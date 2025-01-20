@interface _CDSizeMetric
- (_CDSizeMetric)initWithName:(id)a3 string:(id)a4 scale:(unint64_t)a5 family:(id)a6;
- (double)averageSize;
- (id)firstUpdate;
- (id)lastUpdate;
- (os_unfair_lock_s)count;
- (os_unfair_lock_s)firstSize;
- (os_unfair_lock_s)lastSize;
- (os_unfair_lock_s)maximumSize;
- (os_unfair_lock_s)minimumSize;
@end

@implementation _CDSizeMetric

- (_CDSizeMetric)initWithName:(id)a3 string:(id)a4 scale:(unint64_t)a5 family:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_CDSizeMetric;
  v14 = [(_CDSizeMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_string, a4);
    v15->_scale = a5;
    objc_storeWeak((id *)&v15->_family, v13);
  }

  return v15;
}

- (os_unfair_lock_s)count
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[6]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)firstSize
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)lastSize
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)minimumSize
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[12]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)maximumSize
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[14]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (double)averageSize
{
  if (!a1) {
    return 0.0;
  }
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  double v3 = (double)*(unint64_t *)(a1 + 64) / (double)*(unint64_t *)(a1 + 24);
  os_unfair_lock_unlock(v2);
  return (double)(unint64_t)v3;
}

- (id)firstUpdate
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[9];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)lastUpdate
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[10];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_family);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_firstUpdate, 0);
}

@end