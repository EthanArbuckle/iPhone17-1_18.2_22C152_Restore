@interface AKSignatureModelController
- (AKController)controller;
- (AKSignature)selectedSignature;
- (AKSignatureModelController)initWithController:(id)a3;
- (BOOL)_createNewKeychainItemWithSignature:(id)a3;
- (BOOL)_deleteSignatureFromKeychain:(id)a3;
- (NSArray)signatures;
- (id)_createAKSignatureFromItemRef:(id)a3;
- (void)_loadSignaturesFromPersistentStorage;
- (void)_saveSignatureToPersistentStorage:(id)a3;
- (void)insertObject:(id)a3 inSignaturesAtIndex:(unint64_t)a4;
- (void)reloadSignaturesFromSource;
- (void)removeObjectFromSignaturesAtIndex:(unint64_t)a3;
- (void)setController:(id)a3;
- (void)setSelectedSignature:(id)a3;
@end

@implementation AKSignatureModelController

- (AKSignatureModelController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKSignatureModelController;
  v5 = [(AKSignatureModelController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKSignatureModelController *)v5 setController:v4];
  }

  return v6;
}

- (void)insertObject:(id)a3 inSignaturesAtIndex:(unint64_t)a4
{
  signatures = self->_signatures;
  id v7 = a3;
  [(NSMutableArray *)signatures insertObject:v7 atIndex:a4];
  [(AKSignatureModelController *)self _saveSignatureToPersistentStorage:v7];
}

- (void)removeObjectFromSignaturesAtIndex:(unint64_t)a3
{
  -[NSMutableArray objectAtIndex:](self->_signatures, "objectAtIndex:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_signatures removeObjectAtIndex:a3];
  [(AKSignatureModelController *)self _deleteSignatureFromKeychain:v5];
}

- (NSArray)signatures
{
  signatures = self->_signatures;
  if (!signatures)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_signatures;
    self->_signatures = v4;

    [(AKSignatureModelController *)self _loadSignaturesFromPersistentStorage];
    signatures = self->_signatures;
  }

  return (NSArray *)signatures;
}

- (void)reloadSignaturesFromSource
{
  objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, -[NSMutableArray count](self->_signatures, "count"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 count]) {
    [(AKSignatureModelController *)self willChange:3 valuesAtIndexes:v3 forKey:@"signatures"];
  }
  [(NSMutableArray *)self->_signatures removeAllObjects];
  if ([v3 count]) {
    [(AKSignatureModelController *)self didChange:3 valuesAtIndexes:v3 forKey:@"signatures"];
  }
  [(AKSignatureModelController *)self _loadSignaturesFromPersistentStorage];
}

- (void)_loadSignaturesFromPersistentStorage
{
  v33[6] = *MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  uint64_t v3 = *MEMORY[0x263F171C8];
  uint64_t v4 = *MEMORY[0x263F17518];
  uint64_t v28 = *MEMORY[0x263F171B8];
  v32[0] = *MEMORY[0x263F171B8];
  v32[1] = v4;
  uint64_t v26 = v4;
  uint64_t v5 = *MEMORY[0x263EFFB40];
  uint64_t v27 = v3;
  v33[0] = v3;
  v33[1] = v5;
  uint64_t v6 = *MEMORY[0x263F170B0];
  v32[2] = *MEMORY[0x263F16E80];
  v32[3] = v6;
  v33[2] = @"com.apple.AnnotationKit";
  v33[3] = v5;
  uint64_t v7 = *MEMORY[0x263F17400];
  v32[4] = *MEMORY[0x263F17090];
  v32[5] = v7;
  uint64_t v25 = v7;
  uint64_t v8 = *MEMORY[0x263F17408];
  v33[4] = @"Signature Annotation Privacy Service";
  v33[5] = v8;
  CFDictionaryRef v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  OSStatus v9 = SecItemCopyMatching(v29, &result);
  if (v9 == -25300)
  {
    NSLog(&cfstr_NoItemsFoundIn.isa);
  }
  else if (v9)
  {
    NSLog(&cfstr_Secitemcopymat.isa, v9, &stru_26EA57918);
  }
  else
  {
    v22 = self;
    v21 = [MEMORY[0x263EFF980] array];
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      CFIndex v10 = 0;
      uint64_t v11 = *MEMORY[0x263F16ED8];
      uint64_t v12 = *MEMORY[0x263F17520];
      uint64_t v13 = *MEMORY[0x263F17410];
      uint64_t v23 = *MEMORY[0x263F175A8];
      do
      {
        v14 = objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)result, v10), "mutableCopy");
        v15 = [v14 objectForKey:v11];
        v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v29];
        [v16 removeObjectForKey:v26];
        [v16 setObject:v5 forKey:v12];
        [v16 setObject:v13 forKey:v25];
        [v16 setObject:v27 forKey:v28];
        [v16 setValue:v15 forKey:v11];
        CFTypeRef v30 = 0;
        if (SecItemCopyMatching((CFDictionaryRef)v16, &v30))
        {
          NSLog(&cfstr_Secitemcopymat.isa, 0, &stru_26EA57918);
        }
        else
        {
          v17 = (void *)v30;
          if (v30)
          {
            v18 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v30 options:0];
            [v14 setValue:v18 forKey:v23];

            if (v18)
            {
              v19 = [(AKSignatureModelController *)v22 _createAKSignatureFromItemRef:v18];
              if (v19) {
                [v21 addObject:v19];
              }
            }
          }
        }

        ++v10;
      }
      while (Count != v10);
    }
    if ([v21 count])
    {
      v20 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v21, "count"));
      if ([v20 count]) {
        [(AKSignatureModelController *)v22 willChange:2 valuesAtIndexes:v20 forKey:@"signatures"];
      }
      [(NSMutableArray *)v22->_signatures addObjectsFromArray:v21];
      if ([v20 count]) {
        [(AKSignatureModelController *)v22 didChange:2 valuesAtIndexes:v20 forKey:@"signatures"];
      }
    }
    CFRelease(result);
  }
}

- (void)_saveSignatureToPersistentStorage:(id)a3
{
  if (a3) {
    MEMORY[0x270F9A6D0](self, sel__createNewKeychainItemWithSignature_);
  }
}

- (BOOL)_deleteSignatureFromKeychain:(id)a3
{
  v21[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F171C8];
  uint64_t v4 = *MEMORY[0x263F17528];
  v20[0] = *MEMORY[0x263F171B8];
  v20[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFFB40];
  uint64_t v6 = *MEMORY[0x263F16E80];
  v20[2] = *MEMORY[0x263F17090];
  v20[3] = v6;
  v21[0] = v3;
  v21[1] = v5;
  v21[2] = @"Signature Annotation Privacy Service";
  v21[3] = @"com.apple.AnnotationKit";
  uint64_t v7 = *MEMORY[0x263F170B0];
  v21[4] = v5;
  uint64_t v8 = *MEMORY[0x263F16ED8];
  v20[4] = v7;
  v20[5] = v8;
  OSStatus v9 = [a3 uniqueID];
  CFIndex v10 = [v9 UUIDString];
  v20[6] = *MEMORY[0x263F17400];
  uint64_t v11 = *MEMORY[0x263F17410];
  v21[5] = v10;
  v21[6] = v11;
  CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:7];

  CFTypeRef result = 0;
  SecItemCopyMatching(v12, &result);
  if (result)
  {
    uint64_t v18 = *MEMORY[0x263F175B0];
    CFTypeRef v19 = result;
    CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    OSStatus v14 = SecItemDelete(v13);
    BOOL v15 = v14 == 0;
    if (v14) {
      NSLog(&cfstr_SecitemdeleteR.isa, v14, &stru_26EA57918);
    }
  }
  else
  {
    NSLog(&cfstr_Secitemcopymat_0.isa);
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_createNewKeychainItemWithSignature:(id)a3
{
  v25[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x237E1DFC0]();
    id v23 = 0;
    uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v23];
    id v6 = v23;
    uint64_t v7 = v6;
    if (v6) {
      NSLog(&cfstr_FailedToEncode.isa, v6);
    }
    uint64_t v8 = [v5 base64EncodedDataWithOptions:0];
    OSStatus v9 = v8;
    if (v8 && [v8 length])
    {
      uint64_t v10 = *MEMORY[0x263F171C8];
      uint64_t v11 = *MEMORY[0x263F17090];
      v24[0] = *MEMORY[0x263F171B8];
      v24[1] = v11;
      v25[0] = v10;
      v25[1] = @"Signature Annotation Privacy Service";
      uint64_t v12 = *MEMORY[0x263F16E80];
      v24[2] = *MEMORY[0x263F17000];
      v24[3] = v12;
      v25[2] = @"Signature Annotation Privacy";
      v25[3] = @"com.apple.AnnotationKit";
      v25[4] = *MEMORY[0x263EFFB40];
      uint64_t v13 = *MEMORY[0x263F16F08];
      v24[4] = *MEMORY[0x263F170B0];
      v24[5] = v13;
      OSStatus v14 = +[AKController akBundle];
      BOOL v15 = [v14 localizedStringForKey:@"Signatures for AnnotationKit (shared by e.g. Markup & Preview). Deletion will remove all signatures from the list." value:&stru_26EA57918 table:@"AKSignatureModelController"];
      v25[5] = v15;
      v24[6] = *MEMORY[0x263F16ED8];
      v16 = [v3 uniqueID];
      v17 = [v16 UUIDString];
      v24[7] = *MEMORY[0x263F175A8];
      v25[6] = v17;
      v25[7] = v9;
      CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:8];

      CFTypeRef result = 0;
      OSStatus v19 = SecItemAdd(v18, &result);
      if (v19) {
        NSLog(&cfstr_CouldnTAddSign.isa, v19);
      }
      else {
        NSLog(&cfstr_SuccessfullyWr.isa, v21);
      }
      if (result) {
        CFRelease(result);
      }
    }
    else
    {
      NSLog(&cfstr_CouldnTAddSign_0.isa);
    }
  }

  return 0;
}

- (id)_createAKSignatureFromItemRef:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F08928];
    id v4 = a3;
    uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

    id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    [v5 finishDecoding];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (AKSignature)selectedSignature
{
  return self->_selectedSignature;
}

- (void)setSelectedSignature:(id)a3
{
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_selectedSignature, 0);

  objc_storeStrong((id *)&self->_signatures, 0);
}

@end