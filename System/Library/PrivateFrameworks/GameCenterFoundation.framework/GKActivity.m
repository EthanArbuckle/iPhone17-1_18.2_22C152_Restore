@interface GKActivity
+ (id)currentOrNewNamed:(id)a3;
+ (id)detachedNamed:(id)a3;
+ (id)named:(id)a3;
+ (void)named:(id)a3 execute:(id)a4;
- (GKActivity)initWithName:(id)a3 parent:(id)a4 mode:(unsigned int)a5;
- (NSString)name;
- (OS_os_activity)activity;
- (OS_os_activity)parent;
- (id)childNamed:(id)a3;
- (id)renamed:(id)a3;
- (unsigned)mode;
- (void)childNamed:(id)a3 execute:(id)a4;
- (void)createActivity;
- (void)execute:(id)a3;
- (void)setActivity:(id)a3;
- (void)setMode:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
@end

@implementation GKActivity

uint64_t __22__GKActivity_execute___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_parent, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)execute:(id)a3
{
  id v4 = a3;
  activity = self->_activity;
  if (!activity)
  {
    [(GKActivity *)self createActivity];
    activity = self->_activity;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__GKActivity_execute___block_invoke;
  block[3] = &unk_1E646D7A0;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(activity, block);
}

- (void)createActivity
{
  os_activity_t v3 = _os_activity_create(&dword_1C2D22000, [(NSString *)self->_name UTF8String], (os_activity_t)self->_parent, (os_activity_flag_t)self->_mode);
  [(GKActivity *)self setActivity:v3];
}

- (void)setActivity:(id)a3
{
}

+ (id)named:(id)a3
{
  id v3 = a3;
  id v4 = [GKActivity alloc];
  v5 = [(GKActivity *)v4 initWithName:v3 parent:MEMORY[0x1E4F144F0] mode:2];

  return v5;
}

- (GKActivity)initWithName:(id)a3 parent:(id)a4 mode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKActivity;
  v10 = [(GKActivity *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(GKActivity *)v10 setName:v8];
    [(GKActivity *)v11 setParent:v9];
    [(GKActivity *)v11 setMode:v5];
  }

  return v11;
}

- (void)setParent:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

+ (void)named:(id)a3 execute:(id)a4
{
  id v5 = a4;
  id v6 = +[GKActivity named:a3];
  [v6 execute:v5];
}

+ (id)detachedNamed:(id)a3
{
  id v3 = a3;
  id v4 = [GKActivity alloc];
  id v5 = [(GKActivity *)v4 initWithName:v3 parent:MEMORY[0x1E4F144F0] mode:1];

  return v5;
}

+ (id)currentOrNewNamed:(id)a3
{
  id v3 = a3;
  id v4 = [GKActivity alloc];
  id v5 = [(GKActivity *)v4 initWithName:v3 parent:MEMORY[0x1E4F144F0] mode:2];

  return v5;
}

- (id)childNamed:(id)a3
{
  id v4 = a3;
  if (!self->_activity) {
    [(GKActivity *)self createActivity];
  }
  id v5 = [[GKActivity alloc] initWithName:v4 parent:self->_activity mode:0];

  return v5;
}

- (void)childNamed:(id)a3 execute:(id)a4
{
  id v6 = a4;
  id v7 = [(GKActivity *)self childNamed:a3];
  [v7 execute:v6];
}

- (id)renamed:(id)a3
{
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)mode
{
  return self->_mode;
}

- (OS_os_activity)parent
{
  return self->_parent;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

@end