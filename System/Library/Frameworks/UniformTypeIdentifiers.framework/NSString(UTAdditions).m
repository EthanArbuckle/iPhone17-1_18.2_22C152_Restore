@interface NSString(UTAdditions)
- (id)stringByAppendingPathComponent:()UTAdditions conformingToType:;
- (id)stringByAppendingPathExtensionForType:()UTAdditions;
@end

@implementation NSString(UTAdditions)

- (id)stringByAppendingPathComponent:()UTAdditions conformingToType:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 19, @"Invalid parameter not satisfying: %@", @"partialName != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 20, @"Invalid parameter not satisfying: %@", @"contentType != nil" object file lineNumber description];

LABEL_3:
  v10 = [v7 stringByAppendingPathExtensionForType:v9];
  v11 = [a1 stringByAppendingPathComponent:v10];

  return v11;
}

- (id)stringByAppendingPathExtensionForType:()UTAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 31, @"Invalid parameter not satisfying: %@", @"contentType != nil" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x19F387810]();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  long long range = xmmword_19B03C970;
  _CFGetPathExtensionRangesFromPathComponent();
  id v7 = (void *)v17[5];
  if (!v7)
  {
    uint64_t v8 = [(id)v5 preferredFilenameExtension];
    v9 = (void *)v17[5];
    v17[5] = v8;

    id v7 = (void *)v17[5];
    if ((v5 & 0x8000000000000000) == 0 && !v7)
    {
      v10 = [(id)v5 _typeRecord];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__NSString_UTAdditions__stringByAppendingPathExtensionForType___block_invoke;
      v14[3] = &unk_1E583EEB8;
      v14[4] = &v16;
      [v10 enumeratePedigreeWithBlock:v14];

      id v7 = (void *)v17[5];
    }
    if (!v7) {
      goto LABEL_9;
    }
  }
  if (([v7 isEqual:0] & 1) == 0)
  {
    v11 = [a1 stringByAppendingPathExtension:v17[5]];
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  if (!v11) {
    v11 = (void *)[a1 copy];
  }

  return v11;
}

@end