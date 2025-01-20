@interface CPUISwitch
- (CPUISwitch)initWithHandler:(id)a3;
- (CPUISwitch)initWithHandler:(id)a3 isOn:(BOOL)a4;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CPUISwitch

- (CPUISwitch)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPUISwitch;
  v5 = -[CPUISwitch initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A684770](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (CPUISwitch)initWithHandler:(id)a3 isOn:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(CPUISwitch *)self initWithHandler:a3];
  [(CPUISwitch *)v5 setOn:v4];
  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5 = [(CPUISwitch *)self handler];
  v5[2](v5, [(CPUISwitch *)self isOn] ^ 1);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end