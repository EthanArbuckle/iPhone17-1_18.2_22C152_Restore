@interface TKSmartCardATRInterfaceGroup
- (NSNumber)TA;
- (NSNumber)TB;
- (NSNumber)TC;
- (NSNumber)protocol;
- (TKSmartCardATRInterfaceGroup)initWithProtocol:(id)a3;
- (id)description;
- (id)parseWithY:(char *)a3 toProtocol:(id *)a4 fromSource:(id)a5 hasNext:(BOOL *)a6;
@end

@implementation TKSmartCardATRInterfaceGroup

- (NSNumber)TA
{
  return self->_ABC[0];
}

- (NSNumber)TB
{
  return self->_ABC[1];
}

- (NSNumber)TC
{
  return self->_ABC[2];
}

- (TKSmartCardATRInterfaceGroup)initWithProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardATRInterfaceGroup;
  v6 = [(TKSmartCardATRInterfaceGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_protocol, a3);
  }

  return v7;
}

- (id)parseWithY:(char *)a3 toProtocol:(id *)a4 fromSource:(id)a5 hasNext:(BOOL *)a6
{
  v10 = (uint64_t (**)(void))a5;
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (((*a3 >> i) & 0x10) != 0)
    {
      uint64_t v12 = v10[2](v10);
      if ((v12 & 0x80000000) != 0) {
        goto LABEL_11;
      }
      uint64_t v13 = [NSNumber numberWithInt:v12];
      v14 = &self->super.isa + i;
      Class v15 = v14[1];
      v14[1] = (Class)v13;
    }
  }
  if ((*a3 & 0x80000000) == 0)
  {
    id v16 = 0;
    *a6 = 0;
    *a3 = 0;
LABEL_10:
    *a4 = v16;
    v18 = self;
    goto LABEL_12;
  }
  *a6 = 1;
  int v17 = v10[2](v10);
  if ((v17 & 0x80000000) == 0)
  {
    *a3 = v17 & 0xF0;
    id v16 = [NSNumber numberWithUnsignedLong:1 << (v17 & 0xF)];
    goto LABEL_10;
  }
LABEL_11:
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if (self->_protocol)
  {
    uint64_t v4 = 0;
    while (([(NSNumber *)self->_protocol unsignedIntegerValue] & (1 << v4)) == 0)
    {
      uint64_t v4 = (v4 + 1);
      if (v4 == 16) {
        goto LABEL_7;
      }
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"T=%d:", v4);

    v3 = (void *)v5;
  }
LABEL_7:
  for (uint64_t i = 8; i != 32; i += 8)
  {
    v7 = *(Class *)((char *)&self->super.isa + i);
    if (v7) {
      objc_msgSend(v3, "appendFormat:", @"%02x", objc_msgSend(v7, "unsignedCharValue"));
    }
    else {
      [v3 appendString:@"-"];
    }
  }

  return v3;
}

- (NSNumber)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end