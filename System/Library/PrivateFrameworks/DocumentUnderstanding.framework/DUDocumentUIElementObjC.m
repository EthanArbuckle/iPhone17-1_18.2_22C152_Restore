@interface DUDocumentUIElementObjC
- (BOOL)isOnScreen;
- (BOOL)isValidForContentExtraction;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (DUDocumentUIElementObjC)init;
- (NSArray)superviewClassNames;
- (NSString)classDescriptor;
- (NSString)text;
- (NSString)version;
- (float)fontSize;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setClassDescriptor:(id)a3;
- (void)setFontSize:(float)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)setIsValidForContentExtraction:(BOOL)a3;
- (void)setSuperviewClassNames:(id)a3;
- (void)setText:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DUDocumentUIElementObjC

- (void).cxx_destruct
{
}

- (void)setIsValidForContentExtraction:(BOOL)a3
{
  objc_msgSend_setIsValidForContentExtraction_(self->_underlyingElement, a2, a3, v3, v4);
}

- (BOOL)isValidForContentExtraction
{
  return objc_msgSend_isValidForContentExtraction(self->_underlyingElement, a2, v2, v3, v4);
}

- (void)setIsOnScreen:(BOOL)a3
{
  objc_msgSend_setIsOnScreen_(self->_underlyingElement, a2, a3, v3, v4);
}

- (BOOL)isOnScreen
{
  return objc_msgSend_isOnScreen(self->_underlyingElement, a2, v2, v3, v4);
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  objc_msgSend_setAbsoluteOriginOnScreen_(self->_underlyingElement, a2, v3, v4, v5, a3.x, a3.y);
}

- (CGPoint)absoluteOriginOnScreen
{
  objc_msgSend_absoluteOriginOnScreen(self->_underlyingElement, a2, v2, v3, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  objc_msgSend_setFrameInWindow_(self->_underlyingElement, a2, v3, v4, v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frameInWindow
{
  objc_msgSend_frameInWindow(self->_underlyingElement, a2, v2, v3, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)setSuperviewClassNames:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setSuperviewClassNames_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (NSArray)superviewClassNames
{
  return (NSArray *)objc_msgSend_superviewClassNames(self->_underlyingElement, a2, v2, v3, v4);
}

- (void)setFontSize:(float)a3
{
  objc_msgSend_setFontSize_(self->_underlyingElement, a2, v3, v4, v5);
}

- (float)fontSize
{
  objc_msgSend_fontSize(self->_underlyingElement, a2, v2, v3, v4);
  return result;
}

- (void)setClassDescriptor:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setClassDescriptor_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (NSString)classDescriptor
{
  return (NSString *)objc_msgSend_classDescriptor(self->_underlyingElement, a2, v2, v3, v4);
}

- (void)setVersion:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setVersion_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (NSString)version
{
  return (NSString *)objc_msgSend_version(self->_underlyingElement, a2, v2, v3, v4);
}

- (void)setText:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setText_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (NSString)text
{
  return (NSString *)objc_msgSend_text(self->_underlyingElement, a2, v2, v3, v4);
}

- (DUDocumentUIElementObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUDocumentUIElementObjC;
  uint64_t v2 = [(DUDocumentUIElementObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentUIElement);
    underlyingElement = v2->_underlyingElement;
    v2->_underlyingElement = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end