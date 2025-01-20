@interface _MTVisualStylingVibrancyEffect
- (BOOL)isEqual:(id)a3;
- (MTVisualStyling)_visualStyling;
- (_MTVisualStylingVibrancyEffect)initWithCoder:(id)a3;
- (_MTVisualStylingVibrancyEffect)initWithVisualStyling:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectConfig;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MTVisualStylingVibrancyEffect

- (_MTVisualStylingVibrancyEffect)initWithVisualStyling:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MTVisualStylingVibrancyEffect;
  v6 = [(UIVibrancyEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_visualStyling, a3);
  }

  return v7;
}

- (_MTVisualStylingVibrancyEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"visualStyleSetName"];
  v6 = +[MTVisualStylingProvider _visualStylingProviderForStyleSetNamed:v5 inBundle:0];
  v7 = [v4 decodeObjectForKey:@"visualStyleName"];

  v8 = [v6 _visualStylingForStyleNamed:v7];
  objc_super v9 = [(_MTVisualStylingVibrancyEffect *)self initWithVisualStyling:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  visualStyling = self->_visualStyling;
  id v5 = a3;
  v6 = [(MTVisualStyling *)visualStyling visualStyleSetName];
  [v5 encodeObject:v6 forKey:@"visualStyleSetName"];

  id v7 = [(MTVisualStyling *)self->_visualStyling visualStyleName];
  [v5 encodeObject:v7 forKey:@"visualStyleName"];
}

- (id)effectConfig
{
  v2 = [(MTVisualStyling *)self->_visualStyling _layerConfig];
  v3 = [MEMORY[0x263F1CD60] configWithContentConfig:v2];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_MTVisualStylingVibrancyEffect alloc];
  visualStyling = self->_visualStyling;

  return [(_MTVisualStylingVibrancyEffect *)v4 initWithVisualStyling:visualStyling];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(MTVisualStyling *)self->_visualStyling visualStyleSetName];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke;
  v18[3] = &unk_264256BD8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v18];

  objc_super v9 = [(MTVisualStyling *)self->_visualStyling visualStyleName];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke_2;
  v16 = &unk_264256BD8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(MTVisualStyling *)self->_visualStyling visualStyleSetName];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(MTVisualStyling *)self->_visualStyling visualStyleName];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (MTVisualStyling)_visualStyling
{
  return self->_visualStyling;
}

- (void).cxx_destruct
{
}

@end