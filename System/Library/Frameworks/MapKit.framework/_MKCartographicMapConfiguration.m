@interface _MKCartographicMapConfiguration
+ (BOOL)supportsSecureCoding;
- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCartographicMapConfiguration:(id)a3;
- (_MKCartographicMapConfiguration)initWithCartographicConfiguration:(id *)a3;
- (_MKCartographicMapConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (void)_removeObserver:(id)a3 context:(void *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MKCartographicMapConfiguration

- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfiguration
{
  long long v3 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(void *)&retstr->var6 = self[1].var3;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKCartographicMapConfiguration;
  id result = [(MKMapConfiguration *)&v8 copyWithZone:a3];
  long long v6 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  long long v5 = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  long long v7 = *(_OWORD *)&self->_cartographicConfiguration.style;
  *((void *)result + 10) = *(void *)&self->_cartographicConfiguration.gridOnly;
  *((_OWORD *)result + 3) = v6;
  *((_OWORD *)result + 4) = v5;
  *((_OWORD *)result + 2) = v7;
  return result;
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_MKCartographicMapConfiguration;
  id v8 = a3;
  [(MKMapConfiguration *)&v9 _addObserver:v8 options:a4 context:a5];
  [(_MKCartographicMapConfiguration *)self addObserver:v8, @"cartographicConfiguration", a4, a5, v9.receiver, v9.super_class forKeyPath options context];
}

- (_MKCartographicMapConfiguration)initWithCartographicConfiguration:(id *)a3
{
  BOOL v4 = (unint64_t)(a3->var3 - 1) < 2;
  v9.receiver = self;
  v9.super_class = (Class)_MKCartographicMapConfiguration;
  id result = [(MKMapConfiguration *)&v9 initWithElevationStyle:v4];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var2;
    long long v6 = *(_OWORD *)&a3->var4;
    long long v8 = *(_OWORD *)&a3->var0;
    *(void *)&result->_cartographicConfiguration.gridOnly = *(void *)&a3->var6;
    *(_OWORD *)&result->_cartographicConfiguration.projection = v7;
    *(_OWORD *)&result->_cartographicConfiguration.mapkitUsage = v6;
    *(_OWORD *)&result->_cartographicConfiguration.style = v8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKCartographicMapConfiguration;
  id v4 = a3;
  [(MKMapConfiguration *)&v8 encodeWithCoder:v4];
  long long v5 = *(_OWORD *)&self->_cartographicConfiguration.projection;
  v6[0] = *(_OWORD *)&self->_cartographicConfiguration.style;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_cartographicConfiguration.mapkitUsage;
  uint64_t v7 = *(void *)&self->_cartographicConfiguration.gridOnly;
  _MKCartographicConfigurationEncodeWithCoder((uint64_t *)v6, v4, @"MKCartographicMapConfigurationCartographicConfiguration_");
}

- (_MKCartographicMapConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKCartographicMapConfiguration;
  long long v5 = [(MKMapConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    _MKCartographicConfigurationDecodeWithCoder(v4, @"MKCartographicMapConfigurationCartographicConfiguration_", (uint64_t)v10);
    long long v6 = v10[0];
    long long v7 = v10[1];
    long long v8 = v10[2];
    *(void *)&v5->_cartographicConfiguration.gridOnly = v11;
    *(_OWORD *)&v5->_cartographicConfiguration.projection = v7;
    *(_OWORD *)&v5->_cartographicConfiguration.mapkitUsage = v8;
    *(_OWORD *)&v5->_cartographicConfiguration.style = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(_MKCartographicMapConfiguration *)self isEqualToCartographicMapConfiguration:v4];

  return v5;
}

- (BOOL)isEqualToCartographicMapConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (v7.receiver = self,
        v7.super_class = (Class)_MKCartographicMapConfiguration,
        [(MKMapConfiguration *)&v7 isEqual:v4])
    && _MKCartographicConfigurationEquals((uint64_t)&self->_cartographicConfiguration, (uint64_t)v4 + 32);

  return v5;
}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MKCartographicMapConfiguration;
  id v6 = a3;
  [(MKMapConfiguration *)&v7 _removeObserver:v6 context:a4];
  [(_MKCartographicMapConfiguration *)self removeObserver:v6, @"cartographicConfiguration", a4, v7.receiver, v7.super_class forKeyPath context];
}

@end