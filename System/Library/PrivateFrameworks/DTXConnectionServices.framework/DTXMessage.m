@interface DTXMessage
+ (BOOL)extractSerializedCompressionInfoFromBuffer:(const char *)a3 length:(unint64_t)a4 compressionType:(int *)a5 uncompressedLength:(unint64_t *)a6 compressedDataOffset:(unint64_t *)a7;
+ (NSSet)defaultAllowedSecureCodingClasses;
+ (id)message;
+ (id)messageReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5;
+ (id)messageWithBuffer:(const void *)a3 length:(unint64_t)a4;
+ (id)messageWithData:(id)a3;
+ (id)messageWithError:(id)a3;
+ (id)messageWithObject:(id)a3;
+ (id)messageWithPrimitive:(void *)a3;
+ (id)messageWithSelector:(SEL)a3 arguments:(id)a4;
+ (id)messageWithSelector:(SEL)a3 objectArguments:(id)a4;
+ (id)messageWithSelector:(SEL)a3 typesAndArguments:(unsigned int)a4;
+ (void)initialize;
+ (void)setReportCompressionBlock:(id)a3;
- (BOOL)deserialized;
- (BOOL)expectsReply;
- (BOOL)isBarrier;
- (BOOL)isDispatch;
- (BOOL)shouldInvokeWithTarget:(id)a3;
- (DTXMessage)initWithInvocation:(id)a3;
- (DTXMessage)initWithSelector:(SEL)a3 firstArg:(id)a4 remainingObjectArgs:(char *)a5;
- (DTXMessage)initWithSelector:(SEL)a3 objects:(id)a4;
- (DTXMessage)initWithSerializedForm:(const char *)a3 length:(unint64_t)a4 destructor:(id)a5 compressor:(id)a6;
- (DTXMessage)initWithSerializedForm:(id)a3 compressor:(id)a4;
- (NSData)data;
- (NSError)error;
- (NSSecureCoding)object;
- (NSSecureCoding)payloadObject;
- (const)getBufferWithReturnedLength:(unint64_t *)a3;
- (id)_decompressedData:(id)a3 compressor:(id)a4 compressionType:(int)a5;
- (id)_faultAuxiliaryValueOfType:(Class)a3 forKey:(id)a4;
- (id)_initWithReferencedSerializedForm:(id)a3 compressor:(id)a4 payloadSet:(id)a5;
- (id)_mutableAuxiliaryDictionary;
- (id)dataForMessageKey:(id)a3;
- (id)description;
- (id)descriptionWithRoutingInformation:(DTXMessageRoutingInfo)a3;
- (id)newReply;
- (id)newReplyReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5;
- (id)newReplyWithError:(id)a3;
- (id)newReplyWithMessage:(id)a3;
- (id)newReplyWithObject:(id)a3;
- (id)objectWithAllowedClasses:(id)a3;
- (id)stringForMessageKey:(id)a3;
- (id)valueForMessageKey:(id)a3;
- (int64_t)integerForMessageKey:(id)a3;
- (unint64_t)cost;
- (unint64_t)serializedLength;
- (unsigned)channelCode;
- (unsigned)conversationIndex;
- (unsigned)errorStatus;
- (unsigned)identifier;
- (unsigned)messageType;
- (void)_appendTypesAndValues:(unsigned int)a3 withKey:(id)a4 list:(char *)a5;
- (void)_makeBarrier;
- (void)_makeImmutable;
- (void)_setPayloadBuffer:(const char *)a3 length:(unint64_t)a4 shouldCopy:(BOOL)a5 destructor:(id)a6;
- (void)_willModifyAuxiliary;
- (void)compressWithCompressor:(id)a3 usingType:(int)a4 forCompatibilityWithVersion:(int64_t)a5;
- (void)dealloc;
- (void)invokeWithTarget:(id)a3 replyChannel:(id)a4 validator:(id)a5;
- (void)serializedFormApply:(id)a3;
- (void)setChannelCode:(unsigned int)a3;
- (void)setConversationIndex:(unsigned int)a3;
- (void)setData:(id)a3 forMessageKey:(id)a4;
- (void)setError:(id)a3;
- (void)setErrorStatus:(unsigned int)a3;
- (void)setExpectsReply:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setInteger:(int64_t)a3 forMessageKey:(id)a4;
- (void)setMessageType:(unsigned int)a3;
- (void)setPayloadObject:(id)a3;
- (void)setString:(id)a3 forMessageKey:(id)a4;
@end

@implementation DTXMessage

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)kDTXBarrierMessage;
    kDTXBarrierMessage = v2;

    [v4 setMessageType:5];
    [kDTXBarrierMessage makeImmutable:v5 withTransitionContext:v6];
    uint64_t v7 = objc_opt_new();
    v8 = (void *)kDTXAckBarrierMessage;
    kDTXAckBarrierMessage = v7;

    [kDTXAckBarrierMessage setMessageType:v9];
    [kDTXAckBarrierMessage makeImmutable:v10 withTransitionContext:v11];
    uint64_t v12 = objc_opt_new();
    v13 = (void *)kDTXHeartbeatMessage;
    kDTXHeartbeatMessage = v12;

    [kDTXHeartbeatMessage setMessageType:5];
    [kDTXHeartbeatMessage makeImmutable:v15 withTransitionContext:v16];
    uint64_t v17 = objc_opt_new();
    v18 = (void *)kDTXInterruptionMessage;
    kDTXInterruptionMessage = v17;

    [kDTXInterruptionMessage setErrorStatus:v19];
    [kDTXInterruptionMessage makeImmutable:v20 withTransitionContext:v21];
    mach_timebase_info((mach_timebase_info_t)&dword_26AD828C8);
    v38 = (void *)MEMORY[0x263EFFA08];
    uint64_t v37 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v34 = [v38 setWithObjects:v33, v37, v36, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, nil];
    v35 = (void *)qword_26AD828B8;
    qword_26AD828B8 = v34;
  }
}

+ (NSSet)defaultAllowedSecureCodingClasses
{
  return (NSSet *)(id)qword_26AD828B8;
}

- (NSData)data
{
  if (self->_messageType == 1) {
    return self->_payloadData;
  }
  else {
    return (NSData *)0;
  }
}

- (id)description
{
  return sub_22AF4A504(self, self->_identifier | ((unint64_t)self->_conversationIndex << 32), self->_channelCode | ((unint64_t)self->_expectsReply << 32));
}

- (id)descriptionWithRoutingInformation:(DTXMessageRoutingInfo)a3
{
  return sub_22AF4A504(self, *(unint64_t *)&a3.var0, *(uint64_t *)&a3.var2);
}

+ (void)setReportCompressionBlock:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF4AB5C;
  v5[3] = &unk_264883ED8;
  id v6 = v3;
  id v4 = v3;
  sub_22AF4AAC4(v5);
}

- (void)compressWithCompressor:(id)a3 usingType:(int)a4 forCompatibilityWithVersion:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v10 = a3;
  unsigned int messageType = self->_messageType;
  if (messageType == 1)
  {
    p_payloadData = (void **)&self->_payloadData;
    if (![self->_payloadData length:v8]
      || (unint64_t)[*p_payloadData length] >> 32)
    {
      goto LABEL_18;
    }
    if (!v10) {
      sub_22AF53078();
    }
    uint64_t v17 = [*p_payloadData length];
    id v18 = objc_alloc(MEMORY[0x263EFF990]);
    uint64_t v22 = [v18 initWithLength:v19 + 4];
    int v61 = 0;
    if (qword_2683E3590)
    {
      uint64_t v23 = mach_absolute_time();
      uint64_t v26 = [self->_payloadData bytes:v24 length:v25];
      uint64_t v29 = [self->_payloadData length];
      id v30 = v22;
      uint64_t v33 = [v30 mutableBytesWithLength:v31 bytes:v32];
      uint64_t v35 = [v10 compressBuffer:v34 ofLength:v26 toBuffer:v29 ofLength:v33 + 4 usingCompressionType:v17 withFinalCompressionType:v6];
      uint64_t v36 = mach_absolute_time();
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = sub_22AF4AE88;
      v59[3] = &unk_2648843B8;
      v59[4] = self;
      v59[5] = v35;
      v59[6] = v36 - v23;
      int v60 = v61;
      sub_22AF4AAC4(v59);
      if (v35)
      {
LABEL_9:
        int v37 = v61;
        self->_compressionType = v61;
        p_compressionType = &self->_compressionType;
        *(p_compressionType - 1) = 7;
        if (a5 <= 1)
        {
          unsigned int v39 = v37 - 3;
          if (v39 >= 8 || ((0xF3u >> v39) & 1) == 0) {
            sub_22AF530A4(p_compressionType, a5);
          }
          int *p_compressionType = dword_22AF551F8[v39];
        }
        id v40 = v22;
        v43 = (__unsafe_unretained id *)objc_msgSend_mutableBytes(v40, v41, v42);
        _DWORD *v43 = [*p_payloadData length];
        [v40 setLength:v46 + 4];
        objc_storeStrong(p_payloadData, v40);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v47 = [*p_payloadData bytes:v20 length:v21];
      uint64_t v50 = [*p_payloadData length];
      id v51 = v22;
      uint64_t v54 = [v51 mutableBytesWithZone:v52 capacity:v53];
      uint64_t v35 = [v10 compressBuffer:v55 ofLength:v47 toBuffer:v50 ofLength:v54 + 4 usingCompressionType:v17 withFinalCompressionType:v6];
      if (v35) {
        goto LABEL_9;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = [*p_payloadData length];
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v58;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "DTXMessage failed to compress buffer of length %llu", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (messageType == 8) {
    [self->_payloadObject compressWithCompressor:v8 usingType:(uint64_t)v10 forCompatibilityWithVersion:v6];
  }
LABEL_18:
}

+ (id)messageWithObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setPayloadObject:v5];

  return v4;
}

+ (id)messageWithError:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setError:v5];

  return v4;
}

+ (id)messageWithPrimitive:(void *)a3
{
  id v4 = objc_opt_new();
  unsigned int v9 = 0;
  uint64_t Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)a3, &v9);
  [v4 setPayloadBuffer:v6 length:v9 shouldCopy:1 destructor:0];
  [v4 setMessageType:6];

  return v4;
}

+ (id)messageWithBuffer:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v6 = objc_opt_new();
  [v6 setPayloadBuffer:v7 length:(uint64_t)a3 shouldCopy:a4 destructor:0];

  return v6;
}

+ (id)messageReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  v8 = objc_opt_new();
  [v8 setPayloadBuffer:v9 length:(uint64_t)a3 shouldCopy:a4 destructor:v7];
  if (v7 && !v8[3]) {
    v7[2](v7);
  }

  return v8;
}

+ (id)messageWithData:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_opt_new();
  if (v6)
  {
    uint64_t v7 = [v3 copyWithZone:v4];
    v8 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v7;

    *(_DWORD *)(v6 + 8) = 1;
    id v9 = (id)v6;
  }

  return (id)v6;
}

+ (id)messageWithSelector:(SEL)a3 typesAndArguments:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    uint64_t v16 = [MEMORY[0x263F08690] a2];
    [v16 _DTXMessage_DTXMessage_m_541_Invalid_parameter_not_satisfying__selector_:a2];
  }
  uint64_t v7 = objc_opt_new();
  v8 = NSStringFromSelector(a3);
  [v7 setPayloadObject:v8];

  [v7 setMessageType:2];
  [v7 appendTypesAndValues:v11 withKey:v4];
  [v7 _makeImmutable:v12 withTransitionContext:v13];

  return v7;
}

+ (id)messageWithSelector:(SEL)a3 objectArguments:(id)a4
{
  id v9 = a4;
  if (!a3)
  {
    uint64_t v16 = [MEMORY[0x263F08690] _currentHandler:v7 with:v8];
    [v16 _DTXMessage_DTXMessage_m_554_Invalid_parameter_not_satisfying__selector_:a2];
  }
  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = [v10 initWithSelector:v11 firstArg:(uint64_t)a3 remainingObjectArgs:v9];
  [v12 _makeImmutable:v13 withTransitionContext:v14];

  return v12;
}

+ (id)messageWithSelector:(SEL)a3 arguments:(id)a4
{
  id v9 = a4;
  if (!a3)
  {
    uint64_t v16 = [MEMORY[0x263F08690] _currentHandler:v7 with:v8];
    [v16 _DTXMessage_DTXMessage_handleFailureInMethod_object_file_lineNumber_description_:v17:a2:a1:@"DTXMessage.m":564:@"Invalid parameter not satisfying: %@", @"selector"];
  }
  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = [v10 initWithSelector:v11 objects:(uint64_t)a3, v9];
  [v12 _makeImmutable:v13 withTransitionContext:v14];

  return v12;
}

+ (id)message
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

- (id)newReply
{
  id v3 = objc_opt_new();
  uint64_t v6 = [self _channelCode:v4 with:v5];
  [v3 setChannelCode:v7];
  uint64_t v10 = [self v8:v9];
  [v3 setIdentifier:v11];
  int v14 = [self v12:v13];
  [v3 setConversationIndex:v15 + 1];
  return v3;
}

- (id)newReplyWithObject:(id)a3
{
  uint64_t v4 = [DTXMessage messageWithObject:a2];
  uint64_t v7 = [self _channelCode:v5 with:v6];
  [v4 setChannelCode:v8];
  uint64_t v11 = [self v9:v10];
  [v4 setIdentifier:v12];
  int v15 = [self v13:v14];
  [v4 setConversationIndex:v16 + 1];
  return v4;
}

- (id)newReplyWithError:(id)a3
{
  uint64_t v4 = [DTXMessage messageWithError:a2];
  uint64_t v7 = [self _channelCode:v5 with:v6];
  [v4 setChannelCode:v8];
  uint64_t v11 = [self v9:v10];
  [v4 setIdentifier:v12];
  int v15 = [self v13:v14];
  [v4 setConversationIndex:v16 + 1];
  return v4;
}

- (id)newReplyWithMessage:(id)a3
{
  id v5 = a3;
  int v8 = [v5 v6:v7];
  if (v8 == 3)
  {
    uint64_t v11 = [v5 v9:v10];
    id v18 = @"peer unable to respond";
  }
  else
  {
    if (v8 != 2)
    {
      uint64_t v21 = [DTXMessage messageWithSelector:v9 arguments:v10];
      objc_storeStrong((id *)(v21 + 48), a3);
      *(void *)(v21 + 32) = [v5 performSelector:v24 withObject:v25];
      [v21 setMessageType:8];
      uint64_t v29 = [v5 v27:v28];
      [v21 setErrorStatus:v30];
      goto LABEL_7;
    }
    uint64_t v11 = [v5 v9:v10];
    id v18 = @"interruption encountered and re-routed";
  }
  uint64_t v19 = sub_22AF4B6EC(v11, v18, v12, v13, v14, v15, v16, v17, v44);
  uint64_t v21 = [DTXMessage messageWithError:v20];

LABEL_7:
  uint64_t v31 = [self v22:v23];
  [v21 setChannelCode:v32];
  uint64_t v35 = [self v33:v34];
  [v21 setIdentifier:v36];
  int v39 = [self v37:v38];
  [v21 setConversationIndex:(v40 + 1)];
  [v21 _makeImmutable:v41 withTransitionContext:v42];

  return (id)v21;
}

- (id)newReplyReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  uint64_t v6 = [DTXMessage messageReferencingBuffer:a2 length:a3 destructor:a4];
  uint64_t v9 = [self _channelCode:v7 with:v8];
  [v6 setChannelCode:v10];
  uint64_t v13 = [self v11:v12];
  [v6 setIdentifier:v14];
  int v17 = [self v15:v16];
  [v6 setConversationIndex:v18 + 1];
  return v6;
}

- (DTXMessage)initWithSelector:(SEL)a3 firstArg:(id)a4 remainingObjectArgs:(char *)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DTXMessage;
  uint64_t v21 = a5;
  uint64_t v9 = [(DTXMessage *)&v20 init];
  if (v9)
  {
    uint64_t v10 = NSStringFromSelector(a3);
    [v9 setPayloadObject:v11 payload:v10];

    v9->_unsigned int messageType = 2;
    if (v8)
    {
      [v9 _willModifyAuxiliary:v12 withTransitionContext:v13];
      uint64_t v14 = MEMORY[0x263EF8330];
      do
      {
        v18[0] = v14;
        v18[1] = 3221225472;
        v18[2] = sub_22AF4BAEC;
        v18[3] = &unk_2648843E0;
        uint64_t v19 = v9;
        sub_22AF4B9C0(v8, v18);
        uint64_t v15 = (id *)v21;
        v21 += 8;
        id v16 = *v15;

        id v8 = v16;
      }
      while (v16);
    }
  }

  return v9;
}

- (DTXMessage)initWithSelector:(SEL)a3 objects:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)DTXMessage;
  uint64_t v7 = [(DTXMessage *)&v29 init];
  if (v7)
  {
    id v8 = NSStringFromSelector(a3);
    [v7 setPayloadObject:v8];

    v7->_unsigned int messageType = 2;
    if ([v6 count:v10 with:v11])
    {
      [v7 _willModifyAuxiliary:v12];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v6;
      uint64_t v16 = [v14 countByEnumeratingWithState:v15 objects:&v25 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v14);
            }
            objc_super v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = sub_22AF4BCD8;
            v23[3] = &unk_2648843E0;
            uint64_t v24 = v7;
            sub_22AF4B9C0(v20, v23);

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v14 countByEnumeratingWithState:v21 objects:v30 count:16];
        }
        while (v17);
      }
    }
  }

  return v7;
}

- (DTXMessage)initWithInvocation:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DTXMessage;
  uint64_t v7 = [(DTXMessage *)&v42 init];
  if (v7)
  {
    id v8 = (const char *)[v4 performSelector:v5 withObject:v6];
    uint64_t v9 = NSStringFromSelector(v8);
    [v7 setPayloadObject:v9];

    v7->_unsigned int messageType = 2;
    uint64_t v13 = [v4 methodSignatureForSelector:v11 withArguments:v12];
    unint64_t v16 = [v13 numberOfArguments:v14, v15];
    if (v16 >= 3)
    {
      unint64_t v19 = v16;
      [v7 _willModifyAuxiliary:v17];
      uint64_t v20 = *MEMORY[0x263EFF4A0];
      for (uint64_t i = 2; i != v19; ++i)
      {
        id v22 = v13;
        ArgumentTypeAtIndex = (unsigned char *)[v22 getArgumentTypeAtIndex:i];
        if (*ArgumentTypeAtIndex == 64)
        {
          v41 = 0;
          [v4 getArgument:&v41 atIndex:i];
          if (v41)
          {
            char v28 = [v41 conformsToProtocol:v27];
            objc_super v29 = v41;
            if ((v28 & 1) == 0)
            {
              id v30 = (void *)MEMORY[0x263EFF940];
              uint64_t v31 = objc_opt_class();
              [v30 raiseFormat:v32 format:v20, @"Arguments for proxied messages must conform to NSSecureCoding. %@ does not.", v31];
              objc_super v29 = v41;
            }
          }
          else
          {
            objc_super v29 = 0;
          }
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = sub_22AF4BF10;
          v39[3] = &unk_2648843E0;
          id v40 = v7;
          sub_22AF4B9C0(v29, v39);
        }
        else
        {
          uint64_t v33 = ArgumentTypeAtIndex;
          uint64_t v34 = (void *)MEMORY[0x263EFF940];
          uint64_t v35 = (const char *)[v4 v25:v26];
          uint64_t v36 = NSStringFromSelector(v35);
          [v34 _raise_format:v37, v20, @"Invalid argument type %s at index %lu of selector %@", v33, i, v36];
        }
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  auxiliary = self->_auxiliary;
  if (auxiliary && !self->_deserialized)
  {
    DTXPrimitiveDictionaryDestroy(auxiliary);
    self->_auxiliary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMessage;
  [(DTXMessage *)&v4 dealloc];
}

- (void)_setPayloadBuffer:(const char *)a3 length:(unint64_t)a4 shouldCopy:(BOOL)a5 destructor:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  if (a3 && a4)
  {
    if (v6)
    {
      [NSData dataWithBytes:MEMORY[0x263EFF8F8] length:(uint64_t)a3];
      uint64_t v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = sub_22AF4C0A8;
        v18[3] = &unk_264884408;
        unint64_t v19 = (NSData *)v11;
        uint64_t v15 = (NSData *)[v13 initWithBytesNoCopy:v14 length:a3 deallocator:v18];
        payloadData = self->_payloadData;
        self->_payloadData = v15;

        uint64_t v17 = v19;
LABEL_9:

        goto LABEL_10;
      }
      [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v10 length:(uint64_t)a3 freeWhenDone:a4];
      uint64_t v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v17 = self->_payloadData;
    self->_payloadData = v12;
    goto LABEL_9;
  }
LABEL_10:
  self->_unsigned int messageType = 1;
}

- (void)setPayloadObject:(id)a3
{
  BOOL v6 = (NSSecureCoding *)a3;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_immutable);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    Name = sel_getName(a2);
    [v8 DTXMessageException:Format:@"-[%@ %s] Unable to modify immutable message: %@", v10, Name, self];
  }
  if (self->_payloadObject != v6)
  {
    objc_storeStrong((id *)&self->_payloadObject, a3);
    payloadObject = self->_payloadObject;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_22AF4C1C4;
    v14[3] = &unk_2648843E0;
    v14[4] = self;
    sub_22AF4B9C0(payloadObject, v14);
  }
}

- (NSSecureCoding)payloadObject
{
  objc_super v4 = objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, a2, v2);
  sub_22AF4C260(self, v4);

  payloadObject = self->_payloadObject;

  return payloadObject;
}

- (id)objectWithAllowedClasses:(id)a3
{
  id v4 = a3;
  sub_22AF4C260(self, v4);
  id v5 = self->_payloadObject;
  id v6 = v4;
  for (Class i = object_getClass(v5); ; Class i = class_getSuperclass(v9))
  {
    uint64_t v9 = i;
    if (!i) {
      break;
    }
    if ([v6 containsObject:v8])
    {
      uint64_t v9 = v5;
      break;
    }
  }

  return v9;
}

- (NSSecureCoding)object
{
  id v6 = 0;
  switch([self a2:v2])
  {
    case 1u:
    case 3u:
    case 6u:
      unsigned __int8 v7 = [DTXMessage _defaultAllowedSecureCodingClasses:v4 withSecureCodingClass:v5];
      id v6 = [self objc_msgSend_objectWithAllowedClasses_:v8:v7];

      break;
    case 8u:
      id v6 = [self->_payloadObject performSelector:v4 withObject:v5];
      break;
    default:
      break;
  }

  return (NSSecureCoding *)v6;
}

- (const)getBufferWithReturnedLength:(unint64_t *)a3
{
  if (self->_messageType != 1) {
    return 0;
  }
  if (a3) {
    *a3 = [self->_payloadData length];
  }
  payloadData = self->_payloadData;

  return (const void *)[payloadData performSelector:a2 withObject:(id)a3];
}

- (void)_makeImmutable
{
  if (qword_26AD828E8 != -1) {
    dispatch_once(&qword_26AD828E8, &unk_26DE3D030);
  }
  char v3 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_immutable, (unsigned __int8 *)&v3, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v3 && self->_auxiliaryPromoted)
  {
    if (!self->_auxiliary)
    {
      DTXPrimitiveDictionaryCreate();
      self->_auxiliary = v4;
    }
    uint64_t v5 = (void *)MEMORY[0x230F368A0]();
    auxiliaryPromoted = self->_auxiliaryPromoted;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_22AF4C8DC;
    v9[3] = &unk_264884490;
    v9[4] = self;
    [auxiliaryPromoted enumerateKeysAndObjectsUsingBlock:v7, v9];
    id v8 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = 0;
  }
}

- (void)_makeBarrier
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF940];
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    Name = sel_getName(a2);
    [v5 DTXMessageException:Format:@"-[%@ %s] Unable to modify immutable message: %@", v7, Name, self];
  }
  self->_unsigned int messageType = 5;
}

- (void)setErrorStatus:(unsigned int)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_immutable);
  if (v5)
  {
    unsigned __int8 v7 = (void *)MEMORY[0x263EFF940];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    Name = sel_getName(a2);
    [v7 DTXMessageException:Format:@"-[%@ %s] Unable to modify immutable message: %@", v9, Name, self];
  }
  self->_status = a3;
}

- (void)_willModifyAuxiliary
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if (v3)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x263EFF940];
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    Name = sel_getName(a2);
    [v5 DTXMessageException:Format:@"-[%@ %s] Unable to modify immutable message: %@", v7, Name, self];
  }
  if (!self->_auxiliary)
  {
    DTXPrimitiveDictionaryCreate();
    self->_auxiliary = v10;
  }
}

- (void)_appendTypesAndValues:(unsigned int)a3 withKey:(id)a4 list:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  uint64_t v32 = a5;
  [self _willModifyAuxiliary:v10 withTransitionContext:v11];
  while ((int)v6 > 5)
  {
    if (v6 == 6)
    {
      uint64_t v21 = v32;
      v32 += 8;
      uint64_t v22 = *(void *)v21;
      id v23 = v9;
      uint64_t v26 = (char *)[v23 UTF8String];
      DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v26, 6, v22);
LABEL_10:
      if (v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (v6 != 11) {
      goto LABEL_13;
    }
    uint64_t v12 = (void **)v32;
    v32 += 8;
    id v13 = *v12;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_22AF4CD30;
    v30[3] = &unk_2648844B8;
    v30[4] = self;
    id v31 = v9;
    id v14 = v13;
    sub_22AF4B9C0(v14, v30);

    if (v9) {
      goto LABEL_15;
    }
LABEL_14:
    objc_super v29 = v32;
    v32 += 8;
    uint64_t v6 = *(unsigned int *)v29;
  }
  if (v6 == 3)
  {
    uint64_t v15 = v32;
    v32 += 8;
    uint64_t v16 = *(unsigned int *)v15;
    id v17 = v9;
    uint64_t v20 = (char *)[v17 UTF8String];
    DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v20, 3, v16);
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v27 = objc_opt_class();
  char v28 = NSStringFromSelector(a2);
  NSLog(&cfstr_UnknownParamet.isa, v27, v28, v6);

  if (!v9) {
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_mutableAuxiliaryDictionary
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if (v3)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    Name = sel_getName(a2);
    [v5 DTXMessageException:Format:@"-[%@ %s] Unable to modify immutable message: %@", v7, Name, self];
  }
  auxiliaryPromoted = self->_auxiliaryPromoted;
  if (!auxiliaryPromoted)
  {
    uint64_t v11 = (NSDictionary *)objc_opt_new();
    uint64_t v12 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = v11;

    auxiliaryPromoted = self->_auxiliaryPromoted;
  }

  return auxiliaryPromoted;
}

- (void)setString:(id)a3 forMessageKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [self mutableAuxiliaryDictionary:v7 withTransitionContext:v8];
        [v9 setObject:v10 forKeyedSubscript:(uint64_t)v11];
      }
    }
  }
}

- (void)setInteger:(int64_t)a3 forMessageKey:(id)a4
{
  if (a4)
  {
    id v6 = NSNumber;
    id v7 = a4;
    [v6 numberWithLongLong:a3];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [self mutableAuxiliaryDictionaryWithIdentifier:v9 createIfNeeded:v10];
    [v11 setObject:v12 forKeyedSubscript:(uint64_t)v13];
  }
}

- (void)setData:(id)a3 forMessageKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [self mutableAuxiliaryDictionary:v7 withTransitionContext:v8];
        [v9 setObject:v10 forKeyedSubscript:(uint64_t)v11];
      }
    }
  }
}

- (id)_faultAuxiliaryValueOfType:(Class)a3 forKey:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    if (self->_messageType == 8)
    {
      [self->_payloadObject faultAuxiliaryValueOfType:v6 forKey:(uint64_t)a3];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      auxiliaryPromoted = self->_auxiliaryPromoted;
      if (!auxiliaryPromoted)
      {
        uint64_t v10 = (NSDictionary *)CFDictionaryCreateWithDTXPrimitiveDictionary((uint64_t)self->_auxiliary);
        id v11 = self->_auxiliaryPromoted;
        self->_auxiliaryPromoted = v10;

        auxiliaryPromoted = self->_auxiliaryPromoted;
      }
      uint64_t v12 = [auxiliaryPromoted objectForKeyedSubscript:v6];
      if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
        id v13 = 0;
      }
      else {
        id v13 = v12;
      }
      id v8 = v13;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)integerForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = [self faultAuxiliaryValueOfType:v6 forKey:v5];

  int64_t v10 = [v7 v8:v9];
  return v10;
}

- (id)stringForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = [self faultAuxiliaryValueOfType:v6 forKey:v5];

  return v7;
}

- (id)dataForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = [self faultAuxiliaryValueOfType:v6 forKey:v5];

  return v7;
}

- (id)valueForMessageKey:(id)a3
{
  return [self faultAuxiliaryValueOfType:0 forKey:a3];
}

- (NSError)error
{
  v12[1] = *MEMORY[0x263EF8340];
  unsigned int messageType = self->_messageType;
  if (messageType == 4)
  {
    uint64_t v5 = [self a2:v2];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v5;
      }
      else
      {
        id v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = *MEMORY[0x263F08320];
        v12[0] = v5;
        id v8 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v11 count:v12];
        [v7 errorWithDomain:@"DTXConnection" code:1 userInfo:v8];
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  else if (messageType == 8)
  {
    [self->_payloadObject performSelector:a2 withObject:v2];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  self->_unsigned int messageType = 4;
  self->_status = 1;
}

- (BOOL)isDispatch
{
  unsigned int messageType = self->_messageType;
  if (messageType == 8) {
    return [self->_payloadObject isEqual:v2];
  }
  else {
    return messageType == 2;
  }
}

- (BOOL)isBarrier
{
  unsigned int messageType = self->_messageType;
  if (messageType == 8) {
    return [self->_payloadObject isBarrier:v2];
  }
  else {
    return messageType == 5;
  }
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned int)a3
{
  self->_unsigned int messageType = a3;
}

- (BOOL)shouldInvokeWithTarget:(id)a3
{
  id v4 = a3;
  int isDispatch = [self isDispatch:v5 with:v6];
  char v10 = 0;
  if (v4 && isDispatch)
  {
    [self _setPayloadObject:v8];
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    SEL v12 = NSSelectorFromString(v11);

    id v14 = [v4 methodSignatureForSelector:v13];
    if (v14) {
      char v10 = sub_22AF4D4AC((uint64_t)v12, v4);
    }
    else {
      char v10 = 0;
    }
  }
  return v10;
}

- (void)invokeWithTarget:(id)a3 replyChannel:(id)a4 validator:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, void *))a5;
  if (![self _isDispatch:v11 withTransitionContext:v12]) {
    goto LABEL_29;
  }
  [self _setPayloadObject:v13];
  uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v16 = NSSelectorFromString(v15);

  uint64_t v20 = [v8 methodSignatureForSelector:v17];
  if (v20)
  {
    if (v10 || (sub_22AF4D4AC((uint64_t)v16, v8) & 1) != 0) {
      goto LABEL_8;
    }
    uint64_t v22 = (void *)MEMORY[0x263EFF940];
    id v23 = [self v18:v21];
    [v22 raiseFormat:@"DTXMessageInvocationException" format:@"Unable to invoke -[%@ %@] - the selector is not allowed", v8, v23];
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x263EFF940];
    id v23 = [self v18:v19];
    [v25 raise:@"DTXMessageInvocationException" format:@"Unable to invoke -[%@ %@] - it does not respond to the selector", v8, v23];
  }

LABEL_8:
  uint64_t v27 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v18];
  [v27 setSelector:v28];
  [v27 setTarget:v29];
  uint64_t v34 = [DTXMessage _defaultAllowedSecureCodingClasses:v30 withTransitionContext:v31];
  if (v10)
  {
    uint64_t v35 = v10[2](v10, v27);

    uint64_t v34 = (void *)v35;
  }
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  uint64_t v78 = [v20 numberOfArgumentsWithSelector:v32] - 2;
  uint64_t v36 = objc_opt_new();
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  auxiliary = self->_auxiliary;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = sub_22AF4DCB4;
  v65[3] = &unk_2648844E0;
  v68 = &v79;
  v69 = &v75;
  v70 = &v71;
  id v38 = v27;
  id v66 = v38;
  id v39 = v36;
  id v67 = v39;
  sub_22AF4DBF8((uint64_t)auxiliary, v34, v65);
  if (v80[3] < (unint64_t)v76[3])
  {
    objc_super v42 = (void *)MEMORY[0x263EFF940];
    v43 = [self v40:v41];
    [v42 raiseFormat:@"DTXMessageInvocationException" format:@"Unable to invoke [(%@ *)%lu provided %@]", v8, v43, v80[3], v76[3]];
  }
  [v38 performSelector:v40 withObject:v41];
  CFArrayRef v47 = (const __CFArray *)v72[3];
  if (v47)
  {
    v84.length = CFArrayGetCount((CFArrayRef)v72[3]);
    v84.location = 0;
    CFArrayApplyFunction(v47, v84, (CFArrayApplierFunction)j__free, 0);
    CFRelease((CFTypeRef)v72[3]);
  }
  id v64 = 0;
  if (objc_msgSend_methodReturnLength(v20, v45, v46) < 8)
  {
    id v51 = 0;
  }
  else
  {
    [v38 _getReturnValue:v48];
    id v50 = v64;
    id v51 = v50;
    if (v50)
    {
      if ([v50 conformsToProtocol:v48] == NO)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v60 = (void *)MEMORY[0x263EFF940];
          v52 = [self v48:v49];
          [v60 raise:@"DTXMessageInvocationException" format:@"Unable to invoke -[%@ %@] - 'id' return value does not conform to NSSecureCoding", v8, v52];
        }
      }
    }
  }
  if ([self _callOutQueue_willDestroyWithTransitionContext:v48 completion:v49])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v56 = v51;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = sub_22AF4DE6C;
      v61[3] = &unk_264884508;
      id v62 = v9;
      uint64_t v63 = self;
      [v56 handleCompletion:v57 withError:v61];
    }
    else
    {
      if (v51) {
        uint64_t v58 = [self newReplyWithObject:v54];
      }
      else {
        uint64_t v58 = [self v54:v55];
      }
      id v56 = (id)v58;
      [v9 sendControlAsync:v59 replyHandler:v58];
    }
  }
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

LABEL_29:
}

+ (BOOL)extractSerializedCompressionInfoFromBuffer:(const char *)a3 length:(unint64_t)a4 compressionType:(int *)a5 uncompressedLength:(unint64_t *)a6 compressedDataOffset:(unint64_t *)a7
{
  BOOL result = 0;
  if (a3 && a4 >= 0x14 && a5 && a6 && a7)
  {
    if (*(_DWORD *)a3 == 7
      && (unint64_t v8 = *((void *)a3 + 1) - *((unsigned int *)a3 + 1), *a5 = (*(_DWORD *)a3 >> 8) & 0xF, v8 >= 4))
    {
      id v9 = &a3[*((unsigned int *)a3 + 1)];
      *a6 = *((unsigned int *)v9 + 4);
      *a7 = v9 + 16 - a3 + 4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_decompressedData:(id)a3 compressor:(id)a4 compressionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v44[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    sub_22AF5314C();
  }
  uint64_t v11 = v8;
  if ([v7 length] <= 3)
  {
    char v28 = [DTXDecompressionException alloc];
    v43 = @"compressionType";
    id v30 = [NSNumber numberWithUnsignedInt:v29];
    v44[0] = v30;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v31 forKeys:(uint64_t)v44 count:1];
    id v34 = [v28 initWithName:v33 reason:@"DTXDecompressionException" userInfo:@"payload too small to contain block compression header"];
    goto LABEL_10;
  }
  id v12 = v7;
  uint64_t v15 = (unsigned int *)[v12 v13:v14];
  id v16 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v18 = [v16 initWithLength:v17 bytes:v15];
  uint64_t v21 = [v12 length] - 4;
  id v22 = v18;
  uint64_t v25 = [v22 mutableBytesWithZone:v23 capacity:v24];
  if ([v11 uncompressBuffer:v26 ofLength:(v15 + 1) toBuffer:v21 withKnownUncompressedLength:v25 usingCompressionType:*v15] == NO)
  {
    uint64_t v35 = [DTXDecompressionException alloc];
    v41[0] = @"compressionType";
    id v30 = [NSNumber numberWithUnsignedInt:v36];
    v41[1] = @"uncompressedSize";
    v42[0] = v30;
    uint64_t v32 = [NSNumber numberWithUnsignedInt:*v15];
    v42[1] = v32;
    id v39 = [NSDictionary dictionaryWithObjects:v38 forKeys:v41 count:2];
    id v34 = [v35 initWithName:@"DTXDecompressionException" reason:@"block decompressor failed" userInfo:v39];

LABEL_10:
    objc_exception_throw(v34);
  }

  return v22;
}

- (id)_initWithReferencedSerializedForm:(id)a3 compressor:(id)a4 payloadSet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  v28.receiver = self;
  v28.super_class = (Class)DTXMessage;
  uint64_t v11 = [(DTXMessage *)&v28 init];
  if (v11)
  {
    id v12 = v8;
    uint64_t v15 = (unsigned __int8 *)[v12 v13:v14];
    v11->_deserialized = 1;
    v11->_cost = [v12 lengthWithOptions:v16 range:v17];
    uint64_t v18 = *((unsigned int *)v15 + 1);
    uint64_t v19 = *((void *)v15 + 1) - v18;
    v10[2](v10, (uint64_t)&v15[v18 + 16], v19);
    v11->_auxiliary = (void *)DTXPrimitiveDictionaryReferencingSerialized(v15 + 16, *((unsigned int *)v15 + 1));
    unsigned int v22 = *v15;
    v11->_unsigned int messageType = v22;
    v11->_status = v22 == 4;
    if (v22 == 7)
    {
      id v23 = [NSData dataWithBytesNoCopy:MEMORY[0x263EFF8F8] length:(uint64_t)&v15[*((unsigned int *)v15 + 1) + 16] freeWhenDone:v19];
      uint64_t v25 = [v11 decompressedData:v24 compressor:v23 compressionType:(*(_DWORD *)v15 >> 12) & 0xF0 | (*(_DWORD *)v15 >> 8) & 0xFu];
      payloadData = v11->_payloadData;
      v11->_payloadData = (NSData *)v25;

      if (!v11->_payloadData)
      {

        uint64_t v11 = 0;
        goto LABEL_7;
      }
      v11->_unsigned int messageType = 1;
    }
    [v11 _makeImmutable:v20 withTransitionContext:v21];
  }
LABEL_7:

  return v11;
}

- (DTXMessage)initWithSerializedForm:(id)a3 compressor:(id)a4
{
  objc_storeStrong((id *)&self->_serializedData, a3);
  id v7 = a3;
  id v8 = a4;
  serializedData = self->_serializedData;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22AF4E3EC;
  v13[3] = &unk_264884530;
  uint64_t v14 = self;
  uint64_t v11 = (DTXMessage *)[[DTXMessage alloc] initWithReferencedSerializedForm:serializedData compressor:v8 payloadSet:v13];

  return v11;
}

- (DTXMessage)initWithSerializedForm:(const char *)a3 length:(unint64_t)a4 destructor:(id)a5 compressor:(id)a6
{
  id v10 = a5;
  uint64_t v11 = (objc_class *)MEMORY[0x263EFF8F8];
  id v12 = a6;
  id v13 = [v11 alloc];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_22AF4E570;
  v24[3] = &unk_264884408;
  id v25 = v10;
  id v14 = v10;
  id v16 = [v13 initWithBytesNoCopy:v15 length:a3 deallocator:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_22AF4E588;
  v22[3] = &unk_264884530;
  id v23 = self;
  uint64_t v18 = (DTXMessage *)[[DTXMessage alloc] initWithReferencedSerializedForm:v17 compressor:v12 payloadSet:v22];

  serializedData = v18->_serializedData;
  v18->_serializedData = v16;
  uint64_t v20 = v16;

  return v18;
}

- (void)serializedFormApply:(id)a3
{
  uint64_t v5 = (void (**)(id, _DWORD *, uint64_t))a3;
  if (v5)
  {
    if (self->_messageType == 8)
    {
      [self->_payloadObject apply:v4 withObject:v5];
    }
    else
    {
      unsigned int v21 = 0;
      uint64_t Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v21);
      uint64_t v7 = v21;
      uint64_t v10 = [self->_payloadData length];
      unsigned int messageType = self->_messageType;
      if (messageType == 7) {
        unsigned int messageType = (self->_compressionType << 12) & 0xF0000 | ((self->_compressionType & 0xF) << 8) | 7;
      }
      v19[0] = messageType;
      v19[1] = v21;
      uint64_t v20 = v10 + v7;
      v5[2](v5, v19, 16);
      uint64_t v13 = v21;
      if (v21) {
        ((void (*)(void (**)(id, _DWORD *, uint64_t), uint64_t))v5[2])(v5, Serialized);
      }
      payloadData = self->_payloadData;
      if (payloadData)
      {
        uint64_t v15 = [payloadData bytes:v12 length:v13];
        uint64_t v18 = [self->_payloadData length];
        ((void (**)(id, uint64_t, uint64_t))v5)[2](v5, v15, v18);
      }
    }
  }
}

- (unint64_t)serializedLength
{
  if (self->_messageType == 8)
  {
    payloadObject = self->_payloadObject;
    return [payloadObject serializedLengthWithObject:a2];
  }
  else
  {
    unsigned int v9 = 0;
    DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v9);
    uint64_t v6 = v9;
    return v6 + [self->_payloadData length] + 16;
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (void)setChannelCode:(unsigned int)a3
{
  self->_channelCode = a3;
}

- (BOOL)expectsReply
{
  return self->_expectsReply;
}

- (void)setExpectsReply:(BOOL)a3
{
  self->_expectsReply = a3;
}

- (unsigned)conversationIndex
{
  return self->_conversationIndex;
}

- (void)setConversationIndex:(unsigned int)a3
{
  self->_conversationIndex = a3;
}

- (BOOL)deserialized
{
  return self->_deserialized;
}

- (unsigned)errorStatus
{
  return self->_status;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryPromoted, 0);
  objc_storeStrong((id *)&self->_payloadObject, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);

  objc_storeStrong((id *)&self->_payloadData, 0);
}

@end