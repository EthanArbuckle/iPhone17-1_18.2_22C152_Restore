@interface UIDocumentPickerDescriptor
@end

@implementation UIDocumentPickerDescriptor

intptr_t __41___UIDocumentPickerDescriptor_allPickers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

uint64_t __41___UIDocumentPickerDescriptor_allPickers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = [v5 identifier];
  unint64_t v9 = [v7 indexOfObject:v8];

  v10 = *(void **)(a1 + 32);
  v11 = [v6 identifier];
  unint64_t v12 = [v10 indexOfObject:v11];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [v5 compare:v6];
  }
  else
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = -1;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = -1;
      if (v9 >= v12) {
        uint64_t v15 = 1;
      }
      if (v9 == v12) {
        uint64_t v15 = 0;
      }
      if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v14 = v15;
      }
    }
  }

  return v14;
}

uint64_t __63___UIDocumentPickerDescriptor_allPickersForMode_documentTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pickerEnabledForMode:*(void *)(a1 + 40) documentTypes:*(void *)(a1 + 32) reason:0];
}

uint64_t __64___UIDocumentPickerDescriptor_filteredPickersForPickers_filter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enabled];
}

uint64_t __64___UIDocumentPickerDescriptor_filteredPickersForPickers_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F1D878]];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v2 extension];
    v7 = [v6 attributes];
    v8 = [v7 objectForKey:@"UIDocumentPickerVisibilityUserManageable"];

    if (v8) {
      uint64_t v5 = [v8 BOOLValue];
    }
    else {
      uint64_t v5 = 1;
    }
  }
  return v5;
}

uint64_t __56___UIDocumentPickerDescriptor_descriptorWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __49___UIDocumentPickerDescriptor_cloudEnabledStatus__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__ubiquityIdentityTokenDidChange_ name:*MEMORY[0x263F085F0] object:0];

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__ubiquityIdentityTokenDidChange_ name:*MEMORY[0x263F1D0D0] object:0];

  uint64_t v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "__updateCloudEnabledStatus");
}

void __61___UIDocumentPickerDescriptor__extensionValueOfClass_forKey___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) extension];
  id v2 = [v3 identifier];
  NSLog(&cfstr_ExtensionHasMa.isa, v2, *(void *)(a1 + 40));
}

@end