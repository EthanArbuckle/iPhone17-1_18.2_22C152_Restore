@interface _SFFormAutoFillInputSession
- (NSDictionary)autoFillInputSessionUserObject;
- (SFFormAutoFillFrameHandle)frameHandle;
- (WBSFormMetadata)formMetadata;
- (_SFFormAutoFillInputSession)initWithFocusedElement:(id)a3;
- (_SFFormAutoFillInputSession)initWithFormInputSession:(id)a3;
- (_WKFocusedElementInfo)focusedElementInfo;
- (_WKFormInputSession)formInputSession;
- (id)_initWithFormInputSession:(id)a3 focusedElement:(id)a4;
- (id)autoFillInputSessionByReplacingInputSessionUserObject:(id)a3;
- (void)_updateAutoFillInputSessionUserObject:(id)a3;
@end

@implementation _SFFormAutoFillInputSession

- (_SFFormAutoFillInputSession)initWithFormInputSession:(id)a3
{
  return (_SFFormAutoFillInputSession *)[(_SFFormAutoFillInputSession *)self _initWithFormInputSession:a3 focusedElement:0];
}

- (_SFFormAutoFillInputSession)initWithFocusedElement:(id)a3
{
  return (_SFFormAutoFillInputSession *)[(_SFFormAutoFillInputSession *)self _initWithFormInputSession:0 focusedElement:a3];
}

- (id)_initWithFormInputSession:(id)a3 focusedElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFFormAutoFillInputSession;
  v9 = [(_SFFormAutoFillInputSession *)&v16 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_formInputSession, a3);
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      id v11 = [p_isa[3] focusedElementInfo];
    }
    id v12 = p_isa[1];
    p_isa[1] = v11;

    v13 = [p_isa[3] userObject];
    if (!v13)
    {
      v13 = [p_isa[1] userObject];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [p_isa _updateAutoFillInputSessionUserObject:v13];
    }
    v14 = p_isa;
  }
  return p_isa;
}

- (void)_updateAutoFillInputSessionUserObject:(id)a3
{
  objc_storeStrong((id *)&self->_autoFillInputSessionUserObject, a3);
  id v5 = a3;
  v6 = [(NSDictionary *)self->_autoFillInputSessionUserObject objectForKeyedSubscript:@"frame"];
  id v7 = +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:v6];
  frameHandle = self->_frameHandle;
  self->_frameHandle = v7;

  v9 = (void *)MEMORY[0x1E4F98B58];
  id v12 = [(NSDictionary *)self->_autoFillInputSessionUserObject objectForKeyedSubscript:@"form"];
  v10 = [v9 formMetadataFromSerializedData:v12];
  formMetadata = self->_formMetadata;
  self->_formMetadata = v10;
}

- (id)autoFillInputSessionByReplacingInputSessionUserObject:(id)a3
{
  id v4 = a3;
  id v5 = [_SFFormAutoFillInputSession alloc];
  v6 = [(_SFFormAutoFillInputSession *)self formInputSession];
  id v7 = [(_SFFormAutoFillInputSession *)self focusedElementInfo];
  id v8 = [(_SFFormAutoFillInputSession *)v5 _initWithFormInputSession:v6 focusedElement:v7];

  [v8 _updateAutoFillInputSessionUserObject:v4];

  return v8;
}

- (_WKFocusedElementInfo)focusedElementInfo
{
  return self->_focusedElementInfo;
}

- (NSDictionary)autoFillInputSessionUserObject
{
  return self->_autoFillInputSessionUserObject;
}

- (_WKFormInputSession)formInputSession
{
  return self->_formInputSession;
}

- (SFFormAutoFillFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_frameHandle, 0);
  objc_storeStrong((id *)&self->_formInputSession, 0);
  objc_storeStrong((id *)&self->_autoFillInputSessionUserObject, 0);

  objc_storeStrong((id *)&self->_focusedElementInfo, 0);
}

@end