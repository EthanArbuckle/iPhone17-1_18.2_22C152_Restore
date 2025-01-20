@interface AXPiOSElementData
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)uid;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)pid;
- (unint64_t)hash;
- (void)setPid:(int)a3;
- (void)setUid:(id)a3;
@end

@implementation AXPiOSElementData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = [(AXPiOSElementData *)self uid];
  objc_msgSend(v4, "setUid:", v5, v6);
  objc_msgSend(v4, "setPid:", -[AXPiOSElementData pid](self, "pid"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 pid];
    if (v6 == [(AXPiOSElementData *)self pid]
      && ([v5 uid], uint64_t v8 = v7, -[AXPiOSElementData uid](self, "uid"), v8 == v9))
    {
      uint64_t v10 = [v5 uid];
      BOOL v11 = v10 == [(AXPiOSElementData *)self uid];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(AXPiOSElementData *)self uid];
  uint64_t v4 = [(AXPiOSElementData *)self uid] ^ v3;
  return v4 ^ [(AXPiOSElementData *)self pid];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXPiOSElementData;
  uint64_t v4 = [(AXPiOSElementData *)&v8 description];
  [(AXPiOSElementData *)self uid];
  int v6 = [v3 stringWithFormat:@"%@: hash: %llu, elementID: %llu, pid: %d", v4, v5, -[AXPiOSElementData uid](self, "uid"), -[AXPiOSElementData pid](self, "pid")];

  return v6;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)uid
{
  unint64_t v2 = *(unint64_t *)((char *)&self->_uid.elementOrHash + 4);
  unint64_t v3 = *(void *)(&self->_pid + 1);
  result.var1 = v2;
  result.var0 = v3;
  return result;
}

- (void)setUid:(id)a3
{
  *(void *)(&self->_pid + 1) = a3.var0;
  *(unint64_t *)((char *)&self->_uid.elementOrHash + 4) = a3.var1;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

@end