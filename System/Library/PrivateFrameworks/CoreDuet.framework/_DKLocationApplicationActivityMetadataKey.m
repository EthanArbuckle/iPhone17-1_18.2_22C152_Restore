@interface _DKLocationApplicationActivityMetadataKey
+ (id)URL;
+ (id)city;
+ (id)country;
+ (id)displayName;
+ (id)fullyFormattedAddress;
+ (id)latitude;
+ (id)locationName;
+ (id)longitude;
+ (id)phoneNumbers;
+ (id)postalCode;
+ (id)stateOrProvince;
+ (id)subThoroughfare;
+ (id)thoroughfare;
@end

@implementation _DKLocationApplicationActivityMetadataKey

+ (id)city
{
  return @"_DKLocationApplicationActivityMetadataKey-city";
}

+ (id)stateOrProvince
{
  return @"_DKLocationApplicationActivityMetadataKey-stateOrProvince";
}

+ (id)country
{
  return @"_DKLocationApplicationActivityMetadataKey-country";
}

+ (id)locationName
{
  return @"_DKLocationApplicationActivityMetadataKey-locationName";
}

+ (id)thoroughfare
{
  return @"_DKLocationApplicationActivityMetadataKey-thoroughfare";
}

+ (id)fullyFormattedAddress
{
  return @"_DKLocationApplicationActivityMetadataKey-fullyFormattedAddress";
}

+ (id)subThoroughfare
{
  return @"_DKLocationApplicationActivityMetadataKey-subThoroughfare";
}

+ (id)postalCode
{
  return @"_DKLocationApplicationActivityMetadataKey-postalCode";
}

+ (id)latitude
{
  return @"_DKLocationApplicationActivityMetadataKey-latitude";
}

+ (id)longitude
{
  return @"_DKLocationApplicationActivityMetadataKey-longitude";
}

+ (id)phoneNumbers
{
  return @"_DKLocationApplicationActivityMetadataKey-phoneNumbers";
}

+ (id)URL
{
  return @"_DKLocationApplicationActivityMetadataKey-URL";
}

+ (id)displayName
{
  return @"_DKLocationApplicationActivityMetadataKey-displayName";
}

@end