@interface NEIKEv2TransportClient
- (id)description;
@end

@implementation NEIKEv2TransportClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteSPI, 0);

  objc_storeStrong((id *)&self->_clientSPI, 0);
}

- (id)description
{
  id v4 = [NSString alloc];
  if (self)
  {
    id v5 = objc_getProperty(self, v3, 8, 1);
    id v7 = objc_getProperty(self, v6, 16, 1);
    self = (NEIKEv2TransportClient *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    id v7 = 0;
    id v5 = 0;
  }
  v8 = (void *)[v4 initWithFormat:@"[NEIKEv2TransportClient %@-%@ %@]", v5, v7, self];

  return v8;
}

@end