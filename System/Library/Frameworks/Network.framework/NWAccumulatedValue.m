@interface NWAccumulatedValue
- (NSObject)object;
- (NSString)keyPath;
- (NWAccumulation)accumulation;
- (id)callback;
- (id)description;
- (id)snapshot;
- (void)setAccumulation:(id)a3;
- (void)setCallback:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation NWAccumulatedValue

- (NWAccumulation)accumulation
{
  return self->_accumulation;
}

- (NSObject)object
{
  return self->_object;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_accumulation, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

- (void)setCallback:(id)a3
{
}

- (void)setAccumulation:(id)a3
{
}

- (void)setKeyPath:(id)a3
{
}

- (void)setObject:(id)a3
{
}

- (id)snapshot
{
  v3 = objc_alloc_init(NWAccumulatedValue);
  v4 = [(NWAccumulatedValue *)self keyPath];
  [(NWAccumulatedValue *)v3 setKeyPath:v4];

  v5 = [(NWAccumulatedValue *)self accumulation];
  v6 = [v5 snapshot];
  [(NWAccumulatedValue *)v3 setAccumulation:v6];

  return v3;
}

- (id)description
{
  v2 = [(NWAccumulatedValue *)self accumulation];
  v3 = [v2 description];

  return v3;
}

@end