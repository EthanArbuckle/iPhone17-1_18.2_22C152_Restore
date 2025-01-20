@interface SFFormAutoFillFrame
+ (id)autoFillFrameWithWebProcessPlugInFrame:(id)a3;
- (BOOL)containsAnyFormElements;
- (BOOL)isEqual:(id)a3;
- (OpaqueFormAutoFillFrame)frameRef;
- (OpaqueJSContext)jsContextForMetadataControllerScriptWorld;
- (OpaqueJSValue)jsWrapperInMetadataControllerScriptWorldForNode:(id)a3;
- (SFFormAutoFillFrame)initWithWebProcessPlugInFrame:(id)a3;
- (WKWebProcessPlugInFrame)plugInFrame;
- (id)_formMetadataController;
- (id)_pageContoller;
- (id)committedURL;
- (id)pageMainFrame;
- (unint64_t)hash;
- (void)enumerateChildFramesUsingBlock:(id)a3;
@end

@implementation SFFormAutoFillFrame

+ (id)autoFillFrameWithWebProcessPlugInFrame:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithWebProcessPlugInFrame:v4];

  return v5;
}

- (SFFormAutoFillFrame)initWithWebProcessPlugInFrame:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormAutoFillFrame;
  v6 = [(SFFormAutoFillFrame *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plugInFrame, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFFormAutoFillFrame *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && self->_plugInFrame == v4->_plugInFrame;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(WKWebProcessPlugInFrame *)self->_plugInFrame hash];
}

- (id)_pageContoller
{
  v2 = [(WKWebProcessPlugInFrame *)self->_plugInFrame _browserContextController];
  v3 = +[_SFWebProcessPlugInPageController pageControllerForBrowserContextController:v2];

  return v3;
}

- (id)_formMetadataController
{
  v2 = [(SFFormAutoFillFrame *)self _pageContoller];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 formMetadataController];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (OpaqueFormAutoFillFrame)frameRef
{
  return (OpaqueFormAutoFillFrame *)self->_plugInFrame;
}

- (id)pageMainFrame
{
  v3 = [(SFFormAutoFillFrame *)self _pageContoller];
  id v4 = [v3 mainFrame];

  if (v4 == self->_plugInFrame)
  {
    id v5 = self;
  }
  else
  {
    id v5 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v4];
  }
  v6 = v5;

  return v6;
}

- (OpaqueJSContext)jsContextForMetadataControllerScriptWorld
{
  v3 = [(SFFormAutoFillFrame *)self _formMetadataController];
  id v4 = [v3 scriptWorld];

  if (v4)
  {
    id v5 = [(WKWebProcessPlugInFrame *)self->_plugInFrame jsContextForWorld:v4];
    v6 = (OpaqueJSContext *)[v5 JSGlobalContextRef];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsAnyFormElements
{
  return [(WKWebProcessPlugInFrame *)self->_plugInFrame containsAnyFormElements];
}

- (OpaqueJSValue)jsWrapperInMetadataControllerScriptWorldForNode:(id)a3
{
  id v4 = [a3 nodeHandle];
  id v5 = [(SFFormAutoFillFrame *)self _formMetadataController];
  v6 = [v5 scriptWorld];

  BOOL v7 = 0;
  if (v4 && v6)
  {
    v8 = [(WKWebProcessPlugInFrame *)self->_plugInFrame jsNodeForNodeHandle:v4 inWorld:v6];
    BOOL v7 = (OpaqueJSValue *)[v8 JSValueRef];
  }
  return v7;
}

- (id)committedURL
{
  return (id)[(WKWebProcessPlugInFrame *)self->_plugInFrame URL];
}

- (void)enumerateChildFramesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(WKWebProcessPlugInFrame *)self->_plugInFrame childFrames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (WKWebProcessPlugInFrame)plugInFrame
{
  return self->_plugInFrame;
}

- (void).cxx_destruct
{
}

@end