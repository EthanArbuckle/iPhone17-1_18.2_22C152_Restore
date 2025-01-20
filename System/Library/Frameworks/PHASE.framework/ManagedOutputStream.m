@interface ManagedOutputStream
- (BOOL)isControllerPaused;
- (BOOL)isStreamPaused;
- (ManagedOutputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 renderBlock:(id)a6;
- (NSUUID)attributedClientID;
- (PHASEExternalOutputStreamDefinition)definition;
- (id)renderBlock;
- (void)setAttributedClientID:(id)a3;
- (void)setControllerPaused:(BOOL)a3;
- (void)setDefinition:(id)a3;
- (void)setRenderBlock:(id)a3;
- (void)setStreamPaused:(BOOL)a3;
@end

@implementation ManagedOutputStream

- (ManagedOutputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 renderBlock:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ManagedOutputStream;
  v14 = [(ManagedOutputStream *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_streamPaused = a3;
    objc_storeStrong((id *)&v14->_definition, a5);
    v16 = _Block_copy(v13);
    id renderBlock = v15->_renderBlock;
    v15->_id renderBlock = v16;

    objc_storeStrong((id *)&v15->_attributedClientID, a4);
  }

  return v15;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (BOOL)isControllerPaused
{
  return self->_controllerPaused;
}

- (void)setControllerPaused:(BOOL)a3
{
  self->_controllerPaused = a3;
}

- (PHASEExternalOutputStreamDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void)setRenderBlock:(id)a3
{
}

- (NSUUID)attributedClientID
{
  return self->_attributedClientID;
}

- (void)setAttributedClientID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedClientID, 0);
  objc_storeStrong(&self->_renderBlock, 0);

  objc_storeStrong((id *)&self->_definition, 0);
}

@end