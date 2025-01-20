@interface SGMITrialClientWrapperGuardedData
@end

@implementation SGMITrialClientWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratioToConsiderATokenAsExtremelyDiscriminant, 0);
  objc_storeStrong((id *)&self->_minCountToConsiderATokenAsExtremelyDiscriminant, 0);
  objc_storeStrong((id *)&self->_ratioToConsiderATokenAsHighlyDiscriminant, 0);
  objc_storeStrong((id *)&self->_minCountToConsiderATokenAsHighlyDiscriminant, 0);
  objc_storeStrong((id *)&self->_bodyAnalysisSamplingFactor, 0);
  objc_storeStrong((id *)&self->_followUpWarningsParameters, 0);
  objc_storeStrong((id *)&self->_followUpOnIncomingMailsDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsAsksDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsQuestionsDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_defaultTimeIntervalForAWarning, 0);
  objc_storeStrong((id *)&self->_defaultTimeIntervalToStartWarningExposition, 0);
  objc_storeStrong((id *)&self->_nicknameDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_recipientDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_recipientConservativeDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_conservativeRecipientDetection, 0);
  objc_storeStrong((id *)&self->_attachmentLinkDetection, 0);
  objc_storeStrong((id *)&self->_attachmentDetectionRegexes, 0);
  objc_storeStrong((id *)&self->_classificationOfflineRecall, 0);
  objc_storeStrong((id *)&self->_classificationOfflinePrecision, 0);
  objc_storeStrong((id *)&self->_classificationThreshold, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideOutputs, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideFeatureUpperBounds, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideFeatureLowerBounds, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideFeatureNames, 0);
  objc_storeStrong((id *)&self->_modelGroundTruthOutputs, 0);
  objc_storeStrong((id *)&self->_modelGroundTruthFeatureUpperBounds, 0);
  objc_storeStrong((id *)&self->_modelGroundTruthFeatureLowerBounds, 0);
  objc_storeStrong((id *)&self->_modelGroundTruthFeatureNames, 0);
  objc_storeStrong((id *)&self->_modelFeatureStandardizationStandardDeviations, 0);
  objc_storeStrong((id *)&self->_modelFeatureStandardizationMeans, 0);
  objc_storeStrong((id *)&self->_modelFeatureNames, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_modelInferenceVersion, 0);
  objc_storeStrong((id *)&self->_modelGroundTruthVersion, 0);
  objc_storeStrong((id *)&self->_signatureStatsLogging, 0);
  objc_storeStrong((id *)&self->_isDNUOnlyEnablement, 0);
  objc_storeStrong((id *)&self->_isEnabled, 0);
}

@end