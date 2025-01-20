@interface _CPLFakeDerivativeMapper
+ (unint64_t)destinationresourceTypeFromShortDescription:(id)a3;
+ (void)initialize;
- (CGSize)_dimensionsFromBaseResource:(id)a3;
- (NSString)outputType;
- (_CPLFakeDerivativeMapper)initWithRule:(id)a3;
- (double)maxPixelCount;
- (id)_bestSourceResourceFromResources:(id)a3;
- (id)description;
- (unint64_t)resourceType;
- (void)updateResources:(id)a3;
@end

@implementation _CPLFakeDerivativeMapper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    CFArrayRef v2 = CGImageDestinationCopyTypeIdentifiers();
    v3 = (void *)qword_1002CE618;
    qword_1002CE618 = (uint64_t)v2;

    CFArrayRef v4 = CGImageDestinationCopyTypeIdentifiers();
    uint64_t v5 = qword_1002CE620;
    qword_1002CE620 = (uint64_t)v4;
    _objc_release_x1(v4, v5);
  }
}

+ (unint64_t)destinationresourceTypeFromShortDescription:(id)a3
{
  unint64_t result = (unint64_t)+[CPLResource resourceTypeFromShortDescription:a3];
  if (result - 2 >= 4) {
    return 0;
  }
  return result;
}

- (_CPLFakeDerivativeMapper)initWithRule:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_CPLFakeDerivativeMapper;
  uint64_t v5 = [(_CPLFakeDerivativeMapper *)&v19 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 componentsSeparatedByString:@"/"];
  v7 = [v6 objectAtIndexedSubscript:0];
  if ((unint64_t)[v6 count] < 2)
  {
    outputType = v5->_outputType;
    v5->_outputType = (NSString *)@"public.jpeg";
  }
  else
  {
    v8 = [v6 objectAtIndexedSubscript:1];
    if (([(id)qword_1002CE618 containsObject:v8] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v15 = __CPLGenericOSLogDomain();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          goto LABEL_23;
        }
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        v16 = "%@ is unsupported";
        v17 = v15;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
        goto LABEL_22;
      }
LABEL_23:

      goto LABEL_24;
    }
    outputType = v5->_outputType;
    v5->_outputType = (NSString *)&v8->isa;
  }

  if ((unint64_t)[v6 count] < 3) {
    goto LABEL_9;
  }
  v10 = [v6 objectAtIndexedSubscript:2];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 <= 1000.0)
  {
    if (_CPLSilentLogging) {
      goto LABEL_24;
    }
    v8 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = [v6 objectAtIndexedSubscript:2];
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      v16 = "Invalid max pixel count '%@'";
      v17 = v8;
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  v5->_maxPixelCount = v12;
LABEL_9:
  id v13 = [(id)objc_opt_class() destinationresourceTypeFromShortDescription:v7];
  v5->_resourceType = (unint64_t)v13;
  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid dynamic resource type '%@'", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_24:

    v14 = 0;
    goto LABEL_25;
  }

LABEL_11:
  v14 = v5;
LABEL_25:

  return v14;
}

- (id)_bestSourceResourceFromResources:(id)a3
{
  id v4 = a3;
  if (self->_maxPixelCount != 0.0)
  {
    uint64_t v10 = 0;
    unint64_t resourceType = self->_resourceType;
    long long v18 = xmmword_10024A050;
    long long v19 = xmmword_10024A060;
    while (1)
    {
      double v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unint64_t *)((char *)&resourceType + v10), resourceType, v18, v19);
      id v9 = [v4 objectForKeyedSubscript:v11];

      if (v9
        && !+[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:v9])
      {
        double v12 = [v9 identity];
        if ([v12 isAvailable])
        {
          [v12 imageDimensions];
          if (v13 * v14 >= self->_maxPixelCount)
          {
            v15 = [v12 fileUTI];
            if (v15 && ([(id)qword_1002CE620 containsObject:v15] & 1) != 0)
            {

              goto LABEL_18;
            }
          }
        }
      }
      v10 += 8;

      if (v10 == 48)
      {
        id v9 = 0;
        goto LABEL_18;
      }
    }
  }
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:self->_resourceType];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6
    && ([v6 identity],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isAvailable],
        v7,
        v8))
  {
    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }

LABEL_18:
  return v9;
}

- (CGSize)_dimensionsFromBaseResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identity];
  [v5 imageDimensions];
  double v8 = v7;
  double v9 = v6;
  double maxPixelCount = self->_maxPixelCount;
  if (maxPixelCount != 0.0)
  {
    double v11 = v8 * v6;
    if (v8 * v9 <= 0.0) {
      sub_1001C8390();
    }
    double v12 = maxPixelCount / v11;
    if (v12 > 1.0) {
      sub_1001C83BC();
    }
    double v13 = floor(v8 * v12);
    if (v13 >= 1.0) {
      double v8 = v13;
    }
    else {
      double v8 = 1.0;
    }
    double v14 = floor(v9 * v12);
    if (v14 >= 1.0) {
      double v9 = v14;
    }
    else {
      double v9 = 1.0;
    }
  }

  double v15 = v8;
  double v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateResources:(id)a3
{
  id v20 = a3;
  id v4 = -[_CPLFakeDerivativeMapper _bestSourceResourceFromResources:](self, "_bestSourceResourceFromResources:");
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 identity];
    [(_CPLFakeDerivativeMapper *)self _dimensionsFromBaseResource:v5];
    double v8 = v7;
    double v10 = v9;
    double v11 = [_CPLCloudKitFakeFingerPrint alloc];
    id v12 = [v5 resourceType];
    double v13 = [v6 fingerPrint];
    double v14 = -[_CPLCloudKitFakeFingerPrint initWithRealResourceType:realFingerPrint:outputType:dimensions:](v11, "initWithRealResourceType:realFingerPrint:outputType:dimensions:", v12, v13, self->_outputType, v8, v10);

    id v15 = objc_alloc((Class)CPLResource);
    double v16 = [(_CPLCloudKitFakeFingerPrint *)v14 fakeIdentity];
    v17 = [v5 itemScopedIdentifier];
    id v18 = [v15 initWithResourceIdentity:v16 itemScopedIdentifier:v17 resourceType:self->_resourceType];

    long long v19 = +[NSNumber numberWithUnsignedInteger:self->_resourceType];
    [v20 setObject:v18 forKeyedSubscript:v19];
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = +[CPLResource shortDescriptionForResourceType:self->_resourceType];
  id v5 = [v3 initWithFormat:@"%@/%@", v4, self->_outputType];

  return v5;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (NSString)outputType
{
  return self->_outputType;
}

- (double)maxPixelCount
{
  return self->_maxPixelCount;
}

- (void).cxx_destruct
{
}

@end