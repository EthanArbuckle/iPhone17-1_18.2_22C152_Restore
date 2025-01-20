@interface PKToolPickerEraserItem
- (BOOL)_toolShouldBeSetOnCanvasView;
- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3;
- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3 width:(double)a4;
- (double)width;
- (id)_dictionaryRepresentation;
- (id)_toolCopyWithWidth:(double)a3;
@end

@implementation PKToolPickerEraserItem

- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3
{
  return [(PKToolPickerEraserItem *)self initWithEraserType:a3 width:0.0];
}

- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3 width:(double)a4
{
  v7 = [PKEraserTool alloc];
  if (a4 > 0.0) {
    uint64_t v8 = [(PKEraserTool *)v7 initWithEraserType:a3 width:a4];
  }
  else {
    uint64_t v8 = [(PKEraserTool *)v7 initWithEraserType:a3];
  }
  v9 = (void *)v8;
  v12.receiver = self;
  v12.super_class = (Class)PKToolPickerEraserItem;
  v10 = [(PKToolPickerItem *)&v12 initWithTool:v8];

  return v10;
}

- (double)width
{
  v2 = [(PKToolPickerEraserItem *)self eraserTool];
  [v2 width];
  double v4 = v3;

  return v4;
}

- (id)_toolCopyWithWidth:(double)a3
{
  v5 = [PKEraserTool alloc];
  v6 = [(PKToolPickerEraserItem *)self eraserTool];
  v7 = -[PKEraserTool initWithEraserType:width:](v5, "initWithEraserType:width:", [v6 eraserType], a3);

  return v7;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  v2 = [(PKToolPickerEraserItem *)self eraserTool];
  double v3 = [v2 ink];
  double v4 = [v3 dictionaryRepresentation];

  return v4;
}

@end