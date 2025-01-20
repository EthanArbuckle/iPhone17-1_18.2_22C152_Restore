@interface NSData(BRCSignatureAdditions)
+ (id)brc_pendingPlaceholderForPackage:()BRCSignatureAdditions;
- (BOOL)brc_signatureIsPendingPlaceHolder;
- (id)brc_signature;
- (uint64_t)brc_signatureIsValid;
- (unsigned)brc_signatureIsPackage;
- (void)brc_signatureIsValid;
@end

@implementation NSData(BRCSignatureAdditions)

+ (id)brc_pendingPlaceholderForPackage:()BRCSignatureAdditions
{
  if (brc_pendingPlaceholder_once != -1) {
    dispatch_once(&brc_pendingPlaceholder_once, &__block_literal_global_69);
  }
  v4 = &brc_pendingPlaceholder_pkgPlaceHolder;
  if (!a3) {
    v4 = &brc_pendingPlaceholder_filePlaceHolder;
  }
  v5 = (void *)*v4;
  return v5;
}

- (BOOL)brc_signatureIsPendingPlaceHolder
{
  if ([a1 length] != 2) {
    return 0;
  }
  v2 = (unsigned __int8 *)[a1 bytes];
  if (v2[1] != 63) {
    return 0;
  }
  int v3 = *v2;
  return v3 == 1 || v3 == 27;
}

- (unsigned)brc_signatureIsPackage
{
  result = (unsigned __int8 *)[a1 bytes];
  if (result) {
    return (unsigned __int8 *)(*result == 27);
  }
  return result;
}

- (uint64_t)brc_signatureIsValid
{
  if ((objc_msgSend(a1, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
  {
    if ((objc_msgSend(a1, "brc_signatureIsPackage") & 1) != 0
      || ([MEMORY[0x1E4F1A3B8] isValidSignature:a1] & 1) != 0)
    {
      return 1;
    }
    int v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      [(NSData(BRCSignatureAdditions) *)(uint64_t)a1 brc_signatureIsValid];
    }
  }
  return 0;
}

- (id)brc_signature
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A3B8]);
  id v3 = a1;
  objc_msgSend(v2, "updateWithBytes:length:", objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"));
  v4 = [v2 dataByFinishingSignature];

  return v4;
}

- (void)brc_signatureIsValid
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] invalid signature in %@%@", (uint8_t *)&v3, 0x16u);
}

@end