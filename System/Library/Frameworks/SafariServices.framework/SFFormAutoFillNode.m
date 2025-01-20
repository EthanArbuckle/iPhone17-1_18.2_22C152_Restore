@interface SFFormAutoFillNode
+ (id)autoFillNodeWithNodeHandle:(id)a3;
- (BOOL)isHTMLInputElementUserEdited;
- (BOOL)isHTMLTextAreaElementUserEdited;
- (CGRect)elementBounds;
- (SFFormAutoFillNode)initWithJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4;
- (SFFormAutoFillNode)initWithNodeHandle:(id)a3;
- (WKWebProcessPlugInNodeHandle)nodeHandle;
- (int64_t)htmlInputElementAutoFillButtonType;
- (int64_t)htmlInputElementLastAutoFillButtonType;
- (void)setHTMLInputElementAutoFilledAndObscured:(BOOL)a3;
- (void)setHTMLInputElementAutoFilledAndViewable:(BOOL)a3;
- (void)setHTMLInputElementAutoFilledWithAutomaticStrongPassword:(BOOL)a3;
- (void)setHTMLInputElementAutofilled:(BOOL)a3;
- (void)setSpinnerVisibilityOnHTMLInputElement:(BOOL)a3;
@end

@implementation SFFormAutoFillNode

+ (id)autoFillNodeWithNodeHandle:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithNodeHandle:v4];

  return v5;
}

- (SFFormAutoFillNode)initWithNodeHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormAutoFillNode;
  v6 = [(SFFormAutoFillNode *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nodeHandle, a3);
    v8 = v7;
  }

  return v7;
}

- (SFFormAutoFillNode)initWithJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  id v4 = a3;
  id v5 = self;
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)SFFormAutoFillNode;
    id v5 = [(SFFormAutoFillNode *)&v13 init];
    if (v5)
    {
      v7 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:JSContextGetGlobalContext(a4)];
      v8 = (void *)MEMORY[0x1E4F466E0];
      v9 = [MEMORY[0x1E4F30938] valueWithJSValueRef:v4 inContext:v7];
      uint64_t v10 = [v8 nodeHandleWithJSValue:v9 inContext:v7];
      nodeHandle = v5->_nodeHandle;
      v5->_nodeHandle = (WKWebProcessPlugInNodeHandle *)v10;

      if (v5->_nodeHandle) {
        id v4 = v5;
      }
      else {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return (SFFormAutoFillNode *)v4;
}

- (CGRect)elementBounds
{
  [(WKWebProcessPlugInNodeHandle *)self->_nodeHandle elementBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHTMLInputElementAutofilled:(BOOL)a3
{
}

- (void)setHTMLInputElementAutoFilledAndViewable:(BOOL)a3
{
}

- (void)setHTMLInputElementAutoFilledAndObscured:(BOOL)a3
{
}

- (BOOL)isHTMLInputElementUserEdited
{
  return [(WKWebProcessPlugInNodeHandle *)self->_nodeHandle HTMLInputElementIsUserEdited];
}

- (BOOL)isHTMLTextAreaElementUserEdited
{
  return [(WKWebProcessPlugInNodeHandle *)self->_nodeHandle HTMLTextAreaElementIsUserEdited];
}

- (void)setHTMLInputElementAutoFilledWithAutomaticStrongPassword:(BOOL)a3
{
  BOOL v3 = a3;
  nodeHandle = self->_nodeHandle;
  if (a3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  [(WKWebProcessPlugInNodeHandle *)nodeHandle setHTMLInputElementAutoFillButtonEnabledWithButtonType:v6];
  v7 = self->_nodeHandle;

  [(WKWebProcessPlugInNodeHandle *)v7 setHTMLInputElementIsAutoFilled:v3];
}

- (int64_t)htmlInputElementAutoFillButtonType
{
  uint64_t v2 = [(WKWebProcessPlugInNodeHandle *)self->_nodeHandle htmlInputElementAutoFillButtonType];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1A6A89100[v2 - 1];
  }
}

- (int64_t)htmlInputElementLastAutoFillButtonType
{
  uint64_t v2 = [(WKWebProcessPlugInNodeHandle *)self->_nodeHandle htmlInputElementLastAutoFillButtonType];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1A6A89100[v2 - 1];
  }
}

- (void)setSpinnerVisibilityOnHTMLInputElement:(BOOL)a3
{
  nodeHandle = self->_nodeHandle;
  if (a3) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 0;
  }
  [(WKWebProcessPlugInNodeHandle *)nodeHandle setHTMLInputElementAutoFillButtonEnabledWithButtonType:v4];
}

- (WKWebProcessPlugInNodeHandle)nodeHandle
{
  return self->_nodeHandle;
}

- (void).cxx_destruct
{
}

@end