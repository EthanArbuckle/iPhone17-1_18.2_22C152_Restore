@interface CNContactBufferDecoder
- (BOOL)decodeContactsFromBuffer:(id)a3 replyHandler:(id)a4;
- (BOOL)hasPendingContacts;
- (BOOL)mutableResults;
- (CNContactBufferDecoder)initWithKeyDescriptorToMakeAvailable:(id)a3 mutableResults:(BOOL)a4;
- (CNContactKeyVector)keyDescriptorToMakeAvailable;
- (id)_contactFromByteCursor:(unint64_t)a3 end:;
- (id)completedPendingContactFromByteCursor:(unint64_t)a3 end:;
- (void)_applyImageDataFromByteCursor:(unint64_t)a3 end:;
- (void)_applyMultivalueFromByteCursor:(unint64_t)a3 end:(uint64_t)property abPropertyID:;
- (void)_applyPropertiesFromFromByteCursor:(unint64_t)a3 end:;
- (void)setKeyDescriptorToMakeAvailable:(id)a3;
- (void)setMutableResults:(BOOL)a3;
@end

@implementation CNContactBufferDecoder

- (BOOL)decodeContactsFromBuffer:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, BOOL))a4;
  id v8 = v6;
  unint64_t v19 = [v8 bytes];
  unint64_t v9 = v19 + [v8 length];
  while (!self || self->_bytesNeededToResume < 1)
  {
    uint64_t v11 = -[CNContactBufferDecoder _contactFromByteCursor:end:]((uint64_t)self, (uint64_t *)&v19, v9);
    v10 = (void *)v11;
    if (self) {
      goto LABEL_6;
    }
    BOOL v14 = v19 < v9;
    if (v11) {
      goto LABEL_13;
    }
LABEL_20:
    if (!v14) {
      goto LABEL_25;
    }
  }
  v10 = -[CNContactBufferDecoder completedPendingContactFromByteCursor:end:]((uint64_t)self, &v19, v9);
LABEL_6:
  int64_t state = self->_state;
  if (state) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v19 >= v9;
  }
  BOOL v14 = !v13;
  if (v10)
  {
LABEL_13:
    v15 = [(CNContactBufferDecoder *)self keyDescriptorToMakeAvailable];
    [v10 setAvailableKeyDescriptor:v15];

    if ([(CNContactBufferDecoder *)self mutableResults]) {
      [v10 setFrozenSelfAsSnapshot];
    }
    else {
      id v16 = (id)[v10 freezeWithSelfAsSnapshot];
    }
    v7[2](v7, v10, v14);

    goto LABEL_20;
  }
  if (state == 2)
  {
    BOOL v17 = 0;
    goto LABEL_26;
  }
  if (state != 1) {
    goto LABEL_20;
  }
  v7[2](v7, 0, 0);
LABEL_25:
  BOOL v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)mutableResults
{
  return self->_mutableResults;
}

- (CNContactKeyVector)keyDescriptorToMakeAvailable
{
  return self->_keyDescriptorToMakeAvailable;
}

- (id)_contactFromByteCursor:(unint64_t)a3 end:
{
  id v3 = 0;
  if (a1 && a2)
  {
    unint64_t v6 = *a2;
    if (*a2) {
      BOOL v7 = v6 >= a3;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7 || ((unint64_t v8 = v6 + 13, *(unsigned char *)v6 == 1) ? (v9 = v8 > a3) : (v9 = 1), v9 || v8 + *(void *)(v6 + 5) > a3))
    {
      id v3 = 0;
    }
    else
    {
      uint64_t v12 = *(unsigned int *)(v6 + 1);
      BOOL v13 = (void *)[[NSString alloc] initWithBytes:v6 + 13 length:*(void *)(v6 + 5) encoding:4];
      uint64_t v14 = +[CNContact contactWithIdentifier:v13];
      v15 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v14;

      [*(id *)(a1 + 32) setIOSLegacyIdentifier:v12];
      uint64_t v17 = *(void *)(v6 + 5) + v6 + 13;
      -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, (unint64_t *)&v17, a3);
      *a2 = v17;
      if (*(void *)(a1 + 24))
      {
        id v3 = 0;
      }
      else
      {
        id v3 = *(id *)(a1 + 32);
        id v16 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0;
      }
    }
  }

  return v3;
}

- (void)_applyPropertiesFromFromByteCursor:(unint64_t)a3 end:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v3 = a2;
  if (!a2) {
    return;
  }
  unint64_t v4 = a3;
  unint64_t v5 = *a2;
  if (!*a2 || v5 >= a3) {
    return;
  }
  unint64_t v29 = *a2;
  unint64_t v23 = a3;
  v24 = a2;
  while (2)
  {
    switch(*(unsigned char *)v5)
    {
      case 1:
        uint64_t v22 = 0;
        goto LABEL_30;
      case 2:
        if (v5 + 13 > v4) {
          goto LABEL_26;
        }
        uint64_t v8 = *(void *)(v5 + 5);
        if (v5 + 13 + v8 > v4) {
          goto LABEL_26;
        }
        uint64_t v9 = *(unsigned int *)(v5 + 1);
        v10 = +[CNiOSABConversions contactPropertiesByABPropertyID]();
        uint64_t v11 = [NSNumber numberWithInt:v9];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              unint64_t v19 = objc_msgSend(v18, "CNValueFromABBytes:length:", v5 + 13, v8, v23, v24);
              [v18 setCNValue:v19 onContact:*(void *)(a1 + 32)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v15);
        }

        v29 += *(void *)(v5 + 5) + 13;
        unint64_t v4 = v23;
        id v3 = v24;
        goto LABEL_24;
      case 3:
        if (v5 + 5 > v4) {
          goto LABEL_26;
        }
        uint64_t v20 = *(unsigned int *)(v5 + 1);
        unint64_t v29 = v5 + 5;
        -[CNContactBufferDecoder _applyMultivalueFromByteCursor:end:abPropertyID:](a1, &v29, v4, v20);
        goto LABEL_24;
      case 6:
        unint64_t v21 = v5 + 26;
        if (v5 + 26 > v4)
        {
LABEL_26:
          uint64_t v22 = 2;
          goto LABEL_31;
        }
        if (v21 + *(void *)(v5 + 18) <= v4)
        {
          -[CNContactBufferDecoder _applyImageDataFromByteCursor:end:](a1, (uint64_t *)&v29, v4);
LABEL_24:
          unint64_t v5 = v29;
          *id v3 = v29;
          if (v5 >= v4)
          {
            uint64_t v22 = 0;
            goto LABEL_31;
          }
          continue;
        }
        [*(id *)(a1 + 40) appendBytes:v29 length:v4 - v29];
        *(void *)(a1 + 48) = v21 + *(void *)(v5 + 18) - v4;
        uint64_t v22 = 1;
LABEL_30:
        *id v3 = v29;
LABEL_31:
        *(void *)(a1 + 24) = v22;
        return;
      default:
        uint64_t v22 = 2;
        goto LABEL_30;
    }
  }
}

- (void)_applyMultivalueFromByteCursor:(unint64_t)a3 end:(uint64_t)property abPropertyID:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1 && a2 && *a2 && *a2 < a3)
  {
    unint64_t v39 = *a2;
    ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(property);
    uint64_t v8 = +[CNiOSABConversions contactPropertiesByABPropertyID]();
    uint64_t v40 = property;
    uint64_t v9 = [NSNumber numberWithInt:property];
    v10 = [v8 objectForKeyedSubscript:v9];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v12)
    {
      uint64_t v36 = a1;
      uint64_t v13 = *(void *)v46;
      unint64_t v14 = 0x1E4F29000uLL;
      id v38 = v11;
      uint64_t v34 = *(void *)v46;
      while (2)
      {
        uint64_t v15 = 0;
        uint64_t v33 = v12;
        do
        {
          if (*(void *)v46 != v13)
          {
            uint64_t v16 = v15;
            objc_enumerationMutation(v11);
            uint64_t v15 = v16;
          }
          uint64_t v35 = v15;
          v41 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
          v43 = [v41 CNMutableValueForABMultivalue];
          int v17 = 0;
          unint64_t v18 = v39;
          while (*(unsigned char *)v18 == 4)
          {
            if (v18 + 29 > a3 || v18 + 29 + *(void *)(v18 + 5) > a3)
            {
              *(void *)(v36 + 24) = 2;
LABEL_47:

              goto LABEL_48;
            }
            uint64_t v19 = *(unsigned int *)(v18 + 1);
            uint64_t v20 = (void *)[objc_alloc(*(Class *)(v14 + 24)) initWithBytes:v18 + 29 length:*(void *)(v18 + 5) encoding:4];
            uint64_t v21 = *(void *)(v18 + 5) + v18 + 29;
            uint64_t v22 = *(void *)(v18 + 13);
            if (v21 + v22 > a3)
            {
              *(void *)(v36 + 24) = 2;
LABEL_46:

              goto LABEL_47;
            }
            if (v22) {
              v44 = (void *)[objc_alloc(*(Class *)(v14 + 24)) initWithBytes:v21 length:*(void *)(v18 + 13) encoding:4];
            }
            else {
              v44 = 0;
            }
            unint64_t v18 = v21 + *(void *)(v18 + 13) + *(void *)(v18 + 21);
            if (TypeOfProperty == 261)
            {
              unint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
              if (v18 < a3)
              {
                while (1)
                {
                  if (*(unsigned char *)v18 != 5) {
                    goto LABEL_30;
                  }
                  unint64_t v24 = v18 + 17;
                  if (v18 + 17 > a3 || v24 + *(void *)(v18 + 1) > a3) {
                    break;
                  }
                  long long v25 = (void *)[objc_alloc(*(Class *)(v14 + 24)) initWithBytes:v18 + 17 length:*(void *)(v18 + 1) encoding:4];
                  unint64_t v26 = v14;
                  long long v27 = v25;
                  unint64_t v28 = v24 + *(void *)(v18 + 1);
                  if (v28 + *(void *)(v18 + 9) > a3)
                  {
                    *(void *)(v36 + 24) = 2;

                    goto LABEL_44;
                  }
                  unint64_t v29 = v26;
                  v30 = (void *)[objc_alloc(*(Class *)(v26 + 24)) initWithBytes:v28 length:*(void *)(v18 + 9) encoding:4];
                  uint64_t v31 = *(void *)(v18 + 9);
                  if (v27) {
                    [v23 setObject:v30 forKey:v27];
                  }
                  else {
                    NSLog(&cfstr_MissingDiction.isa, v40);
                  }
                  unint64_t v18 = v28 + v31;

                  unint64_t v14 = v29;
                  if (v18 >= a3) {
                    goto LABEL_30;
                  }
                }
                *(void *)(v36 + 24) = 2;
LABEL_44:

                id v11 = v38;
                goto LABEL_45;
              }
LABEL_30:
              v32 = v44;
              v17 |= [v41 applyDictionary:v23 identifier:v20 legacyIdentifier:v19 label:v44 toCNMultivalueRepresentation:v43];

              id v11 = v38;
            }
            else
            {
              if (v18 > a3)
              {
                *(void *)(v36 + 24) = 2;
LABEL_45:

                goto LABEL_46;
              }
              v32 = v44;
              v17 |= objc_msgSend(v41, "applyABMultivalueValueBytes:length:identifier:legacyIdentifier:label:toCNMultivalueRepresentation:");
            }

            if (v18 >= a3) {
              break;
            }
          }
          if (v17) {
            [v41 setCNValue:v43 onContact:*(void *)(v36 + 32)];
          }

          uint64_t v13 = v34;
          uint64_t v15 = v35 + 1;
        }
        while (v35 + 1 != v33);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
        uint64_t v13 = v34;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v18 = v39;
    }

    *a2 = v18;
LABEL_48:
  }
}

- (CNContactBufferDecoder)initWithKeyDescriptorToMakeAvailable:(id)a3 mutableResults:(BOOL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactBufferDecoder;
  BOOL v7 = [(CNContactBufferDecoder *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    keyDescriptorToMakeAvailable = v7->_keyDescriptorToMakeAvailable;
    v7->_keyDescriptorToMakeAvailable = (CNContactKeyVector *)v8;

    v7->_int64_t state = 0;
    v7->_mutableResults = a4;
    uint64_t v10 = objc_opt_new();
    resumeBuffer = v7->_resumeBuffer;
    v7->_resumeBuffer = (NSMutableData *)v10;

    uint64_t v12 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeBuffer, 0);
  objc_storeStrong((id *)&self->_pendingContact, 0);

  objc_storeStrong((id *)&self->_keyDescriptorToMakeAvailable, 0);
}

- (void)_applyImageDataFromByteCursor:(unint64_t)a3 end:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = *a2;
    unint64_t v7 = *a2 + 26;
    if (v7 > a3)
    {
LABEL_7:
      *(void *)(a1 + 24) = 2;
      return;
    }
    if (*(unsigned char *)(v6 + 1)) {
      objc_msgSend(*(id *)(a1 + 32), "setCropRect:", (double)*(int *)(v6 + 2), (double)*(int *)(v6 + 6), (double)*(int *)(v6 + 10), (double)*(int *)(v6 + 10));
    }
    uint64_t v8 = *(void *)(v6 + 18);
    if (v8)
    {
      if (v7 + v8 > a3) {
        goto LABEL_7;
      }
      uint64_t v10 = ABOSLogImageMetadata();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(v6 + 14);
        uint64_t v12 = *(void *)(v6 + 18);
        v14[0] = 67109376;
        v14[1] = v11;
        __int16 v15 = 2048;
        uint64_t v16 = v12;
        _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "[CNContactBufferDecoder _applyImageDataFromByteCursor:end:] reading image format %d of length %lu into NSData", (uint8_t *)v14, 0x12u);
      }

      uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:*(void *)(v6 + 18)];
      switch(*(_DWORD *)(v6 + 14))
      {
        case 0:
          [*(id *)(a1 + 32) setThumbnailImageData:v13];
          break;
        case 2:
          [*(id *)(a1 + 32) setImageData:v13];
          break;
        case 4:
          [*(id *)(a1 + 32) setFullscreenImageData:v13];
          break;
        case 5:
          [*(id *)(a1 + 32) setSyncImageData:v13];
          break;
        default:
          break;
      }

      uint64_t v9 = *(void *)(v6 + 18) + 26;
    }
    else
    {
      uint64_t v9 = 26;
    }
    *a2 += v9;
  }
}

- (BOOL)hasPendingContacts
{
  return self->_pendingContact != 0;
}

- (id)completedPendingContactFromByteCursor:(unint64_t)a3 end:
{
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v8 = a1 + 40;
  uint64_t v6 = *(void **)(a1 + 40);
  unint64_t v7 = *(void *)(v8 + 8);
  unint64_t v9 = a3 - *a2 >= v7 ? v7 : a3 - *a2;
  objc_msgSend(v6, "appendBytes:length:");
  *a2 += v9;
  unint64_t v10 = *(void *)(a1 + 48) - v9;
  *(void *)(a1 + 48) = v10;
  if (v10) {
    goto LABEL_9;
  }
  *(void *)(a1 + 24) = 0;
  uint64_t v15 = [*(id *)(a1 + 40) bytes];
  unint64_t v11 = v15 + [*(id *)(a1 + 40) length];
  -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, (unint64_t *)&v15, v11);
  [*(id *)(a1 + 40) setLength:0];
  if (v15 != v11)
  {
    id v12 = 0;
    *(void *)(a1 + 24) = 2;
    goto LABEL_10;
  }
  -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, a2, a3);
  if (*(void *)(a1 + 24))
  {
LABEL_9:
    id v12 = 0;
  }
  else
  {
    id v12 = *(id *)(a1 + 32);
    objc_super v14 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
LABEL_10:

  return v12;
}

- (void)setMutableResults:(BOOL)a3
{
  self->_mutableResults = a3;
}

- (void)setKeyDescriptorToMakeAvailable:(id)a3
{
}

@end