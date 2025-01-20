@interface GTMTLTextureRenderEncoder
- (GTMTLTextureRenderEncoder)initWithDevice:(id)a3;
- (MTLDevice)device;
- (NSArray)commands;
- (void)drawOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5;
- (void)drawTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5;
- (void)reset;
- (void)resetCommand;
- (void)setAnchor:(CGPoint)a3;
- (void)setBounds:(CGRect)a3 contentsScale:(double)a4;
- (void)setTransform:(CATransform3D *)a3;
- (void)submitCommand;
@end

@implementation GTMTLTextureRenderEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommand, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_commands, 0);
}

- (NSArray)commands
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)reset
{
  [(NSMutableArray *)self->_commands removeAllObjects];

  [(GTMTLTextureRenderEncoder *)self resetCommand];
}

- (void)drawOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setTexture:a3];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setDepthStencil:0];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setOverlay:1];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setRgb:v6];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setShrinkToFit:v5];

  [(GTMTLTextureRenderEncoder *)self submitCommand];
}

- (void)drawTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setTexture:a3];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setDepthStencil:v6];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setOverlay:0];
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setShrinkToFit:v5];

  [(GTMTLTextureRenderEncoder *)self submitCommand];
}

- (void)setTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  long long v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  long long v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  long long v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  [(GTMTLTextureRenderEncoderCommand *)self->_currentCommand setTransform:v7];
}

- (void)setAnchor:(CGPoint)a3
{
}

- (void)setBounds:(CGRect)a3 contentsScale:(double)a4
{
  -[GTMTLTextureRenderEncoderCommand setBounds:](self->_currentCommand, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  currentCommand = self->_currentCommand;

  [(GTMTLTextureRenderEncoderCommand *)currentCommand setContentsScale:a4];
}

- (void)resetCommand
{
  long long v3 = (GTMTLTextureRenderEncoderCommand *)[(GTMTLTextureRenderEncoderCommand *)self->_currentCommand copy];
  currentCommand = self->_currentCommand;
  self->_currentCommand = v3;

  long long v5 = self->_currentCommand;

  [(GTMTLTextureRenderEncoderCommand *)v5 setTexture:0];
}

- (void)submitCommand
{
  [(NSMutableArray *)self->_commands addObject:self->_currentCommand];

  [(GTMTLTextureRenderEncoder *)self resetCommand];
}

- (GTMTLTextureRenderEncoder)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLTextureRenderEncoder;
  long long v6 = [(GTMTLTextureRenderEncoder *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    commands = v7->_commands;
    v7->_commands = v8;

    v10 = objc_alloc_init(GTMTLTextureRenderEncoderCommand);
    currentCommand = v7->_currentCommand;
    v7->_currentCommand = v10;
  }
  return v7;
}

@end