@interface UARPPacketDumper
- (UARPPacketDumper)initWithFileName:(id)a3;
- (void)dump:(id)a3 accessoryID:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6;
- (void)dump:(id)a3 uuid:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6;
@end

@implementation UARPPacketDumper

- (UARPPacketDumper)initWithFileName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UARPPacketDumper;
  v5 = [(UARPPacketDumper *)&v10 init];
  if (v5
    && (v6 = [[BloodhoundPacketDumper alloc] initWithFileName:v4], bloodhoundDumper = v5->_bloodhoundDumper, v5->_bloodhoundDumper = v6, bloodhoundDumper, !v5->_bloodhoundDumper))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dump:(id)a3 accessoryID:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = [a4 uuid];
  [(UARPPacketDumper *)self dump:v10 uuid:v11 uarpStatus:v7 direction:a6];
}

- (void)dump:(id)a3 uuid:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(&v12[3], 0, 15);
  id v10 = a3;
  objc_msgSend(a4, "getUUIDBytes:", v12, 23);
  *(_DWORD *)&v12[8] = a5;
  LOBYTE(v12[10]) = v6;
  [(BloodhoundPacketDumper *)self->_bloodhoundDumper dumpPacket:v10 type:3 metadata:&v11 metadataLength:23];
}

- (void).cxx_destruct
{
}

@end