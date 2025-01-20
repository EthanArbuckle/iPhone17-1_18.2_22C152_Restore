@interface PDFAnnotationChange
- (PDFAnnotation)annotation;
- (PDFAnnotationChange)initWithAddedAnnotation:(id)a3;
- (PDFAnnotationChange)initWithChangedAnnotation:(id)a3;
- (PDFAnnotationChange)initWithRemovedAnnotation:(id)a3;
- (PDFAnnotationChange)initWithReorderedAndChangedAnnotation:(id)a3;
- (PDFAnnotationChange)initWithReorderedAnnotation:(id)a3;
- (id)description;
- (int)changeType;
- (unint64_t)changeTimestamp;
@end

@implementation PDFAnnotationChange

- (PDFAnnotationChange)initWithAddedAnnotation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = [(PDFAnnotationChange *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    uint64_t v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 0;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithChangedAnnotation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = [(PDFAnnotationChange *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    uint64_t v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 1;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithRemovedAnnotation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = [(PDFAnnotationChange *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    uint64_t v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 2;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithReorderedAnnotation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = [(PDFAnnotationChange *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    uint64_t v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 3;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithReorderedAndChangedAnnotation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = [(PDFAnnotationChange *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    uint64_t v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 4;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (int)changeType
{
  return self->_private->changeType;
}

- (PDFAnnotation)annotation
{
  return self->_private->annotation;
}

- (unint64_t)changeTimestamp
{
  return self->_private->changeTimestamp;
}

- (id)description
{
  uint64_t changeType = self->_private->changeType;
  if (changeType > 4) {
    v4 = 0;
  }
  else {
    v4 = off_264204440[changeType];
  }
  id v5 = NSString;
  unint64_t changeTimestamp = self->_private->changeTimestamp;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [(PDFAnnotation *)self->_private->annotation type];
  v10 = [v5 stringWithFormat:@"PDFAnnotationChange - Type: %@  Timestamp: %llu  Annotation: %@/%@ (%p) ", v4, changeTimestamp, v8, v9, self->_private->annotation];

  return v10;
}

- (void).cxx_destruct
{
}

@end