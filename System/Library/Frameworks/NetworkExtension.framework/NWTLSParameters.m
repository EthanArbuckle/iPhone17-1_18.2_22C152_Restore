@interface NWTLSParameters
- (NSData)TLSSessionID;
- (NSSet)SSLCipherSuites;
- (NSUInteger)maximumSSLProtocolVersion;
- (NSUInteger)minimumSSLProtocolVersion;
- (void)setMaximumSSLProtocolVersion:(NSUInteger)maximumSSLProtocolVersion;
- (void)setMinimumSSLProtocolVersion:(NSUInteger)minimumSSLProtocolVersion;
- (void)setSSLCipherSuites:(NSSet *)SSLCipherSuites;
- (void)setTLSSessionID:(NSData *)TLSSessionID;
@end

@implementation NWTLSParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSLCipherSuites, 0);

  objc_storeStrong((id *)&self->_TLSSessionID, 0);
}

- (void)setMaximumSSLProtocolVersion:(NSUInteger)maximumSSLProtocolVersion
{
  self->_maximumSSLProtocolVersion = maximumSSLProtocolVersion;
}

- (NSUInteger)maximumSSLProtocolVersion
{
  return self->_maximumSSLProtocolVersion;
}

- (void)setMinimumSSLProtocolVersion:(NSUInteger)minimumSSLProtocolVersion
{
  self->_minimumSSLProtocolVersion = minimumSSLProtocolVersion;
}

- (NSUInteger)minimumSSLProtocolVersion
{
  return self->_minimumSSLProtocolVersion;
}

- (void)setSSLCipherSuites:(NSSet *)SSLCipherSuites
{
}

- (NSSet)SSLCipherSuites
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTLSSessionID:(NSData *)TLSSessionID
{
}

- (NSData)TLSSessionID
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end