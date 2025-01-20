@interface DTXTransport
+ (BOOL)recognizesURL:(id)a3;
+ (id)schemes;
- (DTXResourceTracker)resourceTracker;
- (DTXTransport)init;
- (DTXTransport)initWithRemoteAddress:(id)a3;
- (DTXTransport)initWithXPCRepresentation:(id)a3;
- (NSArray)localAddresses;
- (id)dataReceivedHandler;
- (id)permittedBlockCompressionTypes;
- (id)serializedXPCRepresentation;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)status;
- (unsigned)supportedDirections;
- (void)dealloc;
- (void)disconnect;
- (void)received:(const char *)a3 ofLength:(unint64_t)a4 destructor:(id)a5;
- (void)serializedDisconnect:(id)a3;
- (void)setDataReceivedHandler:(id)a3;
- (void)setStatus:(unsigned int)a3;
@end

@implementation DTXTransport

+ (id)schemes
{
  return 0;
}

+ (BOOL)recognizesURL:(id)a3
{
  id v4 = a3;
  v7 = [a1 schemes:v5];
  v10 = [v4 v8:v9];

  LOBYTE(v4) = [v7 containsObject:v11];
  return (char)v4;
}

- (DTXTransport)init
{
  v5.receiver = self;
  v5.super_class = (Class)DTXTransport;
  v2 = [(DTXTransport *)&v5 init];
  v3 = v2;
  if (v2) {
    sub_22AF3BD84(v2);
  }
  return v3;
}

- (DTXTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DTXTransport;
  objc_super v5 = [(DTXTransport *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    sub_22AF3BD84(v5);
    if (!v4)
    {
      v11 = 0;
      goto LABEL_8;
    }
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "__DTXTransport_preflightdata", &length);
    if (data)
    {
      v8 = data;
      if (length)
      {
        uint64_t v9 = malloc_type_malloc(length, 0x34527BAAuLL);
        memcpy(v9, v8, length);
        serializer = v6->_serializer;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = sub_22AF3BFA4;
        v13[3] = &unk_264883B90;
        v14 = v6;
        v15 = v9;
        size_t v16 = length;
        dispatch_async(serializer, v13);
      }
    }
  }
  v11 = v6;
LABEL_8:

  return v11;
}

- (id)serializedXPCRepresentation
{
  return 0;
}

- (void)dealloc
{
  if (!self->_resumed) {
    dispatch_resume((dispatch_object_t)self->_serializer);
  }
  v3.receiver = self;
  v3.super_class = (Class)DTXTransport;
  [(DTXTransport *)&v3 dealloc];
}

- (DTXTransport)initWithRemoteAddress:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTXTransport;
  uint64_t v6 = [(DTXTransport *)&v14 init];
  v7 = v6;
  if (v6)
  {
    sub_22AF3BD84(v6);
    v8 = objc_opt_class();
    if ([v8 _recognizesURL:v9 withOptions:(NSUInteger)v5] == NO)
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      NSLog(&cfstr_UnrecognizedUr.isa, v11, v12, v5);

      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  return 0;
}

- (void)received:(const char *)a3 ofLength:(unint64_t)a4 destructor:(id)a5
{
  id v9 = a5;
  if (a4) {
    [self->_tracker acquireSize:v8];
  }
  serializer = self->_serializer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_22AF3C208;
  v12[3] = &unk_264883BB8;
  objc_super v14 = a3;
  unint64_t v15 = a4;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(serializer, v12);
}

- (void)disconnect
{
  handlerGuard = self->_handlerGuard;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3C344;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(handlerGuard, block);
  [self received:v4 ofLength:0 destructor:0];
  [self setStatus:3];
}

- (void)serializedDisconnect:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x263F08690] currentHandler:v5 with:v6];
    [v17 handleFailureInMethod:v18 object:a2 file:@"DTXTransport.m" lineNumber:134 description:@"Invalid parameter not satisfying: %@", @"transportCallback != nil"];
  }
  v8 = (void *)MEMORY[0x230F368A0]();
  id v11 = [self serializedXPCRepresentationWithError:v9];
  [self disconnectWithError:v12];
  serializer = self->_serializer;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3C498;
  block[3] = &unk_264883BE0;
  id v15 = v7;
  id v20 = v11;
  id v21 = v15;
  id v16 = v11;
  dispatch_async(serializer, block);
}

- (void)setDataReceivedHandler:(id)a3
{
  id v4 = a3;
  handlerGuard = self->_handlerGuard;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF3C544;
  v7[3] = &unk_264883940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(handlerGuard, v7);
}

- (id)dataReceivedHandler
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_22AF3C718;
  uint64_t v10 = sub_22AF3C744;
  id v11 = 0;
  handlerGuard = self->_handlerGuard;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF3C74C;
  v5[3] = &unk_264883C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(handlerGuard, v5);
  objc_super v3 = (void *)MEMORY[0x230F36B10](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)localAddresses
{
  return 0;
}

- (id)permittedBlockCompressionTypes
{
  return [MEMORY[0x263EFFA08] setWithObjects:a2, (uint64_t)&unk_26DE40D20, &unk_26DE40D38, &unk_26DE40D50, &unk_26DE40D68, &unk_26DE40D80, &unk_26DE40D98, &unk_26DE40DB0, &unk_26DE40DC8, nil];
}

- (unsigned)supportedDirections
{
  return 3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (DTXResourceTracker)resourceTracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataReceivedHandler, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_handlerGuard, 0);

  objc_storeStrong((id *)&self->_serializer, 0);
}

@end