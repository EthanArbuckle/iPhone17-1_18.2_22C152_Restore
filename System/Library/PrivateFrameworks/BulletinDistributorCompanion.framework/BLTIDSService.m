@interface BLTIDSService
- (BLTAbstractIDSDevice)defaultPairedDevice;
- (BLTIDSService)initWithService:(id)a3;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
@end

@implementation BLTIDSService

- (BLTIDSService)initWithService:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTIDSService;
  v5 = [(BLTIDSService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v4];
    service = v5->_service;
    v5->_service = (IDSService *)v6;
  }
  return v5;
}

- (BLTAbstractIDSDevice)defaultPairedDevice
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(IDSService *)self->_service devices];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (BLTIDSDevice *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (BLTIDSDevice *)((char *)i + 1))
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isDefaultPairedDevice", (void)v8))
        {
          v3 = [[BLTIDSDevice alloc] initWithIDSDevice:v6];
          goto LABEL_11;
        }
      }
      v3 = (BLTIDSDevice *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (BLTAbstractIDSDevice *)v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
}

- (void)removeDelegate:(id)a3
{
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  return [(IDSService *)self->_service sendProtobuf:a3 toDestinations:a4 priority:a5 options:a6 identifier:a7 error:a8];
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  return -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](self->_service, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
}

@end