@interface IMMessagePartHighlightChatItem
- (BOOL)highlightedMessageIsFromMe;
- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor;
- (NSString)highlightedMessagePartGUID;
- (_NSRange)highlightedMessagePartRange;
- (id)_initWithItem:(id)a3 highlightedMessagePartGUID:(id)a4 highlightedMessagePartIndex:(int64_t)a5 highlightedMessagePartRange:(_NSRange)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)highlightedMessagePartIndex;
@end

@implementation IMMessagePartHighlightChatItem

- (id)_initWithItem:(id)a3 highlightedMessagePartGUID:(id)a4 highlightedMessagePartIndex:(int64_t)a5 highlightedMessagePartRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IMMessagePartHighlightChatItem;
  id v13 = [(IMChatItem *)&v28 _initWithItem:v11];
  v14 = v13;
  if (v13)
  {
    *((void *)v13 + 8) = a5;
    *((void *)v13 + 10) = location;
    *((void *)v13 + 11) = length;
    objc_storeStrong((id *)v13 + 9, a4);
    v14[56] = objc_msgSend_isFromMe(v11, v15, v16, v17);
    v18 = (void *)MEMORY[0x1E4F6E868];
    v22 = objc_msgSend_guid(v11, v19, v20, v21);
    v24 = objc_msgSend_encodeMessagePartGUID_prefix_partNumber_(v18, v23, (uint64_t)v22, @"mh", a5);
    objc_msgSend__setGUID_(v14, v25, (uint64_t)v24, v26);
  }
  return v14;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  *(_OWORD *)&retstr->scale = 0u;
  *(_OWORD *)&retstr->xScalar = 0u;
  *(_OWORD *)&retstr->associatedLayoutIntent = 0u;
  retstr->layoutIntent = 11;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  id v12 = objc_msgSend_highlightedMessagePartGUID(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_highlightedMessagePartIndex(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_highlightedMessagePartRange(self, v17, v18, v19);
  v22 = objc_msgSend__initWithItem_highlightedMessagePartGUID_highlightedMessagePartIndex_highlightedMessagePartRange_(v4, v21, (uint64_t)v8, (uint64_t)v12, v16, v20, v21);

  return v22;
}

- (unint64_t)highlightedMessagePartIndex
{
  return self->_highlightedMessagePartIndex;
}

- (NSString)highlightedMessagePartGUID
{
  return self->_highlightedMessagePartGUID;
}

- (_NSRange)highlightedMessagePartRange
{
  p_highlightedMessagePartRange = &self->_highlightedMessagePartRange;
  NSUInteger location = self->_highlightedMessagePartRange.location;
  NSUInteger length = p_highlightedMessagePartRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)highlightedMessageIsFromMe
{
  return self->_highlightedMessageIsFromMe;
}

- (void).cxx_destruct
{
}

@end