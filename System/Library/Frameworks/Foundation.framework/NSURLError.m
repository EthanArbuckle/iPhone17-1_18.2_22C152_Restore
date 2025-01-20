@interface NSURLError
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLError

- (void)encodeWithCoder:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v5 = [(NSError *)self userInfo];
  v6 = (void *)[(NSDictionary *)v5 mutableCopy];
  [v6 removeObjectForKey:@"NSErrorPeerCertificateChainKey"];
  [v6 removeObjectForKey:@"NSErrorClientCertificateChainKey"];
  [v6 removeObjectForKey:@"NSURLErrorFailingURLPeerTrustErrorKey"];
  [v6 removeObjectForKey:@"NSUnderlyingError"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __dictionaryThatCanCode_block_invoke;
  v7[3] = &unk_1E51F7840;
  v7[4] = v6;
  [(NSDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v7];
  [+[NSError errorWithDomain:[(NSError *)self domain] code:[(NSError *)self code] userInfo:v6] encodeWithCoder:a3];
}

@end