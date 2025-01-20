@interface _CDMutableSizeMetric
- (_CDMutableSizeMetric)initWithName:(id)a3 string:(id)a4 scale:(unint64_t)a5 family:(id)a6;
- (id)description;
- (void)addBytes:(uint64_t)a1;
@end

@implementation _CDMutableSizeMetric

- (_CDMutableSizeMetric)initWithName:(id)a3 string:(id)a4 scale:(unint64_t)a5 family:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_CDMutableSizeMetric;
  return [(_CDSizeMetric *)&v7 initWithName:a3 string:a4 scale:a5 family:a6];
}

- (void)addBytes:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id obj = [MEMORY[0x1E4F1C9C8] date];
  v4 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6 + 1;
  unint64_t v7 = a2 / v5;
  objc_storeStrong((id *)(a1 + 80), obj);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 64) += v7;
  if (!v6)
  {
    objc_storeStrong((id *)(a1 + 72), obj);
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 48) = v7;
    v8 = (unint64_t *)(a1 + 56);
    goto LABEL_7;
  }
  v8 = (unint64_t *)(a1 + 48);
  if (v7 < *(void *)(a1 + 48))
  {
LABEL_7:
    unint64_t *v8 = v7;
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + 56);
  v9 = (unint64_t *)(a1 + 56);
  if (v7 > v10)
  {
    v8 = v9;
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock(v4);
}

- (id)description
{
  v19 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v3);
  if (self)
  {
    id v5 = objc_getProperty(self, v4, 88, 1);
    id Property = objc_getProperty(self, v6, 96, 1);
  }
  else
  {
    id v5 = 0;
    id Property = 0;
  }
  v8 = NSNumber;
  id v18 = Property;
  v17 = [v8 numberWithUnsignedInteger:-[_CDSizeMetric count]((os_unfair_lock_s *)self)];
  v9 = -[_CDSizeMetric firstUpdate]((os_unfair_lock_s *)self);
  unint64_t v10 = [NSNumber numberWithUnsignedInteger:-[_CDSizeMetric firstSize]((os_unfair_lock_s *)self)];
  v11 = -[_CDSizeMetric lastUpdate]((os_unfair_lock_s *)self);
  v12 = [NSNumber numberWithUnsignedInteger:-[_CDSizeMetric lastSize]((os_unfair_lock_s *)self)];
  v13 = [NSNumber numberWithUnsignedInteger:-[_CDSizeMetric minimumSize]((os_unfair_lock_s *)self)];
  v14 = [NSNumber numberWithUnsignedInteger:-[_CDSizeMetric maximumSize]((os_unfair_lock_s *)self)];
  v15 = [NSNumber numberWithDouble:-[_CDSizeMetric averageSize]((uint64_t)self)];
  v20 = [v19 stringWithFormat:@"%@: { name=%@, text='%@', count=%@, firstUpdate=%@, firstSize=%@, lastUpdate=%@, lastSize=%@, minimumSize=%@, maximumSize=%@, averageSize=%@ }", v21, v5, v18, v17, v9, v10, v11, v12, v13, v14, v15];

  return v20;
}

@end