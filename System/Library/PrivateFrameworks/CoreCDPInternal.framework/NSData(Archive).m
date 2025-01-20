@interface NSData(Archive)
- (id)cdp_unarchivedRoot;
- (void)cdp_unarchivedRoot;
@end

@implementation NSData(Archive)

- (id)cdp_unarchivedRoot
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:a1 error:0];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = [v1 decodeObjectOfClasses:v4 forKey:@"root"];

  [v1 finishDecoding];
  return v5;
}

- (void)cdp_unarchivedRoot
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Failed to parse data: %@ - %@", buf, 0x16u);
}

@end