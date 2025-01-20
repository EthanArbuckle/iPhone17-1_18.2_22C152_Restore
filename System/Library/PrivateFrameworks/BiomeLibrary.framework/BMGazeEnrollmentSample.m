@interface BMGazeEnrollmentSample
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMGazeEnrollmentSample)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMGazeEnrollmentSample)initWithUserProfileId:(id)a3 eyeSide:(int)a4 isOffline:(id)a5 enrollmentResidual75thPercentile:(id)a6 enrollmentResidual95thPercentile:(id)a7 enrollmentResidualMedian:(id)a8 dominantEye:(int)a9 monocularQuality:(int)a10 enrollmentFailureReasons:(id)a11 binocQuality:(int)a12 fixationCount:(id)a13 fixationCountLowBrightness:(id)a14 fixationCountMediumBrightness:(id)a15 fixationCountHighBrightness:(id)a16 stimulusCount:(id)a17 stimulusCountLowBrightness:(id)a18 stimulusCountMediumBrightness:(id)a19 stimulusCountHighBrightness:(id)a20 accessibilityMode:(int)a21 eyeboxStatus:(int)a22 centralStimulusSignedResidualYaw:(id)a23 brightness1topStimulusSignedResidualYaw:(id)a24 brightness1topRightStimulusSignedResidualYaw:(id)a25 brightness1bottomRightStimulusSignedResidualYaw:(id)a26 brightness1bottomStimulusSignedResidualYaw:(id)a27 brightness1bottomLeftStimulusSignedResidualYaw:(id)a28 brightness1topLeftStimulusSignedResidualYaw:(id)a29 brightness2topStimulusSignedResidualYaw:(id)a30 brightness2topRightStimulusSignedResidualYaw:(id)a31 brightness2bottomRightStimulusSignedResidualYaw:(id)a32 brightness2bottomStimulusSignedResidualYaw:(id)a33 brightness2bottomLeftStimulusSignedResidualYaw:(id)a34 brightness2topLeftStimulusSignedResidualYaw:(id)a35 brightness3topStimulusSignedResidualYaw:(id)a36 brightness3topRightStimulusSignedResidualYaw:(id)a37 brightness3bottomRightStimulusSignedResidualYaw:(id)a38 brightness3bottomStimulusSignedResidualYaw:(id)a39 brightness3bottomLeftStimulusSignedResidualYaw:(id)a40 brightness3topLeftStimulusSignedResidualYaw:(id)a41 centralStimulusSignedResidualPitch:(id)a42 brightness1topStimulusSignedResidualPitch:(id)a43 brightness1topRightStimulusSignedResidualPitch:(id)a44 brightness1bottomRightStimulusSignedResidualPitch:(id)a45 brightness1bottomStimulusSignedResidualPitch:(id)a46 brightness1bottomLeftStimulusSignedResidualPitch:(id)a47 brightness1topLeftStimulusSignedResidualPitch:(id)a48 brightness2topStimulusSignedResidualPitch:(id)a49 brightness2topRightStimulusSignedResidualPitch:(id)a50 brightness2bottomRightStimulusSignedResidualPitch:(id)a51 brightness2bottomStimulusSignedResidualPitch:(id)a52 brightness2bottomLeftStimulusSignedResidualPitch:(id)a53 brightness2topLeftStimulusSignedResidualPitch:(id)a54 brightness3topStimulusSignedResidualPitch:(id)a55 brightness3topRightStimulusSignedResidualPitch:(id)a56 brightness3bottomRightStimulusSignedResidualPitch:(id)a57 brightness3bottomStimulusSignedResidualPitch:(id)a58 brightness3bottomLeftStimulusSignedResidualPitch:(id)a59 brightness3topLeftStimulusSignedResidualPitch:(id)a60 rxuuid:(id)a61 enrollmentReason:(int)a62;
- (BOOL)hasBrightness1bottomLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness1bottomLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness1bottomRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness1bottomRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness1bottomStimulusSignedResidualPitch;
- (BOOL)hasBrightness1bottomStimulusSignedResidualYaw;
- (BOOL)hasBrightness1topLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness1topLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness1topRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness1topRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness1topStimulusSignedResidualPitch;
- (BOOL)hasBrightness1topStimulusSignedResidualYaw;
- (BOOL)hasBrightness2bottomLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness2bottomLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness2bottomRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness2bottomRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness2bottomStimulusSignedResidualPitch;
- (BOOL)hasBrightness2bottomStimulusSignedResidualYaw;
- (BOOL)hasBrightness2topLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness2topLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness2topRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness2topRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness2topStimulusSignedResidualPitch;
- (BOOL)hasBrightness2topStimulusSignedResidualYaw;
- (BOOL)hasBrightness3bottomLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness3bottomLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness3bottomRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness3bottomRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness3bottomStimulusSignedResidualPitch;
- (BOOL)hasBrightness3bottomStimulusSignedResidualYaw;
- (BOOL)hasBrightness3topLeftStimulusSignedResidualPitch;
- (BOOL)hasBrightness3topLeftStimulusSignedResidualYaw;
- (BOOL)hasBrightness3topRightStimulusSignedResidualPitch;
- (BOOL)hasBrightness3topRightStimulusSignedResidualYaw;
- (BOOL)hasBrightness3topStimulusSignedResidualPitch;
- (BOOL)hasBrightness3topStimulusSignedResidualYaw;
- (BOOL)hasCentralStimulusSignedResidualPitch;
- (BOOL)hasCentralStimulusSignedResidualYaw;
- (BOOL)hasEnrollmentResidual75thPercentile;
- (BOOL)hasEnrollmentResidual95thPercentile;
- (BOOL)hasEnrollmentResidualMedian;
- (BOOL)hasFixationCount;
- (BOOL)hasFixationCountHighBrightness;
- (BOOL)hasFixationCountLowBrightness;
- (BOOL)hasFixationCountMediumBrightness;
- (BOOL)hasIsOffline;
- (BOOL)hasStimulusCount;
- (BOOL)hasStimulusCountHighBrightness;
- (BOOL)hasStimulusCountLowBrightness;
- (BOOL)hasStimulusCountMediumBrightness;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOffline;
- (NSArray)enrollmentFailureReasons;
- (NSString)description;
- (NSString)rxuuid;
- (NSString)userProfileId;
- (float)brightness1bottomLeftStimulusSignedResidualPitch;
- (float)brightness1bottomLeftStimulusSignedResidualYaw;
- (float)brightness1bottomRightStimulusSignedResidualPitch;
- (float)brightness1bottomRightStimulusSignedResidualYaw;
- (float)brightness1bottomStimulusSignedResidualPitch;
- (float)brightness1bottomStimulusSignedResidualYaw;
- (float)brightness1topLeftStimulusSignedResidualPitch;
- (float)brightness1topLeftStimulusSignedResidualYaw;
- (float)brightness1topRightStimulusSignedResidualPitch;
- (float)brightness1topRightStimulusSignedResidualYaw;
- (float)brightness1topStimulusSignedResidualPitch;
- (float)brightness1topStimulusSignedResidualYaw;
- (float)brightness2bottomLeftStimulusSignedResidualPitch;
- (float)brightness2bottomLeftStimulusSignedResidualYaw;
- (float)brightness2bottomRightStimulusSignedResidualPitch;
- (float)brightness2bottomRightStimulusSignedResidualYaw;
- (float)brightness2bottomStimulusSignedResidualPitch;
- (float)brightness2bottomStimulusSignedResidualYaw;
- (float)brightness2topLeftStimulusSignedResidualPitch;
- (float)brightness2topLeftStimulusSignedResidualYaw;
- (float)brightness2topRightStimulusSignedResidualPitch;
- (float)brightness2topRightStimulusSignedResidualYaw;
- (float)brightness2topStimulusSignedResidualPitch;
- (float)brightness2topStimulusSignedResidualYaw;
- (float)brightness3bottomLeftStimulusSignedResidualPitch;
- (float)brightness3bottomLeftStimulusSignedResidualYaw;
- (float)brightness3bottomRightStimulusSignedResidualPitch;
- (float)brightness3bottomRightStimulusSignedResidualYaw;
- (float)brightness3bottomStimulusSignedResidualPitch;
- (float)brightness3bottomStimulusSignedResidualYaw;
- (float)brightness3topLeftStimulusSignedResidualPitch;
- (float)brightness3topLeftStimulusSignedResidualYaw;
- (float)brightness3topRightStimulusSignedResidualPitch;
- (float)brightness3topRightStimulusSignedResidualYaw;
- (float)brightness3topStimulusSignedResidualPitch;
- (float)brightness3topStimulusSignedResidualYaw;
- (float)centralStimulusSignedResidualPitch;
- (float)centralStimulusSignedResidualYaw;
- (float)enrollmentResidual75thPercentile;
- (float)enrollmentResidual95thPercentile;
- (float)enrollmentResidualMedian;
- (id)_enrollmentFailureReasonsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)accessibilityMode;
- (int)binocQuality;
- (int)dominantEye;
- (int)enrollmentReason;
- (int)eyeSide;
- (int)eyeboxStatus;
- (int)monocularQuality;
- (unsigned)dataVersion;
- (unsigned)fixationCount;
- (unsigned)fixationCountHighBrightness;
- (unsigned)fixationCountLowBrightness;
- (unsigned)fixationCountMediumBrightness;
- (unsigned)stimulusCount;
- (unsigned)stimulusCountHighBrightness;
- (unsigned)stimulusCountLowBrightness;
- (unsigned)stimulusCountMediumBrightness;
- (void)setHasBrightness1bottomLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1bottomLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness1bottomRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1bottomRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness1bottomStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1bottomStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness1topLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1topLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness1topRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1topRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness1topStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness1topStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2bottomLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2bottomLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2bottomRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2bottomRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2bottomStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2bottomStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2topLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2topLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2topRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2topRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness2topStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness2topStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3bottomLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3bottomLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3bottomRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3bottomRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3bottomStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3bottomStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3topLeftStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3topLeftStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3topRightStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3topRightStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasBrightness3topStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasBrightness3topStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasCentralStimulusSignedResidualPitch:(BOOL)a3;
- (void)setHasCentralStimulusSignedResidualYaw:(BOOL)a3;
- (void)setHasEnrollmentResidual75thPercentile:(BOOL)a3;
- (void)setHasEnrollmentResidual95thPercentile:(BOOL)a3;
- (void)setHasEnrollmentResidualMedian:(BOOL)a3;
- (void)setHasFixationCount:(BOOL)a3;
- (void)setHasFixationCountHighBrightness:(BOOL)a3;
- (void)setHasFixationCountLowBrightness:(BOOL)a3;
- (void)setHasFixationCountMediumBrightness:(BOOL)a3;
- (void)setHasIsOffline:(BOOL)a3;
- (void)setHasStimulusCount:(BOOL)a3;
- (void)setHasStimulusCountHighBrightness:(BOOL)a3;
- (void)setHasStimulusCountLowBrightness:(BOOL)a3;
- (void)setHasStimulusCountMediumBrightness:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMGazeEnrollmentSample

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxuuid, 0);
  objc_storeStrong((id *)&self->_enrollmentFailureReasons, 0);

  objc_storeStrong((id *)&self->_userProfileId, 0);
}

- (int)enrollmentReason
{
  return self->_enrollmentReason;
}

- (NSString)rxuuid
{
  return self->_rxuuid;
}

- (void)setHasBrightness3topLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3topLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3topLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness3topLeftStimulusSignedResidualPitch;
}

- (float)brightness3topLeftStimulusSignedResidualPitch
{
  return self->_brightness3topLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness3bottomLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3bottomLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3bottomLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness3bottomLeftStimulusSignedResidualPitch;
}

- (float)brightness3bottomLeftStimulusSignedResidualPitch
{
  return self->_brightness3bottomLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness3bottomStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3bottomStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3bottomStimulusSignedResidualPitch
{
  return self->_hasBrightness3bottomStimulusSignedResidualPitch;
}

- (float)brightness3bottomStimulusSignedResidualPitch
{
  return self->_brightness3bottomStimulusSignedResidualPitch;
}

- (void)setHasBrightness3bottomRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3bottomRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3bottomRightStimulusSignedResidualPitch
{
  return self->_hasBrightness3bottomRightStimulusSignedResidualPitch;
}

- (float)brightness3bottomRightStimulusSignedResidualPitch
{
  return self->_brightness3bottomRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness3topRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3topRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3topRightStimulusSignedResidualPitch
{
  return self->_hasBrightness3topRightStimulusSignedResidualPitch;
}

- (float)brightness3topRightStimulusSignedResidualPitch
{
  return self->_brightness3topRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness3topStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness3topStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness3topStimulusSignedResidualPitch
{
  return self->_hasBrightness3topStimulusSignedResidualPitch;
}

- (float)brightness3topStimulusSignedResidualPitch
{
  return self->_brightness3topStimulusSignedResidualPitch;
}

- (void)setHasBrightness2topLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2topLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2topLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness2topLeftStimulusSignedResidualPitch;
}

- (float)brightness2topLeftStimulusSignedResidualPitch
{
  return self->_brightness2topLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness2bottomLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2bottomLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2bottomLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness2bottomLeftStimulusSignedResidualPitch;
}

- (float)brightness2bottomLeftStimulusSignedResidualPitch
{
  return self->_brightness2bottomLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness2bottomStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2bottomStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2bottomStimulusSignedResidualPitch
{
  return self->_hasBrightness2bottomStimulusSignedResidualPitch;
}

- (float)brightness2bottomStimulusSignedResidualPitch
{
  return self->_brightness2bottomStimulusSignedResidualPitch;
}

- (void)setHasBrightness2bottomRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2bottomRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2bottomRightStimulusSignedResidualPitch
{
  return self->_hasBrightness2bottomRightStimulusSignedResidualPitch;
}

- (float)brightness2bottomRightStimulusSignedResidualPitch
{
  return self->_brightness2bottomRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness2topRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2topRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2topRightStimulusSignedResidualPitch
{
  return self->_hasBrightness2topRightStimulusSignedResidualPitch;
}

- (float)brightness2topRightStimulusSignedResidualPitch
{
  return self->_brightness2topRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness2topStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness2topStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness2topStimulusSignedResidualPitch
{
  return self->_hasBrightness2topStimulusSignedResidualPitch;
}

- (float)brightness2topStimulusSignedResidualPitch
{
  return self->_brightness2topStimulusSignedResidualPitch;
}

- (void)setHasBrightness1topLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1topLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1topLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness1topLeftStimulusSignedResidualPitch;
}

- (float)brightness1topLeftStimulusSignedResidualPitch
{
  return self->_brightness1topLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness1bottomLeftStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1bottomLeftStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1bottomLeftStimulusSignedResidualPitch
{
  return self->_hasBrightness1bottomLeftStimulusSignedResidualPitch;
}

- (float)brightness1bottomLeftStimulusSignedResidualPitch
{
  return self->_brightness1bottomLeftStimulusSignedResidualPitch;
}

- (void)setHasBrightness1bottomStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1bottomStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1bottomStimulusSignedResidualPitch
{
  return self->_hasBrightness1bottomStimulusSignedResidualPitch;
}

- (float)brightness1bottomStimulusSignedResidualPitch
{
  return self->_brightness1bottomStimulusSignedResidualPitch;
}

- (void)setHasBrightness1bottomRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1bottomRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1bottomRightStimulusSignedResidualPitch
{
  return self->_hasBrightness1bottomRightStimulusSignedResidualPitch;
}

- (float)brightness1bottomRightStimulusSignedResidualPitch
{
  return self->_brightness1bottomRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness1topRightStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1topRightStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1topRightStimulusSignedResidualPitch
{
  return self->_hasBrightness1topRightStimulusSignedResidualPitch;
}

- (float)brightness1topRightStimulusSignedResidualPitch
{
  return self->_brightness1topRightStimulusSignedResidualPitch;
}

- (void)setHasBrightness1topStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasBrightness1topStimulusSignedResidualPitch = a3;
}

- (BOOL)hasBrightness1topStimulusSignedResidualPitch
{
  return self->_hasBrightness1topStimulusSignedResidualPitch;
}

- (float)brightness1topStimulusSignedResidualPitch
{
  return self->_brightness1topStimulusSignedResidualPitch;
}

- (void)setHasCentralStimulusSignedResidualPitch:(BOOL)a3
{
  self->_hasCentralStimulusSignedResidualPitch = a3;
}

- (BOOL)hasCentralStimulusSignedResidualPitch
{
  return self->_hasCentralStimulusSignedResidualPitch;
}

- (float)centralStimulusSignedResidualPitch
{
  return self->_centralStimulusSignedResidualPitch;
}

- (void)setHasBrightness3topLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3topLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3topLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness3topLeftStimulusSignedResidualYaw;
}

- (float)brightness3topLeftStimulusSignedResidualYaw
{
  return self->_brightness3topLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness3bottomLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3bottomLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3bottomLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness3bottomLeftStimulusSignedResidualYaw;
}

- (float)brightness3bottomLeftStimulusSignedResidualYaw
{
  return self->_brightness3bottomLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness3bottomStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3bottomStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3bottomStimulusSignedResidualYaw
{
  return self->_hasBrightness3bottomStimulusSignedResidualYaw;
}

- (float)brightness3bottomStimulusSignedResidualYaw
{
  return self->_brightness3bottomStimulusSignedResidualYaw;
}

- (void)setHasBrightness3bottomRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3bottomRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3bottomRightStimulusSignedResidualYaw
{
  return self->_hasBrightness3bottomRightStimulusSignedResidualYaw;
}

- (float)brightness3bottomRightStimulusSignedResidualYaw
{
  return self->_brightness3bottomRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness3topRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3topRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3topRightStimulusSignedResidualYaw
{
  return self->_hasBrightness3topRightStimulusSignedResidualYaw;
}

- (float)brightness3topRightStimulusSignedResidualYaw
{
  return self->_brightness3topRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness3topStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness3topStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness3topStimulusSignedResidualYaw
{
  return self->_hasBrightness3topStimulusSignedResidualYaw;
}

- (float)brightness3topStimulusSignedResidualYaw
{
  return self->_brightness3topStimulusSignedResidualYaw;
}

- (void)setHasBrightness2topLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2topLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2topLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness2topLeftStimulusSignedResidualYaw;
}

- (float)brightness2topLeftStimulusSignedResidualYaw
{
  return self->_brightness2topLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness2bottomLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2bottomLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2bottomLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness2bottomLeftStimulusSignedResidualYaw;
}

- (float)brightness2bottomLeftStimulusSignedResidualYaw
{
  return self->_brightness2bottomLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness2bottomStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2bottomStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2bottomStimulusSignedResidualYaw
{
  return self->_hasBrightness2bottomStimulusSignedResidualYaw;
}

- (float)brightness2bottomStimulusSignedResidualYaw
{
  return self->_brightness2bottomStimulusSignedResidualYaw;
}

- (void)setHasBrightness2bottomRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2bottomRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2bottomRightStimulusSignedResidualYaw
{
  return self->_hasBrightness2bottomRightStimulusSignedResidualYaw;
}

- (float)brightness2bottomRightStimulusSignedResidualYaw
{
  return self->_brightness2bottomRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness2topRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2topRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2topRightStimulusSignedResidualYaw
{
  return self->_hasBrightness2topRightStimulusSignedResidualYaw;
}

- (float)brightness2topRightStimulusSignedResidualYaw
{
  return self->_brightness2topRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness2topStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness2topStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness2topStimulusSignedResidualYaw
{
  return self->_hasBrightness2topStimulusSignedResidualYaw;
}

- (float)brightness2topStimulusSignedResidualYaw
{
  return self->_brightness2topStimulusSignedResidualYaw;
}

- (void)setHasBrightness1topLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1topLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1topLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness1topLeftStimulusSignedResidualYaw;
}

- (float)brightness1topLeftStimulusSignedResidualYaw
{
  return self->_brightness1topLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness1bottomLeftStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1bottomLeftStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1bottomLeftStimulusSignedResidualYaw
{
  return self->_hasBrightness1bottomLeftStimulusSignedResidualYaw;
}

- (float)brightness1bottomLeftStimulusSignedResidualYaw
{
  return self->_brightness1bottomLeftStimulusSignedResidualYaw;
}

- (void)setHasBrightness1bottomStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1bottomStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1bottomStimulusSignedResidualYaw
{
  return self->_hasBrightness1bottomStimulusSignedResidualYaw;
}

- (float)brightness1bottomStimulusSignedResidualYaw
{
  return self->_brightness1bottomStimulusSignedResidualYaw;
}

- (void)setHasBrightness1bottomRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1bottomRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1bottomRightStimulusSignedResidualYaw
{
  return self->_hasBrightness1bottomRightStimulusSignedResidualYaw;
}

- (float)brightness1bottomRightStimulusSignedResidualYaw
{
  return self->_brightness1bottomRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness1topRightStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1topRightStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1topRightStimulusSignedResidualYaw
{
  return self->_hasBrightness1topRightStimulusSignedResidualYaw;
}

- (float)brightness1topRightStimulusSignedResidualYaw
{
  return self->_brightness1topRightStimulusSignedResidualYaw;
}

- (void)setHasBrightness1topStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasBrightness1topStimulusSignedResidualYaw = a3;
}

- (BOOL)hasBrightness1topStimulusSignedResidualYaw
{
  return self->_hasBrightness1topStimulusSignedResidualYaw;
}

- (float)brightness1topStimulusSignedResidualYaw
{
  return self->_brightness1topStimulusSignedResidualYaw;
}

- (void)setHasCentralStimulusSignedResidualYaw:(BOOL)a3
{
  self->_hasCentralStimulusSignedResidualYaw = a3;
}

- (BOOL)hasCentralStimulusSignedResidualYaw
{
  return self->_hasCentralStimulusSignedResidualYaw;
}

- (float)centralStimulusSignedResidualYaw
{
  return self->_centralStimulusSignedResidualYaw;
}

- (int)eyeboxStatus
{
  return self->_eyeboxStatus;
}

- (int)accessibilityMode
{
  return self->_accessibilityMode;
}

- (void)setHasStimulusCountHighBrightness:(BOOL)a3
{
  self->_hasStimulusCountHighBrightness = a3;
}

- (BOOL)hasStimulusCountHighBrightness
{
  return self->_hasStimulusCountHighBrightness;
}

- (unsigned)stimulusCountHighBrightness
{
  return self->_stimulusCountHighBrightness;
}

- (void)setHasStimulusCountMediumBrightness:(BOOL)a3
{
  self->_hasStimulusCountMediumBrightness = a3;
}

- (BOOL)hasStimulusCountMediumBrightness
{
  return self->_hasStimulusCountMediumBrightness;
}

- (unsigned)stimulusCountMediumBrightness
{
  return self->_stimulusCountMediumBrightness;
}

- (void)setHasStimulusCountLowBrightness:(BOOL)a3
{
  self->_hasStimulusCountLowBrightness = a3;
}

- (BOOL)hasStimulusCountLowBrightness
{
  return self->_hasStimulusCountLowBrightness;
}

- (unsigned)stimulusCountLowBrightness
{
  return self->_stimulusCountLowBrightness;
}

- (void)setHasStimulusCount:(BOOL)a3
{
  self->_hasStimulusCount = a3;
}

- (BOOL)hasStimulusCount
{
  return self->_hasStimulusCount;
}

- (unsigned)stimulusCount
{
  return self->_stimulusCount;
}

- (void)setHasFixationCountHighBrightness:(BOOL)a3
{
  self->_hasFixationCountHighBrightness = a3;
}

- (BOOL)hasFixationCountHighBrightness
{
  return self->_hasFixationCountHighBrightness;
}

- (unsigned)fixationCountHighBrightness
{
  return self->_fixationCountHighBrightness;
}

- (void)setHasFixationCountMediumBrightness:(BOOL)a3
{
  self->_hasFixationCountMediumBrightness = a3;
}

- (BOOL)hasFixationCountMediumBrightness
{
  return self->_hasFixationCountMediumBrightness;
}

- (unsigned)fixationCountMediumBrightness
{
  return self->_fixationCountMediumBrightness;
}

- (void)setHasFixationCountLowBrightness:(BOOL)a3
{
  self->_hasFixationCountLowBrightness = a3;
}

- (BOOL)hasFixationCountLowBrightness
{
  return self->_hasFixationCountLowBrightness;
}

- (unsigned)fixationCountLowBrightness
{
  return self->_fixationCountLowBrightness;
}

- (void)setHasFixationCount:(BOOL)a3
{
  self->_hasFixationCount = a3;
}

- (BOOL)hasFixationCount
{
  return self->_hasFixationCount;
}

- (unsigned)fixationCount
{
  return self->_fixationCount;
}

- (int)binocQuality
{
  return self->_binocQuality;
}

- (NSArray)enrollmentFailureReasons
{
  return self->_enrollmentFailureReasons;
}

- (int)monocularQuality
{
  return self->_monocularQuality;
}

- (int)dominantEye
{
  return self->_dominantEye;
}

- (void)setHasEnrollmentResidualMedian:(BOOL)a3
{
  self->_hasEnrollmentResidualMedian = a3;
}

- (BOOL)hasEnrollmentResidualMedian
{
  return self->_hasEnrollmentResidualMedian;
}

- (float)enrollmentResidualMedian
{
  return self->_enrollmentResidualMedian;
}

- (void)setHasEnrollmentResidual95thPercentile:(BOOL)a3
{
  self->_hasEnrollmentResidual95thPercentile = a3;
}

- (BOOL)hasEnrollmentResidual95thPercentile
{
  return self->_hasEnrollmentResidual95thPercentile;
}

- (float)enrollmentResidual95thPercentile
{
  return self->_enrollmentResidual95thPercentile;
}

- (void)setHasEnrollmentResidual75thPercentile:(BOOL)a3
{
  self->_hasEnrollmentResidual75thPercentile = a3;
}

- (BOOL)hasEnrollmentResidual75thPercentile
{
  return self->_hasEnrollmentResidual75thPercentile;
}

- (float)enrollmentResidual75thPercentile
{
  return self->_enrollmentResidual75thPercentile;
}

- (void)setHasIsOffline:(BOOL)a3
{
  self->_hasIsOffline = a3;
}

- (BOOL)hasIsOffline
{
  return self->_hasIsOffline;
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (int)eyeSide
{
  return self->_eyeSide;
}

- (NSString)userProfileId
{
  return self->_userProfileId;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMGazeEnrollmentSample *)self userProfileId];
    uint64_t v7 = [v5 userProfileId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMGazeEnrollmentSample *)self userProfileId];
      v10 = [v5 userProfileId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_269;
      }
    }
    int v13 = [(BMGazeEnrollmentSample *)self eyeSide];
    if (v13 != [v5 eyeSide]) {
      goto LABEL_269;
    }
    if (-[BMGazeEnrollmentSample hasIsOffline](self, "hasIsOffline") || [v5 hasIsOffline])
    {
      if (![(BMGazeEnrollmentSample *)self hasIsOffline]) {
        goto LABEL_269;
      }
      if (![v5 hasIsOffline]) {
        goto LABEL_269;
      }
      int v14 = [(BMGazeEnrollmentSample *)self isOffline];
      if (v14 != [v5 isOffline]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasEnrollmentResidual75thPercentile]
      || [v5 hasEnrollmentResidual75thPercentile])
    {
      if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidual75thPercentile]) {
        goto LABEL_269;
      }
      if (![v5 hasEnrollmentResidual75thPercentile]) {
        goto LABEL_269;
      }
      [(BMGazeEnrollmentSample *)self enrollmentResidual75thPercentile];
      float v16 = v15;
      [v5 enrollmentResidual75thPercentile];
      if (v16 != v17) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasEnrollmentResidual95thPercentile]
      || [v5 hasEnrollmentResidual95thPercentile])
    {
      if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidual95thPercentile]) {
        goto LABEL_269;
      }
      if (![v5 hasEnrollmentResidual95thPercentile]) {
        goto LABEL_269;
      }
      [(BMGazeEnrollmentSample *)self enrollmentResidual95thPercentile];
      float v19 = v18;
      [v5 enrollmentResidual95thPercentile];
      if (v19 != v20) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasEnrollmentResidualMedian]
      || [v5 hasEnrollmentResidualMedian])
    {
      if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidualMedian]) {
        goto LABEL_269;
      }
      if (![v5 hasEnrollmentResidualMedian]) {
        goto LABEL_269;
      }
      [(BMGazeEnrollmentSample *)self enrollmentResidualMedian];
      float v22 = v21;
      [v5 enrollmentResidualMedian];
      if (v22 != v23) {
        goto LABEL_269;
      }
    }
    int v24 = [(BMGazeEnrollmentSample *)self dominantEye];
    if (v24 != [v5 dominantEye]) {
      goto LABEL_269;
    }
    int v25 = [(BMGazeEnrollmentSample *)self monocularQuality];
    if (v25 != [v5 monocularQuality]) {
      goto LABEL_269;
    }
    v26 = [(BMGazeEnrollmentSample *)self enrollmentFailureReasons];
    uint64_t v27 = [v5 enrollmentFailureReasons];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMGazeEnrollmentSample *)self enrollmentFailureReasons];
      v30 = [v5 enrollmentFailureReasons];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_269;
      }
    }
    int v32 = [(BMGazeEnrollmentSample *)self binocQuality];
    if (v32 != [v5 binocQuality]) {
      goto LABEL_269;
    }
    if ([(BMGazeEnrollmentSample *)self hasFixationCount]
      || [v5 hasFixationCount])
    {
      if (![(BMGazeEnrollmentSample *)self hasFixationCount]) {
        goto LABEL_269;
      }
      if (![v5 hasFixationCount]) {
        goto LABEL_269;
      }
      unsigned int v33 = [(BMGazeEnrollmentSample *)self fixationCount];
      if (v33 != [v5 fixationCount]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasFixationCountLowBrightness]
      || [v5 hasFixationCountLowBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasFixationCountLowBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasFixationCountLowBrightness]) {
        goto LABEL_269;
      }
      unsigned int v34 = [(BMGazeEnrollmentSample *)self fixationCountLowBrightness];
      if (v34 != [v5 fixationCountLowBrightness]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasFixationCountMediumBrightness]
      || [v5 hasFixationCountMediumBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasFixationCountMediumBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasFixationCountMediumBrightness]) {
        goto LABEL_269;
      }
      unsigned int v35 = [(BMGazeEnrollmentSample *)self fixationCountMediumBrightness];
      if (v35 != [v5 fixationCountMediumBrightness]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasFixationCountHighBrightness]
      || [v5 hasFixationCountHighBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasFixationCountHighBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasFixationCountHighBrightness]) {
        goto LABEL_269;
      }
      unsigned int v36 = [(BMGazeEnrollmentSample *)self fixationCountHighBrightness];
      if (v36 != [v5 fixationCountHighBrightness]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasStimulusCount]
      || [v5 hasStimulusCount])
    {
      if (![(BMGazeEnrollmentSample *)self hasStimulusCount]) {
        goto LABEL_269;
      }
      if (![v5 hasStimulusCount]) {
        goto LABEL_269;
      }
      unsigned int v37 = [(BMGazeEnrollmentSample *)self stimulusCount];
      if (v37 != [v5 stimulusCount]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasStimulusCountLowBrightness]
      || [v5 hasStimulusCountLowBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasStimulusCountLowBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasStimulusCountLowBrightness]) {
        goto LABEL_269;
      }
      unsigned int v38 = [(BMGazeEnrollmentSample *)self stimulusCountLowBrightness];
      if (v38 != [v5 stimulusCountLowBrightness]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasStimulusCountMediumBrightness]
      || [v5 hasStimulusCountMediumBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasStimulusCountMediumBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasStimulusCountMediumBrightness]) {
        goto LABEL_269;
      }
      unsigned int v39 = [(BMGazeEnrollmentSample *)self stimulusCountMediumBrightness];
      if (v39 != [v5 stimulusCountMediumBrightness]) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasStimulusCountHighBrightness]
      || [v5 hasStimulusCountHighBrightness])
    {
      if (![(BMGazeEnrollmentSample *)self hasStimulusCountHighBrightness]) {
        goto LABEL_269;
      }
      if (![v5 hasStimulusCountHighBrightness]) {
        goto LABEL_269;
      }
      unsigned int v40 = [(BMGazeEnrollmentSample *)self stimulusCountHighBrightness];
      if (v40 != [v5 stimulusCountHighBrightness]) {
        goto LABEL_269;
      }
    }
    int v41 = [(BMGazeEnrollmentSample *)self accessibilityMode];
    if (v41 != [v5 accessibilityMode]) {
      goto LABEL_269;
    }
    int v42 = [(BMGazeEnrollmentSample *)self eyeboxStatus];
    if (v42 != [v5 eyeboxStatus]) {
      goto LABEL_269;
    }
    if ([(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualYaw]
      || [v5 hasCentralStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualYaw]) {
        goto LABEL_269;
      }
      if (![v5 hasCentralStimulusSignedResidualYaw]) {
        goto LABEL_269;
      }
      [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualYaw];
      float v44 = v43;
      [v5 centralStimulusSignedResidualYaw];
      if (v44 != v45) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topStimulusSignedResidualYaw](self, "hasBrightness1topStimulusSignedResidualYaw")|| [v5 hasBrightness1topStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1topStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualYaw];
      float v47 = v46;
      [v5 brightness1topStimulusSignedResidualYaw];
      if (v47 != v48) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topRightStimulusSignedResidualYaw](self, "hasBrightness1topRightStimulusSignedResidualYaw")|| [v5 hasBrightness1topRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1topRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualYaw];
      float v50 = v49;
      [v5 brightness1topRightStimulusSignedResidualYaw];
      if (v50 != v51) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomRightStimulusSignedResidualYaw](self, "hasBrightness1bottomRightStimulusSignedResidualYaw")|| [v5 hasBrightness1bottomRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1bottomRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualYaw];
      float v53 = v52;
      [v5 brightness1bottomRightStimulusSignedResidualYaw];
      if (v53 != v54) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomStimulusSignedResidualYaw](self, "hasBrightness1bottomStimulusSignedResidualYaw")|| [v5 hasBrightness1bottomStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1bottomStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualYaw];
      float v56 = v55;
      [v5 brightness1bottomStimulusSignedResidualYaw];
      if (v56 != v57) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomLeftStimulusSignedResidualYaw](self, "hasBrightness1bottomLeftStimulusSignedResidualYaw")|| [v5 hasBrightness1bottomLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1bottomLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualYaw];
      float v59 = v58;
      [v5 brightness1bottomLeftStimulusSignedResidualYaw];
      if (v59 != v60) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topLeftStimulusSignedResidualYaw](self, "hasBrightness1topLeftStimulusSignedResidualYaw")|| [v5 hasBrightness1topLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness1topLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualYaw];
      float v62 = v61;
      [v5 brightness1topLeftStimulusSignedResidualYaw];
      if (v62 != v63) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topStimulusSignedResidualYaw](self, "hasBrightness2topStimulusSignedResidualYaw")|| [v5 hasBrightness2topStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2topStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualYaw];
      float v65 = v64;
      [v5 brightness2topStimulusSignedResidualYaw];
      if (v65 != v66) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topRightStimulusSignedResidualYaw](self, "hasBrightness2topRightStimulusSignedResidualYaw")|| [v5 hasBrightness2topRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2topRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualYaw];
      float v68 = v67;
      [v5 brightness2topRightStimulusSignedResidualYaw];
      if (v68 != v69) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomRightStimulusSignedResidualYaw](self, "hasBrightness2bottomRightStimulusSignedResidualYaw")|| [v5 hasBrightness2bottomRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2bottomRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualYaw];
      float v71 = v70;
      [v5 brightness2bottomRightStimulusSignedResidualYaw];
      if (v71 != v72) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomStimulusSignedResidualYaw](self, "hasBrightness2bottomStimulusSignedResidualYaw")|| [v5 hasBrightness2bottomStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2bottomStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualYaw];
      float v74 = v73;
      [v5 brightness2bottomStimulusSignedResidualYaw];
      if (v74 != v75) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomLeftStimulusSignedResidualYaw](self, "hasBrightness2bottomLeftStimulusSignedResidualYaw")|| [v5 hasBrightness2bottomLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2bottomLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualYaw];
      float v77 = v76;
      [v5 brightness2bottomLeftStimulusSignedResidualYaw];
      if (v77 != v78) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topLeftStimulusSignedResidualYaw](self, "hasBrightness2topLeftStimulusSignedResidualYaw")|| [v5 hasBrightness2topLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness2topLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualYaw];
      float v80 = v79;
      [v5 brightness2topLeftStimulusSignedResidualYaw];
      if (v80 != v81) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topStimulusSignedResidualYaw](self, "hasBrightness3topStimulusSignedResidualYaw")|| [v5 hasBrightness3topStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3topStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualYaw];
      float v83 = v82;
      [v5 brightness3topStimulusSignedResidualYaw];
      if (v83 != v84) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topRightStimulusSignedResidualYaw](self, "hasBrightness3topRightStimulusSignedResidualYaw")|| [v5 hasBrightness3topRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3topRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualYaw];
      float v86 = v85;
      [v5 brightness3topRightStimulusSignedResidualYaw];
      if (v86 != v87) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomRightStimulusSignedResidualYaw](self, "hasBrightness3bottomRightStimulusSignedResidualYaw")|| [v5 hasBrightness3bottomRightStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomRightStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3bottomRightStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualYaw];
      float v89 = v88;
      [v5 brightness3bottomRightStimulusSignedResidualYaw];
      if (v89 != v90) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomStimulusSignedResidualYaw](self, "hasBrightness3bottomStimulusSignedResidualYaw")|| [v5 hasBrightness3bottomStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3bottomStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualYaw];
      float v92 = v91;
      [v5 brightness3bottomStimulusSignedResidualYaw];
      if (v92 != v93) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomLeftStimulusSignedResidualYaw](self, "hasBrightness3bottomLeftStimulusSignedResidualYaw")|| [v5 hasBrightness3bottomLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3bottomLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualYaw];
      float v95 = v94;
      [v5 brightness3bottomLeftStimulusSignedResidualYaw];
      if (v95 != v96) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topLeftStimulusSignedResidualYaw](self, "hasBrightness3topLeftStimulusSignedResidualYaw")|| [v5 hasBrightness3topLeftStimulusSignedResidualYaw])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topLeftStimulusSignedResidualYaw])goto LABEL_269; {
      if (![v5 hasBrightness3topLeftStimulusSignedResidualYaw])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualYaw];
      float v98 = v97;
      [v5 brightness3topLeftStimulusSignedResidualYaw];
      if (v98 != v99) {
        goto LABEL_269;
      }
    }
    if ([(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualPitch]
      || [v5 hasCentralStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasCentralStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualPitch];
      float v101 = v100;
      [v5 centralStimulusSignedResidualPitch];
      if (v101 != v102) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topStimulusSignedResidualPitch](self, "hasBrightness1topStimulusSignedResidualPitch")|| [v5 hasBrightness1topStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1topStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualPitch];
      float v104 = v103;
      [v5 brightness1topStimulusSignedResidualPitch];
      if (v104 != v105) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topRightStimulusSignedResidualPitch](self, "hasBrightness1topRightStimulusSignedResidualPitch")|| [v5 hasBrightness1topRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1topRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualPitch];
      float v107 = v106;
      [v5 brightness1topRightStimulusSignedResidualPitch];
      if (v107 != v108) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomRightStimulusSignedResidualPitch](self, "hasBrightness1bottomRightStimulusSignedResidualPitch")|| [v5 hasBrightness1bottomRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1bottomRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualPitch];
      float v110 = v109;
      [v5 brightness1bottomRightStimulusSignedResidualPitch];
      if (v110 != v111) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomStimulusSignedResidualPitch](self, "hasBrightness1bottomStimulusSignedResidualPitch")|| [v5 hasBrightness1bottomStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1bottomStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualPitch];
      float v113 = v112;
      [v5 brightness1bottomStimulusSignedResidualPitch];
      if (v113 != v114) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1bottomLeftStimulusSignedResidualPitch](self, "hasBrightness1bottomLeftStimulusSignedResidualPitch")|| [v5 hasBrightness1bottomLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1bottomLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualPitch];
      float v116 = v115;
      [v5 brightness1bottomLeftStimulusSignedResidualPitch];
      if (v116 != v117) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness1topLeftStimulusSignedResidualPitch](self, "hasBrightness1topLeftStimulusSignedResidualPitch")|| [v5 hasBrightness1topLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness1topLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness1topLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualPitch];
      float v119 = v118;
      [v5 brightness1topLeftStimulusSignedResidualPitch];
      if (v119 != v120) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topStimulusSignedResidualPitch](self, "hasBrightness2topStimulusSignedResidualPitch")|| [v5 hasBrightness2topStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2topStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualPitch];
      float v122 = v121;
      [v5 brightness2topStimulusSignedResidualPitch];
      if (v122 != v123) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topRightStimulusSignedResidualPitch](self, "hasBrightness2topRightStimulusSignedResidualPitch")|| [v5 hasBrightness2topRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2topRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualPitch];
      float v125 = v124;
      [v5 brightness2topRightStimulusSignedResidualPitch];
      if (v125 != v126) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomRightStimulusSignedResidualPitch](self, "hasBrightness2bottomRightStimulusSignedResidualPitch")|| [v5 hasBrightness2bottomRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2bottomRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualPitch];
      float v128 = v127;
      [v5 brightness2bottomRightStimulusSignedResidualPitch];
      if (v128 != v129) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomStimulusSignedResidualPitch](self, "hasBrightness2bottomStimulusSignedResidualPitch")|| [v5 hasBrightness2bottomStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2bottomStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualPitch];
      float v131 = v130;
      [v5 brightness2bottomStimulusSignedResidualPitch];
      if (v131 != v132) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2bottomLeftStimulusSignedResidualPitch](self, "hasBrightness2bottomLeftStimulusSignedResidualPitch")|| [v5 hasBrightness2bottomLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2bottomLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualPitch];
      float v134 = v133;
      [v5 brightness2bottomLeftStimulusSignedResidualPitch];
      if (v134 != v135) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness2topLeftStimulusSignedResidualPitch](self, "hasBrightness2topLeftStimulusSignedResidualPitch")|| [v5 hasBrightness2topLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness2topLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness2topLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualPitch];
      float v137 = v136;
      [v5 brightness2topLeftStimulusSignedResidualPitch];
      if (v137 != v138) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topStimulusSignedResidualPitch](self, "hasBrightness3topStimulusSignedResidualPitch")|| [v5 hasBrightness3topStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3topStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualPitch];
      float v140 = v139;
      [v5 brightness3topStimulusSignedResidualPitch];
      if (v140 != v141) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topRightStimulusSignedResidualPitch](self, "hasBrightness3topRightStimulusSignedResidualPitch")|| [v5 hasBrightness3topRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3topRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualPitch];
      float v143 = v142;
      [v5 brightness3topRightStimulusSignedResidualPitch];
      if (v143 != v144) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomRightStimulusSignedResidualPitch](self, "hasBrightness3bottomRightStimulusSignedResidualPitch")|| [v5 hasBrightness3bottomRightStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomRightStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3bottomRightStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualPitch];
      float v146 = v145;
      [v5 brightness3bottomRightStimulusSignedResidualPitch];
      if (v146 != v147) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomStimulusSignedResidualPitch](self, "hasBrightness3bottomStimulusSignedResidualPitch")|| [v5 hasBrightness3bottomStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3bottomStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualPitch];
      float v149 = v148;
      [v5 brightness3bottomStimulusSignedResidualPitch];
      if (v149 != v150) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3bottomLeftStimulusSignedResidualPitch](self, "hasBrightness3bottomLeftStimulusSignedResidualPitch")|| [v5 hasBrightness3bottomLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3bottomLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualPitch];
      float v152 = v151;
      [v5 brightness3bottomLeftStimulusSignedResidualPitch];
      if (v152 != v153) {
        goto LABEL_269;
      }
    }
    if (-[BMGazeEnrollmentSample hasBrightness3topLeftStimulusSignedResidualPitch](self, "hasBrightness3topLeftStimulusSignedResidualPitch")|| [v5 hasBrightness3topLeftStimulusSignedResidualPitch])
    {
      if (![(BMGazeEnrollmentSample *)self hasBrightness3topLeftStimulusSignedResidualPitch])goto LABEL_269; {
      if (![v5 hasBrightness3topLeftStimulusSignedResidualPitch])
      }
        goto LABEL_269;
      [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualPitch];
      float v155 = v154;
      [v5 brightness3topLeftStimulusSignedResidualPitch];
      if (v155 != v156) {
        goto LABEL_269;
      }
    }
    v157 = [(BMGazeEnrollmentSample *)self rxuuid];
    uint64_t v158 = [v5 rxuuid];
    if (v157 == (void *)v158)
    {
    }
    else
    {
      v159 = (void *)v158;
      v160 = [(BMGazeEnrollmentSample *)self rxuuid];
      v161 = [v5 rxuuid];
      int v162 = [v160 isEqual:v161];

      if (!v162)
      {
LABEL_269:
        BOOL v12 = 0;
LABEL_270:

        goto LABEL_271;
      }
    }
    int v164 = [(BMGazeEnrollmentSample *)self enrollmentReason];
    BOOL v12 = v164 == [v5 enrollmentReason];
    goto LABEL_270;
  }
  BOOL v12 = 0;
LABEL_271:

  return v12;
}

- (id)jsonDictionary
{
  v272[60] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMGazeEnrollmentSample *)self userProfileId];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample eyeSide](self, "eyeSide"));
  if ([(BMGazeEnrollmentSample *)self hasIsOffline])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMGazeEnrollmentSample isOffline](self, "isOffline"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidual75thPercentile]
    || ([(BMGazeEnrollmentSample *)self enrollmentResidual75thPercentile],
        fabsf(v6) == INFINITY))
  {
    id v218 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self enrollmentResidual75thPercentile];
    uint64_t v7 = NSNumber;
    [(BMGazeEnrollmentSample *)self enrollmentResidual75thPercentile];
    objc_msgSend(v7, "numberWithFloat:");
    id v218 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidual95thPercentile]
    || ([(BMGazeEnrollmentSample *)self enrollmentResidual95thPercentile],
        fabsf(v8) == INFINITY))
  {
    id v10 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self enrollmentResidual95thPercentile];
    v9 = NSNumber;
    [(BMGazeEnrollmentSample *)self enrollmentResidual95thPercentile];
    objc_msgSend(v9, "numberWithFloat:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasEnrollmentResidualMedian]
    || ([(BMGazeEnrollmentSample *)self enrollmentResidualMedian], fabsf(v11) == INFINITY))
  {
    id v13 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self enrollmentResidualMedian];
    BOOL v12 = NSNumber;
    [(BMGazeEnrollmentSample *)self enrollmentResidualMedian];
    objc_msgSend(v12, "numberWithFloat:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample dominantEye](self, "dominantEye"));
  v270 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample monocularQuality](self, "monocularQuality"));
  v269 = [(BMGazeEnrollmentSample *)self _enrollmentFailureReasonsJSONArray];
  v268 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample binocQuality](self, "binocQuality"));
  if ([(BMGazeEnrollmentSample *)self hasFixationCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCount](self, "fixationCount"));
    id v267 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v267 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasFixationCountLowBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountLowBrightness](self, "fixationCountLowBrightness"));
    id v266 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v266 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasFixationCountMediumBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountMediumBrightness](self, "fixationCountMediumBrightness"));
    id v265 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v265 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasFixationCountHighBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountHighBrightness](self, "fixationCountHighBrightness"));
    id v264 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v264 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasStimulusCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCount](self, "stimulusCount"));
    id v263 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v263 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasStimulusCountLowBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountLowBrightness](self, "stimulusCountLowBrightness"));
    id v262 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v262 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasStimulusCountMediumBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountMediumBrightness](self, "stimulusCountMediumBrightness"));
    id v261 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v261 = 0;
  }
  if ([(BMGazeEnrollmentSample *)self hasStimulusCountHighBrightness])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountHighBrightness](self, "stimulusCountHighBrightness"));
    id v260 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v260 = 0;
  }
  v259 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample accessibilityMode](self, "accessibilityMode"));
  v258 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample eyeboxStatus](self, "eyeboxStatus"));
  if (![(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualYaw]
    || ([(BMGazeEnrollmentSample *)self centralStimulusSignedResidualYaw],
        fabsf(v15) == INFINITY))
  {
    id v257 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualYaw];
    float v16 = NSNumber;
    [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualYaw];
    objc_msgSend(v16, "numberWithFloat:");
    id v257 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualYaw], fabsf(v17) == INFINITY))
  {
    id v256 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualYaw];
    float v18 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualYaw];
    objc_msgSend(v18, "numberWithFloat:");
    id v256 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualYaw], fabsf(v19) == INFINITY))
  {
    id v255 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualYaw];
    float v20 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualYaw];
    objc_msgSend(v20, "numberWithFloat:");
    id v255 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualYaw], fabsf(v21) == INFINITY))
  {
    id v254 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualYaw];
    float v22 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualYaw];
    objc_msgSend(v22, "numberWithFloat:");
    id v254 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualYaw], fabsf(v23) == INFINITY))
  {
    id v253 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualYaw];
    int v24 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualYaw];
    objc_msgSend(v24, "numberWithFloat:");
    id v253 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualYaw], fabsf(v25) == INFINITY))
  {
    id v252 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualYaw];
    v26 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualYaw];
    objc_msgSend(v26, "numberWithFloat:");
    id v252 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualYaw], fabsf(v27) == INFINITY))
  {
    id v251 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualYaw];
    v28 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualYaw];
    objc_msgSend(v28, "numberWithFloat:");
    id v251 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualYaw], fabsf(v29) == INFINITY))
  {
    id v250 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualYaw];
    v30 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualYaw];
    objc_msgSend(v30, "numberWithFloat:");
    id v250 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualYaw], fabsf(v31) == INFINITY))
  {
    id v249 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualYaw];
    int v32 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualYaw];
    objc_msgSend(v32, "numberWithFloat:");
    id v249 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualYaw], fabsf(v33) == INFINITY))
  {
    id v248 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualYaw];
    unsigned int v34 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualYaw];
    objc_msgSend(v34, "numberWithFloat:");
    id v248 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualYaw], fabsf(v35) == INFINITY))
  {
    id v247 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualYaw];
    unsigned int v36 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualYaw];
    objc_msgSend(v36, "numberWithFloat:");
    id v247 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualYaw], fabsf(v37) == INFINITY))
  {
    id v246 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualYaw];
    unsigned int v38 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualYaw];
    objc_msgSend(v38, "numberWithFloat:");
    id v246 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualYaw], fabsf(v39) == INFINITY))
  {
    id v245 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualYaw];
    unsigned int v40 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualYaw];
    objc_msgSend(v40, "numberWithFloat:");
    id v245 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualYaw], fabsf(v41) == INFINITY))
  {
    id v244 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualYaw];
    int v42 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualYaw];
    objc_msgSend(v42, "numberWithFloat:");
    id v244 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualYaw], fabsf(v43) == INFINITY))
  {
    id v243 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualYaw];
    float v44 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualYaw];
    objc_msgSend(v44, "numberWithFloat:");
    id v243 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomRightStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualYaw], fabsf(v45) == INFINITY))
  {
    id v242 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualYaw];
    float v46 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualYaw];
    objc_msgSend(v46, "numberWithFloat:");
    id v242 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualYaw], fabsf(v47) == INFINITY))
  {
    id v241 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualYaw];
    float v48 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualYaw];
    objc_msgSend(v48, "numberWithFloat:");
    id v241 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualYaw], fabsf(v49) == INFINITY))
  {
    id v240 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualYaw];
    float v50 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualYaw];
    objc_msgSend(v50, "numberWithFloat:");
    id v240 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topLeftStimulusSignedResidualYaw]|| ([(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualYaw], fabsf(v51) == INFINITY))
  {
    id v239 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualYaw];
    float v52 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualYaw];
    objc_msgSend(v52, "numberWithFloat:");
    id v239 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasCentralStimulusSignedResidualPitch]
    || ([(BMGazeEnrollmentSample *)self centralStimulusSignedResidualPitch],
        fabsf(v53) == INFINITY))
  {
    id v238 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualPitch];
    float v54 = NSNumber;
    [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualPitch];
    objc_msgSend(v54, "numberWithFloat:");
    id v238 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualPitch], fabsf(v55) == INFINITY))
  {
    id v237 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualPitch];
    float v56 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualPitch];
    objc_msgSend(v56, "numberWithFloat:");
    id v237 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualPitch], fabsf(v57) == INFINITY))
  {
    id v236 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualPitch];
    float v58 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualPitch];
    objc_msgSend(v58, "numberWithFloat:");
    id v236 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualPitch], fabsf(v59) == INFINITY))
  {
    id v235 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualPitch];
    float v60 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualPitch];
    objc_msgSend(v60, "numberWithFloat:");
    id v235 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualPitch], fabsf(v61) == INFINITY))
  {
    id v234 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualPitch];
    float v62 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualPitch];
    objc_msgSend(v62, "numberWithFloat:");
    id v234 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1bottomLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualPitch], fabsf(v63) == INFINITY))
  {
    id v233 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualPitch];
    float v64 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualPitch];
    objc_msgSend(v64, "numberWithFloat:");
    id v233 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness1topLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualPitch], fabsf(v65) == INFINITY))
  {
    id v232 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualPitch];
    float v66 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualPitch];
    objc_msgSend(v66, "numberWithFloat:");
    id v232 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualPitch], fabsf(v67) == INFINITY))
  {
    id v231 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualPitch];
    float v68 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualPitch];
    objc_msgSend(v68, "numberWithFloat:");
    id v231 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualPitch], fabsf(v69) == INFINITY))
  {
    id v230 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualPitch];
    float v70 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualPitch];
    objc_msgSend(v70, "numberWithFloat:");
    id v230 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualPitch], fabsf(v71) == INFINITY))
  {
    id v229 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualPitch];
    float v72 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualPitch];
    objc_msgSend(v72, "numberWithFloat:");
    id v229 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualPitch], fabsf(v73) == INFINITY))
  {
    id v228 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualPitch];
    float v74 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualPitch];
    objc_msgSend(v74, "numberWithFloat:");
    id v228 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2bottomLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualPitch], fabsf(v75) == INFINITY))
  {
    id v227 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualPitch];
    float v76 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualPitch];
    objc_msgSend(v76, "numberWithFloat:");
    id v227 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness2topLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualPitch], fabsf(v77) == INFINITY))
  {
    id v226 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualPitch];
    float v78 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualPitch];
    objc_msgSend(v78, "numberWithFloat:");
    id v226 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualPitch], fabsf(v79) == INFINITY))
  {
    id v225 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualPitch];
    float v80 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualPitch];
    objc_msgSend(v80, "numberWithFloat:");
    id v225 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualPitch], fabsf(v81) == INFINITY))
  {
    id v224 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualPitch];
    float v82 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualPitch];
    objc_msgSend(v82, "numberWithFloat:");
    id v224 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomRightStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualPitch], fabsf(v83) == INFINITY))
  {
    id v223 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualPitch];
    float v84 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualPitch];
    objc_msgSend(v84, "numberWithFloat:");
    id v223 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualPitch], fabsf(v85) == INFINITY))
  {
    id v222 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualPitch];
    float v86 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualPitch];
    objc_msgSend(v86, "numberWithFloat:");
    id v222 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3bottomLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualPitch], fabsf(v87) == INFINITY))
  {
    id v221 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualPitch];
    float v88 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualPitch];
    objc_msgSend(v88, "numberWithFloat:");
    id v221 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMGazeEnrollmentSample *)self hasBrightness3topLeftStimulusSignedResidualPitch]|| ([(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualPitch], fabsf(v89) == INFINITY))
  {
    id v220 = 0;
  }
  else
  {
    [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualPitch];
    float v90 = NSNumber;
    [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualPitch];
    objc_msgSend(v90, "numberWithFloat:");
    id v220 = (id)objc_claimAutoreleasedReturnValue();
  }
  v219 = [(BMGazeEnrollmentSample *)self rxuuid];
  float v91 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGazeEnrollmentSample enrollmentReason](self, "enrollmentReason"));
  v271[0] = @"userProfileId";
  uint64_t v92 = v3;
  if (!v3)
  {
    uint64_t v92 = [MEMORY[0x1E4F1CA98] null];
  }
  v209 = (void *)v92;
  v272[0] = v92;
  v271[1] = @"eyeSide";
  uint64_t v93 = v4;
  if (!v4)
  {
    uint64_t v93 = [MEMORY[0x1E4F1CA98] null];
  }
  v208 = (void *)v93;
  v272[1] = v93;
  v271[2] = @"isOffline";
  uint64_t v94 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v94 = [MEMORY[0x1E4F1CA98] null];
  }
  v207 = (void *)v94;
  v272[2] = v94;
  v271[3] = @"enrollmentResidual75thPercentile";
  uint64_t v95 = (uint64_t)v218;
  if (!v218)
  {
    uint64_t v95 = [MEMORY[0x1E4F1CA98] null];
  }
  v206 = (void *)v95;
  v272[3] = v95;
  v271[4] = @"enrollmentResidual95thPercentile";
  uint64_t v96 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v96 = [MEMORY[0x1E4F1CA98] null];
  }
  v205 = (void *)v96;
  v272[4] = v96;
  v271[5] = @"enrollmentResidualMedian";
  uint64_t v97 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v97 = [MEMORY[0x1E4F1CA98] null];
  }
  v204 = (void *)v97;
  v272[5] = v97;
  v271[6] = @"dominantEye";
  uint64_t v98 = v14;
  if (!v14)
  {
    uint64_t v98 = [MEMORY[0x1E4F1CA98] null];
  }
  v203 = (void *)v98;
  v272[6] = v98;
  v271[7] = @"monocularQuality";
  uint64_t v99 = (uint64_t)v270;
  if (!v270)
  {
    uint64_t v99 = [MEMORY[0x1E4F1CA98] null];
  }
  v272[7] = v99;
  v271[8] = @"enrollmentFailureReasons";
  uint64_t v100 = (uint64_t)v269;
  if (!v269)
  {
    uint64_t v100 = [MEMORY[0x1E4F1CA98] null];
  }
  v272[8] = v100;
  v271[9] = @"binocQuality";
  uint64_t v101 = (uint64_t)v268;
  if (!v268)
  {
    uint64_t v101 = [MEMORY[0x1E4F1CA98] null];
  }
  v200 = (void *)v101;
  v272[9] = v101;
  v271[10] = @"fixationCount";
  uint64_t v102 = (uint64_t)v267;
  if (!v267)
  {
    uint64_t v102 = [MEMORY[0x1E4F1CA98] null];
  }
  float v103 = v13;
  v213 = (void *)v102;
  v272[10] = v102;
  v271[11] = @"fixationCountLowBrightness";
  uint64_t v104 = (uint64_t)v266;
  if (!v266)
  {
    uint64_t v104 = [MEMORY[0x1E4F1CA98] null];
  }
  float v105 = (void *)v4;
  v212 = (void *)v104;
  v272[11] = v104;
  v271[12] = @"fixationCountMediumBrightness";
  uint64_t v106 = (uint64_t)v265;
  if (!v265)
  {
    uint64_t v106 = [MEMORY[0x1E4F1CA98] null];
  }
  float v107 = (void *)v106;
  v272[12] = v106;
  v271[13] = @"fixationCountHighBrightness";
  uint64_t v108 = (uint64_t)v264;
  if (!v264)
  {
    uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
  }
  v199 = (void *)v108;
  v272[13] = v108;
  v271[14] = @"stimulusCount";
  uint64_t v109 = (uint64_t)v263;
  if (!v263)
  {
    uint64_t v109 = [MEMORY[0x1E4F1CA98] null];
  }
  v198 = (void *)v109;
  v272[14] = v109;
  v271[15] = @"stimulusCountLowBrightness";
  uint64_t v110 = (uint64_t)v262;
  if (!v262)
  {
    uint64_t v110 = [MEMORY[0x1E4F1CA98] null];
  }
  v197 = (void *)v110;
  v272[15] = v110;
  v271[16] = @"stimulusCountMediumBrightness";
  uint64_t v111 = (uint64_t)v261;
  if (!v261)
  {
    uint64_t v111 = [MEMORY[0x1E4F1CA98] null];
  }
  v196 = (void *)v111;
  v272[16] = v111;
  v271[17] = @"stimulusCountHighBrightness";
  uint64_t v112 = (uint64_t)v260;
  if (!v260)
  {
    uint64_t v112 = [MEMORY[0x1E4F1CA98] null];
  }
  v195 = (void *)v112;
  v272[17] = v112;
  v271[18] = @"accessibilityMode";
  uint64_t v113 = (uint64_t)v259;
  if (!v259)
  {
    uint64_t v113 = [MEMORY[0x1E4F1CA98] null];
  }
  v194 = (void *)v113;
  v272[18] = v113;
  v271[19] = @"eyeboxStatus";
  uint64_t v114 = (uint64_t)v258;
  if (!v258)
  {
    uint64_t v114 = [MEMORY[0x1E4F1CA98] null];
  }
  v193 = (void *)v114;
  v272[19] = v114;
  v271[20] = @"centralStimulusSignedResidualYaw";
  uint64_t v115 = (uint64_t)v257;
  if (!v257)
  {
    uint64_t v115 = [MEMORY[0x1E4F1CA98] null];
  }
  v192 = (void *)v115;
  v272[20] = v115;
  v271[21] = @"brightness1topStimulusSignedResidualYaw";
  uint64_t v116 = (uint64_t)v256;
  if (!v256)
  {
    uint64_t v116 = [MEMORY[0x1E4F1CA98] null];
  }
  v191 = (void *)v116;
  v272[21] = v116;
  v271[22] = @"brightness1topRightStimulusSignedResidualYaw";
  uint64_t v117 = (uint64_t)v255;
  if (!v255)
  {
    uint64_t v117 = [MEMORY[0x1E4F1CA98] null];
  }
  v190 = (void *)v117;
  v272[22] = v117;
  v271[23] = @"brightness1bottomRightStimulusSignedResidualYaw";
  uint64_t v118 = (uint64_t)v254;
  if (!v254)
  {
    uint64_t v118 = [MEMORY[0x1E4F1CA98] null];
  }
  v189 = (void *)v118;
  v272[23] = v118;
  v271[24] = @"brightness1bottomStimulusSignedResidualYaw";
  uint64_t v119 = (uint64_t)v253;
  if (!v253)
  {
    uint64_t v119 = [MEMORY[0x1E4F1CA98] null];
  }
  v188 = (void *)v119;
  v272[24] = v119;
  v271[25] = @"brightness1bottomLeftStimulusSignedResidualYaw";
  uint64_t v120 = (uint64_t)v252;
  if (!v252)
  {
    uint64_t v120 = [MEMORY[0x1E4F1CA98] null];
  }
  v187 = (void *)v120;
  v272[25] = v120;
  v271[26] = @"brightness1topLeftStimulusSignedResidualYaw";
  uint64_t v121 = (uint64_t)v251;
  if (!v251)
  {
    uint64_t v121 = [MEMORY[0x1E4F1CA98] null];
  }
  v186 = (void *)v121;
  v272[26] = v121;
  v271[27] = @"brightness2topStimulusSignedResidualYaw";
  uint64_t v122 = (uint64_t)v250;
  if (!v250)
  {
    uint64_t v122 = [MEMORY[0x1E4F1CA98] null];
  }
  v185 = (void *)v122;
  v272[27] = v122;
  v271[28] = @"brightness2topRightStimulusSignedResidualYaw";
  uint64_t v123 = (uint64_t)v249;
  if (!v249)
  {
    uint64_t v123 = [MEMORY[0x1E4F1CA98] null];
  }
  v184 = (void *)v123;
  v272[28] = v123;
  v271[29] = @"brightness2bottomRightStimulusSignedResidualYaw";
  uint64_t v124 = (uint64_t)v248;
  if (!v248)
  {
    uint64_t v124 = [MEMORY[0x1E4F1CA98] null];
  }
  v183 = (void *)v124;
  v272[29] = v124;
  v271[30] = @"brightness2bottomStimulusSignedResidualYaw";
  uint64_t v125 = (uint64_t)v247;
  if (!v247)
  {
    uint64_t v125 = [MEMORY[0x1E4F1CA98] null];
  }
  v182 = (void *)v125;
  v272[30] = v125;
  v271[31] = @"brightness2bottomLeftStimulusSignedResidualYaw";
  uint64_t v126 = (uint64_t)v246;
  if (!v246)
  {
    uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
  }
  v181 = (void *)v126;
  v272[31] = v126;
  v271[32] = @"brightness2topLeftStimulusSignedResidualYaw";
  uint64_t v127 = (uint64_t)v245;
  if (!v245)
  {
    uint64_t v127 = [MEMORY[0x1E4F1CA98] null];
  }
  v180 = (void *)v127;
  v272[32] = v127;
  v271[33] = @"brightness3topStimulusSignedResidualYaw";
  uint64_t v128 = (uint64_t)v244;
  if (!v244)
  {
    uint64_t v128 = [MEMORY[0x1E4F1CA98] null];
  }
  v179 = (void *)v128;
  v272[33] = v128;
  v271[34] = @"brightness3topRightStimulusSignedResidualYaw";
  uint64_t v129 = (uint64_t)v243;
  if (!v243)
  {
    uint64_t v129 = [MEMORY[0x1E4F1CA98] null];
  }
  v178 = (void *)v129;
  v272[34] = v129;
  v271[35] = @"brightness3bottomRightStimulusSignedResidualYaw";
  uint64_t v130 = (uint64_t)v242;
  if (!v242)
  {
    uint64_t v130 = [MEMORY[0x1E4F1CA98] null];
  }
  v177 = (void *)v130;
  v272[35] = v130;
  v271[36] = @"brightness3bottomStimulusSignedResidualYaw";
  uint64_t v131 = (uint64_t)v241;
  if (!v241)
  {
    uint64_t v131 = [MEMORY[0x1E4F1CA98] null];
  }
  v176 = (void *)v131;
  v272[36] = v131;
  v271[37] = @"brightness3bottomLeftStimulusSignedResidualYaw";
  uint64_t v132 = (uint64_t)v240;
  if (!v240)
  {
    uint64_t v132 = [MEMORY[0x1E4F1CA98] null];
  }
  v175 = (void *)v132;
  v272[37] = v132;
  v271[38] = @"brightness3topLeftStimulusSignedResidualYaw";
  uint64_t v133 = (uint64_t)v239;
  if (!v239)
  {
    uint64_t v133 = [MEMORY[0x1E4F1CA98] null];
  }
  v174 = (void *)v133;
  v272[38] = v133;
  v271[39] = @"centralStimulusSignedResidualPitch";
  uint64_t v134 = (uint64_t)v238;
  if (!v238)
  {
    uint64_t v134 = [MEMORY[0x1E4F1CA98] null];
  }
  v173 = (void *)v134;
  v272[39] = v134;
  v271[40] = @"brightness1topStimulusSignedResidualPitch";
  uint64_t v135 = (uint64_t)v237;
  if (!v237)
  {
    uint64_t v135 = [MEMORY[0x1E4F1CA98] null];
  }
  v172 = (void *)v135;
  v272[40] = v135;
  v271[41] = @"brightness1topRightStimulusSignedResidualPitch";
  uint64_t v136 = (uint64_t)v236;
  if (!v236)
  {
    uint64_t v136 = [MEMORY[0x1E4F1CA98] null];
  }
  v171 = (void *)v136;
  v272[41] = v136;
  v271[42] = @"brightness1bottomRightStimulusSignedResidualPitch";
  uint64_t v137 = (uint64_t)v235;
  if (!v235)
  {
    uint64_t v137 = [MEMORY[0x1E4F1CA98] null];
  }
  v170 = (void *)v137;
  v272[42] = v137;
  v271[43] = @"brightness1bottomStimulusSignedResidualPitch";
  uint64_t v138 = (uint64_t)v234;
  if (!v234)
  {
    uint64_t v138 = [MEMORY[0x1E4F1CA98] null];
  }
  v169 = (void *)v138;
  v272[43] = v138;
  v271[44] = @"brightness1bottomLeftStimulusSignedResidualPitch";
  uint64_t v139 = (uint64_t)v233;
  if (!v233)
  {
    uint64_t v139 = [MEMORY[0x1E4F1CA98] null];
  }
  v168 = (void *)v139;
  v272[44] = v139;
  v271[45] = @"brightness1topLeftStimulusSignedResidualPitch";
  uint64_t v140 = (uint64_t)v232;
  if (!v232)
  {
    uint64_t v140 = [MEMORY[0x1E4F1CA98] null];
  }
  v167 = (void *)v140;
  v272[45] = v140;
  v271[46] = @"brightness2topStimulusSignedResidualPitch";
  uint64_t v141 = (uint64_t)v231;
  if (!v231)
  {
    uint64_t v141 = [MEMORY[0x1E4F1CA98] null];
  }
  v166 = (void *)v141;
  v272[46] = v141;
  v271[47] = @"brightness2topRightStimulusSignedResidualPitch";
  uint64_t v142 = (uint64_t)v230;
  if (!v230)
  {
    uint64_t v142 = [MEMORY[0x1E4F1CA98] null];
  }
  v165 = (void *)v142;
  v272[47] = v142;
  v271[48] = @"brightness2bottomRightStimulusSignedResidualPitch";
  uint64_t v143 = (uint64_t)v229;
  if (!v229)
  {
    uint64_t v143 = [MEMORY[0x1E4F1CA98] null];
  }
  int v164 = (void *)v143;
  v272[48] = v143;
  v271[49] = @"brightness2bottomStimulusSignedResidualPitch";
  uint64_t v144 = (uint64_t)v228;
  if (!v228)
  {
    uint64_t v144 = [MEMORY[0x1E4F1CA98] null];
  }
  v163 = (void *)v144;
  v272[49] = v144;
  v271[50] = @"brightness2bottomLeftStimulusSignedResidualPitch";
  uint64_t v145 = (uint64_t)v227;
  if (!v227)
  {
    uint64_t v145 = [MEMORY[0x1E4F1CA98] null];
  }
  int v162 = (void *)v145;
  v272[50] = v145;
  v271[51] = @"brightness2topLeftStimulusSignedResidualPitch";
  uint64_t v146 = (uint64_t)v226;
  if (!v226)
  {
    uint64_t v146 = [MEMORY[0x1E4F1CA98] null];
  }
  v216 = v5;
  v161 = (void *)v146;
  v272[51] = v146;
  v271[52] = @"brightness3topStimulusSignedResidualPitch";
  uint64_t v147 = (uint64_t)v225;
  if (!v225)
  {
    uint64_t v147 = [MEMORY[0x1E4F1CA98] null];
  }
  v215 = v10;
  v160 = (void *)v147;
  v272[52] = v147;
  v271[53] = @"brightness3topRightStimulusSignedResidualPitch";
  uint64_t v148 = (uint64_t)v224;
  if (!v224)
  {
    uint64_t v148 = [MEMORY[0x1E4F1CA98] null];
  }
  v201 = (void *)v100;
  uint64_t v158 = v148;
  v272[53] = v148;
  v271[54] = @"brightness3bottomRightStimulusSignedResidualPitch";
  float v149 = v223;
  if (!v223)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v148, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175,
      v176,
      v177,
      v178,
      v179,
      v180,
      v181,
      v182,
      v183,
      v184,
      v185,
      v186,
      v187,
      v188,
      v189,
      v190,
      v191,
      v192,
      v193,
      v194,
      v195,
      v196,
      v197,
      v198,
      v199,
      v200,
    float v149 = v100);
  }
  v214 = (void *)v3;
  v272[54] = v149;
  v271[55] = @"brightness3bottomStimulusSignedResidualPitch";
  float v150 = v222;
  if (!v222)
  {
    float v150 = [MEMORY[0x1E4F1CA98] null];
  }
  v202 = (void *)v99;
  v211 = (void *)v14;
  v272[55] = v150;
  v271[56] = @"brightness3bottomLeftStimulusSignedResidualPitch";
  float v151 = v221;
  if (!v221)
  {
    float v151 = [MEMORY[0x1E4F1CA98] null];
  }
  v217 = v91;
  float v152 = v105;
  v272[56] = v151;
  v271[57] = @"brightness3topLeftStimulusSignedResidualPitch";
  float v153 = v220;
  if (!v220)
  {
    float v153 = [MEMORY[0x1E4F1CA98] null];
  }
  v272[57] = v153;
  v271[58] = @"rxuuid";
  float v154 = v219;
  if (!v219)
  {
    float v154 = [MEMORY[0x1E4F1CA98] null];
  }
  v272[58] = v154;
  v271[59] = @"enrollmentReason";
  float v155 = v91;
  if (!v91)
  {
    float v91 = [MEMORY[0x1E4F1CA98] null];
  }
  v272[59] = v91;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v272, v271, 60, v158);
  id v210 = (id)objc_claimAutoreleasedReturnValue();
  if (!v155) {

  }
  float v156 = v107;
  if (!v219)
  {

    float v156 = v107;
  }
  if (!v220)
  {

    float v156 = v107;
  }
  if (!v221)
  {

    float v156 = v107;
  }
  if (!v222)
  {

    float v156 = v107;
  }
  if (!v223)
  {

    float v156 = v107;
  }
  if (!v224)
  {

    float v156 = v107;
  }
  if (!v225)
  {

    float v156 = v107;
  }
  if (!v226)
  {

    float v156 = v107;
  }
  if (!v227)
  {

    float v156 = v107;
  }
  if (!v228)
  {

    float v156 = v107;
  }
  if (!v229)
  {

    float v156 = v107;
  }
  if (!v230)
  {

    float v156 = v107;
  }
  if (!v231)
  {

    float v156 = v107;
  }
  if (!v232)
  {

    float v156 = v107;
  }
  if (!v233)
  {

    float v156 = v107;
  }
  if (!v234)
  {

    float v156 = v107;
  }
  if (!v235)
  {

    float v156 = v107;
  }
  if (!v236)
  {

    float v156 = v107;
  }
  if (!v237)
  {

    float v156 = v107;
  }
  if (!v238)
  {

    float v156 = v107;
  }
  if (!v239)
  {

    float v156 = v107;
  }
  if (!v240)
  {

    float v156 = v107;
  }
  if (!v241)
  {

    float v156 = v107;
  }
  if (!v242)
  {

    float v156 = v107;
  }
  if (!v243)
  {

    float v156 = v107;
  }
  if (!v244)
  {

    float v156 = v107;
  }
  if (!v245)
  {

    float v156 = v107;
  }
  if (!v246)
  {

    float v156 = v107;
  }
  if (!v247)
  {

    float v156 = v107;
  }
  if (!v248)
  {

    float v156 = v107;
  }
  if (!v249)
  {

    float v156 = v107;
  }
  if (!v250)
  {

    float v156 = v107;
  }
  if (!v251)
  {

    float v156 = v107;
  }
  if (!v252)
  {

    float v156 = v107;
  }
  if (!v253)
  {

    float v156 = v107;
  }
  if (!v254)
  {

    float v156 = v107;
  }
  if (!v255)
  {

    float v156 = v107;
  }
  if (!v256)
  {

    float v156 = v107;
  }
  if (!v257)
  {

    float v156 = v107;
  }
  if (!v258)
  {

    float v156 = v107;
  }
  if (!v259)
  {

    float v156 = v107;
  }
  if (!v260)
  {

    float v156 = v107;
  }
  if (!v261)
  {

    float v156 = v107;
  }
  if (!v262)
  {

    float v156 = v107;
  }
  if (!v263)
  {

    float v156 = v107;
  }
  if (!v264)
  {

    float v156 = v107;
  }
  if (!v265) {

  }
  if (!v266) {
  if (!v267)
  }

  if (!v268) {
  if (!v269)
  }

  if (v270)
  {
    if (v211) {
      goto LABEL_418;
    }
  }
  else
  {

    if (v211)
    {
LABEL_418:
      if (v103) {
        goto LABEL_419;
      }
      goto LABEL_429;
    }
  }

  if (v103)
  {
LABEL_419:
    if (v215) {
      goto LABEL_420;
    }
    goto LABEL_430;
  }
LABEL_429:

  if (v215)
  {
LABEL_420:
    if (v218) {
      goto LABEL_421;
    }
    goto LABEL_431;
  }
LABEL_430:

  if (v218)
  {
LABEL_421:
    if (v216) {
      goto LABEL_422;
    }
    goto LABEL_432;
  }
LABEL_431:

  if (v216)
  {
LABEL_422:
    if (v152) {
      goto LABEL_423;
    }
LABEL_433:

    if (v214) {
      goto LABEL_424;
    }
    goto LABEL_434;
  }
LABEL_432:

  if (!v152) {
    goto LABEL_433;
  }
LABEL_423:
  if (v214) {
    goto LABEL_424;
  }
LABEL_434:

LABEL_424:

  return v210;
}

- (id)_enrollmentFailureReasonsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMGazeEnrollmentSample *)self enrollmentFailureReasons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMGazeEnrollmentSample)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v679[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"userProfileId"];
  v546 = self;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = *MEMORY[0x1E4F502C8];
        uint64_t v678 = *MEMORY[0x1E4F28568];
        uint64_t v14 = v7;
        id v15 = [NSString alloc];
        uint64_t v392 = objc_opt_class();
        float v16 = v15;
        uint64_t v7 = v14;
        id v10 = (id)[v16 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v392, @"userProfileId"];
        v679[0] = v10;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v679 forKeys:&v678 count:1];
        id v17 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
        id v8 = 0;
        float v18 = 0;
        *a4 = v17;
        goto LABEL_614;
      }
      id v8 = 0;
      float v18 = 0;
      goto LABEL_615;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"eyeSide"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v676 = *MEMORY[0x1E4F28568];
          uint64_t v64 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eyeSide"];
          uint64_t v677 = v64;
          uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v677 forKeys:&v676 count:1];
          uint64_t v66 = v63;
          v30 = (void *)v64;
          v545 = (void *)v65;
          id v10 = 0;
          float v18 = 0;
          *a4 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v66, 2);
          id v8 = v11;
          goto LABEL_613;
        }
        id v10 = 0;
        float v18 = 0;
        goto LABEL_614;
      }
      id v19 = v9;
      id v10 = [NSNumber numberWithInt:BMOasisAnalyticsGazeSampleEyeSideFromString(v19)];
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v20 = [v6 objectForKeyedSubscript:@"isOffline"];
  v544 = v9;
  v545 = (void *)v20;
  if (v20 && (float v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v36 = v8;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v674 = *MEMORY[0x1E4F28568];
        id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isOffline"];
        id v675 = v28;
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v675 forKeys:&v674 count:1];
        unsigned int v40 = v37;
        id v8 = v36;
        float v41 = (void *)v39;
        id v42 = (id)[v40 initWithDomain:v38 code:2 userInfo:v39];
        v30 = 0;
        float v18 = 0;
        *a4 = v42;
        goto LABEL_612;
      }
      v30 = 0;
      float v18 = 0;
      goto LABEL_613;
    }
    id v22 = v10;
    float v23 = v7;
    int v24 = a4;
    id v25 = v21;
  }
  else
  {
    id v22 = v10;
    float v23 = v7;
    int v24 = a4;
    id v25 = 0;
  }
  uint64_t v26 = [v6 objectForKeyedSubscript:@"enrollmentResidual75thPercentile"];
  id v543 = v8;
  v542 = (void *)v26;
  if (v26 && (float v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v24)
      {
        id v548 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v535 = v25;
        uint64_t v7 = v23;
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v672 = *MEMORY[0x1E4F28568];
        id v10 = v22;
        uint64_t v44 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"enrollmentResidual75thPercentile"];
        uint64_t v673 = v44;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v673 forKeys:&v672 count:1];
        v46 = float v45 = v24;
        uint64_t v47 = v43;
        id v8 = v543;
        v30 = v535;
        float v18 = 0;
        *float v45 = (id)[v548 initWithDomain:v47 code:2 userInfo:v46];
        float v48 = (void *)v46;
        float v41 = v542;
        float v49 = (void *)v44;
        id v28 = 0;
        goto LABEL_611;
      }
      id v28 = 0;
      float v18 = 0;
      float v41 = v27;
      v30 = v25;
      uint64_t v7 = v23;
      id v10 = v22;
      goto LABEL_612;
    }
    v540 = v24;
    id v28 = v27;
  }
  else
  {
    v540 = v24;
    id v28 = 0;
  }
  float v29 = [v6 objectForKeyedSubscript:@"enrollmentResidual95thPercentile"];
  v30 = v25;
  v536 = v23;
  v537 = v22;
  id v539 = v28;
  if (v29)
  {
    objc_opt_class();
    uint64_t v7 = v23;
    if (objc_opt_isKindOfClass())
    {
      id v532 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        float v41 = v542;
        if (v540)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v670 = *MEMORY[0x1E4F28568];
          float v52 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"enrollmentResidual95thPercentile"];
          v671 = v52;
          uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v671 forKeys:&v670 count:1];
          uint64_t v54 = v51;
          float v55 = v29;
          v538 = (void *)v53;
          id v56 = (id)[v50 initWithDomain:v54 code:2 userInfo:v53];
          float v18 = 0;
          id *v540 = v56;
          id v8 = v543;
          float v48 = v55;
          float v41 = v542;
          float v49 = 0;
          uint64_t v7 = v536;
          goto LABEL_610;
        }
        id v10 = v22;
        float v49 = 0;
        float v18 = 0;
        float v48 = v29;
        uint64_t v7 = v536;
        id v8 = v543;
        goto LABEL_611;
      }
      id v532 = v29;
    }
  }
  else
  {
    id v532 = 0;
    uint64_t v7 = v23;
  }
  uint64_t v31 = [v6 objectForKeyedSubscript:@"enrollmentResidualMedian"];
  v538 = (void *)v31;
  v533 = v29;
  if (v31 && (int v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v540)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v668 = *MEMORY[0x1E4F28568];
        id v530 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"enrollmentResidualMedian"];
        id v669 = v530;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v669 forKeys:&v668 count:1];
        uint64_t v60 = v58;
        id v28 = v539;
        v531 = (void *)v59;
        id v61 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v60, 2);
        float v52 = 0;
        float v18 = 0;
        id *v540 = v61;
        id v8 = v543;
        float v49 = v532;
        float v48 = v533;
        float v41 = v542;
        uint64_t v7 = v536;
        goto LABEL_609;
      }
      float v52 = 0;
      float v18 = 0;
      float v49 = v532;
      float v48 = v29;
      float v41 = v542;
      uint64_t v7 = v536;
      id v8 = v543;
      goto LABEL_610;
    }
    id v528 = v32;
  }
  else
  {
    id v528 = 0;
  }
  uint64_t v33 = [v6 objectForKeyedSubscript:@"dominantEye"];
  v534 = v30;
  v531 = (void *)v33;
  if (v33 && (unsigned int v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v35 = v30;
      id v530 = v34;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v540)
        {
          id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v100 = *MEMORY[0x1E4F502C8];
          uint64_t v666 = *MEMORY[0x1E4F28568];
          uint64_t v101 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"dominantEye"];
          uint64_t v667 = v101;
          v527 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v667 forKeys:&v666 count:1];
          id v102 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v100, 2);
          id v530 = 0;
          float v18 = 0;
          id *v540 = v102;
          uint64_t v92 = (void *)v101;
          float v48 = v29;
          float v49 = v532;
          float v52 = v528;
          id v8 = v543;
          goto LABEL_608;
        }
        id v530 = 0;
        float v18 = 0;
        float v41 = v542;
        float v48 = v29;
        float v49 = v532;
        float v52 = v528;
        id v8 = v543;
        goto LABEL_609;
      }
      id v67 = v34;
      id v530 = [NSNumber numberWithInt:BMOasisAnalyticsGazeSampleEyeSideFromString(v67)];

      float v35 = v30;
    }
  }
  else
  {
    float v35 = v30;
    id v530 = 0;
  }
  uint64_t v68 = [v6 objectForKeyedSubscript:@"monocularQuality"];
  v527 = (void *)v68;
  if (v68 && (float v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v526 = v69;
      float v48 = v29;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v540)
        {
          id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v104 = *MEMORY[0x1E4F502C8];
          uint64_t v664 = *MEMORY[0x1E4F28568];
          id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"monocularQuality"];
          id v665 = obj;
          v550 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v665 forKeys:&v664 count:1];
          id v105 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
          uint64_t v92 = 0;
          float v18 = 0;
          id *v540 = v105;
          v30 = v534;
          float v48 = v533;
          float v49 = v532;
          float v52 = v528;
          id v8 = v543;
          uint64_t v7 = v536;

          goto LABEL_607;
        }
        uint64_t v92 = 0;
        float v18 = 0;
        v30 = v534;
        float v48 = v29;
        float v49 = v532;
        float v52 = v528;
        id v8 = v543;
        uint64_t v7 = v536;
        goto LABEL_608;
      }
      id v70 = v69;
      id v526 = [NSNumber numberWithInt:BMGazeEnrollmentSampleEnrollmentQualityFromString(v70)];

      float v35 = v534;
      float v48 = v29;
    }
  }
  else
  {
    id v526 = 0;
    float v48 = v29;
  }
  float v71 = [v6 objectForKeyedSubscript:@"enrollmentFailureReasons"];
  float v72 = [MEMORY[0x1E4F1CA98] null];
  int v73 = [v71 isEqual:v72];

  if (v73)
  {

    float v71 = 0;
  }
  else
  {
    id v8 = v543;
    if (v71)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = v35;
        id obj = v71;
        if (!v540)
        {
          float v18 = 0;
          float v49 = v532;
          float v52 = v528;
          uint64_t v92 = v526;
          goto LABEL_607;
        }
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v95 = *MEMORY[0x1E4F502C8];
        uint64_t v662 = *MEMORY[0x1E4F28568];
        v549 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"enrollmentFailureReasons"];
        v663 = v549;
        uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v663 forKeys:&v662 count:1];
        uint64_t v97 = v94;
        id v8 = v543;
        uint64_t v98 = v95;
        uint64_t v93 = (void *)v96;
        uint64_t v7 = v536;
        float v18 = 0;
        id *v540 = (id)[v97 initWithDomain:v98 code:2 userInfo:v96];
        goto LABEL_91;
      }
    }
  }
  v549 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v71, "count"));
  long long v551 = 0u;
  long long v552 = 0u;
  long long v553 = 0u;
  long long v554 = 0u;
  id v74 = v71;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v551 objects:v661 count:16];
  id obj = v74;
  if (!v75) {
    goto LABEL_80;
  }
  uint64_t v76 = v75;
  uint64_t v77 = *(void *)v552;
  while (2)
  {
    for (uint64_t i = 0; i != v76; ++i)
    {
      if (*(void *)v552 != v77) {
        objc_enumerationMutation(obj);
      }
      float v79 = *(void **)(*((void *)&v551 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v83 = v540;
        if (v540)
        {
          id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v85 = *MEMORY[0x1E4F502C8];
          uint64_t v659 = *MEMORY[0x1E4F28568];
          uint64_t v86 = [[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"enrollmentFailureReasons"];
          uint64_t v660 = v86;
          uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v660 forKeys:&v659 count:1];
          float v88 = v84;
          uint64_t v89 = v85;
          float v82 = (void *)v86;
LABEL_87:
          v522 = (void *)v87;
          float v49 = v532;
          float v52 = v528;
          uint64_t v92 = v526;
          float v18 = 0;
          *float v83 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
          id v524 = obj;
          uint64_t v7 = v536;
          id v8 = v543;
          v30 = v534;
          id v28 = v539;

          goto LABEL_604;
        }
LABEL_88:
        float v18 = 0;
        uint64_t v93 = obj;
        uint64_t v7 = v536;
        id v8 = v543;
        v30 = v534;
        id v28 = v539;
LABEL_91:
        float v49 = v532;
        float v52 = v528;
        uint64_t v92 = v526;
        goto LABEL_605;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v80 = v79;
        goto LABEL_78;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        float v83 = v540;
        if (v540)
        {
          id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v91 = *MEMORY[0x1E4F502C8];
          uint64_t v657 = *MEMORY[0x1E4F28568];
          float v82 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"enrollmentFailureReasons"];
          v658 = v82;
          uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v658 forKeys:&v657 count:1];
          float v88 = v90;
          uint64_t v89 = v91;
          goto LABEL_87;
        }
        goto LABEL_88;
      }
      id v81 = v79;
      id v80 = [NSNumber numberWithInt:BMGazeEnrollmentSampleEnrollmentFailureReasonFromString(v81)];

LABEL_78:
      [v549 addObject:v80];
    }
    id v74 = obj;
    uint64_t v76 = [obj countByEnumeratingWithState:&v551 objects:v661 count:16];
    if (v76) {
      continue;
    }
    break;
  }
LABEL_80:

  float v82 = [v6 objectForKeyedSubscript:@"binocQuality"];
  if (!v82 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v524 = 0;
    id v8 = v543;
    id v28 = v539;
LABEL_107:
    uint64_t v107 = [v6 objectForKeyedSubscript:@"fixationCount"];
    v520 = (void *)v107;
    if (v107 && (uint64_t v108 = (void *)v107, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v523 = v108;
        goto LABEL_110;
      }
      if (!v540)
      {
        id v523 = 0;
        float v18 = 0;
        float v49 = v532;
        float v52 = v528;
        v30 = v534;
        uint64_t v92 = v526;
        uint64_t v7 = v536;
        goto LABEL_602;
      }
      id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v124 = *MEMORY[0x1E4F502C8];
      uint64_t v653 = *MEMORY[0x1E4F28568];
      uint64_t v125 = v82;
      id v126 = [NSString alloc];
      uint64_t v393 = objc_opt_class();
      uint64_t v127 = v126;
      float v82 = v125;
      uint64_t v128 = (void *)[v127 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v393, @"fixationCount"];
      v654 = v128;
      uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v654 forKeys:&v653 count:1];
      uint64_t v130 = v123;
      id v8 = v543;
      v519 = (void *)v129;
      id v523 = 0;
      float v18 = 0;
      id *v540 = (id)objc_msgSend(v130, "initWithDomain:code:userInfo:", v124, 2);
      uint64_t v7 = v536;
    }
    else
    {
      id v523 = 0;
LABEL_110:
      uint64_t v109 = [v6 objectForKeyedSubscript:@"fixationCountLowBrightness"];
      v519 = (void *)v109;
      v529 = v6;
      if (!v109 || (uint64_t v110 = (void *)v109, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v518 = 0;
LABEL_113:
        uint64_t v111 = [v6 objectForKeyedSubscript:@"fixationCountMediumBrightness"];
        if (!v111 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v516 = v111;
          id v112 = 0;
LABEL_116:
          uint64_t v113 = [v529 objectForKeyedSubscript:@"fixationCountHighBrightness"];
          v517 = (void *)v113;
          if (!v113 || (uint64_t v114 = (void *)v113, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v514 = 0;
LABEL_119:
            uint64_t v115 = [v529 objectForKeyedSubscript:@"stimulusCount"];
            v515 = (void *)v115;
            if (v115 && (uint64_t v116 = (void *)v115, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v512 = v116;
                goto LABEL_122;
              }
              if (!v540)
              {
                float v152 = 0;
                float v18 = 0;
                float v49 = v532;
                float v52 = v528;
                uint64_t v92 = v526;
                goto LABEL_596;
              }
              id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v158 = *MEMORY[0x1E4F502C8];
              uint64_t v645 = *MEMORY[0x1E4F28568];
              v159 = v82;
              id v160 = [NSString alloc];
              uint64_t v397 = objc_opt_class();
              v161 = v160;
              float v82 = v159;
              id v513 = (id)[v161 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v397, @"stimulusCount"];
              id v646 = v513;
              uint64_t v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v646 forKeys:&v645 count:1];
              v163 = v157;
              int v164 = (void *)v162;
              float v152 = 0;
              float v18 = 0;
              id *v540 = (id)[v163 initWithDomain:v158 code:2 userInfo:v162];
              float v49 = v532;
              float v52 = v528;
            }
            else
            {
              id v512 = 0;
LABEL_122:
              uint64_t v117 = [v529 objectForKeyedSubscript:@"stimulusCountLowBrightness"];
              if (!v117 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v509 = v117;
                id v513 = 0;
LABEL_125:
                uint64_t v118 = [v529 objectForKeyedSubscript:@"stimulusCountMediumBrightness"];
                v511 = (void *)v118;
                if (!v118 || (uint64_t v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v510 = 0;
LABEL_128:
                  uint64_t v120 = [v529 objectForKeyedSubscript:@"stimulusCountHighBrightness"];
                  v508 = (void *)v120;
                  if (!v120 || (uint64_t v121 = (void *)v120, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v507 = 0;
                    goto LABEL_131;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v507 = v121;
LABEL_131:
                    uint64_t v122 = [v529 objectForKeyedSubscript:@"accessibilityMode"];
                    v506 = v122;
                    if (v122)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v122 = 0;
                        goto LABEL_180;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v156 = v122;
LABEL_179:

                        uint64_t v122 = v156;
                        goto LABEL_180;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v182 = v122;
                        id v156 = [NSNumber numberWithInt:BMGazeEnrollmentSampleAccessibilityModeFromString(v182)];

                        goto LABEL_179;
                      }
                      id v479 = v112;
                      if (v540)
                      {
                        id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v252 = *MEMORY[0x1E4F502C8];
                        uint64_t v637 = *MEMORY[0x1E4F28568];
                        id v253 = v82;
                        id v254 = [NSString alloc];
                        uint64_t v405 = objc_opt_class();
                        id v255 = v254;
                        float v82 = v253;
                        id v235 = (void *)[v255 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v405, @"accessibilityMode"];
                        v638 = v235;
                        v505 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v638 forKeys:&v637 count:1];
                        uint64_t v122 = 0;
                        v504 = 0;
                        id *v540 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v252, 2);
                        goto LABEL_379;
                      }
                      uint64_t v122 = 0;
                      float v18 = 0;
                      float v49 = v532;
                      float v52 = v528;
LABEL_373:
                      float v152 = v512;
                      int v164 = v509;
                      uint64_t v92 = v526;
LABEL_592:

                      id v28 = v539;
LABEL_593:

LABEL_594:
LABEL_595:

LABEL_596:
                      uint64_t v146 = v514;
LABEL_597:

                      goto LABEL_598;
                    }
LABEL_180:
                    uint64_t v183 = [v529 objectForKeyedSubscript:@"eyeboxStatus"];
                    v502 = v122;
                    v505 = (void *)v183;
                    if (v183)
                    {
                      v184 = (void *)v183;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v501 = v184;
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            id v479 = v112;
                            if (v540)
                            {
                              id v256 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v257 = *MEMORY[0x1E4F502C8];
                              uint64_t v635 = *MEMORY[0x1E4F28568];
                              v258 = v82;
                              id v259 = [NSString alloc];
                              uint64_t v406 = objc_opt_class();
                              id v260 = v259;
                              float v82 = v258;
                              id v503 = (id)[v260 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v406, @"eyeboxStatus"];
                              id v636 = v503;
                              id v233 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v636 forKeys:&v635 count:1];
                              id v235 = 0;
                              v504 = 0;
                              id *v540 = (id)[v256 initWithDomain:v257 code:2 userInfo:v233];
                              float v49 = v532;
                              float v52 = v528;
                              float v152 = v512;
                              int v164 = v509;
                              goto LABEL_590;
                            }
                            id v235 = 0;
                            v504 = 0;
LABEL_379:
                            float v49 = v532;
                            float v52 = v528;
                            id v112 = v479;
                            float v152 = v512;
                            int v164 = v509;
                            goto LABEL_591;
                          }
                          id v185 = v184;
                          id v501 = [NSNumber numberWithInt:BMGazeEnrollmentSampleEyeboxStatusFromString(v185)];
                        }
                        goto LABEL_188;
                      }
                    }
                    id v501 = 0;
LABEL_188:
                    v186 = [v529 objectForKeyedSubscript:@"centralStimulusSignedResidualYaw"];
                    if (v186 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v498 = v186;
                        id v503 = v186;
                        goto LABEL_191;
                      }
                      if (!v540)
                      {
                        id v503 = 0;
                        v504 = 0;
                        float v49 = v532;
                        float v52 = v528;
                        float v152 = v512;
                        int v164 = v509;
                        id v235 = v501;
                        id v233 = v186;
                        uint64_t v122 = v502;
                        goto LABEL_590;
                      }
                      id v229 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v230 = *MEMORY[0x1E4F502C8];
                      uint64_t v633 = *MEMORY[0x1E4F28568];
                      id v231 = v82;
                      id v232 = [NSString alloc];
                      id v233 = v186;
                      uint64_t v401 = objc_opt_class();
                      id v234 = v232;
                      float v82 = v231;
                      id v499 = (id)[v234 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v401, @"centralStimulusSignedResidualYaw"];
                      id v634 = v499;
                      v500 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v634 forKeys:&v633 count:1];
                      id v503 = 0;
                      v504 = 0;
                      id *v540 = (id)objc_msgSend(v229, "initWithDomain:code:userInfo:", v230, 2);
                      float v49 = v532;
                      float v52 = v528;
                      float v152 = v512;
                      int v164 = v509;
                      id v235 = v501;
                    }
                    else
                    {
                      v498 = v186;
                      id v503 = 0;
LABEL_191:
                      uint64_t v187 = [v529 objectForKeyedSubscript:@"brightness1topStimulusSignedResidualYaw"];
                      v500 = (void *)v187;
                      if (!v187 || (v188 = (void *)v187, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v499 = 0;
LABEL_194:
                        uint64_t v189 = [v529 objectForKeyedSubscript:@"brightness1topRightStimulusSignedResidualYaw"];
                        v497 = (void *)v189;
                        if (!v189 || (v190 = (void *)v189, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v496 = 0;
LABEL_197:
                          uint64_t v191 = [v529 objectForKeyedSubscript:@"brightness1bottomRightStimulusSignedResidualYaw"];
                          v495 = (void *)v191;
                          if (!v191 || (v192 = (void *)v191, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v494 = 0;
LABEL_200:
                            uint64_t v193 = [v529 objectForKeyedSubscript:@"brightness1bottomStimulusSignedResidualYaw"];
                            v493 = (void *)v193;
                            if (!v193 || (v194 = (void *)v193, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v492 = 0;
LABEL_203:
                              uint64_t v195 = [v529 objectForKeyedSubscript:@"brightness1bottomLeftStimulusSignedResidualYaw"];
                              v491 = (void *)v195;
                              if (!v195 || (v196 = (void *)v195, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v490 = 0;
LABEL_206:
                                uint64_t v197 = [v529 objectForKeyedSubscript:@"brightness1topLeftStimulusSignedResidualYaw"];
                                v489 = (void *)v197;
                                if (!v197
                                  || (v198 = (void *)v197, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v488 = 0;
LABEL_209:
                                  uint64_t v199 = [v529 objectForKeyedSubscript:@"brightness2topStimulusSignedResidualYaw"];
                                  v487 = (void *)v199;
                                  if (!v199
                                    || (v200 = (void *)v199, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v486 = 0;
LABEL_212:
                                    uint64_t v201 = [v529 objectForKeyedSubscript:@"brightness2topRightStimulusSignedResidualYaw"];
                                    v485 = (void *)v201;
                                    if (!v201
                                      || (v202 = (void *)v201, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v484 = 0;
LABEL_215:
                                      uint64_t v203 = [v529 objectForKeyedSubscript:@"brightness2bottomRightStimulusSignedResidualYaw"];
                                      v483 = (void *)v203;
                                      if (!v203
                                        || (v204 = (void *)v203, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v482 = 0;
LABEL_218:
                                        uint64_t v205 = [v529 objectForKeyedSubscript:@"brightness2bottomStimulusSignedResidualYaw"];
                                        v481 = (void *)v205;
                                        if (!v205
                                          || (v206 = (void *)v205, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v480 = 0;
LABEL_221:
                                          uint64_t v207 = [v529 objectForKeyedSubscript:@"brightness2bottomLeftStimulusSignedResidualYaw"];
                                          v477 = (void *)v207;
                                          if (!v207
                                            || (v208 = (void *)v207,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v476 = 0;
LABEL_224:
                                            uint64_t v209 = [v529 objectForKeyedSubscript:@"brightness2topLeftStimulusSignedResidualYaw"];
                                            v474 = (void *)v209;
                                            if (!v209
                                              || (id v210 = (void *)v209,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v475 = 0;
LABEL_227:
                                              uint64_t v211 = [v529 objectForKeyedSubscript:@"brightness3topStimulusSignedResidualYaw"];
                                              v472 = (void *)v211;
                                              if (!v211
                                                || (v212 = (void *)v211,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v473 = 0;
LABEL_230:
                                                uint64_t v213 = [v529 objectForKeyedSubscript:@"brightness3topRightStimulusSignedResidualYaw"];
                                                uint64_t v122 = v502;
                                                v471 = (void *)v213;
                                                if (v213
                                                  && (v214 = (void *)v213,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v470 = v214;
                                                    goto LABEL_233;
                                                  }
                                                  if (!v540)
                                                  {
                                                    id v470 = 0;
                                                    v504 = 0;
                                                    float v49 = v532;
                                                    float v52 = v528;
                                                    float v152 = v512;
                                                    int v164 = v509;
                                                    id v235 = v501;
                                                    id v233 = v498;
                                                    goto LABEL_576;
                                                  }
                                                  id v315 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v316 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v605 = *MEMORY[0x1E4F28568];
                                                  v317 = v82;
                                                  id v318 = [NSString alloc];
                                                  uint64_t v417 = objc_opt_class();
                                                  v319 = v318;
                                                  float v82 = v317;
                                                  id v468 = (id)[v319 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v417, @"brightness3topRightStimulusSignedResidualYaw"];
                                                  id v606 = v468;
                                                  v469 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v606 forKeys:&v605 count:1];
                                                  id v470 = 0;
                                                  v504 = 0;
                                                  id *v540 = (id)objc_msgSend(v315, "initWithDomain:code:userInfo:", v316, 2);
                                                }
                                                else
                                                {
                                                  id v470 = 0;
LABEL_233:
                                                  uint64_t v215 = [v529 objectForKeyedSubscript:@"brightness3bottomRightStimulusSignedResidualYaw"];
                                                  v469 = (void *)v215;
                                                  if (!v215
                                                    || (v216 = (void *)v215,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v468 = 0;
LABEL_236:
                                                    uint64_t v217 = [v529 objectForKeyedSubscript:@"brightness3bottomStimulusSignedResidualYaw"];
                                                    v467 = (void *)v217;
                                                    if (!v217
                                                      || (id v218 = (void *)v217,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v466 = 0;
LABEL_239:
                                                      uint64_t v219 = [v529 objectForKeyedSubscript:@"brightness3bottomLeftStimulusSignedResidualYaw"];
                                                      v465 = (void *)v219;
                                                      if (!v219
                                                        || (id v220 = (void *)v219,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v464 = 0;
LABEL_242:
                                                        uint64_t v221 = [v529 objectForKeyedSubscript:@"brightness3topLeftStimulusSignedResidualYaw"];
                                                        v461 = v82;
                                                        v463 = (void *)v221;
                                                        if (!v221
                                                          || (id v222 = (void *)v221,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v462 = 0;
LABEL_245:
                                                          uint64_t v223 = [v529 objectForKeyedSubscript:@"centralStimulusSignedResidualPitch"];
                                                          v460 = (void *)v223;
                                                          if (!v223
                                                            || (id v224 = (void *)v223,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v459 = 0;
LABEL_248:
                                                            v458 = [v529 objectForKeyedSubscript:@"brightness1topStimulusSignedResidualPitch"];
                                                            if (!v458
                                                              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v457 = 0;
LABEL_251:
                                                              v456 = [v529 objectForKeyedSubscript:@"brightness1topRightStimulusSignedResidualPitch"];
                                                              if (!v456
                                                                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v455 = 0;
LABEL_254:
                                                                v454 = [v529 objectForKeyedSubscript:@"brightness1bottomRightStimulusSignedResidualPitch"];
                                                                if (!v454
                                                                  || (objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v453 = 0;
LABEL_257:
                                                                  v452 = [v529 objectForKeyedSubscript:@"brightness1bottomStimulusSignedResidualPitch"];
                                                                  if (!v452
                                                                    || (objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v451 = 0;
LABEL_260:
                                                                    [v529 objectForKeyedSubscript:@"brightness1bottomLeftStimulusSignedResidualPitch"];
                                                                    v450 = id v478 = v112;
                                                                    if (!v450
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v449 = 0;
LABEL_263:
                                                                      v448 = [v529 objectForKeyedSubscript:@"brightness1topLeftStimulusSignedResidualPitch"];
                                                                      if (!v448
                                                                        || (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v447 = 0;
LABEL_266:
                                                                        v446 = [v529 objectForKeyedSubscript:@"brightness2topStimulusSignedResidualPitch"];
                                                                        if (!v446
                                                                          || (objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v445 = 0;
LABEL_269:
                                                                          v444 = [v529 objectForKeyedSubscript:@"brightness2topRightStimulusSignedResidualPitch"];
                                                                          if (!v444
                                                                            || (objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v443 = 0;
LABEL_272:
                                                                            v442 = [v529 objectForKeyedSubscript:@"brightness2bottomRightStimulusSignedResidualPitch"];
                                                                            if (!v442
                                                                              || (objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v441 = 0;
LABEL_275:
                                                                              v440 = [v529 objectForKeyedSubscript:@"brightness2bottomStimulusSignedResidualPitch"];
                                                                              if (!v440
                                                                                || (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v439 = 0;
LABEL_278:
                                                                                v438 = [v529 objectForKeyedSubscript:@"brightness2bottomLeftStimulusSignedResidualPitch"];
                                                                                if (!v438
                                                                                  || (objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  id v435 = 0;
LABEL_281:
                                                                                  v437 = [v529 objectForKeyedSubscript:@"brightness2topLeftStimulusSignedResidualPitch"];
                                                                                  if (v437
                                                                                    && (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v434 = v437;
                                                                                      goto LABEL_284;
                                                                                    }
                                                                                    if (v540)
                                                                                    {
                                                                                      id v364 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v365 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v571 = *MEMORY[0x1E4F28568];
                                                                                      v366 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2topLeftStimulusSignedResidualPitch"];
                                                                                      v572 = v366;
                                                                                      v436 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v572 forKeys:&v571 count:1];
                                                                                      id v434 = 0;
                                                                                      v504 = 0;
                                                                                      id *v540 = (id)objc_msgSend(v364, "initWithDomain:code:userInfo:", v365, 2);
                                                                                      goto LABEL_557;
                                                                                    }
                                                                                    v362 = 0;
                                                                                    v504 = 0;
                                                                                    uint64_t v122 = v502;
                                                                                    id v235 = v501;
                                                                                    id v233 = v498;
                                                                                    v363 = v437;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    id v434 = 0;
LABEL_284:
                                                                                    v436 = [v529 objectForKeyedSubscript:@"brightness3topStimulusSignedResidualPitch"];
                                                                                    if (v436
                                                                                      && (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) == 0))
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v431 = v436;
                                                                                        goto LABEL_287;
                                                                                      }
                                                                                      if (v540)
                                                                                      {
                                                                                        id v367 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v368 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v569 = *MEMORY[0x1E4F28568];
                                                                                        id v430 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3topStimulusSignedResidualPitch"];
                                                                                        id v570 = v430;
                                                                                        v432 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v570 forKeys:&v569 count:1];
                                                                                        id v431 = 0;
                                                                                        v504 = 0;
                                                                                        id *v540 = (id)objc_msgSend(v367, "initWithDomain:code:userInfo:", v368, 2);
                                                                                        goto LABEL_556;
                                                                                      }
                                                                                      v366 = 0;
                                                                                      v504 = 0;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      id v431 = 0;
LABEL_287:
                                                                                      v432 = [v529 objectForKeyedSubscript:@"brightness3topRightStimulusSignedResidualPitch"];
                                                                                      if (v432
                                                                                        && (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v430 = v432;
                                                                                          goto LABEL_290;
                                                                                        }
                                                                                        if (v540)
                                                                                        {
                                                                                          id v369 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v370 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v567 = *MEMORY[0x1E4F28568];
                                                                                          id v428 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3topRightStimulusSignedResidualPitch"];
                                                                                          id v568 = v428;
                                                                                          v433 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v568 forKeys:&v567 count:1];
                                                                                          id v430 = 0;
                                                                                          v504 = 0;
                                                                                          id *v540 = (id)objc_msgSend(v369, "initWithDomain:code:userInfo:", v370, 2);
                                                                                          goto LABEL_555;
                                                                                        }
                                                                                        id v430 = 0;
                                                                                        v504 = 0;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v430 = 0;
LABEL_290:
                                                                                        v433 = [v529 objectForKeyedSubscript:@"brightness3bottomRightStimulusSignedResidualPitch"];
                                                                                        if (v433
                                                                                          && (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v428 = v433;
                                                                                            goto LABEL_293;
                                                                                          }
                                                                                          if (v540)
                                                                                          {
                                                                                            id v371 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v372 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v565 = *MEMORY[0x1E4F28568];
                                                                                            id v426 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3bottomRightStimulusSignedResidualPitch"];
                                                                                            id v566 = v426;
                                                                                            v429 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v566 forKeys:&v565 count:1];
                                                                                            id v428 = 0;
                                                                                            v504 = 0;
                                                                                            id *v540 = (id)objc_msgSend(v371, "initWithDomain:code:userInfo:", v372, 2);
                                                                                            goto LABEL_554;
                                                                                          }
                                                                                          id v428 = 0;
                                                                                          v504 = 0;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          id v428 = 0;
LABEL_293:
                                                                                          v429 = [v529 objectForKeyedSubscript:@"brightness3bottomStimulusSignedResidualPitch"];
                                                                                          if (v429
                                                                                            && (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v426 = v429;
                                                                                              goto LABEL_296;
                                                                                            }
                                                                                            if (v540)
                                                                                            {
                                                                                              id v373 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v374 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v563 = *MEMORY[0x1E4F28568];
                                                                                              id v424 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3bottomStimulusSignedResidualPitch"];
                                                                                              id v564 = v424;
                                                                                              v427 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v564 forKeys:&v563 count:1];
                                                                                              id v426 = 0;
                                                                                              v504 = 0;
                                                                                              id *v540 = (id)objc_msgSend(v373, "initWithDomain:code:userInfo:", v374, 2);
                                                                                              goto LABEL_553;
                                                                                            }
                                                                                            id v426 = 0;
                                                                                            v504 = 0;
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            id v426 = 0;
LABEL_296:
                                                                                            v427 = [v529 objectForKeyedSubscript:@"brightness3bottomLeftStimulusSignedResidualPitch"];
                                                                                            if (v427
                                                                                              && (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v424 = v427;
                                                                                                goto LABEL_299;
                                                                                              }
                                                                                              if (v540)
                                                                                              {
                                                                                                id v375 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v376 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v561 = *MEMORY[0x1E4F28568];
                                                                                                id v423 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3bottomLeftStimulusSignedResidualPitch"];
                                                                                                id v562 = v423;
                                                                                                v425 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v562 forKeys:&v561 count:1];
                                                                                                id v424 = 0;
                                                                                                v504 = 0;
                                                                                                id *v540 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v376, 2);
                                                                                                goto LABEL_552;
                                                                                              }
                                                                                              id v424 = 0;
                                                                                              v504 = 0;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              id v424 = 0;
LABEL_299:
                                                                                              v425 = [v529 objectForKeyedSubscript:@"brightness3topLeftStimulusSignedResidualPitch"];
                                                                                              if (v425
                                                                                                && (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v423 = v425;
                                                                                                  goto LABEL_302;
                                                                                                }
                                                                                                if (v540)
                                                                                                {
                                                                                                  id v377 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                  uint64_t v378 = *MEMORY[0x1E4F502C8];
                                                                                                  uint64_t v559 = *MEMORY[0x1E4F28568];
                                                                                                  id v226 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3topLeftStimulusSignedResidualPitch"];
                                                                                                  id v560 = v226;
                                                                                                  id v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v560 forKeys:&v559 count:1];
                                                                                                  id v423 = 0;
                                                                                                  v504 = 0;
                                                                                                  id *v540 = (id)objc_msgSend(v377, "initWithDomain:code:userInfo:", v378, 2);
                                                                                                  goto LABEL_551;
                                                                                                }
                                                                                                id v423 = 0;
                                                                                                v504 = 0;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                id v423 = 0;
LABEL_302:
                                                                                                id v225 = [v529 objectForKeyedSubscript:@"rxuuid"];
                                                                                                if (v225 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v226 = v225;
                                                                                                    goto LABEL_305;
                                                                                                  }
                                                                                                  if (v540)
                                                                                                  {
                                                                                                    id v379 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v380 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v557 = *MEMORY[0x1E4F28568];
                                                                                                    id v228 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"rxuuid"];
                                                                                                    id v558 = v228;
                                                                                                    id v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v558 forKeys:&v557 count:1];
                                                                                                    id v226 = 0;
                                                                                                    v504 = 0;
                                                                                                    id *v540 = (id)objc_msgSend(v379, "initWithDomain:code:userInfo:", v380, 2);
                                                                                                    goto LABEL_550;
                                                                                                  }
                                                                                                  id v226 = 0;
                                                                                                  v504 = 0;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  id v226 = 0;
LABEL_305:
                                                                                                  id v227 = [v529 objectForKeyedSubscript:@"enrollmentReason"];
                                                                                                  if (!v227 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    id v228 = 0;
                                                                                                    goto LABEL_549;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v228 = v227;
LABEL_548:

LABEL_549:
                                                                                                    unsigned int v541 = [v537 intValue];
                                                                                                    unsigned int v382 = [v530 intValue];
                                                                                                    unsigned int v383 = [v526 intValue];
                                                                                                    int v384 = [v524 intValue];
                                                                                                    unsigned int v385 = [v502 intValue];
                                                                                                    unsigned int v386 = [v501 intValue];
                                                                                                    LODWORD(v422) = [v228 intValue];
                                                                                                    LODWORD(v421) = v384;
                                                                                                    v546 = -[BMGazeEnrollmentSample initWithUserProfileId:eyeSide:isOffline:enrollmentResidual75thPercentile:enrollmentResidual95thPercentile:enrollmentResidualMedian:dominantEye:monocularQuality:enrollmentFailureReasons:binocQuality:fixationCount:fixationCountLowBrightness:fixationCountMediumBrightness:fixationCountHighBrightness:stimulusCount:stimulusCountLowBrightness:stimulusCountMediumBrightness:stimulusCountHighBrightness:accessibilityMode:eyeboxStatus:centralStimulusSignedResidualYaw:brightness1topStimulusSignedResidualYaw:brightness1topRightStimulusSignedResidualYaw:brightness1bottomRightStimulusSignedResidualYaw:brightness1bottomStimulusSignedResidualYaw:brightness1bottomLeftStimulusSignedResidualYaw:brightness1topLeftStimulusSignedResidualYaw:brightness2topStimulusSignedResidualYaw:brightness2topRightStimulusSignedResidualYaw:brightness2bottomRightStimulusSignedResidualYaw:brightness2bottomStimulusSignedResidualYaw:brightness2bottomLeftStimulusSignedResidualYaw:brightness2topLeftStimulusSignedResidualYaw:brightness3topStimulusSignedResidualYaw:brightness3topRightStimulusSignedResidualYaw:brightness3bottomRightStimulusSignedResidualYaw:brightness3bottomStimulusSignedResidualYaw:brightness3bottomLeftStimulusSignedResidualYaw:brightness3topLeftStimulusSignedResidualYaw:centralStimulusSignedResidualPitch:brightness1topStimulusSignedResidualPitch:brightness1topRightStimulusSignedResidualPitch:brightness1bottomRightStimulusSignedResidualPitch:brightness1bottomStimulusSignedResidualPitch:brightness1bottomLeftStimulusSignedResidualPitch:brightness1topLeftStimulusSignedResidualPitch:brightness2topStimulusSignedResidualPitch:brightness2topRightStimulusSignedResidualPitch:brightness2bottomRightStimulusSignedResidualPitch:brightness2bottomStimulusSignedResidualPitch:brightness2bottomLeftStimulusSignedResidualPitch:brightness2topLeftStimulusSignedResidualPitch:brightness3topStimulusSignedResidualPitch:brightness3topRightStimulusSignedResidualPitch:brightness3bottomRightStimulusSignedResidualPitch:brightness3bottomStimulusSignedResidualPitch:brightness3bottomLeftStimulusSignedResidualPitch:brightness3topLeftStimulusSignedResidualPitch:rxuuid:enrollmentReason:](v546, "initWithUserProfileId:eyeSide:isOffline:enrollmentResidual75thPercentile:enrollmentResidual95thPercentile:enrollmentResidualMedian:dominantEye:monocularQuality:enrollmentFailureReasons:binocQuality:fixationCount:fixationCountLowBrightness:fixationCountMediumBrightness:fixationCountHighBrightness:stimulusCount:stimulusCountLowBrightness:stimulusCountMediumBrightness:stimulusCountHighBrightness:accessibilityMode:eyeboxStatus:centralStimulusSignedResidualYaw:brightness1topStimulusSignedResidualYaw:brightness1topRightStimulusSignedResidualYaw:brightness1bottomRightStimulusSignedResidualYaw:brightness1bottomStimulusSignedResidualYaw:brightness1bottomLeftStimulusSignedResidualYaw:brightness1topLeftStimulusSignedResidualYaw:brightness2topStimulusSignedResidualYaw:brightness2topRightStimulusSignedResidualYaw:brightness2bottomRightStimulusSignedResidualYaw:brightness2bottomStimulusSignedResidualYaw:brightness2bottomLeftStimulusSignedResidualYaw:brightness2topLeftStimulusSignedResidualYaw:brightness3topStimulusSignedResidualYaw:brightness3topRightStimulusSignedResidualYaw:brightness3bottomRightStimulusSignedResidualYaw:brightness3bottomStimulusSignedResidualYaw:brightness3bottomLeftStimulusSignedResidualYaw:brightness3topLeftStimulusSignedResidualYaw:centralStimulusSignedResidualPitch:brightness1topStimulusSignedResidualPitch:brightness1topRightStimulusSignedResidualPitch:brightness1bottomRightStimulusSignedResidualPitch:brightness1bottomStimulusSignedResidualPitch:brightness1bottomLeftStimulusSignedResidualPitch:brightness1topLeftStimulusSignedResidualPitch:brightness2topStimulusSignedResidualPitch:brightness2topRightStimulusSignedResidualPitch:brightness2bottomRightStimulusSignedResidualPitch:brightness2bottomStimulusSignedResidualPitch:brightness2bottomLeftStimulusSignedResidualPitch:brightness2topLeftStimulusSignedResidualPitch:brightness3topStimulusSignedResidualPitch:brightness3topRightStimulusSignedResidualPitch:brightness3bottomRightStimulusSignedResidualPitch:brightness3bottomStimulusSignedResidualPitch:brightness3bottomLeftStimulusSignedResidualPitch:brightness3topLeftStimulusSignedResidualPitch:rxuuid:enrollmentReason:", v543, v541, v534, v539, v532, v528, __PAIR64__(v383, v382), v549, v421, v523, v518, v478, v514, v512, v513, v510, v507, __PAIR64__(v386, v385), v503, v499, v496, v494, v492, v490, v488, v486, v484, v482, v480, v476, v475, v473, v470, v468, v466, v464, v462, v459, v457, v455, v453, v451, v449, v447, v445, v443, v441, v439, v435, v434, v431, v430, v428, v426, v424, v423, v226, v422);
                                                                                                    v504 = v546;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                    {
                                                                                                      id v381 = v227;
                                                                                                      id v228 = [NSNumber numberWithInt:BMGazeEnrollmentSampleEnrollmentReasonFromString(v381)];

                                                                                                      goto LABEL_548;
                                                                                                    }
                                                                                                    if (v540)
                                                                                                    {
                                                                                                      id v388 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                      uint64_t v389 = *MEMORY[0x1E4F502C8];
                                                                                                      uint64_t v555 = *MEMORY[0x1E4F28568];
                                                                                                      v390 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"enrollmentReason"];
                                                                                                      v556 = v390;
                                                                                                      v391 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v556 forKeys:&v555 count:1];
                                                                                                      id *v540 = (id)[v388 initWithDomain:v389 code:2 userInfo:v391];
                                                                                                    }
                                                                                                    id v228 = 0;
                                                                                                    v504 = 0;
                                                                                                  }
LABEL_550:
                                                                                                }
LABEL_551:
                                                                                              }
LABEL_552:
                                                                                            }
LABEL_553:
                                                                                          }
LABEL_554:
                                                                                        }
LABEL_555:
                                                                                      }
LABEL_556:

                                                                                      v366 = v431;
                                                                                    }
LABEL_557:

                                                                                    uint64_t v122 = v502;
                                                                                    id v235 = v501;
                                                                                    id v233 = v498;
                                                                                    v363 = v437;
                                                                                    v362 = v434;
                                                                                  }
                                                                                  v359 = v435;
LABEL_559:

                                                                                  float v49 = v532;
                                                                                  float v52 = v528;
                                                                                  float v82 = v461;
                                                                                  id v112 = v478;
                                                                                  float v152 = v512;
                                                                                  int v164 = v509;
LABEL_560:

LABEL_561:
LABEL_562:

LABEL_563:
LABEL_564:

LABEL_565:
LABEL_566:

LABEL_567:
LABEL_568:

LABEL_569:
LABEL_570:

LABEL_571:
LABEL_572:

LABEL_573:
LABEL_574:

LABEL_575:
LABEL_576:

                                                                                  v309 = v472;
LABEL_577:

                                                                                  v302 = v474;
LABEL_578:

LABEL_579:
LABEL_580:

LABEL_581:
LABEL_582:

LABEL_583:
LABEL_584:

LABEL_585:
LABEL_586:

LABEL_587:
LABEL_588:

LABEL_589:
LABEL_590:

LABEL_591:
                                                                                  uint64_t v92 = v526;

                                                                                  float v18 = v504;
                                                                                  goto LABEL_592;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v435 = v438;
                                                                                  goto LABEL_281;
                                                                                }
                                                                                if (v540)
                                                                                {
                                                                                  id v360 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v361 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v573 = *MEMORY[0x1E4F28568];
                                                                                  v362 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2bottomLeftStimulusSignedResidualPitch"];
                                                                                  v574 = v362;
                                                                                  v363 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v574 forKeys:&v573 count:1];
                                                                                  v359 = 0;
                                                                                  v504 = 0;
                                                                                  id *v540 = (id)[v360 initWithDomain:v361 code:2 userInfo:v363];
                                                                                  uint64_t v122 = v502;
                                                                                  id v235 = v501;
                                                                                  id v233 = v498;
                                                                                  goto LABEL_559;
                                                                                }
                                                                                v359 = 0;
                                                                                v504 = 0;
LABEL_536:
                                                                                float v49 = v532;
                                                                                float v52 = v528;
                                                                                float v152 = v512;
                                                                                int v164 = v509;
                                                                                uint64_t v122 = v502;
                                                                                id v235 = v501;
                                                                                id v233 = v498;
                                                                                goto LABEL_560;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v439 = v440;
                                                                                goto LABEL_278;
                                                                              }
                                                                              if (v540)
                                                                              {
                                                                                id v357 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v358 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v575 = *MEMORY[0x1E4F28568];
                                                                                v359 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2bottomStimulusSignedResidualPitch"];
                                                                                v576 = v359;
                                                                                v438 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v576 forKeys:&v575 count:1];
                                                                                id v439 = 0;
                                                                                v504 = 0;
                                                                                id *v540 = (id)objc_msgSend(v357, "initWithDomain:code:userInfo:", v358, 2);
                                                                                goto LABEL_536;
                                                                              }
                                                                              id v439 = 0;
                                                                              v504 = 0;
LABEL_530:
                                                                              float v49 = v532;
                                                                              float v52 = v528;
                                                                              float v152 = v512;
                                                                              int v164 = v509;
                                                                              uint64_t v122 = v502;
                                                                              id v235 = v501;
                                                                              id v233 = v498;
                                                                              goto LABEL_561;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v441 = v442;
                                                                              goto LABEL_275;
                                                                            }
                                                                            if (v540)
                                                                            {
                                                                              id v355 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v356 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v577 = *MEMORY[0x1E4F28568];
                                                                              id v439 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2bottomRightStimulusSignedResidualPitch"];
                                                                              id v578 = v439;
                                                                              v440 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v578 forKeys:&v577 count:1];
                                                                              id v441 = 0;
                                                                              v504 = 0;
                                                                              id *v540 = (id)objc_msgSend(v355, "initWithDomain:code:userInfo:", v356, 2);
                                                                              goto LABEL_530;
                                                                            }
                                                                            id v441 = 0;
                                                                            v504 = 0;
LABEL_524:
                                                                            float v49 = v532;
                                                                            float v52 = v528;
                                                                            float v152 = v512;
                                                                            int v164 = v509;
                                                                            uint64_t v122 = v502;
                                                                            id v235 = v501;
                                                                            id v233 = v498;
                                                                            goto LABEL_562;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v443 = v444;
                                                                            goto LABEL_272;
                                                                          }
                                                                          if (v540)
                                                                          {
                                                                            id v353 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v354 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v579 = *MEMORY[0x1E4F28568];
                                                                            id v441 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2topRightStimulusSignedResidualPitch"];
                                                                            id v580 = v441;
                                                                            v442 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v580 forKeys:&v579 count:1];
                                                                            id v443 = 0;
                                                                            v504 = 0;
                                                                            id *v540 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v354, 2);
                                                                            goto LABEL_524;
                                                                          }
                                                                          id v443 = 0;
                                                                          v504 = 0;
                                                                          float v49 = v532;
                                                                          float v52 = v528;
                                                                          float v152 = v512;
                                                                          int v164 = v509;
                                                                          uint64_t v122 = v502;
LABEL_518:
                                                                          id v235 = v501;
                                                                          id v233 = v498;
                                                                          goto LABEL_563;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v445 = v446;
                                                                          goto LABEL_269;
                                                                        }
                                                                        if (v540)
                                                                        {
                                                                          id v351 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v352 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v581 = *MEMORY[0x1E4F28568];
                                                                          id v443 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness2topStimulusSignedResidualPitch"];
                                                                          id v582 = v443;
                                                                          v444 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v582 forKeys:&v581 count:1];
                                                                          id v445 = 0;
                                                                          v504 = 0;
                                                                          id *v540 = (id)objc_msgSend(v351, "initWithDomain:code:userInfo:", v352, 2);
                                                                          float v49 = v532;
                                                                          float v52 = v528;
                                                                          float v152 = v512;
                                                                          int v164 = v509;
                                                                          goto LABEL_518;
                                                                        }
                                                                        id v445 = 0;
                                                                        v504 = 0;
LABEL_512:
                                                                        float v49 = v532;
                                                                        float v52 = v528;
                                                                        float v152 = v512;
                                                                        int v164 = v509;
                                                                        id v235 = v501;
                                                                        id v233 = v498;
                                                                        goto LABEL_564;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v447 = v448;
                                                                        goto LABEL_266;
                                                                      }
                                                                      if (v540)
                                                                      {
                                                                        id v349 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v350 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v583 = *MEMORY[0x1E4F28568];
                                                                        id v445 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1topLeftStimulusSignedResidualPitch"];
                                                                        id v584 = v445;
                                                                        v446 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v584 forKeys:&v583 count:1];
                                                                        id v447 = 0;
                                                                        v504 = 0;
                                                                        id *v540 = (id)objc_msgSend(v349, "initWithDomain:code:userInfo:", v350, 2);
                                                                        goto LABEL_512;
                                                                      }
                                                                      id v447 = 0;
                                                                      v504 = 0;
LABEL_506:
                                                                      float v49 = v532;
                                                                      float v52 = v528;
                                                                      float v152 = v512;
                                                                      int v164 = v509;
                                                                      id v235 = v501;
                                                                      id v233 = v498;
                                                                      goto LABEL_565;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v449 = v450;
                                                                      goto LABEL_263;
                                                                    }
                                                                    if (v540)
                                                                    {
                                                                      id v347 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v348 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v585 = *MEMORY[0x1E4F28568];
                                                                      id v447 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1bottomLeftStimulusSignedResidualPitch"];
                                                                      id v586 = v447;
                                                                      v448 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v586 forKeys:&v585 count:1];
                                                                      id v449 = 0;
                                                                      v504 = 0;
                                                                      id *v540 = (id)objc_msgSend(v347, "initWithDomain:code:userInfo:", v348, 2);
                                                                      goto LABEL_506;
                                                                    }
                                                                    id v449 = 0;
                                                                    v504 = 0;
                                                                    float v49 = v532;
                                                                    float v52 = v528;
LABEL_500:
                                                                    float v152 = v512;
                                                                    int v164 = v509;
                                                                    id v235 = v501;
                                                                    id v233 = v498;
                                                                    goto LABEL_566;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v451 = v452;
                                                                    goto LABEL_260;
                                                                  }
                                                                  if (v540)
                                                                  {
                                                                    id v345 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v346 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v587 = *MEMORY[0x1E4F28568];
                                                                    id v449 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1bottomStimulusSignedResidualPitch"];
                                                                    id v588 = v449;
                                                                    v450 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v588 forKeys:&v587 count:1];
                                                                    id v451 = 0;
                                                                    v504 = 0;
                                                                    id *v540 = (id)objc_msgSend(v345, "initWithDomain:code:userInfo:", v346, 2);
                                                                    float v49 = v532;
                                                                    float v52 = v528;
                                                                    goto LABEL_500;
                                                                  }
                                                                  id v451 = 0;
                                                                  v504 = 0;
LABEL_494:
                                                                  float v49 = v532;
                                                                  float v52 = v528;
                                                                  float v152 = v512;
                                                                  int v164 = v509;
                                                                  id v235 = v501;
                                                                  id v233 = v498;
                                                                  goto LABEL_567;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v453 = v454;
                                                                  goto LABEL_257;
                                                                }
                                                                if (v540)
                                                                {
                                                                  id v343 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v344 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v589 = *MEMORY[0x1E4F28568];
                                                                  id v451 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1bottomRightStimulusSignedResidualPitch"];
                                                                  id v590 = v451;
                                                                  v452 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v590 forKeys:&v589 count:1];
                                                                  id v453 = 0;
                                                                  v504 = 0;
                                                                  id *v540 = (id)objc_msgSend(v343, "initWithDomain:code:userInfo:", v344, 2);
                                                                  goto LABEL_494;
                                                                }
                                                                id v453 = 0;
                                                                v504 = 0;
LABEL_488:
                                                                float v49 = v532;
                                                                float v52 = v528;
                                                                float v152 = v512;
                                                                int v164 = v509;
                                                                id v235 = v501;
                                                                id v233 = v498;
                                                                goto LABEL_568;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v455 = v456;
                                                                goto LABEL_254;
                                                              }
                                                              if (v540)
                                                              {
                                                                id v341 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v342 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v591 = *MEMORY[0x1E4F28568];
                                                                id v453 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1topRightStimulusSignedResidualPitch"];
                                                                id v592 = v453;
                                                                v454 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v592 forKeys:&v591 count:1];
                                                                id v455 = 0;
                                                                v504 = 0;
                                                                id *v540 = (id)objc_msgSend(v341, "initWithDomain:code:userInfo:", v342, 2);
                                                                goto LABEL_488;
                                                              }
                                                              id v455 = 0;
                                                              v504 = 0;
LABEL_482:
                                                              float v49 = v532;
                                                              float v52 = v528;
                                                              float v152 = v512;
                                                              int v164 = v509;
                                                              id v235 = v501;
                                                              id v233 = v498;
                                                              goto LABEL_569;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v457 = v458;
                                                              goto LABEL_251;
                                                            }
                                                            if (v540)
                                                            {
                                                              id v339 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v340 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v593 = *MEMORY[0x1E4F28568];
                                                              id v455 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness1topStimulusSignedResidualPitch"];
                                                              id v594 = v455;
                                                              v456 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v594 forKeys:&v593 count:1];
                                                              id v457 = 0;
                                                              v504 = 0;
                                                              id *v540 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v340, 2);
                                                              goto LABEL_482;
                                                            }
                                                            id v457 = 0;
                                                            v504 = 0;
LABEL_476:
                                                            float v49 = v532;
                                                            float v52 = v528;
                                                            float v152 = v512;
                                                            int v164 = v509;
                                                            id v235 = v501;
                                                            id v233 = v498;
                                                            goto LABEL_570;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v459 = v224;
                                                            goto LABEL_248;
                                                          }
                                                          if (v540)
                                                          {
                                                            id v337 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v338 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v595 = *MEMORY[0x1E4F28568];
                                                            id v457 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"centralStimulusSignedResidualPitch"];
                                                            id v596 = v457;
                                                            v458 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v596 forKeys:&v595 count:1];
                                                            id v459 = 0;
                                                            v504 = 0;
                                                            id *v540 = (id)objc_msgSend(v337, "initWithDomain:code:userInfo:", v338, 2);
                                                            goto LABEL_476;
                                                          }
                                                          id v459 = 0;
                                                          v504 = 0;
LABEL_470:
                                                          float v49 = v532;
                                                          float v52 = v528;
                                                          float v152 = v512;
                                                          int v164 = v509;
                                                          id v235 = v501;
                                                          id v233 = v498;
                                                          goto LABEL_571;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v462 = v222;
                                                          goto LABEL_245;
                                                        }
                                                        if (v540)
                                                        {
                                                          id v335 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v336 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v597 = *MEMORY[0x1E4F28568];
                                                          id v459 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightness3topLeftStimulusSignedResidualYaw"];
                                                          id v598 = v459;
                                                          v460 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v598 forKeys:&v597 count:1];
                                                          id v462 = 0;
                                                          v504 = 0;
                                                          id *v540 = (id)objc_msgSend(v335, "initWithDomain:code:userInfo:", v336, 2);
                                                          goto LABEL_470;
                                                        }
                                                        id v462 = 0;
                                                        v504 = 0;
                                                        float v49 = v532;
                                                        float v52 = v528;
LABEL_464:
                                                        float v152 = v512;
                                                        int v164 = v509;
                                                        id v235 = v501;
                                                        id v233 = v498;
                                                        goto LABEL_572;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v464 = v220;
                                                        goto LABEL_242;
                                                      }
                                                      if (v540)
                                                      {
                                                        id v330 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v331 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v599 = *MEMORY[0x1E4F28568];
                                                        v332 = v82;
                                                        id v333 = [NSString alloc];
                                                        uint64_t v420 = objc_opt_class();
                                                        v334 = v333;
                                                        float v82 = v332;
                                                        id v462 = (id)[v334 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v420, @"brightness3bottomLeftStimulusSignedResidualYaw"];
                                                        id v600 = v462;
                                                        v463 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v600 forKeys:&v599 count:1];
                                                        id v464 = 0;
                                                        v504 = 0;
                                                        id *v540 = (id)objc_msgSend(v330, "initWithDomain:code:userInfo:", v331, 2);
                                                        float v49 = v532;
                                                        float v52 = v528;
                                                        goto LABEL_464;
                                                      }
                                                      id v464 = 0;
                                                      v504 = 0;
LABEL_458:
                                                      float v49 = v532;
                                                      float v52 = v528;
                                                      float v152 = v512;
                                                      int v164 = v509;
                                                      id v235 = v501;
                                                      id v233 = v498;
                                                      goto LABEL_573;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v466 = v218;
                                                      goto LABEL_239;
                                                    }
                                                    if (v540)
                                                    {
                                                      id v325 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v326 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v601 = *MEMORY[0x1E4F28568];
                                                      v327 = v82;
                                                      id v328 = [NSString alloc];
                                                      uint64_t v419 = objc_opt_class();
                                                      v329 = v328;
                                                      float v82 = v327;
                                                      id v464 = (id)[v329 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v419, @"brightness3bottomStimulusSignedResidualYaw"];
                                                      id v602 = v464;
                                                      v465 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v602 forKeys:&v601 count:1];
                                                      id v466 = 0;
                                                      v504 = 0;
                                                      id *v540 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v326, 2);
                                                      goto LABEL_458;
                                                    }
                                                    id v466 = 0;
                                                    v504 = 0;
LABEL_452:
                                                    float v49 = v532;
                                                    float v52 = v528;
                                                    float v152 = v512;
                                                    int v164 = v509;
                                                    id v235 = v501;
                                                    id v233 = v498;
                                                    goto LABEL_574;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v468 = v216;
                                                    goto LABEL_236;
                                                  }
                                                  if (v540)
                                                  {
                                                    id v320 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v321 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v603 = *MEMORY[0x1E4F28568];
                                                    v322 = v82;
                                                    id v323 = [NSString alloc];
                                                    uint64_t v418 = objc_opt_class();
                                                    v324 = v323;
                                                    float v82 = v322;
                                                    id v466 = (id)[v324 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v418, @"brightness3bottomRightStimulusSignedResidualYaw"];
                                                    id v604 = v466;
                                                    v467 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v604 forKeys:&v603 count:1];
                                                    id v468 = 0;
                                                    v504 = 0;
                                                    id *v540 = (id)objc_msgSend(v320, "initWithDomain:code:userInfo:", v321, 2);
                                                    goto LABEL_452;
                                                  }
                                                  id v468 = 0;
                                                  v504 = 0;
                                                }
                                                float v49 = v532;
                                                float v52 = v528;
                                                float v152 = v512;
                                                int v164 = v509;
                                                id v235 = v501;
                                                id v233 = v498;
                                                goto LABEL_575;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v473 = v212;
                                                goto LABEL_230;
                                              }
                                              if (v540)
                                              {
                                                id v310 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v311 = *MEMORY[0x1E4F502C8];
                                                uint64_t v607 = *MEMORY[0x1E4F28568];
                                                v312 = v82;
                                                id v313 = [NSString alloc];
                                                uint64_t v416 = objc_opt_class();
                                                v314 = v313;
                                                float v82 = v312;
                                                id v470 = (id)[v314 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v416, @"brightness3topStimulusSignedResidualYaw"];
                                                id v608 = v470;
                                                v471 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v608 forKeys:&v607 count:1];
                                                id v473 = 0;
                                                v504 = 0;
                                                id *v540 = (id)objc_msgSend(v310, "initWithDomain:code:userInfo:", v311, 2);
                                                float v49 = v532;
                                                float v52 = v528;
                                                float v152 = v512;
                                                int v164 = v509;
                                                id v235 = v501;
                                                id v233 = v498;
                                                uint64_t v122 = v502;
                                                goto LABEL_576;
                                              }
                                              id v473 = 0;
                                              v504 = 0;
                                              float v49 = v532;
                                              float v52 = v528;
                                              float v152 = v512;
                                              int v164 = v509;
                                              id v235 = v501;
                                              id v233 = v498;
                                              v309 = v472;
LABEL_435:
                                              uint64_t v122 = v502;
                                              goto LABEL_577;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v475 = v210;
                                              goto LABEL_227;
                                            }
                                            if (v540)
                                            {
                                              id v303 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v304 = *MEMORY[0x1E4F502C8];
                                              uint64_t v609 = *MEMORY[0x1E4F28568];
                                              v305 = v82;
                                              id v306 = [NSString alloc];
                                              uint64_t v415 = objc_opt_class();
                                              v307 = v306;
                                              float v82 = v305;
                                              id v473 = (id)[v307 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v415, @"brightness2topLeftStimulusSignedResidualYaw"];
                                              id v610 = v473;
                                              uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v610 forKeys:&v609 count:1];
                                              id v475 = 0;
                                              v504 = 0;
                                              id *v540 = (id)[v303 initWithDomain:v304 code:2 userInfo:v308];
                                              v309 = (void *)v308;
                                              float v49 = v532;
                                              float v52 = v528;
                                              float v152 = v512;
                                              int v164 = v509;
                                              id v235 = v501;
                                              id v233 = v498;
                                              goto LABEL_435;
                                            }
                                            id v475 = 0;
                                            v504 = 0;
                                            float v49 = v532;
                                            float v52 = v528;
                                            float v152 = v512;
                                            int v164 = v509;
                                            id v235 = v501;
                                            id v233 = v498;
                                            v302 = v474;
LABEL_429:
                                            uint64_t v122 = v502;
                                            goto LABEL_578;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v476 = v208;
                                            goto LABEL_224;
                                          }
                                          if (v540)
                                          {
                                            id v296 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v297 = *MEMORY[0x1E4F502C8];
                                            uint64_t v611 = *MEMORY[0x1E4F28568];
                                            v298 = v82;
                                            id v299 = [NSString alloc];
                                            uint64_t v414 = objc_opt_class();
                                            v300 = v299;
                                            float v82 = v298;
                                            id v475 = (id)[v300 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v414, @"brightness2bottomLeftStimulusSignedResidualYaw"];
                                            id v612 = v475;
                                            uint64_t v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v612 forKeys:&v611 count:1];
                                            id v476 = 0;
                                            v504 = 0;
                                            id *v540 = (id)[v296 initWithDomain:v297 code:2 userInfo:v301];
                                            v302 = (void *)v301;
                                            float v49 = v532;
                                            float v52 = v528;
                                            float v152 = v512;
                                            int v164 = v509;
                                            id v235 = v501;
                                            id v233 = v498;
                                            goto LABEL_429;
                                          }
                                          id v476 = 0;
                                          v504 = 0;
LABEL_423:
                                          float v49 = v532;
                                          float v52 = v528;
                                          float v152 = v512;
                                          int v164 = v509;
                                          id v235 = v501;
                                          id v233 = v498;
                                          uint64_t v122 = v502;
                                          goto LABEL_579;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v480 = v206;
                                          goto LABEL_221;
                                        }
                                        if (v540)
                                        {
                                          id v291 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v292 = *MEMORY[0x1E4F502C8];
                                          uint64_t v613 = *MEMORY[0x1E4F28568];
                                          v293 = v82;
                                          id v294 = [NSString alloc];
                                          uint64_t v413 = objc_opt_class();
                                          v295 = v294;
                                          float v82 = v293;
                                          id v476 = (id)[v295 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v413, @"brightness2bottomStimulusSignedResidualYaw"];
                                          id v614 = v476;
                                          v477 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v614 forKeys:&v613 count:1];
                                          id v480 = 0;
                                          v504 = 0;
                                          id *v540 = (id)objc_msgSend(v291, "initWithDomain:code:userInfo:", v292, 2);
                                          goto LABEL_423;
                                        }
                                        id v480 = 0;
                                        v504 = 0;
LABEL_417:
                                        float v49 = v532;
                                        float v52 = v528;
                                        float v152 = v512;
                                        int v164 = v509;
                                        id v235 = v501;
                                        id v233 = v498;
                                        uint64_t v122 = v502;
                                        goto LABEL_580;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v482 = v204;
                                        goto LABEL_218;
                                      }
                                      if (v540)
                                      {
                                        id v286 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v287 = *MEMORY[0x1E4F502C8];
                                        uint64_t v615 = *MEMORY[0x1E4F28568];
                                        v288 = v82;
                                        id v289 = [NSString alloc];
                                        uint64_t v412 = objc_opt_class();
                                        v290 = v289;
                                        float v82 = v288;
                                        id v480 = (id)[v290 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v412, @"brightness2bottomRightStimulusSignedResidualYaw"];
                                        id v616 = v480;
                                        v481 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v616 forKeys:&v615 count:1];
                                        id v482 = 0;
                                        v504 = 0;
                                        id *v540 = (id)objc_msgSend(v286, "initWithDomain:code:userInfo:", v287, 2);
                                        goto LABEL_417;
                                      }
                                      id v482 = 0;
                                      v504 = 0;
LABEL_411:
                                      float v49 = v532;
                                      float v52 = v528;
                                      float v152 = v512;
                                      int v164 = v509;
                                      id v235 = v501;
                                      id v233 = v498;
                                      uint64_t v122 = v502;
                                      goto LABEL_581;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v484 = v202;
                                      goto LABEL_215;
                                    }
                                    if (v540)
                                    {
                                      id v281 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v282 = *MEMORY[0x1E4F502C8];
                                      uint64_t v617 = *MEMORY[0x1E4F28568];
                                      v283 = v82;
                                      id v284 = [NSString alloc];
                                      uint64_t v411 = objc_opt_class();
                                      v285 = v284;
                                      float v82 = v283;
                                      id v482 = (id)[v285 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v411, @"brightness2topRightStimulusSignedResidualYaw"];
                                      id v618 = v482;
                                      v483 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v618 forKeys:&v617 count:1];
                                      id v484 = 0;
                                      v504 = 0;
                                      id *v540 = (id)objc_msgSend(v281, "initWithDomain:code:userInfo:", v282, 2);
                                      goto LABEL_411;
                                    }
                                    id v484 = 0;
                                    v504 = 0;
LABEL_405:
                                    float v49 = v532;
                                    float v52 = v528;
                                    float v152 = v512;
                                    int v164 = v509;
                                    id v235 = v501;
                                    id v233 = v498;
                                    uint64_t v122 = v502;
                                    goto LABEL_582;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v486 = v200;
                                    goto LABEL_212;
                                  }
                                  if (v540)
                                  {
                                    id v276 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v277 = *MEMORY[0x1E4F502C8];
                                    uint64_t v619 = *MEMORY[0x1E4F28568];
                                    v278 = v82;
                                    id v279 = [NSString alloc];
                                    uint64_t v410 = objc_opt_class();
                                    v280 = v279;
                                    float v82 = v278;
                                    id v484 = (id)[v280 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v410, @"brightness2topStimulusSignedResidualYaw"];
                                    id v620 = v484;
                                    v485 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v620 forKeys:&v619 count:1];
                                    id v486 = 0;
                                    v504 = 0;
                                    id *v540 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v277, 2);
                                    goto LABEL_405;
                                  }
                                  id v486 = 0;
                                  v504 = 0;
LABEL_399:
                                  float v49 = v532;
                                  float v52 = v528;
                                  float v152 = v512;
                                  int v164 = v509;
                                  id v235 = v501;
                                  id v233 = v498;
                                  uint64_t v122 = v502;
                                  goto LABEL_583;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v488 = v198;
                                  goto LABEL_209;
                                }
                                if (v540)
                                {
                                  id v271 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v272 = *MEMORY[0x1E4F502C8];
                                  uint64_t v621 = *MEMORY[0x1E4F28568];
                                  v273 = v82;
                                  id v274 = [NSString alloc];
                                  uint64_t v409 = objc_opt_class();
                                  v275 = v274;
                                  float v82 = v273;
                                  id v486 = (id)[v275 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v409, @"brightness1topLeftStimulusSignedResidualYaw"];
                                  id v622 = v486;
                                  v487 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v622 forKeys:&v621 count:1];
                                  id v488 = 0;
                                  v504 = 0;
                                  id *v540 = (id)objc_msgSend(v271, "initWithDomain:code:userInfo:", v272, 2);
                                  goto LABEL_399;
                                }
                                id v488 = 0;
                                v504 = 0;
LABEL_393:
                                float v49 = v532;
                                float v52 = v528;
                                float v152 = v512;
                                int v164 = v509;
                                id v235 = v501;
                                id v233 = v498;
                                uint64_t v122 = v502;
                                goto LABEL_584;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v490 = v196;
                                goto LABEL_206;
                              }
                              if (v540)
                              {
                                id v266 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v267 = *MEMORY[0x1E4F502C8];
                                uint64_t v623 = *MEMORY[0x1E4F28568];
                                v268 = v82;
                                id v269 = [NSString alloc];
                                uint64_t v408 = objc_opt_class();
                                v270 = v269;
                                float v82 = v268;
                                id v488 = (id)[v270 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v408, @"brightness1bottomLeftStimulusSignedResidualYaw"];
                                id v624 = v488;
                                v489 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v624 forKeys:&v623 count:1];
                                id v490 = 0;
                                v504 = 0;
                                id *v540 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v267, 2);
                                goto LABEL_393;
                              }
                              id v490 = 0;
                              v504 = 0;
LABEL_387:
                              float v49 = v532;
                              float v52 = v528;
                              float v152 = v512;
                              int v164 = v509;
                              id v235 = v501;
                              id v233 = v498;
                              uint64_t v122 = v502;
                              goto LABEL_585;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v492 = v194;
                              goto LABEL_203;
                            }
                            if (v540)
                            {
                              id v261 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v262 = *MEMORY[0x1E4F502C8];
                              uint64_t v625 = *MEMORY[0x1E4F28568];
                              id v263 = v82;
                              id v264 = [NSString alloc];
                              uint64_t v407 = objc_opt_class();
                              id v265 = v264;
                              float v82 = v263;
                              id v490 = (id)[v265 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v407, @"brightness1bottomStimulusSignedResidualYaw"];
                              id v626 = v490;
                              v491 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v626 forKeys:&v625 count:1];
                              id v492 = 0;
                              v504 = 0;
                              id *v540 = (id)objc_msgSend(v261, "initWithDomain:code:userInfo:", v262, 2);
                              goto LABEL_387;
                            }
                            id v492 = 0;
                            v504 = 0;
LABEL_381:
                            float v49 = v532;
                            float v52 = v528;
                            float v152 = v512;
                            int v164 = v509;
                            id v235 = v501;
                            id v233 = v498;
                            uint64_t v122 = v502;
                            goto LABEL_586;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v494 = v192;
                            goto LABEL_200;
                          }
                          if (v540)
                          {
                            id v246 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v247 = *MEMORY[0x1E4F502C8];
                            uint64_t v627 = *MEMORY[0x1E4F28568];
                            id v248 = v82;
                            id v249 = [NSString alloc];
                            uint64_t v404 = objc_opt_class();
                            id v250 = v249;
                            float v82 = v248;
                            id v492 = (id)[v250 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v404, @"brightness1bottomRightStimulusSignedResidualYaw"];
                            id v628 = v492;
                            v493 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v628 forKeys:&v627 count:1];
                            id v494 = 0;
                            v504 = 0;
                            id *v540 = (id)objc_msgSend(v246, "initWithDomain:code:userInfo:", v247, 2);
                            goto LABEL_381;
                          }
                          id v494 = 0;
                          v504 = 0;
LABEL_371:
                          float v49 = v532;
                          float v52 = v528;
                          float v152 = v512;
                          int v164 = v509;
                          id v235 = v501;
                          id v233 = v498;
                          uint64_t v122 = v502;
                          goto LABEL_587;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v496 = v190;
                          goto LABEL_197;
                        }
                        if (v540)
                        {
                          id v241 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v242 = *MEMORY[0x1E4F502C8];
                          uint64_t v629 = *MEMORY[0x1E4F28568];
                          id v243 = v82;
                          id v244 = [NSString alloc];
                          uint64_t v403 = objc_opt_class();
                          id v245 = v244;
                          float v82 = v243;
                          id v494 = (id)[v245 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v403, @"brightness1topRightStimulusSignedResidualYaw"];
                          id v630 = v494;
                          v495 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v630 forKeys:&v629 count:1];
                          id v496 = 0;
                          v504 = 0;
                          id *v540 = (id)objc_msgSend(v241, "initWithDomain:code:userInfo:", v242, 2);
                          goto LABEL_371;
                        }
                        id v496 = 0;
                        v504 = 0;
LABEL_365:
                        float v49 = v532;
                        float v52 = v528;
                        float v152 = v512;
                        int v164 = v509;
                        id v235 = v501;
                        id v233 = v498;
                        uint64_t v122 = v502;
                        goto LABEL_588;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v499 = v188;
                        goto LABEL_194;
                      }
                      if (v540)
                      {
                        id v236 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v237 = *MEMORY[0x1E4F502C8];
                        uint64_t v631 = *MEMORY[0x1E4F28568];
                        id v238 = v82;
                        id v239 = [NSString alloc];
                        uint64_t v402 = objc_opt_class();
                        id v240 = v239;
                        float v82 = v238;
                        id v496 = (id)[v240 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v402, @"brightness1topStimulusSignedResidualYaw"];
                        id v632 = v496;
                        v497 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v632 forKeys:&v631 count:1];
                        id v499 = 0;
                        v504 = 0;
                        id *v540 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v237, 2);
                        goto LABEL_365;
                      }
                      id v499 = 0;
                      v504 = 0;
                      float v49 = v532;
                      float v52 = v528;
                      float v152 = v512;
                      int v164 = v509;
                      id v235 = v501;
                      id v233 = v498;
                    }
                    uint64_t v122 = v502;
                    goto LABEL_589;
                  }
                  if (v540)
                  {
                    id v177 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v178 = *MEMORY[0x1E4F502C8];
                    uint64_t v639 = *MEMORY[0x1E4F28568];
                    v179 = v82;
                    id v180 = [NSString alloc];
                    uint64_t v400 = objc_opt_class();
                    v181 = v180;
                    float v82 = v179;
                    uint64_t v122 = (void *)[v181 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v400, @"stimulusCountHighBrightness"];
                    v640 = v122;
                    v506 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v640 forKeys:&v639 count:1];
                    id v507 = 0;
                    float v18 = 0;
                    id *v540 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v178, 2);
                    float v49 = v532;
                    float v52 = v528;
                    goto LABEL_373;
                  }
                  id v507 = 0;
                  float v18 = 0;
LABEL_344:
                  float v49 = v532;
                  float v52 = v528;
                  float v152 = v512;
                  int v164 = v509;
                  id v28 = v539;
                  uint64_t v92 = v526;
                  goto LABEL_593;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v510 = v119;
                  goto LABEL_128;
                }
                if (v540)
                {
                  id v172 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v173 = *MEMORY[0x1E4F502C8];
                  uint64_t v641 = *MEMORY[0x1E4F28568];
                  v174 = v82;
                  id v175 = [NSString alloc];
                  uint64_t v399 = objc_opt_class();
                  v176 = v175;
                  float v82 = v174;
                  id v507 = (id)[v176 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v399, @"stimulusCountMediumBrightness"];
                  id v642 = v507;
                  v508 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v642 forKeys:&v641 count:1];
                  id v510 = 0;
                  float v18 = 0;
                  id *v540 = (id)objc_msgSend(v172, "initWithDomain:code:userInfo:", v173, 2);
                  goto LABEL_344;
                }
                id v510 = 0;
                float v18 = 0;
                float v49 = v532;
                float v52 = v528;
                float v152 = v512;
                int v164 = v509;
LABEL_334:
                id v28 = v539;
                uint64_t v92 = v526;
                goto LABEL_594;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v509 = v117;
                id v513 = v117;
                goto LABEL_125;
              }
              if (v540)
              {
                id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v166 = *MEMORY[0x1E4F502C8];
                uint64_t v643 = *MEMORY[0x1E4F28568];
                v167 = v82;
                id v168 = [NSString alloc];
                uint64_t v398 = objc_opt_class();
                v169 = v168;
                float v82 = v167;
                id v510 = (id)[v169 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v398, @"stimulusCountLowBrightness"];
                id v644 = v510;
                uint64_t v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v644 forKeys:&v643 count:1];
                v171 = v165;
                int v164 = v117;
                v511 = (void *)v170;
                id v513 = 0;
                float v18 = 0;
                id *v540 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v166, 2);
                float v49 = v532;
                float v52 = v528;
                float v152 = v512;
                goto LABEL_334;
              }
              id v513 = 0;
              float v18 = 0;
              float v49 = v532;
              float v52 = v528;
              float v152 = v512;
              int v164 = v117;
              id v28 = v539;
            }
            uint64_t v92 = v526;
            goto LABEL_595;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v514 = v114;
            goto LABEL_119;
          }
          if (v540)
          {
            id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v148 = *MEMORY[0x1E4F502C8];
            uint64_t v647 = *MEMORY[0x1E4F28568];
            float v149 = v82;
            id v150 = [NSString alloc];
            uint64_t v396 = objc_opt_class();
            float v151 = v150;
            float v82 = v149;
            float v152 = (void *)[v151 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v396, @"fixationCountHighBrightness"];
            v648 = v152;
            v515 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v648 forKeys:&v647 count:1];
            id v153 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v148, 2);
            uint64_t v146 = 0;
            float v18 = 0;
            id *v540 = v153;
            float v49 = v532;
            float v52 = v528;
            uint64_t v92 = v526;
            goto LABEL_597;
          }
          uint64_t v146 = 0;
          float v18 = 0;
          float v49 = v532;
          float v52 = v528;
          uint64_t v92 = v526;
LABEL_598:
          uint64_t v111 = v516;
LABEL_599:

          id v8 = v543;
LABEL_600:

          id v6 = v529;
          uint64_t v7 = v536;
          uint64_t v128 = v518;
LABEL_601:

          v30 = v534;
LABEL_602:

LABEL_603:
          goto LABEL_604;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v516 = v111;
          id v112 = v111;
          goto LABEL_116;
        }
        if (v540)
        {
          id v138 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v139 = *MEMORY[0x1E4F502C8];
          uint64_t v649 = *MEMORY[0x1E4F28568];
          uint64_t v140 = v82;
          id v141 = [NSString alloc];
          uint64_t v395 = objc_opt_class();
          uint64_t v142 = v141;
          float v82 = v140;
          uint64_t v143 = [v142 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v395, @"fixationCountMediumBrightness"];
          uint64_t v650 = v143;
          uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v650 forKeys:&v649 count:1];
          uint64_t v145 = v138;
          uint64_t v146 = (void *)v143;
          v517 = (void *)v144;
          id v112 = 0;
          float v18 = 0;
          id *v540 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v139, 2);
          float v49 = v532;
          float v52 = v528;
          uint64_t v92 = v526;
          goto LABEL_599;
        }
        id v112 = 0;
        float v18 = 0;
LABEL_176:
        float v49 = v532;
        float v52 = v528;
        uint64_t v92 = v526;
        goto LABEL_600;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v518 = v110;
        goto LABEL_113;
      }
      uint64_t v7 = v536;
      if (v540)
      {
        id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v132 = *MEMORY[0x1E4F502C8];
        uint64_t v651 = *MEMORY[0x1E4F28568];
        uint64_t v133 = v82;
        id v134 = [NSString alloc];
        uint64_t v394 = objc_opt_class();
        uint64_t v135 = v134;
        float v82 = v133;
        uint64_t v136 = [v135 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v394, @"fixationCountLowBrightness"];
        uint64_t v652 = v136;
        uint64_t v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v652 forKeys:&v651 count:1];
        uint64_t v137 = v131;
        id v112 = (id)v136;
        id v518 = 0;
        float v18 = 0;
        id *v540 = (id)[v137 initWithDomain:v132 code:2 userInfo:v111];
        goto LABEL_176;
      }
      uint64_t v128 = 0;
      float v18 = 0;
    }
    float v49 = v532;
    float v52 = v528;
    uint64_t v92 = v526;
    goto LABEL_601;
  }
  objc_opt_class();
  v30 = v534;
  id v28 = v539;
  if (objc_opt_isKindOfClass())
  {
    id v524 = v82;
LABEL_106:

    id v8 = v543;
    goto LABEL_107;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v106 = v82;
    id v524 = [NSNumber numberWithInt:BMGazeEnrollmentSampleEnrollmentQualityFromString(v106)];

    goto LABEL_106;
  }
  if (v540)
  {
    id v525 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v154 = *MEMORY[0x1E4F502C8];
    uint64_t v655 = *MEMORY[0x1E4F28568];
    id v523 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"binocQuality"];
    id v656 = v523;
    v521 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v656 forKeys:&v655 count:1];
    id v155 = (id)objc_msgSend(v525, "initWithDomain:code:userInfo:", v154, 2);
    id v524 = 0;
    id *v540 = v155;
    uint64_t v7 = v536;
    float v18 = 0;
    float v49 = v532;
    float v52 = v528;
    uint64_t v92 = v526;
    id v8 = v543;

    goto LABEL_603;
  }
  id v524 = 0;
  float v18 = 0;
  float v49 = v532;
  float v52 = v528;
  uint64_t v92 = v526;
  uint64_t v7 = v536;
  id v8 = v543;
LABEL_604:

  uint64_t v93 = v524;
LABEL_605:

  float v48 = v533;
LABEL_607:

LABEL_608:
  float v41 = v542;
LABEL_609:

LABEL_610:
  id v10 = v537;
LABEL_611:

LABEL_612:
  v9 = v544;
LABEL_613:

LABEL_614:
  self = v546;
LABEL_615:

  return v18;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMGazeEnrollmentSample *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userProfileId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsOffline) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasEnrollmentResidual75thPercentile) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasEnrollmentResidual95thPercentile) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasEnrollmentResidualMedian) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_enrollmentFailureReasons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "unsignedIntValue", (void)v10);
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  if (self->_hasFixationCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFixationCountLowBrightness) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFixationCountMediumBrightness) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFixationCountHighBrightness) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStimulusCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStimulusCountLowBrightness) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStimulusCountMediumBrightness) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStimulusCountHighBrightness) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasCentralStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomRightStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topLeftStimulusSignedResidualYaw) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasCentralStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1bottomLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness1topLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2bottomLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness2topLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomRightStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3bottomLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBrightness3topLeftStimulusSignedResidualPitch) {
    PBDataWriterWriteFloatField();
  }
  if (self->_rxuuid) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v225.receiver = self;
  v225.super_class = (Class)BMGazeEnrollmentSample;
  uint64_t v5 = [(BMEventBase *)&v225 init];
  if (!v5)
  {
LABEL_441:
    uint64_t v223 = v5;
    goto LABEL_442;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_439:
    uint64_t v220 = [v6 copy];
    enrollmentFailureReasons = v5->_enrollmentFailureReasons;
    v5->_enrollmentFailureReasons = (NSArray *)v220;

    int v222 = v4[*v9];
    if (v222) {
      goto LABEL_440;
    }
    goto LABEL_441;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_439;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v7;
      uint64_t v15 = *(void *)&v4[v14];
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
      *(void *)&v4[v14] = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    int v19 = v4[*v9];
    if (v4[*v9]) {
      unint64_t v13 = 0;
    }
LABEL_15:
    if (v19 || (v13 & 7) == 4) {
      goto LABEL_439;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 296;
        goto LABEL_257;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v26 = *v7;
          uint64_t v27 = *(void *)&v4[v26];
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v18 = v24++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_270:
        if (v25 >= 5) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 72;
        goto LABEL_354;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        v5->_hasIsOffline = 1;
        while (2)
        {
          uint64_t v33 = *v7;
          uint64_t v34 = *(void *)&v4[v33];
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)&v4[*v10] + v34);
            *(void *)&v4[v33] = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              BOOL v18 = v31++ >= 9;
              if (v18)
              {
                uint64_t v32 = 0;
                goto LABEL_276;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v32 = 0;
        }
LABEL_276:
        v5->_isOffline = v32 != 0;
        goto LABEL_438;
      case 4u:
        v5->_hasEnrollmentResidual75thPercentile = 1;
        uint64_t v37 = *v7;
        unint64_t v38 = *(void *)&v4[v37];
        if (v38 <= 0xFFFFFFFFFFFFFFFBLL && v38 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v38);
          *(void *)&v4[v37] = v38 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 76;
        goto LABEL_437;
      case 5u:
        v5->_hasEnrollmentResidual95thPercentile = 1;
        uint64_t v40 = *v7;
        unint64_t v41 = *(void *)&v4[v40];
        if (v41 <= 0xFFFFFFFFFFFFFFFBLL && v41 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v41);
          *(void *)&v4[v40] = v41 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 80;
        goto LABEL_437;
      case 6u:
        v5->_hasEnrollmentResidualMedian = 1;
        uint64_t v42 = *v7;
        unint64_t v43 = *(void *)&v4[v42];
        if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v43);
          *(void *)&v4[v42] = v43 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 84;
        goto LABEL_437;
      case 7u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v46 = *v7;
          uint64_t v47 = *(void *)&v4[v46];
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)&v4[*v10] + v47);
            *(void *)&v4[v46] = v48;
            v25 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v18 = v45++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_280;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_280:
        if (v25 >= 5) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 88;
        goto LABEL_354;
      case 8u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v52 = *v7;
          uint64_t v53 = *(void *)&v4[v52];
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)&v4[*v10] + v53);
            *(void *)&v4[v52] = v54;
            v25 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              BOOL v18 = v51++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_286:
        if (v25 >= 6) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 92;
        goto LABEL_354;
      case 9u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v58 = 0;
        uint64_t v59 = NSNumber;
        while (2)
        {
          uint64_t v60 = *v7;
          uint64_t v61 = *(void *)&v4[v60];
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)&v4[*v10] + v61);
            *(void *)&v4[v60] = v62;
            v58 |= (unint64_t)(v63 & 0x7F) << v56;
            if (v63 < 0)
            {
              v56 += 7;
              BOOL v18 = v57++ >= 9;
              if (v18)
              {
                LODWORD(v58) = 0;
                goto LABEL_292;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v58) = 0;
        }
LABEL_292:
        if (v58 >= 0xA) {
          uint64_t v215 = 0;
        }
        else {
          uint64_t v215 = v58;
        }
        uint64_t v216 = [v59 numberWithUnsignedInt:v215];
        if (v216)
        {
          uint64_t v217 = (void *)v216;
          [v6 addObject:v216];

LABEL_438:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_439;
          }
          continue;
        }
LABEL_443:

LABEL_440:
        uint64_t v223 = 0;
LABEL_442:

        return v223;
      case 0xAu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v66 = *v7;
          uint64_t v67 = *(void *)&v4[v66];
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)&v4[*v10] + v67);
            *(void *)&v4[v66] = v68;
            v25 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              BOOL v18 = v65++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_300;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_300:
        if (v25 >= 6) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 96;
        goto LABEL_354;
      case 0xBu:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v72 = 0;
        v5->_hasFixationCount = 1;
        while (2)
        {
          uint64_t v73 = *v7;
          uint64_t v74 = *(void *)&v4[v73];
          unint64_t v75 = v74 + 1;
          if (v74 == -1 || v75 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v76 = *(unsigned char *)(*(void *)&v4[*v10] + v74);
            *(void *)&v4[v73] = v75;
            v72 |= (unint64_t)(v76 & 0x7F) << v70;
            if (v76 < 0)
            {
              v70 += 7;
              BOOL v18 = v71++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_306;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_306:
        uint64_t v218 = 100;
        goto LABEL_335;
      case 0xCu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v72 = 0;
        v5->_hasFixationCountLowBrightness = 1;
        while (2)
        {
          uint64_t v79 = *v7;
          uint64_t v80 = *(void *)&v4[v79];
          unint64_t v81 = v80 + 1;
          if (v80 == -1 || v81 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v82 = *(unsigned char *)(*(void *)&v4[*v10] + v80);
            *(void *)&v4[v79] = v81;
            v72 |= (unint64_t)(v82 & 0x7F) << v77;
            if (v82 < 0)
            {
              v77 += 7;
              BOOL v18 = v78++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_310;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_310:
        uint64_t v218 = 104;
        goto LABEL_335;
      case 0xDu:
        char v83 = 0;
        unsigned int v84 = 0;
        uint64_t v72 = 0;
        v5->_hasFixationCountMediumBrightness = 1;
        while (2)
        {
          uint64_t v85 = *v7;
          uint64_t v86 = *(void *)&v4[v85];
          unint64_t v87 = v86 + 1;
          if (v86 == -1 || v87 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v88 = *(unsigned char *)(*(void *)&v4[*v10] + v86);
            *(void *)&v4[v85] = v87;
            v72 |= (unint64_t)(v88 & 0x7F) << v83;
            if (v88 < 0)
            {
              v83 += 7;
              BOOL v18 = v84++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_314;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_314:
        uint64_t v218 = 108;
        goto LABEL_335;
      case 0xEu:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v72 = 0;
        v5->_hasFixationCountHighBrightness = 1;
        while (2)
        {
          uint64_t v91 = *v7;
          uint64_t v92 = *(void *)&v4[v91];
          unint64_t v93 = v92 + 1;
          if (v92 == -1 || v93 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v94 = *(unsigned char *)(*(void *)&v4[*v10] + v92);
            *(void *)&v4[v91] = v93;
            v72 |= (unint64_t)(v94 & 0x7F) << v89;
            if (v94 < 0)
            {
              v89 += 7;
              BOOL v18 = v90++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_318;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_318:
        uint64_t v218 = 112;
        goto LABEL_335;
      case 0xFu:
        char v95 = 0;
        unsigned int v96 = 0;
        uint64_t v72 = 0;
        v5->_hasStimulusCount = 1;
        while (2)
        {
          uint64_t v97 = *v7;
          uint64_t v98 = *(void *)&v4[v97];
          unint64_t v99 = v98 + 1;
          if (v98 == -1 || v99 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v100 = *(unsigned char *)(*(void *)&v4[*v10] + v98);
            *(void *)&v4[v97] = v99;
            v72 |= (unint64_t)(v100 & 0x7F) << v95;
            if (v100 < 0)
            {
              v95 += 7;
              BOOL v18 = v96++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_322;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_322:
        uint64_t v218 = 116;
        goto LABEL_335;
      case 0x10u:
        char v101 = 0;
        unsigned int v102 = 0;
        uint64_t v72 = 0;
        v5->_hasStimulusCountLowBrightness = 1;
        while (2)
        {
          uint64_t v103 = *v7;
          uint64_t v104 = *(void *)&v4[v103];
          unint64_t v105 = v104 + 1;
          if (v104 == -1 || v105 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v106 = *(unsigned char *)(*(void *)&v4[*v10] + v104);
            *(void *)&v4[v103] = v105;
            v72 |= (unint64_t)(v106 & 0x7F) << v101;
            if (v106 < 0)
            {
              v101 += 7;
              BOOL v18 = v102++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_326;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_326:
        uint64_t v218 = 120;
        goto LABEL_335;
      case 0x11u:
        char v107 = 0;
        unsigned int v108 = 0;
        uint64_t v72 = 0;
        v5->_hasStimulusCountMediumBrightness = 1;
        while (2)
        {
          uint64_t v109 = *v7;
          uint64_t v110 = *(void *)&v4[v109];
          unint64_t v111 = v110 + 1;
          if (v110 == -1 || v111 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v112 = *(unsigned char *)(*(void *)&v4[*v10] + v110);
            *(void *)&v4[v109] = v111;
            v72 |= (unint64_t)(v112 & 0x7F) << v107;
            if (v112 < 0)
            {
              v107 += 7;
              BOOL v18 = v108++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_330;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_330:
        uint64_t v218 = 124;
        goto LABEL_335;
      case 0x12u:
        char v113 = 0;
        unsigned int v114 = 0;
        uint64_t v72 = 0;
        v5->_hasStimulusCountHighBrightness = 1;
        while (2)
        {
          uint64_t v115 = *v7;
          uint64_t v116 = *(void *)&v4[v115];
          unint64_t v117 = v116 + 1;
          if (v116 == -1 || v117 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v118 = *(unsigned char *)(*(void *)&v4[*v10] + v116);
            *(void *)&v4[v115] = v117;
            v72 |= (unint64_t)(v118 & 0x7F) << v113;
            if (v118 < 0)
            {
              v113 += 7;
              BOOL v18 = v114++ >= 9;
              if (v18)
              {
                LODWORD(v72) = 0;
                goto LABEL_334;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v72) = 0;
        }
LABEL_334:
        uint64_t v218 = 128;
LABEL_335:
        *(_DWORD *)((char *)&v5->super.super.isa + v218) = v72;
        goto LABEL_438;
      case 0x13u:
        char v119 = 0;
        unsigned int v120 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v121 = *v7;
          uint64_t v122 = *(void *)&v4[v121];
          unint64_t v123 = v122 + 1;
          if (v122 == -1 || v123 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v124 = *(unsigned char *)(*(void *)&v4[*v10] + v122);
            *(void *)&v4[v121] = v123;
            v25 |= (unint64_t)(v124 & 0x7F) << v119;
            if (v124 < 0)
            {
              v119 += 7;
              BOOL v18 = v120++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_339;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_339:
        if (v25 >= 4) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 132;
        goto LABEL_354;
      case 0x14u:
        char v125 = 0;
        unsigned int v126 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v127 = *v7;
          uint64_t v128 = *(void *)&v4[v127];
          unint64_t v129 = v128 + 1;
          if (v128 == -1 || v129 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v130 = *(unsigned char *)(*(void *)&v4[*v10] + v128);
            *(void *)&v4[v127] = v129;
            v25 |= (unint64_t)(v130 & 0x7F) << v125;
            if (v130 < 0)
            {
              v125 += 7;
              BOOL v18 = v126++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_345;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_345:
        if (v25 >= 3) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 136;
        goto LABEL_354;
      case 0x15u:
        v5->_hasCentralStimulusSignedResidualYaw = 1;
        uint64_t v131 = *v7;
        unint64_t v132 = *(void *)&v4[v131];
        if (v132 <= 0xFFFFFFFFFFFFFFFBLL && v132 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v132);
          *(void *)&v4[v131] = v132 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 140;
        goto LABEL_437;
      case 0x16u:
        v5->_hasBrightness1topStimulusSignedResidualYaw = 1;
        uint64_t v133 = *v7;
        unint64_t v134 = *(void *)&v4[v133];
        if (v134 <= 0xFFFFFFFFFFFFFFFBLL && v134 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v134);
          *(void *)&v4[v133] = v134 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 144;
        goto LABEL_437;
      case 0x17u:
        v5->_hasBrightness1topRightStimulusSignedResidualYaw = 1;
        uint64_t v135 = *v7;
        unint64_t v136 = *(void *)&v4[v135];
        if (v136 <= 0xFFFFFFFFFFFFFFFBLL && v136 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v136);
          *(void *)&v4[v135] = v136 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 148;
        goto LABEL_437;
      case 0x18u:
        v5->_hasBrightness1bottomRightStimulusSignedResidualYaw = 1;
        uint64_t v137 = *v7;
        unint64_t v138 = *(void *)&v4[v137];
        if (v138 <= 0xFFFFFFFFFFFFFFFBLL && v138 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v138);
          *(void *)&v4[v137] = v138 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 152;
        goto LABEL_437;
      case 0x19u:
        v5->_hasBrightness1bottomStimulusSignedResidualYaw = 1;
        uint64_t v139 = *v7;
        unint64_t v140 = *(void *)&v4[v139];
        if (v140 <= 0xFFFFFFFFFFFFFFFBLL && v140 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v140);
          *(void *)&v4[v139] = v140 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 156;
        goto LABEL_437;
      case 0x1Au:
        v5->_hasBrightness1bottomLeftStimulusSignedResidualYaw = 1;
        uint64_t v141 = *v7;
        unint64_t v142 = *(void *)&v4[v141];
        if (v142 <= 0xFFFFFFFFFFFFFFFBLL && v142 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v142);
          *(void *)&v4[v141] = v142 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 160;
        goto LABEL_437;
      case 0x1Bu:
        v5->_hasBrightness1topLeftStimulusSignedResidualYaw = 1;
        uint64_t v143 = *v7;
        unint64_t v144 = *(void *)&v4[v143];
        if (v144 <= 0xFFFFFFFFFFFFFFFBLL && v144 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v144);
          *(void *)&v4[v143] = v144 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 164;
        goto LABEL_437;
      case 0x1Cu:
        v5->_hasBrightness2topStimulusSignedResidualYaw = 1;
        uint64_t v145 = *v7;
        unint64_t v146 = *(void *)&v4[v145];
        if (v146 <= 0xFFFFFFFFFFFFFFFBLL && v146 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v146);
          *(void *)&v4[v145] = v146 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 168;
        goto LABEL_437;
      case 0x1Du:
        v5->_hasBrightness2topRightStimulusSignedResidualYaw = 1;
        uint64_t v147 = *v7;
        unint64_t v148 = *(void *)&v4[v147];
        if (v148 <= 0xFFFFFFFFFFFFFFFBLL && v148 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v148);
          *(void *)&v4[v147] = v148 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 172;
        goto LABEL_437;
      case 0x1Eu:
        v5->_hasBrightness2bottomRightStimulusSignedResidualYaw = 1;
        uint64_t v149 = *v7;
        unint64_t v150 = *(void *)&v4[v149];
        if (v150 <= 0xFFFFFFFFFFFFFFFBLL && v150 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v150);
          *(void *)&v4[v149] = v150 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 176;
        goto LABEL_437;
      case 0x1Fu:
        v5->_hasBrightness2bottomStimulusSignedResidualYaw = 1;
        uint64_t v151 = *v7;
        unint64_t v152 = *(void *)&v4[v151];
        if (v152 <= 0xFFFFFFFFFFFFFFFBLL && v152 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v152);
          *(void *)&v4[v151] = v152 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 180;
        goto LABEL_437;
      case 0x20u:
        v5->_hasBrightness2bottomLeftStimulusSignedResidualYaw = 1;
        uint64_t v153 = *v7;
        unint64_t v154 = *(void *)&v4[v153];
        if (v154 <= 0xFFFFFFFFFFFFFFFBLL && v154 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v154);
          *(void *)&v4[v153] = v154 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 184;
        goto LABEL_437;
      case 0x21u:
        v5->_hasBrightness2topLeftStimulusSignedResidualYaw = 1;
        uint64_t v155 = *v7;
        unint64_t v156 = *(void *)&v4[v155];
        if (v156 <= 0xFFFFFFFFFFFFFFFBLL && v156 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v156);
          *(void *)&v4[v155] = v156 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 188;
        goto LABEL_437;
      case 0x22u:
        v5->_hasBrightness3topStimulusSignedResidualYaw = 1;
        uint64_t v157 = *v7;
        unint64_t v158 = *(void *)&v4[v157];
        if (v158 <= 0xFFFFFFFFFFFFFFFBLL && v158 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v158);
          *(void *)&v4[v157] = v158 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 192;
        goto LABEL_437;
      case 0x23u:
        v5->_hasBrightness3topRightStimulusSignedResidualYaw = 1;
        uint64_t v159 = *v7;
        unint64_t v160 = *(void *)&v4[v159];
        if (v160 <= 0xFFFFFFFFFFFFFFFBLL && v160 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v160);
          *(void *)&v4[v159] = v160 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 196;
        goto LABEL_437;
      case 0x24u:
        v5->_hasBrightness3bottomRightStimulusSignedResidualYaw = 1;
        uint64_t v161 = *v7;
        unint64_t v162 = *(void *)&v4[v161];
        if (v162 <= 0xFFFFFFFFFFFFFFFBLL && v162 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v162);
          *(void *)&v4[v161] = v162 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 200;
        goto LABEL_437;
      case 0x25u:
        v5->_hasBrightness3bottomStimulusSignedResidualYaw = 1;
        uint64_t v163 = *v7;
        unint64_t v164 = *(void *)&v4[v163];
        if (v164 <= 0xFFFFFFFFFFFFFFFBLL && v164 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v164);
          *(void *)&v4[v163] = v164 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 204;
        goto LABEL_437;
      case 0x26u:
        v5->_hasBrightness3bottomLeftStimulusSignedResidualYaw = 1;
        uint64_t v165 = *v7;
        unint64_t v166 = *(void *)&v4[v165];
        if (v166 <= 0xFFFFFFFFFFFFFFFBLL && v166 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v166);
          *(void *)&v4[v165] = v166 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 208;
        goto LABEL_437;
      case 0x27u:
        v5->_hasBrightness3topLeftStimulusSignedResidualYaw = 1;
        uint64_t v167 = *v7;
        unint64_t v168 = *(void *)&v4[v167];
        if (v168 <= 0xFFFFFFFFFFFFFFFBLL && v168 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v168);
          *(void *)&v4[v167] = v168 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 212;
        goto LABEL_437;
      case 0x28u:
        v5->_hasCentralStimulusSignedResidualPitch = 1;
        uint64_t v169 = *v7;
        unint64_t v170 = *(void *)&v4[v169];
        if (v170 <= 0xFFFFFFFFFFFFFFFBLL && v170 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v170);
          *(void *)&v4[v169] = v170 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 216;
        goto LABEL_437;
      case 0x29u:
        v5->_hasBrightness1topStimulusSignedResidualPitch = 1;
        uint64_t v171 = *v7;
        unint64_t v172 = *(void *)&v4[v171];
        if (v172 <= 0xFFFFFFFFFFFFFFFBLL && v172 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v172);
          *(void *)&v4[v171] = v172 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 220;
        goto LABEL_437;
      case 0x2Au:
        v5->_hasBrightness1topRightStimulusSignedResidualPitch = 1;
        uint64_t v173 = *v7;
        unint64_t v174 = *(void *)&v4[v173];
        if (v174 <= 0xFFFFFFFFFFFFFFFBLL && v174 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v174);
          *(void *)&v4[v173] = v174 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 224;
        goto LABEL_437;
      case 0x2Bu:
        v5->_hasBrightness1bottomRightStimulusSignedResidualPitch = 1;
        uint64_t v175 = *v7;
        unint64_t v176 = *(void *)&v4[v175];
        if (v176 <= 0xFFFFFFFFFFFFFFFBLL && v176 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v176);
          *(void *)&v4[v175] = v176 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 228;
        goto LABEL_437;
      case 0x2Cu:
        v5->_hasBrightness1bottomStimulusSignedResidualPitch = 1;
        uint64_t v177 = *v7;
        unint64_t v178 = *(void *)&v4[v177];
        if (v178 <= 0xFFFFFFFFFFFFFFFBLL && v178 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v178);
          *(void *)&v4[v177] = v178 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 232;
        goto LABEL_437;
      case 0x2Du:
        v5->_hasBrightness1bottomLeftStimulusSignedResidualPitch = 1;
        uint64_t v179 = *v7;
        unint64_t v180 = *(void *)&v4[v179];
        if (v180 <= 0xFFFFFFFFFFFFFFFBLL && v180 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v180);
          *(void *)&v4[v179] = v180 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 236;
        goto LABEL_437;
      case 0x2Eu:
        v5->_hasBrightness1topLeftStimulusSignedResidualPitch = 1;
        uint64_t v181 = *v7;
        unint64_t v182 = *(void *)&v4[v181];
        if (v182 <= 0xFFFFFFFFFFFFFFFBLL && v182 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v182);
          *(void *)&v4[v181] = v182 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 240;
        goto LABEL_437;
      case 0x2Fu:
        v5->_hasBrightness2topStimulusSignedResidualPitch = 1;
        uint64_t v183 = *v7;
        unint64_t v184 = *(void *)&v4[v183];
        if (v184 <= 0xFFFFFFFFFFFFFFFBLL && v184 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v184);
          *(void *)&v4[v183] = v184 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 244;
        goto LABEL_437;
      case 0x30u:
        v5->_hasBrightness2topRightStimulusSignedResidualPitch = 1;
        uint64_t v185 = *v7;
        unint64_t v186 = *(void *)&v4[v185];
        if (v186 <= 0xFFFFFFFFFFFFFFFBLL && v186 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v186);
          *(void *)&v4[v185] = v186 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 248;
        goto LABEL_437;
      case 0x31u:
        v5->_hasBrightness2bottomRightStimulusSignedResidualPitch = 1;
        uint64_t v187 = *v7;
        unint64_t v188 = *(void *)&v4[v187];
        if (v188 <= 0xFFFFFFFFFFFFFFFBLL && v188 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v188);
          *(void *)&v4[v187] = v188 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 252;
        goto LABEL_437;
      case 0x32u:
        v5->_hasBrightness2bottomStimulusSignedResidualPitch = 1;
        uint64_t v189 = *v7;
        unint64_t v190 = *(void *)&v4[v189];
        if (v190 <= 0xFFFFFFFFFFFFFFFBLL && v190 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v190);
          *(void *)&v4[v189] = v190 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 256;
        goto LABEL_437;
      case 0x33u:
        v5->_hasBrightness2bottomLeftStimulusSignedResidualPitch = 1;
        uint64_t v191 = *v7;
        unint64_t v192 = *(void *)&v4[v191];
        if (v192 <= 0xFFFFFFFFFFFFFFFBLL && v192 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v192);
          *(void *)&v4[v191] = v192 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 260;
        goto LABEL_437;
      case 0x34u:
        v5->_hasBrightness2topLeftStimulusSignedResidualPitch = 1;
        uint64_t v193 = *v7;
        unint64_t v194 = *(void *)&v4[v193];
        if (v194 <= 0xFFFFFFFFFFFFFFFBLL && v194 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v194);
          *(void *)&v4[v193] = v194 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 264;
        goto LABEL_437;
      case 0x35u:
        v5->_hasBrightness3topStimulusSignedResidualPitch = 1;
        uint64_t v195 = *v7;
        unint64_t v196 = *(void *)&v4[v195];
        if (v196 <= 0xFFFFFFFFFFFFFFFBLL && v196 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v196);
          *(void *)&v4[v195] = v196 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 268;
        goto LABEL_437;
      case 0x36u:
        v5->_hasBrightness3topRightStimulusSignedResidualPitch = 1;
        uint64_t v197 = *v7;
        unint64_t v198 = *(void *)&v4[v197];
        if (v198 <= 0xFFFFFFFFFFFFFFFBLL && v198 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v198);
          *(void *)&v4[v197] = v198 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 272;
        goto LABEL_437;
      case 0x37u:
        v5->_hasBrightness3bottomRightStimulusSignedResidualPitch = 1;
        uint64_t v199 = *v7;
        unint64_t v200 = *(void *)&v4[v199];
        if (v200 <= 0xFFFFFFFFFFFFFFFBLL && v200 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v200);
          *(void *)&v4[v199] = v200 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 276;
        goto LABEL_437;
      case 0x38u:
        v5->_hasBrightness3bottomStimulusSignedResidualPitch = 1;
        uint64_t v201 = *v7;
        unint64_t v202 = *(void *)&v4[v201];
        if (v202 <= 0xFFFFFFFFFFFFFFFBLL && v202 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v202);
          *(void *)&v4[v201] = v202 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 280;
        goto LABEL_437;
      case 0x39u:
        v5->_hasBrightness3bottomLeftStimulusSignedResidualPitch = 1;
        uint64_t v203 = *v7;
        unint64_t v204 = *(void *)&v4[v203];
        if (v204 <= 0xFFFFFFFFFFFFFFFBLL && v204 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v204);
          *(void *)&v4[v203] = v204 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 284;
        goto LABEL_437;
      case 0x3Au:
        v5->_hasBrightness3topLeftStimulusSignedResidualPitch = 1;
        uint64_t v205 = *v7;
        unint64_t v206 = *(void *)&v4[v205];
        if (v206 <= 0xFFFFFFFFFFFFFFFBLL && v206 + 4 <= *(void *)&v4[*v8])
        {
          int v39 = *(_DWORD *)(*(void *)&v4[*v10] + v206);
          *(void *)&v4[v205] = v206 + 4;
        }
        else
        {
          v4[*v9] = 1;
          int v39 = 0;
        }
        uint64_t v219 = 288;
LABEL_437:
        *(_DWORD *)((char *)&v5->super.super.isa + v219) = v39;
        goto LABEL_438;
      case 0x3Bu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 312;
LABEL_257:
        uint64_t v207 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_438;
      case 0x3Cu:
        char v208 = 0;
        unsigned int v209 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          uint64_t v210 = *v7;
          uint64_t v211 = *(void *)&v4[v210];
          unint64_t v212 = v211 + 1;
          if (v211 == -1 || v212 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v213 = *(unsigned char *)(*(void *)&v4[*v10] + v211);
            *(void *)&v4[v210] = v212;
            v25 |= (unint64_t)(v213 & 0x7F) << v208;
            if (v213 < 0)
            {
              v208 += 7;
              BOOL v18 = v209++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_351;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_351:
        if (v25 >= 4) {
          LODWORD(v25) = 0;
        }
        uint64_t v214 = 292;
LABEL_354:
        *(_DWORD *)((char *)&v5->super.super.isa + v214) = v25;
        goto LABEL_438;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_443;
        }
        goto LABEL_438;
    }
  }
}

- (NSString)description
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  [v3 appendString:@"["];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v4 = [(BMGazeEnrollmentSample *)self enrollmentFailureReasons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v114 objects:v118 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v115 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        if ([v3 length] != 1) {
          [v3 appendString:@", "];
        }
        long long v10 = BMGazeEnrollmentSampleEnrollmentFailureReasonAsString([v9 unsignedIntValue]);
        [v3 appendString:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v114 objects:v118 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"]"];
  id v66 = [NSString alloc];
  char v113 = [(BMGazeEnrollmentSample *)self userProfileId];
  char v112 = BMOasisAnalyticsGazeSampleEyeSideAsString([(BMGazeEnrollmentSample *)self eyeSide]);
  unint64_t v111 = objc_msgSend(NSNumber, "numberWithBool:", -[BMGazeEnrollmentSample isOffline](self, "isOffline"));
  char v11 = NSNumber;
  [(BMGazeEnrollmentSample *)self enrollmentResidual75thPercentile];
  uint64_t v110 = objc_msgSend(v11, "numberWithFloat:");
  unsigned int v12 = NSNumber;
  [(BMGazeEnrollmentSample *)self enrollmentResidual95thPercentile];
  uint64_t v109 = objc_msgSend(v12, "numberWithFloat:");
  unint64_t v13 = NSNumber;
  [(BMGazeEnrollmentSample *)self enrollmentResidualMedian];
  unsigned int v108 = objc_msgSend(v13, "numberWithFloat:");
  char v107 = BMOasisAnalyticsGazeSampleEyeSideAsString([(BMGazeEnrollmentSample *)self dominantEye]);
  char v106 = BMGazeEnrollmentSampleEnrollmentQualityAsString([(BMGazeEnrollmentSample *)self monocularQuality]);
  unint64_t v105 = BMGazeEnrollmentSampleEnrollmentQualityAsString([(BMGazeEnrollmentSample *)self binocQuality]);
  uint64_t v104 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCount](self, "fixationCount"));
  uint64_t v103 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountLowBrightness](self, "fixationCountLowBrightness"));
  unsigned int v102 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountMediumBrightness](self, "fixationCountMediumBrightness"));
  char v101 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample fixationCountHighBrightness](self, "fixationCountHighBrightness"));
  char v100 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCount](self, "stimulusCount"));
  unint64_t v99 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountLowBrightness](self, "stimulusCountLowBrightness"));
  uint64_t v98 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountMediumBrightness](self, "stimulusCountMediumBrightness"));
  uint64_t v97 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMGazeEnrollmentSample stimulusCountHighBrightness](self, "stimulusCountHighBrightness"));
  unsigned int v96 = BMGazeEnrollmentSampleAccessibilityModeAsString([(BMGazeEnrollmentSample *)self accessibilityMode]);
  char v95 = BMGazeEnrollmentSampleEyeboxStatusAsString([(BMGazeEnrollmentSample *)self eyeboxStatus]);
  uint64_t v14 = NSNumber;
  [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualYaw];
  char v94 = objc_msgSend(v14, "numberWithFloat:");
  uint64_t v15 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualYaw];
  unsigned int v90 = objc_msgSend(v15, "numberWithFloat:");
  unint64_t v16 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualYaw];
  uint64_t v92 = objc_msgSend(v16, "numberWithFloat:");
  char v17 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualYaw];
  unint64_t v93 = objc_msgSend(v17, "numberWithFloat:");
  BOOL v18 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualYaw];
  uint64_t v91 = objc_msgSend(v18, "numberWithFloat:");
  int v19 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualYaw];
  uint64_t v85 = objc_msgSend(v19, "numberWithFloat:");
  uint64_t v20 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualYaw];
  char v89 = objc_msgSend(v20, "numberWithFloat:");
  uint64_t v21 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualYaw];
  char v83 = objc_msgSend(v21, "numberWithFloat:");
  uint64_t v22 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualYaw];
  char v88 = objc_msgSend(v22, "numberWithFloat:");
  char v23 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualYaw];
  unint64_t v87 = objc_msgSend(v23, "numberWithFloat:");
  unsigned int v24 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualYaw];
  uint64_t v86 = objc_msgSend(v24, "numberWithFloat:");
  uint64_t v25 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualYaw];
  unsigned int v84 = objc_msgSend(v25, "numberWithFloat:");
  uint64_t v26 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualYaw];
  uint64_t v79 = objc_msgSend(v26, "numberWithFloat:");
  uint64_t v27 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualYaw];
  char v82 = objc_msgSend(v27, "numberWithFloat:");
  unint64_t v28 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualYaw];
  char v77 = objc_msgSend(v28, "numberWithFloat:");
  char v29 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualYaw];
  unint64_t v81 = objc_msgSend(v29, "numberWithFloat:");
  char v30 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualYaw];
  unsigned int v65 = objc_msgSend(v30, "numberWithFloat:");
  unsigned int v31 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualYaw];
  uint64_t v80 = objc_msgSend(v31, "numberWithFloat:");
  uint64_t v32 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualYaw];
  unsigned int v78 = objc_msgSend(v32, "numberWithFloat:");
  uint64_t v33 = NSNumber;
  [(BMGazeEnrollmentSample *)self centralStimulusSignedResidualPitch];
  char v76 = objc_msgSend(v33, "numberWithFloat:");
  uint64_t v34 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topStimulusSignedResidualPitch];
  char v64 = objc_msgSend(v34, "numberWithFloat:");
  unint64_t v35 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topRightStimulusSignedResidualPitch];
  unint64_t v75 = objc_msgSend(v35, "numberWithFloat:");
  char v36 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomRightStimulusSignedResidualPitch];
  char v63 = objc_msgSend(v36, "numberWithFloat:");
  uint64_t v37 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomStimulusSignedResidualPitch];
  uint64_t v74 = objc_msgSend(v37, "numberWithFloat:");
  unint64_t v38 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1bottomLeftStimulusSignedResidualPitch];
  unint64_t v62 = objc_msgSend(v38, "numberWithFloat:");
  int v39 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness1topLeftStimulusSignedResidualPitch];
  uint64_t v73 = objc_msgSend(v39, "numberWithFloat:");
  uint64_t v40 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topStimulusSignedResidualPitch];
  uint64_t v72 = objc_msgSend(v40, "numberWithFloat:");
  unint64_t v41 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topRightStimulusSignedResidualPitch];
  unsigned int v71 = objc_msgSend(v41, "numberWithFloat:");
  uint64_t v42 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomRightStimulusSignedResidualPitch];
  char v70 = objc_msgSend(v42, "numberWithFloat:");
  unint64_t v43 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomStimulusSignedResidualPitch];
  char v69 = objc_msgSend(v43, "numberWithFloat:");
  char v44 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2bottomLeftStimulusSignedResidualPitch];
  unint64_t v68 = objc_msgSend(v44, "numberWithFloat:");
  unsigned int v45 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness2topLeftStimulusSignedResidualPitch];
  uint64_t v61 = objc_msgSend(v45, "numberWithFloat:");
  uint64_t v46 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topStimulusSignedResidualPitch];
  uint64_t v60 = objc_msgSend(v46, "numberWithFloat:");
  uint64_t v47 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topRightStimulusSignedResidualPitch];
  uint64_t v59 = objc_msgSend(v47, "numberWithFloat:");
  unint64_t v48 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomRightStimulusSignedResidualPitch];
  uint64_t v58 = objc_msgSend(v48, "numberWithFloat:");
  char v49 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomStimulusSignedResidualPitch];
  char v50 = objc_msgSend(v49, "numberWithFloat:");
  unsigned int v51 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3bottomLeftStimulusSignedResidualPitch];
  uint64_t v52 = objc_msgSend(v51, "numberWithFloat:");
  uint64_t v53 = NSNumber;
  [(BMGazeEnrollmentSample *)self brightness3topLeftStimulusSignedResidualPitch];
  unint64_t v54 = objc_msgSend(v53, "numberWithFloat:");
  char v55 = [(BMGazeEnrollmentSample *)self rxuuid];
  char v56 = BMGazeEnrollmentSampleEnrollmentReasonAsString([(BMGazeEnrollmentSample *)self enrollmentReason]);
  id v67 = (id)objc_msgSend(v66, "initWithFormat:", @"BMGazeEnrollmentSample with userProfileId: %@, eyeSide: %@, isOffline: %@, enrollmentResidual75thPercentile: %@, enrollmentResidual95thPercentile: %@, enrollmentResidualMedian: %@, dominantEye: %@, monocularQuality: %@, enrollmentFailureReasons: %@, binocQuality: %@, fixationCount: %@, fixationCountLowBrightness: %@, fixationCountMediumBrightness: %@, fixationCountHighBrightness: %@, stimulusCount: %@, stimulusCountLowBrightness: %@, stimulusCountMediumBrightness: %@, stimulusCountHighBrightness: %@, accessibilityMode: %@, eyeboxStatus: %@, centralStimulusSignedResidualYaw: %@, brightness1topStimulusSignedResidualYaw: %@, brightness1topRightStimulusSignedResidualYaw: %@, brightness1bottomRightStimulusSignedResidualYaw: %@, brightness1bottomStimulusSignedResidualYaw: %@, brightness1bottomLeftStimulusSignedResidualYaw: %@, brightness1topLeftStimulusSignedResidualYaw: %@, brightness2topStimulusSignedResidualYaw: %@, brightness2topRightStimulusSignedResidualYaw: %@, brightness2bottomRightStimulusSignedResidualYaw: %@, brightness2bottomStimulusSignedResidualYaw: %@, brightness2bottomLeftStimulusSignedResidualYaw: %@, brightness2topLeftStimulusSignedResidualYaw: %@, brightness3topStimulusSignedResidualYaw: %@, brightness3topRightStimulusSignedResidualYaw: %@, brightness3bottomRightStimulusSignedResidualYaw: %@, brightness3bottomStimulusSignedResidualYaw: %@, brightness3bottomLeftStimulusSignedResidualYaw: %@, brightness3topLeftStimulusSignedResidualYaw: %@, centralStimulusSignedResidualPitch: %@, brightness1topStimulusSignedResidualPitch: %@, brightness1topRightStimulusSignedResidualPitch: %@, brightness1bottomRightStimulusSignedResidualPitch: %@, brightness1bottomStimulusSignedResidualPitch: %@, brightness1bottomLeftStimulusSignedResidualPitch: %@, brightness1topLeftStimulusSignedResidualPitch: %@, brightness2topStimulusSignedResidualPitch: %@, brightness2topRightStimulusSignedResidualPitch: %@, brightness2bottomRightStimulusSignedResidualPitch: %@, brightness2bottomStimulusSignedResidualPitch: %@, brightness2bottomLeftStimulusSignedResidualPitch: %@, brightness2topLeftStimulusSignedResidualPitch: %@, brightness3topStimulusSignedResidualPitch: %@, brightness3topRightStimulusSignedResidualPitch: %@, brightness3bottomRightStimulusSignedResidualPitch: %@, brightness3bottomStimulusSignedResidualPitch: %@, brightness3bottomLeftStimulusSignedResidualPitch: %@, brightness3topLeftStimulusSignedResidualPitch: %@, rxuuid: %@, enrollmentReason: %@", v113, v112, v111, v110, v109, v108, v107, v106, v3, v105, v104, v103, v102, v101, v100, v99,
              v98,
              v97,
              v96,
              v95,
              v94,
              v90,
              v92,
              v93,
              v91,
              v85,
              v89,
              v83,
              v88,
              v87,
              v86,
              v84,
              v79,
              v82,
              v77,
              v81,
              v65,
              v80,
              v78,
              v76,
              v64,
              v75,
              v63,
              v74,
              v62,
              v73,
              v72,
              v71,
              v70,
              v69,
              v68,
              v61,
              v60,
              v59,
              v58,
              v50,
              v52,
              v54,
              v55,
              v56);

  return (NSString *)v67;
}

- (BMGazeEnrollmentSample)initWithUserProfileId:(id)a3 eyeSide:(int)a4 isOffline:(id)a5 enrollmentResidual75thPercentile:(id)a6 enrollmentResidual95thPercentile:(id)a7 enrollmentResidualMedian:(id)a8 dominantEye:(int)a9 monocularQuality:(int)a10 enrollmentFailureReasons:(id)a11 binocQuality:(int)a12 fixationCount:(id)a13 fixationCountLowBrightness:(id)a14 fixationCountMediumBrightness:(id)a15 fixationCountHighBrightness:(id)a16 stimulusCount:(id)a17 stimulusCountLowBrightness:(id)a18 stimulusCountMediumBrightness:(id)a19 stimulusCountHighBrightness:(id)a20 accessibilityMode:(int)a21 eyeboxStatus:(int)a22 centralStimulusSignedResidualYaw:(id)a23 brightness1topStimulusSignedResidualYaw:(id)a24 brightness1topRightStimulusSignedResidualYaw:(id)a25 brightness1bottomRightStimulusSignedResidualYaw:(id)a26 brightness1bottomStimulusSignedResidualYaw:(id)a27 brightness1bottomLeftStimulusSignedResidualYaw:(id)a28 brightness1topLeftStimulusSignedResidualYaw:(id)a29 brightness2topStimulusSignedResidualYaw:(id)a30 brightness2topRightStimulusSignedResidualYaw:(id)a31 brightness2bottomRightStimulusSignedResidualYaw:(id)a32 brightness2bottomStimulusSignedResidualYaw:(id)a33 brightness2bottomLeftStimulusSignedResidualYaw:(id)a34 brightness2topLeftStimulusSignedResidualYaw:(id)a35 brightness3topStimulusSignedResidualYaw:(id)a36 brightness3topRightStimulusSignedResidualYaw:(id)a37 brightness3bottomRightStimulusSignedResidualYaw:(id)a38 brightness3bottomStimulusSignedResidualYaw:(id)a39 brightness3bottomLeftStimulusSignedResidualYaw:(id)a40 brightness3topLeftStimulusSignedResidualYaw:(id)a41 centralStimulusSignedResidualPitch:(id)a42 brightness1topStimulusSignedResidualPitch:(id)a43 brightness1topRightStimulusSignedResidualPitch:(id)a44 brightness1bottomRightStimulusSignedResidualPitch:(id)a45 brightness1bottomStimulusSignedResidualPitch:(id)a46 brightness1bottomLeftStimulusSignedResidualPitch:(id)a47 brightness1topLeftStimulusSignedResidualPitch:(id)a48 brightness2topStimulusSignedResidualPitch:(id)a49 brightness2topRightStimulusSignedResidualPitch:(id)a50 brightness2bottomRightStimulusSignedResidualPitch:(id)a51 brightness2bottomStimulusSignedResidualPitch:(id)a52 brightness2bottomLeftStimulusSignedResidualPitch:(id)a53 brightness2topLeftStimulusSignedResidualPitch:(id)a54 brightness3topStimulusSignedResidualPitch:(id)a55 brightness3topRightStimulusSignedResidualPitch:(id)a56 brightness3bottomRightStimulusSignedResidualPitch:(id)a57 brightness3bottomStimulusSignedResidualPitch:(id)a58 brightness3bottomLeftStimulusSignedResidualPitch:(id)a59 brightness3topLeftStimulusSignedResidualPitch:(id)a60 rxuuid:(id)a61 enrollmentReason:(int)a62
{
  id v131 = a3;
  id v172 = a5;
  id v173 = a6;
  id v171 = a7;
  id v170 = a8;
  id v130 = a11;
  id v168 = a13;
  id v65 = a14;
  id v66 = a15;
  id v67 = a16;
  id v167 = a17;
  id v68 = a18;
  id v69 = a19;
  id v70 = a20;
  id v71 = a23;
  id v72 = a24;
  id v73 = a25;
  id v166 = a26;
  id v165 = a27;
  id v164 = a28;
  id v163 = a29;
  id v162 = a30;
  id v161 = a31;
  id v160 = a32;
  id v159 = a33;
  id v158 = a34;
  id v157 = a35;
  id v156 = a36;
  id v155 = a37;
  id v154 = a38;
  id v153 = a39;
  id v152 = a40;
  id v151 = a41;
  id v150 = a42;
  id v149 = a43;
  id v148 = a44;
  id v147 = a45;
  id v146 = a46;
  id v145 = a47;
  id v144 = a48;
  id v143 = a49;
  id v142 = a50;
  id v141 = a51;
  id v140 = a52;
  id v139 = a53;
  id v138 = a54;
  id v137 = a55;
  id v136 = a56;
  id v135 = a57;
  id v134 = a58;
  id v133 = a59;
  id v132 = a60;
  id v129 = a61;
  v174.receiver = self;
  v174.super_class = (Class)BMGazeEnrollmentSample;
  uint64_t v74 = [(BMEventBase *)&v174 init];

  if (v74)
  {
    v74->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v74->_userProfileId, a3);
    v74->_eyeSide = a4;
    if (v172)
    {
      v74->_hasIsOffline = 1;
      v74->_isOffline = [v172 BOOLValue];
    }
    else
    {
      v74->_hasIsOffline = 0;
      v74->_isOffline = 0;
    }
    if (v173)
    {
      v74->_hasEnrollmentResidual75thPercentile = 1;
      [v173 floatValue];
    }
    else
    {
      v74->_hasEnrollmentResidual75thPercentile = 0;
      float v75 = -1.0;
    }
    v74->_enrollmentResidual75thPercentile = v75;
    if (v171)
    {
      v74->_hasEnrollmentResidual95thPercentile = 1;
      [v171 floatValue];
    }
    else
    {
      v74->_hasEnrollmentResidual95thPercentile = 0;
      float v76 = -1.0;
    }
    v74->_enrollmentResidual95thPercentile = v76;
    if (v170)
    {
      v74->_hasEnrollmentResidualMedian = 1;
      [v170 floatValue];
    }
    else
    {
      v74->_hasEnrollmentResidualMedian = 0;
      float v77 = -1.0;
    }
    v74->_enrollmentResidualMedian = v77;
    v74->_dominantEye = a9;
    v74->_monocularQuality = a10;
    objc_storeStrong((id *)&v74->_enrollmentFailureReasons, a11);
    v74->_binocQuality = a12;
    unsigned int v78 = v168;
    if (v168)
    {
      v74->_hasFixationCount = 1;
      unsigned int v78 = [v168 unsignedIntValue];
    }
    else
    {
      v74->_hasFixationCount = 0;
    }
    v74->_fixationCount = v78;
    if (v65)
    {
      v74->_hasFixationCountLowBrightness = 1;
      unsigned int v79 = [v65 unsignedIntValue];
    }
    else
    {
      unsigned int v79 = 0;
      v74->_hasFixationCountLowBrightness = 0;
    }
    v74->_fixationCountLowBrightness = v79;
    if (v66)
    {
      v74->_hasFixationCountMediumBrightness = 1;
      unsigned int v80 = [v66 unsignedIntValue];
    }
    else
    {
      unsigned int v80 = 0;
      v74->_hasFixationCountMediumBrightness = 0;
    }
    v74->_fixationCountMediumBrightness = v80;
    if (v67)
    {
      v74->_hasFixationCountHighBrightness = 1;
      unsigned int v81 = [v67 unsignedIntValue];
    }
    else
    {
      unsigned int v81 = 0;
      v74->_hasFixationCountHighBrightness = 0;
    }
    v74->_fixationCountHighBrightness = v81;
    unsigned int v82 = v167;
    if (v167)
    {
      v74->_hasStimulusCount = 1;
      unsigned int v82 = [v167 unsignedIntValue];
    }
    else
    {
      v74->_hasStimulusCount = 0;
    }
    v74->_stimulusCount = v82;
    if (v68)
    {
      v74->_hasStimulusCountLowBrightness = 1;
      unsigned int v83 = [v68 unsignedIntValue];
    }
    else
    {
      unsigned int v83 = 0;
      v74->_hasStimulusCountLowBrightness = 0;
    }
    v74->_stimulusCountLowBrightness = v83;
    if (v69)
    {
      v74->_hasStimulusCountMediumBrightness = 1;
      unsigned int v84 = [v69 unsignedIntValue];
    }
    else
    {
      unsigned int v84 = 0;
      v74->_hasStimulusCountMediumBrightness = 0;
    }
    v74->_stimulusCountMediumBrightness = v84;
    if (v70)
    {
      v74->_hasStimulusCountHighBrightness = 1;
      unsigned int v85 = [v70 unsignedIntValue];
    }
    else
    {
      unsigned int v85 = 0;
      v74->_hasStimulusCountHighBrightness = 0;
    }
    v74->_stimulusCountHighBrightness = v85;
    v74->_accessibilityMode = a21;
    v74->_eyeboxStatus = a22;
    if (v71)
    {
      v74->_hasCentralStimulusSignedResidualYaw = 1;
      [v71 floatValue];
    }
    else
    {
      v74->_hasCentralStimulusSignedResidualYaw = 0;
      float v86 = -1.0;
    }
    v74->_centralStimulusSignedResidualYaw = v86;
    if (v72)
    {
      v74->_hasBrightness1topStimulusSignedResidualYaw = 1;
      [v72 floatValue];
    }
    else
    {
      v74->_hasBrightness1topStimulusSignedResidualYaw = 0;
      float v87 = -1.0;
    }
    v74->_brightness1topStimulusSignedResidualYaw = v87;
    if (v73)
    {
      v74->_hasBrightness1topRightStimulusSignedResidualYaw = 1;
      [v73 floatValue];
    }
    else
    {
      v74->_hasBrightness1topRightStimulusSignedResidualYaw = 0;
      float v88 = -1.0;
    }
    v74->_brightness1topRightStimulusSignedResidualYaw = v88;
    if (v166)
    {
      v74->_hasBrightness1bottomRightStimulusSignedResidualYaw = 1;
      [v166 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomRightStimulusSignedResidualYaw = 0;
      float v89 = -1.0;
    }
    v74->_brightness1bottomRightStimulusSignedResidualYaw = v89;
    if (v165)
    {
      v74->_hasBrightness1bottomStimulusSignedResidualYaw = 1;
      [v165 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomStimulusSignedResidualYaw = 0;
      float v90 = -1.0;
    }
    v74->_brightness1bottomStimulusSignedResidualYaw = v90;
    if (v164)
    {
      v74->_hasBrightness1bottomLeftStimulusSignedResidualYaw = 1;
      [v164 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomLeftStimulusSignedResidualYaw = 0;
      float v91 = -1.0;
    }
    v74->_brightness1bottomLeftStimulusSignedResidualYaw = v91;
    if (v163)
    {
      v74->_hasBrightness1topLeftStimulusSignedResidualYaw = 1;
      [v163 floatValue];
    }
    else
    {
      v74->_hasBrightness1topLeftStimulusSignedResidualYaw = 0;
      float v92 = -1.0;
    }
    v74->_brightness1topLeftStimulusSignedResidualYaw = v92;
    if (v162)
    {
      v74->_hasBrightness2topStimulusSignedResidualYaw = 1;
      [v162 floatValue];
    }
    else
    {
      v74->_hasBrightness2topStimulusSignedResidualYaw = 0;
      float v93 = -1.0;
    }
    v74->_brightness2topStimulusSignedResidualYaw = v93;
    if (v161)
    {
      v74->_hasBrightness2topRightStimulusSignedResidualYaw = 1;
      [v161 floatValue];
    }
    else
    {
      v74->_hasBrightness2topRightStimulusSignedResidualYaw = 0;
      float v94 = -1.0;
    }
    v74->_brightness2topRightStimulusSignedResidualYaw = v94;
    if (v160)
    {
      v74->_hasBrightness2bottomRightStimulusSignedResidualYaw = 1;
      [v160 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomRightStimulusSignedResidualYaw = 0;
      float v95 = -1.0;
    }
    v74->_brightness2bottomRightStimulusSignedResidualYaw = v95;
    if (v159)
    {
      v74->_hasBrightness2bottomStimulusSignedResidualYaw = 1;
      [v159 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomStimulusSignedResidualYaw = 0;
      float v96 = -1.0;
    }
    v74->_brightness2bottomStimulusSignedResidualYaw = v96;
    if (v158)
    {
      v74->_hasBrightness2bottomLeftStimulusSignedResidualYaw = 1;
      [v158 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomLeftStimulusSignedResidualYaw = 0;
      float v97 = -1.0;
    }
    v74->_brightness2bottomLeftStimulusSignedResidualYaw = v97;
    if (v157)
    {
      v74->_hasBrightness2topLeftStimulusSignedResidualYaw = 1;
      [v157 floatValue];
    }
    else
    {
      v74->_hasBrightness2topLeftStimulusSignedResidualYaw = 0;
      float v98 = -1.0;
    }
    v74->_brightness2topLeftStimulusSignedResidualYaw = v98;
    if (v156)
    {
      v74->_hasBrightness3topStimulusSignedResidualYaw = 1;
      [v156 floatValue];
    }
    else
    {
      v74->_hasBrightness3topStimulusSignedResidualYaw = 0;
      float v99 = -1.0;
    }
    v74->_brightness3topStimulusSignedResidualYaw = v99;
    if (v155)
    {
      v74->_hasBrightness3topRightStimulusSignedResidualYaw = 1;
      [v155 floatValue];
    }
    else
    {
      v74->_hasBrightness3topRightStimulusSignedResidualYaw = 0;
      float v100 = -1.0;
    }
    v74->_brightness3topRightStimulusSignedResidualYaw = v100;
    if (v154)
    {
      v74->_hasBrightness3bottomRightStimulusSignedResidualYaw = 1;
      [v154 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomRightStimulusSignedResidualYaw = 0;
      float v101 = -1.0;
    }
    v74->_brightness3bottomRightStimulusSignedResidualYaw = v101;
    if (v153)
    {
      v74->_hasBrightness3bottomStimulusSignedResidualYaw = 1;
      [v153 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomStimulusSignedResidualYaw = 0;
      float v102 = -1.0;
    }
    v74->_brightness3bottomStimulusSignedResidualYaw = v102;
    if (v152)
    {
      v74->_hasBrightness3bottomLeftStimulusSignedResidualYaw = 1;
      [v152 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomLeftStimulusSignedResidualYaw = 0;
      float v103 = -1.0;
    }
    v74->_brightness3bottomLeftStimulusSignedResidualYaw = v103;
    if (v151)
    {
      v74->_hasBrightness3topLeftStimulusSignedResidualYaw = 1;
      [v151 floatValue];
    }
    else
    {
      v74->_hasBrightness3topLeftStimulusSignedResidualYaw = 0;
      float v104 = -1.0;
    }
    v74->_brightness3topLeftStimulusSignedResidualYaw = v104;
    if (v150)
    {
      v74->_hasCentralStimulusSignedResidualPitch = 1;
      [v150 floatValue];
    }
    else
    {
      v74->_hasCentralStimulusSignedResidualPitch = 0;
      float v105 = -1.0;
    }
    v74->_centralStimulusSignedResidualPitch = v105;
    if (v149)
    {
      v74->_hasBrightness1topStimulusSignedResidualPitch = 1;
      [v149 floatValue];
    }
    else
    {
      v74->_hasBrightness1topStimulusSignedResidualPitch = 0;
      float v106 = -1.0;
    }
    v74->_brightness1topStimulusSignedResidualPitch = v106;
    if (v148)
    {
      v74->_hasBrightness1topRightStimulusSignedResidualPitch = 1;
      [v148 floatValue];
    }
    else
    {
      v74->_hasBrightness1topRightStimulusSignedResidualPitch = 0;
      float v107 = -1.0;
    }
    v74->_brightness1topRightStimulusSignedResidualPitch = v107;
    if (v147)
    {
      v74->_hasBrightness1bottomRightStimulusSignedResidualPitch = 1;
      [v147 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomRightStimulusSignedResidualPitch = 0;
      float v108 = -1.0;
    }
    v74->_brightness1bottomRightStimulusSignedResidualPitch = v108;
    if (v146)
    {
      v74->_hasBrightness1bottomStimulusSignedResidualPitch = 1;
      [v146 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomStimulusSignedResidualPitch = 0;
      float v109 = -1.0;
    }
    v74->_brightness1bottomStimulusSignedResidualPitch = v109;
    if (v145)
    {
      v74->_hasBrightness1bottomLeftStimulusSignedResidualPitch = 1;
      [v145 floatValue];
    }
    else
    {
      v74->_hasBrightness1bottomLeftStimulusSignedResidualPitch = 0;
      float v110 = -1.0;
    }
    v74->_brightness1bottomLeftStimulusSignedResidualPitch = v110;
    if (v144)
    {
      v74->_hasBrightness1topLeftStimulusSignedResidualPitch = 1;
      [v144 floatValue];
    }
    else
    {
      v74->_hasBrightness1topLeftStimulusSignedResidualPitch = 0;
      float v111 = -1.0;
    }
    v74->_brightness1topLeftStimulusSignedResidualPitch = v111;
    if (v143)
    {
      v74->_hasBrightness2topStimulusSignedResidualPitch = 1;
      [v143 floatValue];
    }
    else
    {
      v74->_hasBrightness2topStimulusSignedResidualPitch = 0;
      float v112 = -1.0;
    }
    v74->_brightness2topStimulusSignedResidualPitch = v112;
    if (v142)
    {
      v74->_hasBrightness2topRightStimulusSignedResidualPitch = 1;
      [v142 floatValue];
    }
    else
    {
      v74->_hasBrightness2topRightStimulusSignedResidualPitch = 0;
      float v113 = -1.0;
    }
    v74->_brightness2topRightStimulusSignedResidualPitch = v113;
    if (v141)
    {
      v74->_hasBrightness2bottomRightStimulusSignedResidualPitch = 1;
      [v141 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomRightStimulusSignedResidualPitch = 0;
      float v114 = -1.0;
    }
    v74->_brightness2bottomRightStimulusSignedResidualPitch = v114;
    if (v140)
    {
      v74->_hasBrightness2bottomStimulusSignedResidualPitch = 1;
      [v140 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomStimulusSignedResidualPitch = 0;
      float v115 = -1.0;
    }
    v74->_brightness2bottomStimulusSignedResidualPitch = v115;
    if (v139)
    {
      v74->_hasBrightness2bottomLeftStimulusSignedResidualPitch = 1;
      [v139 floatValue];
    }
    else
    {
      v74->_hasBrightness2bottomLeftStimulusSignedResidualPitch = 0;
      float v116 = -1.0;
    }
    v74->_brightness2bottomLeftStimulusSignedResidualPitch = v116;
    if (v138)
    {
      v74->_hasBrightness2topLeftStimulusSignedResidualPitch = 1;
      [v138 floatValue];
    }
    else
    {
      v74->_hasBrightness2topLeftStimulusSignedResidualPitch = 0;
      float v117 = -1.0;
    }
    v74->_brightness2topLeftStimulusSignedResidualPitch = v117;
    if (v137)
    {
      v74->_hasBrightness3topStimulusSignedResidualPitch = 1;
      [v137 floatValue];
    }
    else
    {
      v74->_hasBrightness3topStimulusSignedResidualPitch = 0;
      float v118 = -1.0;
    }
    v74->_brightness3topStimulusSignedResidualPitch = v118;
    if (v136)
    {
      v74->_hasBrightness3topRightStimulusSignedResidualPitch = 1;
      [v136 floatValue];
    }
    else
    {
      v74->_hasBrightness3topRightStimulusSignedResidualPitch = 0;
      float v119 = -1.0;
    }
    v74->_brightness3topRightStimulusSignedResidualPitch = v119;
    if (v135)
    {
      v74->_hasBrightness3bottomRightStimulusSignedResidualPitch = 1;
      [v135 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomRightStimulusSignedResidualPitch = 0;
      float v120 = -1.0;
    }
    v74->_brightness3bottomRightStimulusSignedResidualPitch = v120;
    if (v134)
    {
      v74->_hasBrightness3bottomStimulusSignedResidualPitch = 1;
      [v134 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomStimulusSignedResidualPitch = 0;
      float v121 = -1.0;
    }
    v74->_brightness3bottomStimulusSignedResidualPitch = v121;
    if (v133)
    {
      v74->_hasBrightness3bottomLeftStimulusSignedResidualPitch = 1;
      [v133 floatValue];
    }
    else
    {
      v74->_hasBrightness3bottomLeftStimulusSignedResidualPitch = 0;
      float v122 = -1.0;
    }
    v74->_brightness3bottomLeftStimulusSignedResidualPitch = v122;
    if (v132)
    {
      v74->_hasBrightness3topLeftStimulusSignedResidualPitch = 1;
      [v132 floatValue];
    }
    else
    {
      v74->_hasBrightness3topLeftStimulusSignedResidualPitch = 0;
      float v123 = -1.0;
    }
    v74->_brightness3topLeftStimulusSignedResidualPitch = v123;
    objc_storeStrong((id *)&v74->_rxuuid, a61);
    v74->_enrollmentReason = a62;
  }
  char v124 = v74;

  return v124;
}

+ (id)protoFields
{
  v64[60] = *MEMORY[0x1E4F143B8];
  char v63 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userProfileId" number:1 type:13 subMessageClass:0];
  v64[0] = v63;
  unint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eyeSide" number:2 type:4 subMessageClass:0];
  v64[1] = v62;
  uint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isOffline" number:3 type:12 subMessageClass:0];
  v64[2] = v61;
  uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentResidual75thPercentile" number:4 type:1 subMessageClass:0];
  v64[3] = v60;
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentResidual95thPercentile" number:5 type:1 subMessageClass:0];
  v64[4] = v59;
  uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentResidualMedian" number:6 type:1 subMessageClass:0];
  v64[5] = v58;
  unsigned int v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dominantEye" number:7 type:4 subMessageClass:0];
  v64[6] = v57;
  char v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"monocularQuality" number:8 type:4 subMessageClass:0];
  v64[7] = v56;
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentFailureReasons" number:9 type:4 subMessageClass:0];
  v64[8] = v55;
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"binocQuality" number:10 type:4 subMessageClass:0];
  v64[9] = v54;
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fixationCount" number:11 type:4 subMessageClass:0];
  v64[10] = v53;
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fixationCountLowBrightness" number:12 type:4 subMessageClass:0];
  v64[11] = v52;
  unsigned int v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fixationCountMediumBrightness" number:13 type:4 subMessageClass:0];
  v64[12] = v51;
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fixationCountHighBrightness" number:14 type:4 subMessageClass:0];
  v64[13] = v50;
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stimulusCount" number:15 type:4 subMessageClass:0];
  v64[14] = v49;
  unint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stimulusCountLowBrightness" number:16 type:4 subMessageClass:0];
  v64[15] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stimulusCountMediumBrightness" number:17 type:4 subMessageClass:0];
  v64[16] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stimulusCountHighBrightness" number:18 type:4 subMessageClass:0];
  v64[17] = v46;
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accessibilityMode" number:19 type:4 subMessageClass:0];
  v64[18] = v45;
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eyeboxStatus" number:20 type:4 subMessageClass:0];
  v64[19] = v44;
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"centralStimulusSignedResidualYaw" number:21 type:1 subMessageClass:0];
  v64[20] = v43;
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topStimulusSignedResidualYaw" number:22 type:1 subMessageClass:0];
  v64[21] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topRightStimulusSignedResidualYaw" number:23 type:1 subMessageClass:0];
  v64[22] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomRightStimulusSignedResidualYaw" number:24 type:1 subMessageClass:0];
  v64[23] = v40;
  int v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomStimulusSignedResidualYaw" number:25 type:1 subMessageClass:0];
  v64[24] = v39;
  unint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomLeftStimulusSignedResidualYaw" number:26 type:1 subMessageClass:0];
  v64[25] = v38;
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topLeftStimulusSignedResidualYaw" number:27 type:1 subMessageClass:0];
  v64[26] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topStimulusSignedResidualYaw" number:28 type:1 subMessageClass:0];
  v64[27] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topRightStimulusSignedResidualYaw" number:29 type:1 subMessageClass:0];
  v64[28] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomRightStimulusSignedResidualYaw" number:30 type:1 subMessageClass:0];
  v64[29] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomStimulusSignedResidualYaw" number:31 type:1 subMessageClass:0];
  v64[30] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomLeftStimulusSignedResidualYaw" number:32 type:1 subMessageClass:0];
  v64[31] = v32;
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topLeftStimulusSignedResidualYaw" number:33 type:1 subMessageClass:0];
  v64[32] = v31;
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topStimulusSignedResidualYaw" number:34 type:1 subMessageClass:0];
  v64[33] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topRightStimulusSignedResidualYaw" number:35 type:1 subMessageClass:0];
  v64[34] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomRightStimulusSignedResidualYaw" number:36 type:1 subMessageClass:0];
  v64[35] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomStimulusSignedResidualYaw" number:37 type:1 subMessageClass:0];
  v64[36] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomLeftStimulusSignedResidualYaw" number:38 type:1 subMessageClass:0];
  v64[37] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topLeftStimulusSignedResidualYaw" number:39 type:1 subMessageClass:0];
  v64[38] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"centralStimulusSignedResidualPitch" number:40 type:1 subMessageClass:0];
  v64[39] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topStimulusSignedResidualPitch" number:41 type:1 subMessageClass:0];
  v64[40] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topRightStimulusSignedResidualPitch" number:42 type:1 subMessageClass:0];
  v64[41] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomRightStimulusSignedResidualPitch" number:43 type:1 subMessageClass:0];
  v64[42] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomStimulusSignedResidualPitch" number:44 type:1 subMessageClass:0];
  v64[43] = v20;
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1bottomLeftStimulusSignedResidualPitch" number:45 type:1 subMessageClass:0];
  v64[44] = v19;
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness1topLeftStimulusSignedResidualPitch" number:46 type:1 subMessageClass:0];
  v64[45] = v18;
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topStimulusSignedResidualPitch" number:47 type:1 subMessageClass:0];
  v64[46] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topRightStimulusSignedResidualPitch" number:48 type:1 subMessageClass:0];
  v64[47] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomRightStimulusSignedResidualPitch" number:49 type:1 subMessageClass:0];
  v64[48] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomStimulusSignedResidualPitch" number:50 type:1 subMessageClass:0];
  v64[49] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2bottomLeftStimulusSignedResidualPitch" number:51 type:1 subMessageClass:0];
  v64[50] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness2topLeftStimulusSignedResidualPitch" number:52 type:1 subMessageClass:0];
  v64[51] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topStimulusSignedResidualPitch" number:53 type:1 subMessageClass:0];
  v64[52] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topRightStimulusSignedResidualPitch" number:54 type:1 subMessageClass:0];
  v64[53] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomRightStimulusSignedResidualPitch" number:55 type:1 subMessageClass:0];
  v64[54] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomStimulusSignedResidualPitch" number:56 type:1 subMessageClass:0];
  v64[55] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3bottomLeftStimulusSignedResidualPitch" number:57 type:1 subMessageClass:0];
  v64[56] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightness3topLeftStimulusSignedResidualPitch" number:58 type:1 subMessageClass:0];
  v64[57] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rxuuid" number:59 type:13 subMessageClass:0];
  v64[58] = v10;
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentReason" number:60 type:4 subMessageClass:0];
  v64[59] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:60];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7698;
}

+ (id)columns
{
  v64[60] = *MEMORY[0x1E4F143B8];
  char v63 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userProfileId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eyeSide" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isOffline" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enrollmentResidual75thPercentile" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:1 convertedType:0];
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enrollmentResidual95thPercentile" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enrollmentResidualMedian" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  char v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dominantEye" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  unsigned int v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"monocularQuality" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"enrollmentFailureReasons_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_429];
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"binocQuality" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fixationCount" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fixationCountLowBrightness" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  unsigned int v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fixationCountMediumBrightness" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fixationCountHighBrightness" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stimulusCount" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  unint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stimulusCountLowBrightness" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stimulusCountMediumBrightness" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stimulusCountHighBrightness" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accessibilityMode" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eyeboxStatus" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"centralStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:21 protoDataType:1 convertedType:0];
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:22 protoDataType:1 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:23 protoDataType:1 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:1 convertedType:0];
  int v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:25 protoDataType:1 convertedType:0];
  unint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:26 protoDataType:1 convertedType:0];
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:27 protoDataType:1 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:28 protoDataType:1 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:29 protoDataType:1 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:30 protoDataType:1 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:31 protoDataType:1 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:32 protoDataType:1 convertedType:0];
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:33 protoDataType:1 convertedType:0];
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:34 protoDataType:1 convertedType:0];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:35 protoDataType:1 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomRightStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:36 protoDataType:1 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:37 protoDataType:1 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:38 protoDataType:1 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topLeftStimulusSignedResidualYaw" dataType:1 requestOnly:0 fieldNumber:39 protoDataType:1 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"centralStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:40 protoDataType:1 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:41 protoDataType:1 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:42 protoDataType:1 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:43 protoDataType:1 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:44 protoDataType:1 convertedType:0];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1bottomLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:45 protoDataType:1 convertedType:0];
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness1topLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:46 protoDataType:1 convertedType:0];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:47 protoDataType:1 convertedType:0];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:48 protoDataType:1 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:49 protoDataType:1 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:50 protoDataType:1 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2bottomLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:51 protoDataType:1 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness2topLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:52 protoDataType:1 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:53 protoDataType:1 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:54 protoDataType:1 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomRightStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:55 protoDataType:1 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:56 protoDataType:1 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3bottomLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:57 protoDataType:1 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightness3topLeftStimulusSignedResidualPitch" dataType:1 requestOnly:0 fieldNumber:58 protoDataType:1 convertedType:0];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rxuuid" dataType:2 requestOnly:0 fieldNumber:59 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enrollmentReason" dataType:0 requestOnly:0 fieldNumber:60 protoDataType:4 convertedType:0];
  v64[0] = v63;
  v64[1] = v62;
  v64[2] = v61;
  v64[3] = v60;
  v64[4] = v59;
  v64[5] = v58;
  v64[6] = v56;
  v64[7] = v57;
  v64[8] = v54;
  v64[9] = v55;
  v64[10] = v53;
  v64[11] = v52;
  v64[12] = v51;
  v64[13] = v50;
  v64[14] = v49;
  v64[15] = v48;
  v64[16] = v47;
  v64[17] = v46;
  v64[18] = v45;
  v64[19] = v44;
  v64[20] = v43;
  v64[21] = v42;
  v64[22] = v41;
  v64[23] = v40;
  v64[24] = v39;
  v64[25] = v38;
  v64[26] = v37;
  v64[27] = v36;
  v64[28] = v35;
  v64[29] = v34;
  v64[30] = v33;
  v64[31] = v32;
  v64[32] = v31;
  v64[33] = v30;
  v64[34] = v29;
  v64[35] = v28;
  v64[36] = v27;
  v64[37] = v26;
  v64[38] = v25;
  v64[39] = v24;
  v64[40] = v23;
  v64[41] = v22;
  v64[42] = v21;
  v64[43] = v20;
  v64[44] = v19;
  v64[45] = v18;
  v64[46] = v17;
  v64[47] = v16;
  v64[48] = v15;
  v64[49] = v14;
  v64[50] = v2;
  v64[51] = v3;
  v64[52] = v4;
  v64[53] = v5;
  v64[54] = v6;
  v64[55] = v7;
  v64[56] = v8;
  v64[57] = v13;
  v64[58] = v12;
  v64[59] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:60];

  return v11;
}

id __33__BMGazeEnrollmentSample_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _enrollmentFailureReasonsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMGazeEnrollmentSample alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[17] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end