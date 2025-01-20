@interface MTLDynamicLibrary
@end

@implementation MTLDynamicLibrary

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a2;
  v8 = [[MTLArchitecture alloc] initWithCPUType:a2 cpuSubtype:HIDWORD(a2)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
  v9 = (float *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  uint64_t v12 = (a2 << 32) | (a2 >> 32);
  v10 = std::unordered_map<unsigned long long,+[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]::archSliceId>::operator[](v9, (unint64_t *)&v12);
  void *v10 = a3;
  v10[1] = a4;

  if (v13 == *(void *)(a1 + 80))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a4;
  }
  else if (*(_DWORD *)(a1 + 88) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + a2;
  }
  else {
    return 0;
  }
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a3 + 96)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(a3 + 48);
  if (*(unsigned char *)(a3 + 41))
  {
    if (*(_DWORD *)(a1 + 64) == v8) {
      goto LABEL_5;
    }
    return 0;
  }
  if (*(void *)(a1 + 56) != v8) {
    return 0;
  }
LABEL_5:
  uint64_t result = [*(id *)(a3 + 56) length];
  if (result)
  {
    unint64_t v10 = a5 + a4 + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    return v10 <= [*(id *)(a1 + 32) length];
  }
  return result;
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + v4;
  }
  else {
    return 0;
  }
}

@end