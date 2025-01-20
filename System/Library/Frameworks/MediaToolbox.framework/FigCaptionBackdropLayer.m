@interface FigCaptionBackdropLayer
+ (void)initialize;
- (FigCaptionBackdropLayer)init;
- (void)configure;
- (void)dealloc;
- (void)insertBackdropAsSublayerToLayer:(id)a3 below:(id)a4;
@end

@implementation FigCaptionBackdropLayer

+ (void)initialize
{
}

- (FigCaptionBackdropLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptionBackdropLayer;
  v2 = [(FigBaseCABackdropLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FigCaptionBackdropLayer *)v2 configure];
  }
  return v3;
}

- (void)dealloc
{
  v3 = *(void **)&self->super._preventsChangesToSublayerHierarchy;
  if (v3) {

  }
  v4.receiver = self;
  v4.super_class = (Class)FigCaptionBackdropLayer;
  [(FigCaptionBackdropLayer *)&v4 dealloc];
}

- (void)configure
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [(FigCaptionBackdropLayer *)self setHidden:1];
  if (objc_opt_respondsToSelector()) {
    [(FigCaptionBackdropLayer *)self setValue:MEMORY[0x1E4F1CC38] forKey:@"allowsInPlaceFiltering"];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F39BC0]);
  objc_super v4 = (void *)[v3 initWithType:*MEMORY[0x1E4F3A058]];
  *(void *)&self->super._preventsChangesToSublayerHierarchy = v4;
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0), @"inputAmount");
  v5[0] = *(void *)&self->super._preventsChangesToSublayerHierarchy;
  -[FigCaptionBackdropLayer setFilters:](self, "setFilters:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

- (void)insertBackdropAsSublayerToLayer:(id)a3 below:(id)a4
{
  if (a3 && a4) {
    objc_msgSend(a3, "insertSublayer:below:", self);
  }
  else {
    FigSignalErrorAt();
  }
}

@end