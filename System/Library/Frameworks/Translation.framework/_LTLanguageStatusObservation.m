@interface _LTLanguageStatusObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndeterminateProgress;
- (NSLocale)locale;
- (_LTLanguageStatusObservation)initWithCoder:(id)a3;
- (_LTLanguageStatusObservation)initWithLocale:(id)a3 progress:(double)a4 status:(int64_t)a5;
- (double)progress;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTLanguageStatusObservation

- (_LTLanguageStatusObservation)initWithLocale:(id)a3 progress:(double)a4 status:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTLanguageStatusObservation;
  v9 = [(_LTLanguageStatusObservation *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    locale = v9->_locale;
    v9->_locale = (NSLocale *)v10;

    v9->_isIndeterminateProgress = 0;
    v9->_status = a5;
    double v12 = 1.0;
    switch(a5)
    {
      case 0:
      case 3:
        double v12 = 0.0;
        goto LABEL_6;
      case 1:
        double v12 = fmax(round(a4 * 100.0) / 100.0, 0.01);
        if (v12 > 0.99) {
          double v12 = 0.99;
        }
        goto LABEL_6;
      case 2:
LABEL_6:
        v9->_progress = v12;
        break;
      default:
        break;
    }
    v13 = v9;
  }

  return v9;
}

- (_LTLanguageStatusObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTLanguageStatusObservation;
  v5 = [(_LTLanguageStatusObservation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v5->_isIndeterminateProgress = [v4 decodeBoolForKey:@"isIndeterminateProgress"];
    [v4 decodeDoubleForKey:@"progress"];
    v5->_progress = v8;
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 encodeObject:locale forKey:@"locale"];
  [v5 encodeBool:self->_isIndeterminateProgress forKey:@"isIndeterminateProgress"];
  [v5 encodeDouble:@"progress" forKey:self->_progress];
  [v5 encodeInteger:self->_status forKey:@"status"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(_LTLanguageStatusObservation *)self status];
    if (v6 == [v5 status]
      && (-[_LTLanguageStatusObservation progress](self, "progress"), double v8 = v7, [v5 progress], v8 == v9)
      && (int v10 = [(_LTLanguageStatusObservation *)self isIndeterminateProgress],
          v10 == [v5 isIndeterminateProgress]))
    {
      v13 = [(_LTLanguageStatusObservation *)self locale];
      v14 = [v13 _ltLocaleIdentifier];
      objc_super v15 = [v5 locale];
      v16 = [v15 _ltLocaleIdentifier];
      char v11 = [v14 isEqualToString:v16];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  locale = self->_locale;
  id v4 = a3;
  id v5 = [(NSLocale *)locale _ltLocaleIdentifier];
  int64_t v6 = [v4 locale];

  double v7 = [v6 _ltLocaleIdentifier];
  int64_t v8 = [v5 compare:v7];

  return v8;
}

- (id)description
{
  int64_t status = self->_status;
  if (status == 1)
  {
    int64_t v6 = NSString;
    id v5 = [(NSLocale *)self->_locale _ltLocaleIdentifier];
    [v6 stringWithFormat:@"%@: Downloading [%f]", v5, *(void *)&self->_progress];
  }
  else
  {
    id v4 = NSString;
    if (status == 2)
    {
      id v5 = [(NSLocale *)self->_locale _ltLocaleIdentifier];
      [v4 stringWithFormat:@"%@: Installed", v5, v9];
    }
    else
    {
      id v5 = [(NSLocale *)self->_locale _ltLocaleIdentifier];
      [v4 stringWithFormat:@"%@: Not Installed", v5, v9];
    }
  double v7 = };

  return v7;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isIndeterminateProgress
{
  return self->_isIndeterminateProgress;
}

- (double)progress
{
  return self->_progress;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end