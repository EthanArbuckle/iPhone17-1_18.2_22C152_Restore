@interface _CNAtomAttachment
+ (id)attachmentWithAtomLayoutView:(id)a3 representedObject:(id)a4;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (_CNAtomAttachment)initWithAtomLayoutView:(id)a3 representedObject:(id)a4;
- (_CNAtomLayoutView)atomView;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (id)representedObject;
@end

@implementation _CNAtomAttachment

+ (id)attachmentWithAtomLayoutView:(id)a3 representedObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAtomLayoutView:v7 representedObject:v6];

  return v8;
}

- (_CNAtomAttachment)initWithAtomLayoutView:(id)a3 representedObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAtomAttachment;
  v9 = [(_CNAtomAttachment *)&v13 initWithData:0 ofType:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_atomView, a3);
    objc_storeStrong(&v10->_representedObject, a4);
    v11 = v10;
  }

  return v10;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  -[_CNAtomLayoutView boundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](self->_atomView, "boundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (_CNAtomLayoutView)atomView
{
  return self->_atomView;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);

  objc_storeStrong((id *)&self->_atomView, 0);
}

@end