@interface XRNetworkingServiceObservationTuple
- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4;
- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4 source:(__CFDictionary *)a5 indexToKeyMap:(const __CFString *)a6;
- (int)kind;
- (unsigned)count;
- (void)dealloc;
- (void)setCount:(unsigned __int8)a3;
- (void)setKind:(int)a3;
@end

@implementation XRNetworkingServiceObservationTuple

- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)XRNetworkingServiceObservationTuple;
  v6 = [(XRNetworkingServiceObservationTuple *)&v14 init];
  if (!v6) {
    return v6;
  }
  if (v4 >= 0x32)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = [NSString stringWithUTF8String:"-[XRNetworkingServiceObservationTuple initWithKind:count:]"];
    [v12 handleFailureInFunction:v13, @"DTNetworkingService.m", 52, @"Invalid parameter not satisfying: %@", @"count < 50" file lineNumber description];
  }
  else
  {
    if (v4) {
      goto LABEL_4;
    }
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = [NSString stringWithUTF8String:"-[XRNetworkingServiceObservationTuple initWithKind:count:]"];
    [v12 handleFailureInFunction:v13, @"DTNetworkingService.m", 53, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];
  }

LABEL_4:
  v6->_kind = a3;
  v6->_count = v4;
  uint64_t v7 = v4;
  v6->data = (id *)malloc_type_calloc(8uLL, v4, 0xFF5361C2uLL);
  if (v4)
  {
    unint64_t v8 = 0;
    v9 = (void *)*MEMORY[0x263EFFD08];
    uint64_t v10 = 8 * v7;
    do
    {
      objc_storeStrong(&v6->data[v8 / 8], v9);
      v8 += 8;
    }
    while (v10 != v8);
  }
  return v6;
}

- (XRNetworkingServiceObservationTuple)initWithKind:(int)a3 count:(unsigned __int8)a4 source:(__CFDictionary *)a5 indexToKeyMap:(const __CFString *)a6
{
  unsigned int v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)XRNetworkingServiceObservationTuple;
  uint64_t v10 = [(XRNetworkingServiceObservationTuple *)&v23 init];
  if (!v10) {
    return v10;
  }
  if (v8 >= 0x32)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSString stringWithUTF8String:"-[XRNetworkingServiceObservationTuple initWithKind:count:source:indexToKeyMap:]"];
    [v21 handleFailureInFunction:v22, @"DTNetworkingService.m", 68, @"Invalid parameter not satisfying: %@", @"count < 50" file lineNumber description];
  }
  else
  {
    if (v8) {
      goto LABEL_4;
    }
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSString stringWithUTF8String:"-[XRNetworkingServiceObservationTuple initWithKind:count:source:indexToKeyMap:]"];
    [v21 handleFailureInFunction:v22, @"DTNetworkingService.m", 69, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];
  }

LABEL_4:
  v10->_kind = a3;
  v10->_count = v8;
  uint64_t v11 = v8;
  v10->data = (id *)malloc_type_calloc(8uLL, v8, 0x15BB445CuLL);
  if (v8)
  {
    uint64_t v12 = 0;
    v13 = (void *)*MEMORY[0x263EFFD08];
    do
    {
      objc_super v14 = (const void **)a6[v12];
      if (v14)
      {
        v15 = CFDictionaryGetValue(a5, *v14);
        uint64_t v16 = [v15 copy];
        data = v10->data;
        id v18 = data[v12];
        data[v12] = (id)v16;
      }
      v19 = &v10->data[v12];
      if (!*v19) {
        objc_storeStrong(v19, v13);
      }
      ++v12;
    }
    while (v11 != v12);
  }
  return v10;
}

- (void)dealloc
{
  if (self->_count)
  {
    unint64_t v3 = 0;
    do
    {
      data = self->data;
      id v5 = data[v3];
      data[v3] = 0;

      ++v3;
    }
    while (v3 < self->_count);
  }
  free(self->data);
  v6.receiver = self;
  v6.super_class = (Class)XRNetworkingServiceObservationTuple;
  [(XRNetworkingServiceObservationTuple *)&v6 dealloc];
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned __int8)a3
{
  self->_count = a3;
}

@end