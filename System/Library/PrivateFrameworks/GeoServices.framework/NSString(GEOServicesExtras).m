@interface NSString(GEOServicesExtras)
- (GEOFormattedString)_geo_formattedString;
@end

@implementation NSString(GEOServicesExtras)

- (GEOFormattedString)_geo_formattedString
{
  v2 = objc_alloc_init(GEOFormattedString);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  [(GEOFormattedString *)v2 setFormatStrings:v3];

  return v2;
}

@end