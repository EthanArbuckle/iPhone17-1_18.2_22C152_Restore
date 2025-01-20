@interface ATXModeConfigurationUIFlowMetric
- (NSString)modeConfigurationUI;
- (NSString)modeSemanticType;
- (NSString)modeUUID;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numAppsAdded;
- (unint64_t)numAppsRemoved;
- (unint64_t)numAppsSuggested;
- (unint64_t)numContactsAdded;
- (unint64_t)numContactsRemoved;
- (unint64_t)numContactsSuggested;
- (unint64_t)numExistingAllowedApps;
- (unint64_t)numExistingAllowedContacts;
- (unint64_t)numSuggestedAppsAdded;
- (unint64_t)numSuggestedAppsRemoved;
- (unint64_t)numSuggestedContactsAdded;
- (unint64_t)numSuggestedContactsRemoved;
- (void)setModeConfigurationUI:(id)a3;
- (void)setModeSemanticType:(id)a3;
- (void)setModeUUID:(id)a3;
- (void)setNumAppsAdded:(unint64_t)a3;
- (void)setNumAppsRemoved:(unint64_t)a3;
- (void)setNumAppsSuggested:(unint64_t)a3;
- (void)setNumContactsAdded:(unint64_t)a3;
- (void)setNumContactsRemoved:(unint64_t)a3;
- (void)setNumContactsSuggested:(unint64_t)a3;
- (void)setNumExistingAllowedApps:(unint64_t)a3;
- (void)setNumExistingAllowedContacts:(unint64_t)a3;
- (void)setNumSuggestedAppsAdded:(unint64_t)a3;
- (void)setNumSuggestedAppsRemoved:(unint64_t)a3;
- (void)setNumSuggestedContactsAdded:(unint64_t)a3;
- (void)setNumSuggestedContactsRemoved:(unint64_t)a3;
@end

@implementation ATXModeConfigurationUIFlowMetric

- (id)metricName
{
  return @"com.apple.ModeConfiguration.ConfigurationEvent";
}

- (id)coreAnalyticsDictionary
{
  v26[15] = *MEMORY[0x1E4F143B8];
  v25[0] = @"stableModeID";
  v24 = [(ATXModeConfigurationUIFlowMetric *)self modeUUID];
  if (v24)
  {
    v23 = [(ATXModeConfigurationUIFlowMetric *)self modeUUID];
    uint64_t v3 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
    v23 = (void *)v3;
  }
  v17 = (void *)v3;
  v26[0] = v3;
  v25[1] = @"modeSemanticType";
  uint64_t v4 = [(ATXModeConfigurationUIFlowMetric *)self modeSemanticType];
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)v4;
  v26[1] = v4;
  v25[2] = @"modeConfigurationUI";
  v22 = [(ATXModeConfigurationUIFlowMetric *)self modeConfigurationUI];
  v26[2] = v22;
  v25[3] = @"numAppsAdded";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsAdded](self, "numAppsAdded"));
  v26[3] = v21;
  v25[4] = @"numAppsRemoved";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsRemoved](self, "numAppsRemoved"));
  v26[4] = v20;
  v25[5] = @"numAppsSuggested";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsSuggested](self, "numAppsSuggested"));
  v26[5] = v19;
  v25[6] = @"numExistingAllowedApps";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numExistingAllowedApps](self, "numExistingAllowedApps"));
  v26[6] = v18;
  v25[7] = @"numSuggestedAppsAdded";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedAppsAdded](self, "numSuggestedAppsAdded"));
  v26[7] = v6;
  v25[8] = @"numSuggestedAppsRemoved";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedAppsRemoved](self, "numSuggestedAppsRemoved"));
  v26[8] = v7;
  v25[9] = @"numContactsAdded";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsAdded](self, "numContactsAdded"));
  v26[9] = v8;
  v25[10] = @"numContactsRemoved";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsRemoved](self, "numContactsRemoved"));
  v26[10] = v9;
  v25[11] = @"numContactsSuggested";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsSuggested](self, "numContactsSuggested"));
  v26[11] = v10;
  v25[12] = @"numExistingAllowedContacts";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numExistingAllowedContacts](self, "numExistingAllowedContacts"));
  v26[12] = v11;
  v25[13] = @"numSuggestedContactsAdded";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedContactsAdded](self, "numSuggestedContactsAdded"));
  v26[13] = v12;
  v25[14] = @"numSuggestedContactsRemoved";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedContactsRemoved](self, "numSuggestedContactsRemoved"));
  v26[14] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:15];

  if (!v5) {
  if (v24)
  }

  return v14;
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
}

- (NSString)modeConfigurationUI
{
  return self->_modeConfigurationUI;
}

- (void)setModeConfigurationUI:(id)a3
{
}

- (unint64_t)numAppsAdded
{
  return self->_numAppsAdded;
}

- (void)setNumAppsAdded:(unint64_t)a3
{
  self->_numAppsAdded = a3;
}

- (unint64_t)numAppsRemoved
{
  return self->_numAppsRemoved;
}

- (void)setNumAppsRemoved:(unint64_t)a3
{
  self->_numAppsRemoved = a3;
}

- (unint64_t)numAppsSuggested
{
  return self->_numAppsSuggested;
}

- (void)setNumAppsSuggested:(unint64_t)a3
{
  self->_numAppsSuggested = a3;
}

- (unint64_t)numExistingAllowedApps
{
  return self->_numExistingAllowedApps;
}

- (void)setNumExistingAllowedApps:(unint64_t)a3
{
  self->_numExistingAllowedApps = a3;
}

- (unint64_t)numSuggestedAppsAdded
{
  return self->_numSuggestedAppsAdded;
}

- (void)setNumSuggestedAppsAdded:(unint64_t)a3
{
  self->_numSuggestedAppsAdded = a3;
}

- (unint64_t)numSuggestedAppsRemoved
{
  return self->_numSuggestedAppsRemoved;
}

- (void)setNumSuggestedAppsRemoved:(unint64_t)a3
{
  self->_numSuggestedAppsRemoved = a3;
}

- (unint64_t)numContactsAdded
{
  return self->_numContactsAdded;
}

- (void)setNumContactsAdded:(unint64_t)a3
{
  self->_numContactsAdded = a3;
}

- (unint64_t)numContactsRemoved
{
  return self->_numContactsRemoved;
}

- (void)setNumContactsRemoved:(unint64_t)a3
{
  self->_numContactsRemoved = a3;
}

- (unint64_t)numContactsSuggested
{
  return self->_numContactsSuggested;
}

- (void)setNumContactsSuggested:(unint64_t)a3
{
  self->_numContactsSuggested = a3;
}

- (unint64_t)numExistingAllowedContacts
{
  return self->_numExistingAllowedContacts;
}

- (void)setNumExistingAllowedContacts:(unint64_t)a3
{
  self->_numExistingAllowedContacts = a3;
}

- (unint64_t)numSuggestedContactsAdded
{
  return self->_numSuggestedContactsAdded;
}

- (void)setNumSuggestedContactsAdded:(unint64_t)a3
{
  self->_numSuggestedContactsAdded = a3;
}

- (unint64_t)numSuggestedContactsRemoved
{
  return self->_numSuggestedContactsRemoved;
}

- (void)setNumSuggestedContactsRemoved:(unint64_t)a3
{
  self->_numSuggestedContactsRemoved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationUI, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
}

@end