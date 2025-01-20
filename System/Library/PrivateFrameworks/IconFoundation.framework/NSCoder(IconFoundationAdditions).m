@interface NSCoder(IconFoundationAdditions)
- (id)_IF_decodeObjectOfClass:()IconFoundationAdditions forKey:;
@end

@implementation NSCoder(IconFoundationAdditions)

- (id)_IF_decodeObjectOfClass:()IconFoundationAdditions forKey:
{
  id v6 = a4;
  v7 = [a1 decodeObjectOfClass:a3 forKey:v6];
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    v9 = IFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NSCoder(IconFoundationAdditions) _IF_decodeObjectOfClass:forKey:]((uint64_t)v6, v9);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)_IF_decodeObjectOfClass:()IconFoundationAdditions forKey:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DC6CA000, a2, OS_LOG_TYPE_FAULT, "Decode error: Unexpected class for key '%@'", (uint8_t *)&v2, 0xCu);
}

@end