@interface SRPhotoplethysmogramOpticalSample
- (id)sr_dictionaryRepresentation;
@end

@implementation SRPhotoplethysmogramOpticalSample

- (id)sr_dictionaryRepresentation
{
  uint64_t v30 = 0;
  if ((objc_msgSend(-[SRPhotoplethysmogramOpticalSample activePhotodiodeIndexes](self, "activePhotodiodeIndexes"), "getBitfield:", &v30) & 1) == 0)
  {
    if (qword_100016DB0 != -1) {
      dispatch_once(&qword_100016DB0, &stru_100010438);
    }
    v3 = qword_100016DB8;
    if (os_log_type_enabled((os_log_t)qword_100016DB8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to get bitfield for photodiodes", buf, 2u);
    }
  }
  v31[0] = @"emitter";
  v32[0] = +[NSNumber numberWithInteger:[(SRPhotoplethysmogramOpticalSample *)self emitter]];
  v31[1] = @"photodiodes";
  v32[1] = +[NSNumber numberWithUnsignedLongLong:v30];
  v31[2] = @"signalIdentifier";
  v32[2] = +[NSNumber numberWithInteger:[(SRPhotoplethysmogramOpticalSample *)self signalIdentifier]];
  v31[3] = @"nominalWavelength";
  id v4 = [(SRPhotoplethysmogramOpticalSample *)self nominalWavelength];
  if (v4)
  {
    [v4 doubleValue];
    if (fabs(v5) == INFINITY) {
      CFStringRef v6 = @"INF";
    }
    else {
      CFStringRef v6 = +[NSString stringWithFormat:@"%f", *(void *)&v5];
    }
  }
  else
  {
    CFStringRef v6 = @"(null)";
  }
  v32[3] = v6;
  v31[4] = @"effectiveWavelength";
  id v7 = [(SRPhotoplethysmogramOpticalSample *)self effectiveWavelength];
  if (v7)
  {
    [v7 doubleValue];
    if (fabs(v8) == INFINITY) {
      CFStringRef v9 = @"INF";
    }
    else {
      CFStringRef v9 = +[NSString stringWithFormat:@"%f", *(void *)&v8];
    }
  }
  else
  {
    CFStringRef v9 = @"(null)";
  }
  v32[4] = v9;
  v31[5] = @"frequency";
  id v10 = [(SRPhotoplethysmogramOpticalSample *)self samplingFrequency];
  if (v10)
  {
    [v10 doubleValue];
    if (fabs(v11) == INFINITY) {
      CFStringRef v12 = @"INF";
    }
    else {
      CFStringRef v12 = +[NSString stringWithFormat:@"%f", *(void *)&v11];
    }
  }
  else
  {
    CFStringRef v12 = @"(null)";
  }
  v32[5] = v12;
  v31[6] = @"nanosecondsSinceStart";
  v32[6] = +[NSNumber numberWithLongLong:[(SRPhotoplethysmogramOpticalSample *)self nanosecondsSinceStart]];
  v31[7] = @"normalizedReflectance";
  id v13 = [(SRPhotoplethysmogramOpticalSample *)self normalizedReflectance];
  if (v13)
  {
    [v13 doubleValue];
    if (fabs(v14) == INFINITY) {
      CFStringRef v15 = @"INF";
    }
    else {
      CFStringRef v15 = +[NSString stringWithFormat:@"%f", *(void *)&v14];
    }
  }
  else
  {
    CFStringRef v15 = @"(null)";
  }
  v32[7] = v15;
  v31[8] = @"whiteNoise";
  id v16 = [(SRPhotoplethysmogramOpticalSample *)self whiteNoise];
  if (v16)
  {
    [v16 doubleValue];
    if (fabs(v17) == INFINITY) {
      CFStringRef v18 = @"INF";
    }
    else {
      CFStringRef v18 = +[NSString stringWithFormat:@"%f", *(void *)&v17];
    }
  }
  else
  {
    CFStringRef v18 = @"(null)";
  }
  v32[8] = v18;
  v31[9] = @"pinkNoise";
  id v19 = [(SRPhotoplethysmogramOpticalSample *)self pinkNoise];
  if (v19)
  {
    [v19 doubleValue];
    if (fabs(v20) == INFINITY) {
      CFStringRef v21 = @"INF";
    }
    else {
      CFStringRef v21 = +[NSString stringWithFormat:@"%f", *(void *)&v20];
    }
  }
  else
  {
    CFStringRef v21 = @"(null)";
  }
  v32[9] = v21;
  v31[10] = @"backgroundNoise";
  id v22 = [(SRPhotoplethysmogramOpticalSample *)self backgroundNoise];
  if (v22)
  {
    [v22 doubleValue];
    if (fabs(v23) == INFINITY) {
      CFStringRef v24 = @"INF";
    }
    else {
      CFStringRef v24 = +[NSString stringWithFormat:@"%f", *(void *)&v23];
    }
  }
  else
  {
    CFStringRef v24 = @"(null)";
  }
  v32[10] = v24;
  v31[11] = @"backgroundNoiseOffset";
  id v25 = [(SRPhotoplethysmogramOpticalSample *)self backgroundNoiseOffset];
  if (v25)
  {
    [v25 doubleValue];
    if (fabs(v26) == INFINITY) {
      CFStringRef v27 = @"INF";
    }
    else {
      CFStringRef v27 = +[NSString stringWithFormat:@"%f", *(void *)&v26];
    }
  }
  else
  {
    CFStringRef v27 = @"(null)";
  }
  v32[11] = v27;
  v31[12] = @"conditions";
  v32[12] = [(SRPhotoplethysmogramOpticalSample *)self conditions];
  return +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:13];
}

@end