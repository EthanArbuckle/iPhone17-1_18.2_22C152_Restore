@interface NSCoder(_FEGeometryKeyedCoding)
- (double)decodeCGRectForKey:()_FEGeometryKeyedCoding;
- (void)encodeCGRect:()_FEGeometryKeyedCoding forKey:;
@end

@implementation NSCoder(_FEGeometryKeyedCoding)

- (void)encodeCGRect:()_FEGeometryKeyedCoding forKey:
{
  id v12 = a7;
  _FEStringFromCGRect(a2, a3, a4, a5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v13 forKey:v12];
}

- (double)decodeCGRectForKey:()_FEGeometryKeyedCoding
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5)
  {
    id v6 = v5;
    double DoubleValue = *MEMORY[0x263F001A8];
    if ((unint64_t)[v6 length] >= 0xD)
    {
      v15 = 0;
      v16 = 0;
      if (SplitBracesAndComma(v6, (CFStringRef *)&v16, (CFStringRef *)&v15))
      {
        v8 = v16;
        double DoubleValue = *MEMORY[0x263F00148];
        if ((unint64_t)[(__CFString *)v8 length] >= 5)
        {
          CFStringRef v17 = 0;
          CFStringRef str = 0;
          if (SplitBracesAndComma(v8, &str, &v17))
          {
            CFStringRef v9 = str;
            double DoubleValue = CFStringGetDoubleValue(str);
            CFStringRef v10 = v17;
            CFStringGetDoubleValue(v17);
            CFRelease(v9);
            CFRelease(v10);
          }
        }

        v11 = v15;
        if ((unint64_t)[(__CFString *)v11 length] >= 5)
        {
          CFStringRef v17 = 0;
          CFStringRef str = 0;
          if (SplitBracesAndComma(v11, &str, &v17))
          {
            CFStringRef v12 = str;
            CFStringGetDoubleValue(str);
            CFStringRef v13 = v17;
            CFStringGetDoubleValue(v17);
            CFRelease(v12);
            CFRelease(v13);
          }
        }

        CFRelease(v8);
        CFRelease(v11);
      }
    }
  }
  else
  {
    double DoubleValue = *MEMORY[0x263F001A8];
  }

  return DoubleValue;
}

@end