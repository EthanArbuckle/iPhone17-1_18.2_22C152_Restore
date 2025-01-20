@interface DTXProxyRequestHandler
- (BOOL)matchesPublishedProtocolName:(id)a3 peerProtocolName:(id)a4;
- (DTXProxyRequestHandler)initWithPublishedProtocol:(id)a3 publishedProtocolName:(id)a4 peerProtocol:(id)a5 peerProtocolName:(id)a6 handlerBlock:(id)a7;
- (NSString)channelIdentifier;
- (NSString)peerProtocolName;
- (NSString)publishedProtocolName;
- (Protocol)peerProtocol;
- (Protocol)publishedProtocol;
- (id)handlerBlock;
@end

@implementation DTXProxyRequestHandler

- (DTXProxyRequestHandler)initWithPublishedProtocol:(id)a3 publishedProtocolName:(id)a4 peerProtocol:(id)a5 peerProtocolName:(id)a6 handlerBlock:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v20 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = [MEMORY[0x263F08690] currentHandler:v18 with:v19];
    [v36 _DTXConnection_DTXConnection_handleFailureInMethod_object_file_lineNumber_description_:v37:self:@"DTXConnection.m":113:@"Invalid parameter not satisfying: %@", @"publishedProtocol != NULL"];

    if (v15) {
      goto LABEL_3;
    }
  }
  v38 = [MEMORY[0x263F08690] currentHandler:v18 with:v19];
  [v38 _DTXConnection_DTXConnection_handleFailureInMethod_object_file_lineNumber_description_:v39:a2:self:@"DTXConnection.m":114:@"Invalid parameter not satisfying: %@", @"publishedProtocolName != nil"];

LABEL_3:
  if ((v16 == 0) == (v17 == 0))
  {
    if (v20) {
      goto LABEL_5;
    }
  }
  else
  {
    v40 = [MEMORY[0x263F08690] currentHandler:v18 with:v19];
    [v40 _DTXConnection_DTXConnection_m_115_Invalid_parameter_not_satisfying__peerProtocol__peerProtocolName__:a2];

    if (v20) {
      goto LABEL_5;
    }
  }
  v42 = [MEMORY[0x263F08690] currentHandler:v18 with:v19];
  [v42 _DTXConnection_DTXConnection_handleFailureInMethod_object_file_lineNumber_description_:v43:self:DTXConnection.m:116:@"Invalid parameter not satisfying: %@", @"handlerBlock != NULL"];

LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)DTXProxyRequestHandler;
  v21 = [(DTXProxyRequestHandler *)&v44 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_publishedProtocol, a3);
    uint64_t v25 = [v15 copyWithZone:v23];
    publishedProtocolName = v22->_publishedProtocolName;
    v22->_publishedProtocolName = (NSString *)v25;

    objc_storeStrong((id *)&v22->_peerProtocol, a5);
    uint64_t v29 = [v17 copyWithZone:v27];
    peerProtocolName = v22->_peerProtocolName;
    v22->_peerProtocolName = (NSString *)v29;

    uint64_t v33 = [v20 copyWithZone:v31];
    id handlerBlock = v22->_handlerBlock;
    v22->_id handlerBlock = (id)v33;
  }
  return v22;
}

- (NSString)channelIdentifier
{
  [self _publishedProtocolName:a2];
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [self _peerProtocolName:v5];
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = @"*";
  if (v4) {
    v10 = v4;
  }
  else {
    v10 = @"*";
  }
  if (v8) {
    v9 = v8;
  }
  v11 = [NSString stringWithFormat:@"%@:%@:%@", @"dtxproxy", v10, v9];

  return (NSString *)v11;
}

- (BOOL)matchesPublishedProtocolName:(id)a3 peerProtocolName:(id)a4
{
  uint64_t v6 = (uint64_t)a4;
  id v7 = a3;
  v10 = [self publishedProtocolNameWithProtocolName:v8];
  int isEqualToString = [v10 isEqualToString:v11];

  if (isEqualToString)
  {
    uint64_t v17 = [self _peerProtocolName:v13 withProtocol:v14];
    if (v6 | v17)
    {
      uint64_t v19 = [self _peerProtocolName:v15 withName:v16];
      char v18 = [v19 isEqualToString:v20];
    }
    else
    {
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (Protocol)publishedProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)publishedProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (Protocol)peerProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)peerProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)handlerBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_peerProtocolName, 0);
  objc_storeStrong((id *)&self->_peerProtocol, 0);
  objc_storeStrong((id *)&self->_publishedProtocolName, 0);

  objc_storeStrong((id *)&self->_publishedProtocol, 0);
}

@end