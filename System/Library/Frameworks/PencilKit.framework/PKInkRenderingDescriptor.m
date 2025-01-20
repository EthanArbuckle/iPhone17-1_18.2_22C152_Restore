@interface PKInkRenderingDescriptor
- (PKInkParticleDescriptor)particleDescriptor;
- (PKInkParticleDescriptor)secondaryParticleDescriptor;
- (PKInkRenderingDescriptor)initWithType:(unint64_t)a3 blendMode:(unint64_t)a4 alternateMode:(unint64_t)a5 particleDescriptor:(id)a6 secondaryParticleDescriptor:(id)a7;
- (id)mutableCopy;
- (unint64_t)alternateMode;
- (unint64_t)blendMode;
- (unint64_t)type;
@end

@implementation PKInkRenderingDescriptor

- (unint64_t)blendMode
{
  return self->_blendMode;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKInkRenderingDescriptor)initWithType:(unint64_t)a3 blendMode:(unint64_t)a4 alternateMode:(unint64_t)a5 particleDescriptor:(id)a6 secondaryParticleDescriptor:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKInkRenderingDescriptor;
  v15 = [(PKInkRenderingDescriptor *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_blendMode = a4;
    v15->_alternateMode = a5;
    objc_storeStrong((id *)&v15->_particleDescriptor, a6);
    objc_storeStrong((id *)&v16->_secondaryParticleDescriptor, a7);
  }

  return v16;
}

- (id)mutableCopy
{
  v3 = [PKInkRenderingDescriptor alloc];
  unint64_t type = self->_type;
  unint64_t blendMode = self->_blendMode;
  unint64_t alternateMode = self->_alternateMode;
  particleDescriptor = self->_particleDescriptor;
  secondaryParticleDescriptor = self->_secondaryParticleDescriptor;

  return [(PKInkRenderingDescriptor *)v3 initWithType:type blendMode:blendMode alternateMode:alternateMode particleDescriptor:particleDescriptor secondaryParticleDescriptor:secondaryParticleDescriptor];
}

- (unint64_t)alternateMode
{
  return self->_alternateMode;
}

- (PKInkParticleDescriptor)particleDescriptor
{
  return self->_particleDescriptor;
}

- (PKInkParticleDescriptor)secondaryParticleDescriptor
{
  return self->_secondaryParticleDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryParticleDescriptor, 0);

  objc_storeStrong((id *)&self->_particleDescriptor, 0);
}

@end