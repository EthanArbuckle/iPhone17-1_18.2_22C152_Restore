@interface IDSSockAddrWrapperPair
+ (id)shortDescriptionForLocalAddress:(id)a3 remoteAddress:(id)a4;
+ (id)wrapperPairWithLocalAddress:(id)a3 remoteAddress:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSockAddrWrapperPair:(id)a3;
- (IDSSockAddrWrapper)localAddress;
- (IDSSockAddrWrapper)remoteAddress;
- (IDSSockAddrWrapperPair)initWithLocalAddress:(id)a3 remoteAddress:(id)a4;
- (id)description;
- (id)shortDescription;
- (unint64_t)hash;
@end

@implementation IDSSockAddrWrapperPair

+ (id)wrapperPairWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[IDSSockAddrWrapperPair alloc] initWithLocalAddress:v6 remoteAddress:v5];

  return v7;
}

- (IDSSockAddrWrapperPair)initWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSockAddrWrapperPair;
  v8 = [(IDSSockAddrWrapperPair *)&v14 init];
  if (v8)
  {
    v9 = (IDSSockAddrWrapper *)[v6 copy];
    localAddress = v8->_localAddress;
    v8->_localAddress = v9;

    v11 = (IDSSockAddrWrapper *)[v7 copy];
    remoteAddress = v8->_remoteAddress;
    v8->_remoteAddress = v11;
  }
  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"local[%@] remote[%@]", self->_localAddress, self->_remoteAddress];
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:@"%u:::%u", [(IDSSockAddrWrapper *)self->_localAddress saPortHostOrder], [(IDSSockAddrWrapper *)self->_remoteAddress saPortHostOrder]];
}

+ (id)shortDescriptionForLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5 = a4;
  LODWORD(a3) = [a3 saPortHostOrder];
  unsigned int v6 = [v5 saPortHostOrder];

  return +[NSString stringWithFormat:@"%u:::%u", a3, v6];
}

- (BOOL)isEqualToSockAddrWrapperPair:(id)a3
{
  id v4 = a3;
  localAddress = self->_localAddress;
  unsigned int v6 = [v4 localAddress];
  if ([(IDSSockAddrWrapper *)localAddress isEqualToWrapper:v6])
  {
    remoteAddress = self->_remoteAddress;
    v8 = [v4 remoteAddress];
    unsigned __int8 v9 = [(IDSSockAddrWrapper *)remoteAddress isEqualToWrapper:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    BOOL v6 = [(IDSSockAddrWrapperPair *)self isEqualToSockAddrWrapperPair:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(IDSSockAddrWrapper *)self->_localAddress hash];
  return (unint64_t)[(IDSSockAddrWrapper *)self->_remoteAddress hash] ^ v3;
}

- (IDSSockAddrWrapper)localAddress
{
  return self->_localAddress;
}

- (IDSSockAddrWrapper)remoteAddress
{
  return self->_remoteAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);

  objc_storeStrong((id *)&self->_localAddress, 0);
}

@end