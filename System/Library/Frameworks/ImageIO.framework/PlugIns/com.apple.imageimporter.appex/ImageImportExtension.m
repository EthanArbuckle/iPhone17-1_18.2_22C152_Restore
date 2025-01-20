@interface ImageImportExtension
- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)updateAttributes:(id)a3 withExifAuxProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withExifProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withGPSProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withIPTCProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withMetadata:(CGImageMetadata *)a4;
- (BOOL)updateAttributes:(id)a3 withPhotoshopProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withProperties:(id)a4 forISR:(CGImageSource *)a5;
- (BOOL)updateAttributes:(id)a3 withTIFFProperties:(id)a4 forISR:(CGImageSource *)a5;
- (id)dateFromString:(id)a3;
@end

@implementation ImageImportExtension

- (id)dateFromString:(id)a3
{
  if (qword_100008498 != -1)
  {
    dispatch_once(&qword_100008498, &stru_100004358);
    if (a3) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
LABEL_3:
  v4 = (void *)qword_100008490;

  return [v4 dateFromString:a3];
}

- (BOOL)updateAttributes:(id)a3 withGPSProperties:(id)a4 forISR:(CGImageSource *)a5
{
  objc_msgSend(a3, "setEXIFGPSVersion:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSVersion), "componentsJoinedByString:", @"."));
  id v8 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSAltitude];
  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
    unsigned int v11 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSAltitudeRef), "intValue");
    BOOL v12 = v10 > 0.0 && v11 == 1;
    double v13 = -v10;
    if (!v12) {
      double v13 = v10;
    }
    objc_msgSend(a3, "setAltitude:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
  }
  id v14 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSLatitude];
  if (v14)
  {
    [v14 doubleValue];
    double v16 = v15;
    id v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSLatitudeRef), "caseInsensitiveCompare:", @"S");
    BOOL v18 = v16 > 0.0 && v17 == 0;
    double v19 = -v16;
    if (!v18) {
      double v19 = v16;
    }
    objc_msgSend(a3, "setLatitude:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
  }
  id v20 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSLongitude];
  if (v20)
  {
    [v20 doubleValue];
    double v22 = v21;
    id v23 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSLongitudeRef), "caseInsensitiveCompare:", @"W");
    BOOL v24 = v22 > 0.0 && v23 == 0;
    double v25 = -v22;
    if (!v24) {
      double v25 = v22;
    }
    objc_msgSend(a3, "setLongitude:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
  }
  id v26 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSSpeed];
  if (v26)
  {
    [v26 doubleValue];
    double v28 = v27;
    id v29 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSSpeedRef];
    if ([v29 caseInsensitiveCompare:@"M"])
    {
      id v30 = [v29 caseInsensitiveCompare:@"N"];
      double v31 = v28 * 1.852;
      if (v30) {
        double v31 = v28;
      }
    }
    else
    {
      double v31 = v28 * 1.609344;
    }
    objc_msgSend(a3, "setSpeed:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
  }
  id v32 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSTrack];
  if (v32) {
    [a3 setGPSTrack:v32];
  }
  id v33 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSImgDirection];
  if (v33) {
    [a3 setImageDirection:v33];
  }
  id v34 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDestLatitude];
  if (v34)
  {
    [v34 doubleValue];
    double v36 = v35;
    id v37 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSDestLatitudeRef), "caseInsensitiveCompare:", @"S");
    BOOL v38 = v36 > 0.0 && v37 == 0;
    double v39 = -v36;
    if (!v38) {
      double v39 = v36;
    }
    objc_msgSend(a3, "setGPSDestLatitude:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39));
  }
  id v40 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDestLongitude];
  if (v40)
  {
    [v40 doubleValue];
    double v42 = v41;
    id v43 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyGPSDestLongitudeRef), "caseInsensitiveCompare:", @"W");
    BOOL v44 = v42 > 0.0 && v43 == 0;
    double v45 = -v42;
    if (!v44) {
      double v45 = v42;
    }
    objc_msgSend(a3, "setGPSDestLongitude:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v45));
  }
  id v46 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSStatus];
  if (v46) {
    [a3 setGPSStatus:v46];
  }
  id v47 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSMeasureMode];
  if (v47) {
    [a3 setGPSMeasureMode:v47];
  }
  id v48 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDOP];
  if (v48) {
    [a3 setGPSDOP:v48];
  }
  id v49 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSMapDatum];
  if (v49) {
    [a3 setGPSMapDatum:v49];
  }
  id v50 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDestBearing];
  if (v50) {
    [a3 setGPSDestBearing:v50];
  }
  id v51 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDestDistance];
  if (v51)
  {
    [v51 doubleValue];
    double v53 = v52;
    id v54 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDestDistanceRef];
    if ([v54 caseInsensitiveCompare:@"M"])
    {
      id v55 = [v54 caseInsensitiveCompare:@"N"];
      double v56 = v53 * 1.852;
      if (v55) {
        double v56 = v53;
      }
    }
    else
    {
      double v56 = v53 * 1.609344;
    }
    objc_msgSend(a3, "setGPSDestDistance:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v56));
  }
  id v57 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSProcessingMethod];
  if (v57) {
    [a3 setGPSProcessingMethod:v57];
  }
  id v58 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSAreaInformation];
  if (v58) {
    [a3 setGPSAreaInformation:v58];
  }
  id v59 = -[ImageImportExtension dateFromString:](self, "dateFromString:", [a4 objectForKeyedSubscript:kCGImagePropertyGPSTimeStamp]);
  if (v59) {
    [a3 setTimestamp:v59];
  }
  id v60 = -[ImageImportExtension dateFromString:](self, "dateFromString:", [a4 objectForKeyedSubscript:kCGImagePropertyGPSDateStamp]);
  if (v60) {
    [a3 setGPSDateStamp:v60];
  }
  id v61 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDifferental];
  if (v61) {
    [a3 setGPSDifferental:v61];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withIPTCProperties:(id)a4 forISR:(CGImageSource *)a5
{
  id v7 = +[NSMutableArray array];
  id v8 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCByline];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 addObjectsFromArray:v9];
    }
    else {
      [v7 addObject:v9];
    }
  }
  id v10 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCWriterEditor];
  if (v10)
  {
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 addObjectsFromArray:v11];
    }
    else {
      [v7 addObject:v11];
    }
  }
  if ([v7 count]) {
    [a3 setAuthorNames:v7];
  }
  id v12 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCCopyrightNotice];
  if (v12) {
    [a3 setCopyright:v12];
  }
  id v13 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCObjectName];
  if (v13) {
    [a3 setTitle:v13];
  }
  id v14 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCCaptionAbstract];
  if (v14) {
    [a3 setContentDescription:v14];
  }
  id v15 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCHeadline];
  if (v15) {
    [a3 setHeadline:v15];
  }
  id v16 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCSpecialInstructions];
  if (v16) {
    [a3 setInstructions:v16];
  }
  id v17 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCCity];
  if (v17) {
    [a3 setCity:v17];
  }
  id v18 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCProvinceState];
  if (v18) {
    [a3 setStateOrProvince:v18];
  }
  id v19 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCCountryPrimaryLocationName];
  if (v19) {
    [a3 setCountry:v19];
  }
  id v20 = (NSArray *)[a4 objectForKeyedSubscript:kCGImagePropertyIPTCContact];
  if (v20)
  {
    double v21 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = a3;
      id v23 = v21;
    }
    else
    {
      double v35 = v21;
      id v23 = +[NSArray arrayWithObjects:&v35 count:1];
      id v22 = a3;
    }
    [v22 setContactKeywords:v23];
  }
  BOOL v24 = (NSArray *)[a4 objectForKeyedSubscript:kCGImagePropertyIPTCKeywords];
  if (v24)
  {
    double v25 = v24;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = a3;
      double v27 = v25;
    }
    else
    {
      id v34 = v25;
      double v27 = +[NSArray arrayWithObjects:&v34 count:1];
      id v26 = a3;
    }
    [v26 setKeywords:v27];
  }
  double v28 = (NSArray *)[a4 objectForKeyedSubscript:kCGImagePropertyIPTCCredit];
  if (v28)
  {
    id v29 = v28;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = a3;
      double v31 = v29;
    }
    else
    {
      id v33 = v29;
      double v31 = +[NSArray arrayWithObjects:&v33 count:1];
      id v30 = a3;
    }
    [v30 setContributors:v31];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withPhotoshopProperties:(id)a4 forISR:(CGImageSource *)a5
{
  id v6 = [a4 objectForKeyedSubscript:kCGImageProperty8BIMLayerNames];
  if (v6) {
    [a3 setLayerNames:v6];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withTIFFProperties:(id)a4 forISR:(CGImageSource *)a5
{
  id v8 = [a4 objectForKeyedSubscript:kCGImagePropertyTIFFModel];
  if (v8) {
    [a3 setAcquisitionModel:v8];
  }
  id v9 = [a4 objectForKeyedSubscript:kCGImagePropertyTIFFMake];
  if (v9) {
    [a3 setAcquisitionMake:v9];
  }
  if (![a3 contentCreationDate])
  {
    id v10 = -[ImageImportExtension dateFromString:](self, "dateFromString:", [a4 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime]);
    if (v10) {
      [a3 setContentCreationDate:v10];
    }
  }
  id v11 = [a4 objectForKeyedSubscript:kCGImagePropertyTIFFSoftware];
  if (v11) {
    [a3 setCreator:v11];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withExifAuxProperties:(id)a4 forISR:(CGImageSource *)a5
{
  id v7 = [a4 objectForKeyedSubscript:kCGImagePropertyExifLensModel];
  if (v7) {
    [a3 setLensModel:v7];
  }
  id v8 = [a4 objectForKeyedSubscript:kCGImagePropertyExifCameraOwnerName];
  if (v8) {
    [a3 setCameraOwner:v8];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withExifProperties:(id)a4 forISR:(CGImageSource *)a5
{
  objc_msgSend(a3, "setEXIFVersion:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyExifVersion), "componentsJoinedByString:", @"."));
  id v8 = -[ImageImportExtension dateFromString:](self, "dateFromString:", [a4 objectForKeyedSubscript:kCGImagePropertyExifDateTimeOriginal]);
  if (v8) {
    [a3 setContentCreationDate:v8];
  }
  id v9 = -[ImageImportExtension dateFromString:](self, "dateFromString:", [a4 objectForKeyedSubscript:kCGImagePropertyExifDateTimeDigitized]);
  if (v9) {
    [a3 setContentModificationDate:v9];
  }
  id v10 = [a4 objectForKeyedSubscript:kCGImagePropertyExifApertureValue];
  if (v10) {
    [a3 setAperture:v10];
  }
  id v11 = [a4 objectForKeyedSubscript:kCGImagePropertyExifExposureTime];
  if (v11)
  {
    id v12 = v11;
    [a3 setExposureTime:v11];
    objc_msgSend(a3, "setExposureTimeString:", objc_msgSend(v12, "fractionString"));
  }
  id v13 = [a4 objectForKeyedSubscript:kCGImagePropertyExifFlash];
  if (v13)
  {
    unsigned __int8 v14 = [v13 intValue];
    if (v14) {
      id v15 = &__kCFBooleanTrue;
    }
    else {
      id v15 = &__kCFBooleanFalse;
    }
    [a3 setFlashOn:v15];
    if ((v14 & 0x40) != 0) {
      id v16 = &__kCFBooleanTrue;
    }
    else {
      id v16 = &__kCFBooleanFalse;
    }
    [a3 setRedEyeOn:v16];
  }
  id v17 = [a4 objectForKeyedSubscript:kCGImagePropertyExifExposureMode];
  if (v17) {
    [a3 setExposureMode:v17];
  }
  id v18 = [a4 objectForKeyedSubscript:kCGImagePropertyExifWhiteBalance];
  if (v18) {
    [a3 setWhiteBalance:v18];
  }
  id v19 = [a4 objectForKeyedSubscript:kCGImagePropertyExifMeteringMode];
  if (v19)
  {
    unsigned int v20 = [v19 intValue];
    if (v20 > 6) {
      CFStringRef v21 = @"other";
    }
    else {
      CFStringRef v21 = *(&off_100004378 + (int)v20);
    }
    [a3 setMeteringMode:v21];
  }
  id v22 = [a4 objectForKeyedSubscript:kCGImagePropertyExifISOSpeedRatings];
  if (v22)
  {
    id v23 = v22;
    if ([v22 count]) {
      objc_msgSend(a3, "setISOSpeed:", objc_msgSend(v23, "objectAtIndexedSubscript:", 0));
    }
  }
  id v24 = [a4 objectForKeyedSubscript:kCGImagePropertyExifFocalLength];
  if (v24) {
    [a3 setFocalLength:v24];
  }
  id v25 = [a4 objectForKeyedSubscript:kCGImagePropertyExifFocalLenIn35mmFilm];
  if (v25) {
    [a3 setFocalLength35mm:v25];
  }
  id v26 = [a4 objectForKeyedSubscript:kCGImagePropertyExifUserComment];
  if (v26)
  {
    double v27 = v26;
    [a3 setComment:v26];
    [v27 isEqualToString:@"Screenshot"];
  }
  id v28 = [a4 objectForKeyedSubscript:kCGImagePropertyExifFNumber];
  if (v28) {
    [a3 setFNumber:v28];
  }
  id v29 = [a4 objectForKeyedSubscript:kCGImagePropertyExifExposureProgram];
  if (v29)
  {
    unsigned int v30 = [v29 intValue] - 1;
    if (v30 > 7) {
      CFStringRef v31 = @"Not defined";
    }
    else {
      CFStringRef v31 = *(&off_1000043B0 + (int)v30);
    }
    [a3 setExposureProgram:v31];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withProperties:(id)a4 forISR:(CGImageSource *)a5
{
  id v8 = [a4 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
  id v9 = [a4 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
  id v10 = [a4 objectForKeyedSubscript:kCGImagePropertyDPIWidth];
  id v11 = [a4 objectForKeyedSubscript:kCGImagePropertyDPIHeight];
  id v12 = [v9 longValue];
  BOOL v13 = (uint64_t)v12 > (uint64_t)[v8 longValue];
  if ([a4 objectForKeyedSubscript:kCGImagePropertyOrientation]
    && (int)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyOrientation), "intValue") >= 5)
  {
    unsigned __int8 v14 = +[NSNumber numberWithInt:v13 ^ 1];
    id v15 = v10;
    id v10 = v11;
    id v16 = v8;
    id v8 = v9;
  }
  else
  {
    unsigned __int8 v14 = +[NSNumber numberWithShort:v13];
    id v15 = v11;
    id v16 = v9;
  }
  [a3 setOrientation:v14];
  [a3 setPixelWidth:v8];
  [a3 setPixelHeight:v16];
  objc_msgSend(a3, "setPixelCount:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (void)objc_msgSend(objc_msgSend(a3, "pixelHeight"), "longLongValue")* (void)objc_msgSend(objc_msgSend(a3, "pixelWidth"), "longLongValue")));
  [a3 setResolutionWidthDPI:v10];
  [a3 setResolutionHeightDPI:v15];
  if (objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyHasAlpha), "BOOLValue")) {
    id v17 = &__kCFBooleanTrue;
  }
  else {
    id v17 = &__kCFBooleanFalse;
  }
  [a3 setHasAlphaChannel:v17];
  if ([a4 objectForKeyedSubscript:kCGImagePropertyProfileName]) {
    objc_msgSend(a3, "setProfileName:", objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyProfileName));
  }
  if ([a4 objectForKeyedSubscript:kCGImagePropertyColorModel]) {
    objc_msgSend(a3, "setColorSpace:", objc_msgSend(a4, "objectForKeyedSubscript:", kCGImagePropertyColorModel));
  }
  id v18 = [a4 objectForKeyedSubscript:kCGImagePropertyExifDictionary];
  if (v18) {
    [(ImageImportExtension *)self updateAttributes:a3 withExifProperties:v18 forISR:a5];
  }
  id v19 = [a4 objectForKeyedSubscript:kCGImagePropertyExifAuxDictionary];
  if (v19) {
    [(ImageImportExtension *)self updateAttributes:a3 withExifAuxProperties:v19 forISR:a5];
  }
  id v20 = [a4 objectForKeyedSubscript:kCGImagePropertyTIFFDictionary];
  if (v20) {
    [(ImageImportExtension *)self updateAttributes:a3 withTIFFProperties:v20 forISR:a5];
  }
  id v21 = [a4 objectForKeyedSubscript:kCGImageProperty8BIMDictionary];
  if (v21) {
    [(ImageImportExtension *)self updateAttributes:a3 withPhotoshopProperties:v21 forISR:a5];
  }
  id v22 = [a4 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  if (v22) {
    [(ImageImportExtension *)self updateAttributes:a3 withIPTCProperties:v22 forISR:a5];
  }
  id v23 = [a4 objectForKeyedSubscript:kCGImagePropertyGPSDictionary];
  if (v23) {
    [(ImageImportExtension *)self updateAttributes:a3 withGPSProperties:v23 forISR:a5];
  }
  return 1;
}

- (BOOL)updateAttributes:(id)a3 withMetadata:(CGImageMetadata *)a4
{
  return 1;
}

- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5
{
  id v7 = CGImageSourceCreateWithURL((CFURLRef)a4, 0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v11 = kCGImageSourceSkipMetadata;
    id v12 = &__kCFBooleanTrue;
    CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
    [(ImageImportExtension *)self updateAttributes:a3 withProperties:(id)CFMakeCollectable(v9) forISR:v8];
    CFRelease(v8);
  }
  return 0;
}

@end