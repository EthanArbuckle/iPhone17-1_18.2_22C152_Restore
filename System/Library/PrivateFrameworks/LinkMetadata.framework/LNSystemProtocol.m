@interface LNSystemProtocol
+ (BOOL)supportsSecureCoding;
+ (LNSystemProtocol)assistantIntentProtocol;
+ (LNSystemProtocol)assistantInvocableIntentProtocol;
+ (LNSystemProtocol)audioRecordingProtocol;
+ (LNSystemProtocol)audioStartingProtocol;
+ (LNSystemProtocol)cameraCaptureProtocol;
+ (LNSystemProtocol)cancelProtocol;
+ (LNSystemProtocol)changeBinarySettingSystemProtocol;
+ (LNSystemProtocol)closeEntityProtocol;
+ (LNSystemProtocol)conditionallyEnabledProtocol;
+ (LNSystemProtocol)controlConfigurationProtocol;
+ (LNSystemProtocol)copyEntityProtocol;
+ (LNSystemProtocol)copySystemProtocol;
+ (LNSystemProtocol)createEntitySystemProtocol;
+ (LNSystemProtocol)cutEntityProtocol;
+ (LNSystemProtocol)cutSystemProtocol;
+ (LNSystemProtocol)deleteEntitySystemProtocol;
+ (LNSystemProtocol)duplicateEntitySystemProtocol;
+ (LNSystemProtocol)enterMarkupProtocol;
+ (LNSystemProtocol)entityUpdatingProtocol;
+ (LNSystemProtocol)exitMarkupProtocol;
+ (LNSystemProtocol)favoriteEntityProtocol;
+ (LNSystemProtocol)focusConfigurationProtocol;
+ (LNSystemProtocol)foregroundContinuableProtocol;
+ (LNSystemProtocol)moveSpatialProtocol;
+ (LNSystemProtocol)navigateSequentiallyProtocol;
+ (LNSystemProtocol)openEntitySystemProtocol;
+ (LNSystemProtocol)pasteSystemProtocol;
+ (LNSystemProtocol)pauseWorkoutProtocol;
+ (LNSystemProtocol)playVideoProtocol;
+ (LNSystemProtocol)previewEntityProtocol;
+ (LNSystemProtocol)progressReportingProtocol;
+ (LNSystemProtocol)propertyUpdaterProtocol;
+ (LNSystemProtocol)protocolWithIdentifier:(id)a3;
+ (LNSystemProtocol)pushToTalkTransmissionProtocol;
+ (LNSystemProtocol)putEntityInContainerProtocol;
+ (LNSystemProtocol)requiresMDMChecksProtocol;
+ (LNSystemProtocol)resizeProtocol;
+ (LNSystemProtocol)resumeWorkoutProtocol;
+ (LNSystemProtocol)saveEntitySystemProtocol;
+ (LNSystemProtocol)scrollProtocol;
+ (LNSystemProtocol)searchSystemProtocol;
+ (LNSystemProtocol)sendMailProtocol;
+ (LNSystemProtocol)sessionStartingProtocol;
+ (LNSystemProtocol)setMailMessageIsReadProtocol;
+ (LNSystemProtocol)setValueProtocol;
+ (LNSystemProtocol)showInAppSearchResultsProtocol;
+ (LNSystemProtocol)showInAppStringSearchResultsProtocol;
+ (LNSystemProtocol)showSearchResultsInAppProtocol;
+ (LNSystemProtocol)showStringSearchResultsInAppProtocol;
+ (LNSystemProtocol)staccatoLongPressProtocol;
+ (LNSystemProtocol)startDiveProtocol;
+ (LNSystemProtocol)startWorkoutProtocol;
+ (LNSystemProtocol)stingProtocol;
+ (LNSystemProtocol)systemFrameworkProtocol;
+ (LNSystemProtocol)toggleProtocol;
+ (LNSystemProtocol)undoSystemProtocol;
+ (LNSystemProtocol)undoableProtocol;
+ (LNSystemProtocol)urlRepresentableProtocol;
+ (LNSystemProtocol)widgetConfigurationProtocol;
+ (LNSystemProtocol)xpcListenerProtocol;
+ (LNSystemProtocol)zoomProtocol;
+ (NSArray)allProtocols;
+ (id)allProtocolsByIdentifier;
+ (id)ofKind:(int64_t)a3;
+ (id)parametersForProtocolWithIdentifier:(id)a3;
+ (id)protocolOrNilWithIdentifier:(id)a3;
+ (id)sendMessageProtocol;
+ (id)systemProtocolKindsByIdentifier;
- (BOOL)isEqual:(id)a3;
- (LNSystemProtocol)initWithCoder:(id)a3;
- (LNSystemProtocol)initWithIdentifier:(id)a3 parameters:(id)a4;
- (NSDictionary)parameters;
- (NSString)defaultActionIdentifier;
- (NSString)identifier;
- (NSString)typeName;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSystemProtocol

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNSystemProtocol *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNSystemProtocol *)self identifier];
      v8 = [(LNSystemProtocol *)v6 identifier];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(LNSystemProtocol *)self parameters];
        v10 = [(LNSystemProtocol *)v6 parameters];
        id v11 = v9;
        id v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {
          char v14 = 1;
        }
        else
        {
          char v14 = 0;
          if (v11 && v12) {
            char v14 = [v11 isEqualToDictionary:v12];
          }
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (LNSystemProtocol)audioRecordingProtocol
{
  if (audioRecordingProtocol_onceToken != -1) {
    dispatch_once(&audioRecordingProtocol_onceToken, &__block_literal_global_180);
  }
  v2 = (void *)audioRecordingProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __46__LNSystemProtocol_focusConfigurationProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.FocusConfiguration"];
  v1 = (void *)focusConfigurationProtocol_value;
  focusConfigurationProtocol_value = v0;
}

+ (id)protocolOrNilWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LNSystemProtocol.m", 478, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v6 = [a1 allProtocolsByIdentifier];
  v7 = [v6 valueForKey:v5];

  if (!v7)
  {
    v8 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_19C9AD000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid LN_TYPE(SystemProtocolIdentifier)", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)allProtocolsByIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__LNSystemProtocol_allProtocolsByIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allProtocolsByIdentifier_onceToken_7661 != -1) {
    dispatch_once(&allProtocolsByIdentifier_onceToken_7661, block);
  }
  id v2 = (void *)allProtocolsByIdentifier_protocolsByIdentifier_7662;
  return v2;
}

+ (LNSystemProtocol)audioStartingProtocol
{
  if (audioStartingProtocol_onceToken[0] != -1) {
    dispatch_once(audioStartingProtocol_onceToken, &__block_literal_global_7665);
  }
  id v2 = (void *)audioStartingProtocol_value;
  return (LNSystemProtocol *)v2;
}

+ (LNSystemProtocol)cameraCaptureProtocol
{
  if (cameraCaptureProtocol_onceToken != -1) {
    dispatch_once(&cameraCaptureProtocol_onceToken, &__block_literal_global_296);
  }
  id v2 = (void *)cameraCaptureProtocol_value;
  return (LNSystemProtocol *)v2;
}

- (LNSystemProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parameters"];

  if (v9)
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    if (v10)
    {
      self = [(LNSystemProtocol *)self initWithIdentifier:v10 parameters:v9];
      id v11 = self;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __44__LNSystemProtocol_allProtocolsByIdentifier__block_invoke()
{
  v183[60] = *MEMORY[0x1E4F143B8];
  v182[0] = @"com.apple.link.systemProtocol.AudioRecording";
  uint64_t v0 = [LNSystemProtocol alloc];
  v181 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.AudioRecording"];
  v180 = [(LNSystemProtocol *)v0 initWithIdentifier:@"com.apple.link.systemProtocol.AudioRecording" parameters:v181];
  v183[0] = v180;
  v182[1] = @"com.apple.link.systemProtocol.AudioStarting";
  v1 = [LNSystemProtocol alloc];
  v179 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.AudioStarting"];
  v178 = [(LNSystemProtocol *)v1 initWithIdentifier:@"com.apple.link.systemProtocol.AudioStarting" parameters:v179];
  v183[1] = v178;
  v182[2] = @"com.apple.link.systemProtocol.Cancel";
  id v2 = [LNSystemProtocol alloc];
  v177 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Cancel"];
  v176 = [(LNSystemProtocol *)v2 initWithIdentifier:@"com.apple.link.systemProtocol.Cancel" parameters:v177];
  v183[2] = v176;
  v182[3] = @"com.apple.link.systemProtocol.ChangeBinarySetting";
  v3 = [LNSystemProtocol alloc];
  v175 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ChangeBinarySetting"];
  v174 = [(LNSystemProtocol *)v3 initWithIdentifier:@"com.apple.link.systemProtocol.ChangeBinarySetting" parameters:v175];
  v183[3] = v174;
  v182[4] = @"com.apple.link.systemProtocol.CloseEntity";
  id v4 = [LNSystemProtocol alloc];
  v173 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.CloseEntity"];
  v172 = [(LNSystemProtocol *)v4 initWithIdentifier:@"com.apple.link.systemProtocol.CloseEntity" parameters:v173];
  v183[4] = v172;
  v182[5] = @"com.apple.link.systemProtocol.ConditionallyEnabled";
  id v5 = [LNSystemProtocol alloc];
  v171 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ConditionallyEnabled"];
  v170 = [(LNSystemProtocol *)v5 initWithIdentifier:@"com.apple.link.systemProtocol.ConditionallyEnabled" parameters:v171];
  v183[5] = v170;
  v182[6] = @"com.apple.link.systemProtocol.ControlConfiguration";
  uint64_t v6 = [LNSystemProtocol alloc];
  v169 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ControlConfiguration"];
  v168 = [(LNSystemProtocol *)v6 initWithIdentifier:@"com.apple.link.systemProtocol.ControlConfiguration" parameters:v169];
  v183[6] = v168;
  v182[7] = @"com.apple.link.systemProtocol.Copy";
  uint64_t v7 = [LNSystemProtocol alloc];
  v167 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Copy"];
  v166 = [(LNSystemProtocol *)v7 initWithIdentifier:@"com.apple.link.systemProtocol.Copy" parameters:v167];
  v183[7] = v166;
  v182[8] = @"com.apple.link.systemProtocol.CopyEntity";
  v8 = [LNSystemProtocol alloc];
  v165 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.CopyEntity"];
  v164 = [(LNSystemProtocol *)v8 initWithIdentifier:@"com.apple.link.systemProtocol.CopyEntity" parameters:v165];
  v183[8] = v164;
  v182[9] = @"com.apple.link.systemProtocol.CreateEntity";
  v9 = [LNSystemProtocol alloc];
  v163 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.CreateEntity"];
  v162 = [(LNSystemProtocol *)v9 initWithIdentifier:@"com.apple.link.systemProtocol.CreateEntity" parameters:v163];
  v183[9] = v162;
  v182[10] = @"com.apple.link.systemProtocol.Cut";
  v10 = [LNSystemProtocol alloc];
  v161 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Cut"];
  v160 = [(LNSystemProtocol *)v10 initWithIdentifier:@"com.apple.link.systemProtocol.Cut" parameters:v161];
  v183[10] = v160;
  v182[11] = @"com.apple.link.systemProtocol.CutEntity";
  id v11 = [LNSystemProtocol alloc];
  v159 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.CutEntity"];
  v158 = [(LNSystemProtocol *)v11 initWithIdentifier:@"com.apple.link.systemProtocol.CutEntity" parameters:v159];
  v183[11] = v158;
  v182[12] = @"com.apple.link.systemProtocol.DeleteEntity";
  id v12 = [LNSystemProtocol alloc];
  v157 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.DeleteEntity"];
  v156 = [(LNSystemProtocol *)v12 initWithIdentifier:@"com.apple.link.systemProtocol.DeleteEntity" parameters:v157];
  v183[12] = v156;
  v182[13] = @"com.apple.link.systemProtocol.DuplicateEntity";
  uint64_t v13 = [LNSystemProtocol alloc];
  v155 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.DuplicateEntity"];
  v154 = [(LNSystemProtocol *)v13 initWithIdentifier:@"com.apple.link.systemProtocol.DuplicateEntity" parameters:v155];
  v183[13] = v154;
  v182[14] = @"com.apple.link.systemProtocol.EnterMarkup";
  char v14 = [LNSystemProtocol alloc];
  v153 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.EnterMarkup"];
  v152 = [(LNSystemProtocol *)v14 initWithIdentifier:@"com.apple.link.systemProtocol.EnterMarkup" parameters:v153];
  v183[14] = v152;
  v182[15] = @"com.apple.link.systemProtocol.EntityUpdating";
  v15 = [LNSystemProtocol alloc];
  v151 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.EntityUpdating"];
  v150 = [(LNSystemProtocol *)v15 initWithIdentifier:@"com.apple.link.systemProtocol.EntityUpdating" parameters:v151];
  v183[15] = v150;
  v182[16] = @"com.apple.link.systemProtocol.ExitMarkup";
  v16 = [LNSystemProtocol alloc];
  v149 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ExitMarkup"];
  v148 = [(LNSystemProtocol *)v16 initWithIdentifier:@"com.apple.link.systemProtocol.ExitMarkup" parameters:v149];
  v183[16] = v148;
  v182[17] = @"com.apple.link.systemProtocol.FavoriteEntity";
  v17 = [LNSystemProtocol alloc];
  v147 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.FavoriteEntity"];
  v146 = [(LNSystemProtocol *)v17 initWithIdentifier:@"com.apple.link.systemProtocol.FavoriteEntity" parameters:v147];
  v183[17] = v146;
  v182[18] = @"com.apple.link.systemProtocol.FocusConfiguration";
  v18 = [LNSystemProtocol alloc];
  v145 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.FocusConfiguration"];
  v144 = [(LNSystemProtocol *)v18 initWithIdentifier:@"com.apple.link.systemProtocol.FocusConfiguration" parameters:v145];
  v183[18] = v144;
  v182[19] = @"com.apple.link.systemProtocol.ForegroundContinuable";
  v19 = [LNSystemProtocol alloc];
  v143 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ForegroundContinuable"];
  v142 = [(LNSystemProtocol *)v19 initWithIdentifier:@"com.apple.link.systemProtocol.ForegroundContinuable" parameters:v143];
  v183[19] = v142;
  v182[20] = @"com.apple.link.systemProtocol.MoveSpatial";
  v20 = [LNSystemProtocol alloc];
  v141 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.MoveSpatial"];
  v140 = [(LNSystemProtocol *)v20 initWithIdentifier:@"com.apple.link.systemProtocol.MoveSpatial" parameters:v141];
  v183[20] = v140;
  v182[21] = @"com.apple.link.systemProtocol.NavigateSequentially";
  v21 = [LNSystemProtocol alloc];
  v139 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.NavigateSequentially"];
  v138 = [(LNSystemProtocol *)v21 initWithIdentifier:@"com.apple.link.systemProtocol.NavigateSequentially" parameters:v139];
  v183[21] = v138;
  v182[22] = @"com.apple.link.systemProtocol.OpenEntity";
  v22 = [LNSystemProtocol alloc];
  v137 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.OpenEntity"];
  v136 = [(LNSystemProtocol *)v22 initWithIdentifier:@"com.apple.link.systemProtocol.OpenEntity" parameters:v137];
  v183[22] = v136;
  v182[23] = @"com.apple.link.systemProtocol.Paste";
  v23 = [LNSystemProtocol alloc];
  v135 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Paste"];
  v134 = [(LNSystemProtocol *)v23 initWithIdentifier:@"com.apple.link.systemProtocol.Paste" parameters:v135];
  v183[23] = v134;
  v182[24] = @"com.apple.link.systemProtocol.PauseWorkout";
  v24 = [LNSystemProtocol alloc];
  v133 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PauseWorkout"];
  v132 = [(LNSystemProtocol *)v24 initWithIdentifier:@"com.apple.link.systemProtocol.PauseWorkout" parameters:v133];
  v183[24] = v132;
  v182[25] = @"com.apple.link.systemProtocol.ProgressReporting";
  v25 = [LNSystemProtocol alloc];
  v131 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ProgressReporting"];
  v130 = [(LNSystemProtocol *)v25 initWithIdentifier:@"com.apple.link.systemProtocol.ProgressReporting" parameters:v131];
  v183[25] = v130;
  v182[26] = @"com.apple.link.systemProtocol.PreviewEntity";
  v26 = [LNSystemProtocol alloc];
  v129 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PreviewEntity"];
  v128 = [(LNSystemProtocol *)v26 initWithIdentifier:@"com.apple.link.systemProtocol.PreviewEntity" parameters:v129];
  v183[26] = v128;
  v182[27] = @"com.apple.link.systemProtocol.PropertyUpdater";
  v27 = [LNSystemProtocol alloc];
  v127 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PropertyUpdater"];
  v126 = [(LNSystemProtocol *)v27 initWithIdentifier:@"com.apple.link.systemProtocol.PropertyUpdater" parameters:v127];
  v183[27] = v126;
  v182[28] = @"com.apple.link.systemProtocol.PushToTalkTransmission";
  v28 = [LNSystemProtocol alloc];
  v125 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PushToTalkTransmission"];
  v124 = [(LNSystemProtocol *)v28 initWithIdentifier:@"com.apple.link.systemProtocol.PushToTalkTransmission" parameters:v125];
  v183[28] = v124;
  v182[29] = @"com.apple.link.systemProtocol.PutEntityInContainer";
  v29 = [LNSystemProtocol alloc];
  v123 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PutEntityInContainer"];
  v122 = [(LNSystemProtocol *)v29 initWithIdentifier:@"com.apple.link.systemProtocol.PutEntityInContainer" parameters:v123];
  v183[29] = v122;
  v182[30] = @"com.apple.link.systemProtocol.RequiresMDMChecks";
  v30 = [LNSystemProtocol alloc];
  v121 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.RequiresMDMChecks"];
  v120 = [(LNSystemProtocol *)v30 initWithIdentifier:@"com.apple.link.systemProtocol.RequiresMDMChecks" parameters:v121];
  v183[30] = v120;
  v182[31] = @"com.apple.link.systemProtocol.Resize";
  v31 = [LNSystemProtocol alloc];
  v119 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Resize"];
  v118 = [(LNSystemProtocol *)v31 initWithIdentifier:@"com.apple.link.systemProtocol.Resize" parameters:v119];
  v183[31] = v118;
  v182[32] = @"com.apple.link.systemProtocol.ResumeWorkout";
  v32 = [LNSystemProtocol alloc];
  v117 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ResumeWorkout"];
  v116 = [(LNSystemProtocol *)v32 initWithIdentifier:@"com.apple.link.systemProtocol.ResumeWorkout" parameters:v117];
  v183[32] = v116;
  v182[33] = @"com.apple.link.systemProtocol.SaveEntity";
  v33 = [LNSystemProtocol alloc];
  v115 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SaveEntity"];
  v114 = [(LNSystemProtocol *)v33 initWithIdentifier:@"com.apple.link.systemProtocol.SaveEntity" parameters:v115];
  v183[33] = v114;
  v182[34] = @"com.apple.link.systemProtocol.Scroll";
  v34 = [LNSystemProtocol alloc];
  v113 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Scroll"];
  v112 = [(LNSystemProtocol *)v34 initWithIdentifier:@"com.apple.link.systemProtocol.Scroll" parameters:v113];
  v183[34] = v112;
  v182[35] = @"com.apple.link.systemProtocol.Search";
  v35 = [LNSystemProtocol alloc];
  v111 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Search"];
  v110 = [(LNSystemProtocol *)v35 initWithIdentifier:@"com.apple.link.systemProtocol.Search" parameters:v111];
  v183[35] = v110;
  v182[36] = @"com.apple.link.systemProtocol.SessionStarting";
  v36 = [LNSystemProtocol alloc];
  v109 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SessionStarting"];
  v108 = [(LNSystemProtocol *)v36 initWithIdentifier:@"com.apple.link.systemProtocol.SessionStarting" parameters:v109];
  v183[36] = v108;
  v182[37] = @"com.apple.link.systemProtocol.SetValue";
  v37 = [LNSystemProtocol alloc];
  v107 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SetValue"];
  v106 = [(LNSystemProtocol *)v37 initWithIdentifier:@"com.apple.link.systemProtocol.SetValue" parameters:v107];
  v183[37] = v106;
  v182[38] = @"com.apple.link.systemProtocol.StartDive";
  v38 = [LNSystemProtocol alloc];
  v105 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.StartDive"];
  v104 = [(LNSystemProtocol *)v38 initWithIdentifier:@"com.apple.link.systemProtocol.StartDive" parameters:v105];
  v183[38] = v104;
  v182[39] = @"com.apple.link.systemProtocol.StartWorkout";
  v39 = [LNSystemProtocol alloc];
  v103 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.StartWorkout"];
  v102 = [(LNSystemProtocol *)v39 initWithIdentifier:@"com.apple.link.systemProtocol.StartWorkout" parameters:v103];
  v183[39] = v102;
  v182[40] = @"com.apple.link.systemProtocol.Sting";
  v40 = [LNSystemProtocol alloc];
  v101 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Sting"];
  v100 = [(LNSystemProtocol *)v40 initWithIdentifier:@"com.apple.link.systemProtocol.Sting" parameters:v101];
  v183[40] = v100;
  v182[41] = @"com.apple.link.systemProtocol.SystemFramework";
  v41 = [LNSystemProtocol alloc];
  v99 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SystemFramework"];
  v98 = [(LNSystemProtocol *)v41 initWithIdentifier:@"com.apple.link.systemProtocol.SystemFramework" parameters:v99];
  v183[41] = v98;
  v182[42] = @"com.apple.link.systemProtocol.Toggle";
  v42 = [LNSystemProtocol alloc];
  v97 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Toggle"];
  v96 = [(LNSystemProtocol *)v42 initWithIdentifier:@"com.apple.link.systemProtocol.Toggle" parameters:v97];
  v183[42] = v96;
  v182[43] = @"com.apple.link.systemProtocol.Undo";
  v43 = [LNSystemProtocol alloc];
  v95 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Undo"];
  v94 = [(LNSystemProtocol *)v43 initWithIdentifier:@"com.apple.link.systemProtocol.Undo" parameters:v95];
  v183[43] = v94;
  v182[44] = @"com.apple.link.systemProtocol.Undoable";
  v44 = [LNSystemProtocol alloc];
  v93 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Undoable"];
  v92 = [(LNSystemProtocol *)v44 initWithIdentifier:@"com.apple.link.systemProtocol.Undoable" parameters:v93];
  v183[44] = v92;
  v182[45] = @"com.apple.link.systemProtocol.URLRepresentable";
  v45 = [LNSystemProtocol alloc];
  v91 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.URLRepresentable"];
  v90 = [(LNSystemProtocol *)v45 initWithIdentifier:@"com.apple.link.systemProtocol.URLRepresentable" parameters:v91];
  v183[45] = v90;
  v182[46] = @"com.apple.link.systemProtocol.WidgetConfiguration";
  v46 = [LNSystemProtocol alloc];
  v89 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.WidgetConfiguration"];
  v88 = [(LNSystemProtocol *)v46 initWithIdentifier:@"com.apple.link.systemProtocol.WidgetConfiguration" parameters:v89];
  v183[46] = v88;
  v182[47] = @"com.apple.link.systemProtocol.XPCListener";
  v47 = [LNSystemProtocol alloc];
  v87 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.XPCListener"];
  v86 = [(LNSystemProtocol *)v47 initWithIdentifier:@"com.apple.link.systemProtocol.XPCListener" parameters:v87];
  v183[47] = v86;
  v182[48] = @"com.apple.link.systemProtocol.Zoom";
  v48 = [LNSystemProtocol alloc];
  v85 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.Zoom"];
  v84 = [(LNSystemProtocol *)v48 initWithIdentifier:@"com.apple.link.systemProtocol.Zoom" parameters:v85];
  v183[48] = v84;
  v182[49] = @"com.apple.link.systemProtocol.AssistantIntent";
  v49 = [LNSystemProtocol alloc];
  v83 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.AssistantIntent"];
  v82 = [(LNSystemProtocol *)v49 initWithIdentifier:@"com.apple.link.systemProtocol.AssistantIntent" parameters:v83];
  v183[49] = v82;
  v182[50] = @"com.apple.link.systemProtocol.AssistantInvocableIntent";
  v50 = [LNSystemProtocol alloc];
  v81 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.AssistantInvocableIntent"];
  v80 = [(LNSystemProtocol *)v50 initWithIdentifier:@"com.apple.link.systemProtocol.AssistantInvocableIntent" parameters:v81];
  v183[50] = v80;
  v182[51] = @"com.apple.link.systemProtocol.SendMail";
  v51 = [LNSystemProtocol alloc];
  v79 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SendMail"];
  v78 = [(LNSystemProtocol *)v51 initWithIdentifier:@"com.apple.link.systemProtocol.SendMail" parameters:v79];
  v183[51] = v78;
  v182[52] = @"com.apple.link.systemProtocol.SetMailMessageIsRead";
  v52 = [LNSystemProtocol alloc];
  v77 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SetMailMessageIsRead"];
  v76 = [(LNSystemProtocol *)v52 initWithIdentifier:@"com.apple.link.systemProtocol.SetMailMessageIsRead" parameters:v77];
  v183[52] = v76;
  v182[53] = @"com.apple.link.systemProtocol.SendMessage";
  v53 = [LNSystemProtocol alloc];
  v75 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.SendMessage"];
  v74 = [(LNSystemProtocol *)v53 initWithIdentifier:@"com.apple.link.systemProtocol.SendMessage" parameters:v75];
  v183[53] = v74;
  v182[54] = @"com.apple.link.systemProtocol.PlayVideo";
  v54 = [LNSystemProtocol alloc];
  v73 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.PlayVideo"];
  v72 = [(LNSystemProtocol *)v54 initWithIdentifier:@"com.apple.link.systemProtocol.PlayVideo" parameters:v73];
  v183[54] = v72;
  v182[55] = @"com.apple.link.systemProtocol.ShowSearchResultsInApp";
  v55 = [LNSystemProtocol alloc];
  v71 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ShowSearchResultsInApp"];
  v56 = [(LNSystemProtocol *)v55 initWithIdentifier:@"com.apple.link.systemProtocol.ShowSearchResultsInApp" parameters:v71];
  v183[55] = v56;
  v182[56] = @"com.apple.link.systemProtocol.ShowInAppSearchResults";
  v57 = [LNSystemProtocol alloc];
  v58 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ShowInAppSearchResults"];
  v59 = [(LNSystemProtocol *)v57 initWithIdentifier:@"com.apple.link.systemProtocol.ShowInAppSearchResults" parameters:v58];
  v183[56] = v59;
  v182[57] = @"com.apple.link.systemProtocol.ShowInAppStringSearchResults";
  v60 = [LNSystemProtocol alloc];
  v61 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.ShowInAppStringSearchResults"];
  v62 = [(LNSystemProtocol *)v60 initWithIdentifier:@"com.apple.link.systemProtocol.ShowInAppStringSearchResults" parameters:v61];
  v183[57] = v62;
  v182[58] = @"com.apple.link.systemProtocol.CameraCapture";
  v63 = [LNSystemProtocol alloc];
  v64 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.CameraCapture"];
  v65 = [(LNSystemProtocol *)v63 initWithIdentifier:@"com.apple.link.systemProtocol.CameraCapture" parameters:v64];
  v183[58] = v65;
  v182[59] = @"com.apple.link.systemProtocol.StaccatoLongPress";
  v66 = [LNSystemProtocol alloc];
  v67 = [(id)objc_opt_class() parametersForProtocolWithIdentifier:@"com.apple.link.systemProtocol.StaccatoLongPress"];
  v68 = [(LNSystemProtocol *)v66 initWithIdentifier:@"com.apple.link.systemProtocol.StaccatoLongPress" parameters:v67];
  v183[59] = v68;
  uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:v182 count:60];
  v70 = (void *)allProtocolsByIdentifier_protocolsByIdentifier_7662;
  allProtocolsByIdentifier_protocolsByIdentifier_7662 = v69;
}

- (LNSystemProtocol)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNSystemProtocol.m", 361, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNSystemProtocol.m", 362, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNSystemProtocol;
  v10 = [(LNSystemProtocol *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    parameters = v10->_parameters;
    v10->_parameters = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

+ (id)parametersForProtocolWithIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"com.apple.link.systemProtocol.ChangeBinarySetting"])
  {
    id v7 = @"setting";
    if (parametersForProtocolWithIdentifier__onceToken != -1) {
      dispatch_once(&parametersForProtocolWithIdentifier__onceToken, &__block_literal_global_317);
    }
    v8[0] = parametersForProtocolWithIdentifier__value;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = (id)parametersForProtocolWithIdentifier__value;
    id v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v5;
}

+ (LNSystemProtocol)focusConfigurationProtocol
{
  if (focusConfigurationProtocol_onceToken != -1) {
    dispatch_once(&focusConfigurationProtocol_onceToken, &__block_literal_global_212);
  }
  id v2 = (void *)focusConfigurationProtocol_value;
  return (LNSystemProtocol *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNSystemProtocol *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(LNSystemProtocol *)self parameters];
  [v4 encodeObject:v6 forKey:@"parameters"];
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

+ (LNSystemProtocol)sessionStartingProtocol
{
  if (sessionStartingProtocol_onceToken != -1) {
    dispatch_once(&sessionStartingProtocol_onceToken, &__block_literal_global_246);
  }
  id v2 = (void *)sessionStartingProtocol_value;
  return (LNSystemProtocol *)v2;
}

+ (LNSystemProtocol)pushToTalkTransmissionProtocol
{
  if (pushToTalkTransmissionProtocol_onceToken != -1) {
    dispatch_once(&pushToTalkTransmissionProtocol_onceToken, &__block_literal_global_272);
  }
  id v2 = (void *)pushToTalkTransmissionProtocol_value;
  return (LNSystemProtocol *)v2;
}

+ (LNSystemProtocol)foregroundContinuableProtocol
{
  if (foregroundContinuableProtocol_onceToken != -1) {
    dispatch_once(&foregroundContinuableProtocol_onceToken, &__block_literal_global_214);
  }
  id v2 = (void *)foregroundContinuableProtocol_value;
  return (LNSystemProtocol *)v2;
}

uint64_t __56__LNSystemProtocol_parametersForProtocolWithIdentifier___block_invoke()
{
  parametersForProtocolWithIdentifier__value = [[LNSystemProtocolParameter alloc] initWithVocabularyModel:2];
  return MEMORY[0x1F41817F8]();
}

- (NSString)defaultActionIdentifier
{
  return self->_defaultActionIdentifier;
}

- (unint64_t)hash
{
  v3 = [(LNSystemProtocol *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNSystemProtocol *)self parameters];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNSystemProtocol *)self typeName];
  id v7 = [v3 stringWithFormat:@"<%@: %p, typeName: %@>", v5, self, v6];

  return v7;
}

- (NSString)typeName
{
  id v2 = [(LNSystemProtocol *)self identifier];
  v3 = [v2 componentsSeparatedByString:@"."];
  uint64_t v4 = [v3 lastObject];

  id v5 = [NSString stringWithFormat:@"%@Action", v4];

  return (NSString *)v5;
}

+ (NSArray)allProtocols
{
  id v2 = [a1 allProtocolsByIdentifier];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

+ (LNSystemProtocol)staccatoLongPressProtocol
{
  if (staccatoLongPressProtocol_onceToken != -1) {
    dispatch_once(&staccatoLongPressProtocol_onceToken, &__block_literal_global_298);
  }
  id v2 = (void *)staccatoLongPressProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __45__LNSystemProtocol_staccatoLongPressProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CameraCapture"];
  v1 = (void *)staccatoLongPressProtocol_value;
  staccatoLongPressProtocol_value = v0;
}

void __41__LNSystemProtocol_cameraCaptureProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CameraCapture"];
  v1 = (void *)cameraCaptureProtocol_value;
  cameraCaptureProtocol_value = v0;
}

+ (LNSystemProtocol)showInAppStringSearchResultsProtocol
{
  if (showInAppStringSearchResultsProtocol_onceToken != -1) {
    dispatch_once(&showInAppStringSearchResultsProtocol_onceToken, &__block_literal_global_294);
  }
  id v2 = (void *)showInAppStringSearchResultsProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __56__LNSystemProtocol_showInAppStringSearchResultsProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ShowInAppStringSearchResults"];
  v1 = (void *)showInAppStringSearchResultsProtocol_value;
  showInAppStringSearchResultsProtocol_value = v0;
}

+ (LNSystemProtocol)showInAppSearchResultsProtocol
{
  if (showInAppSearchResultsProtocol_onceToken != -1) {
    dispatch_once(&showInAppSearchResultsProtocol_onceToken, &__block_literal_global_292);
  }
  id v2 = (void *)showInAppSearchResultsProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __50__LNSystemProtocol_showInAppSearchResultsProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ShowInAppSearchResults"];
  v1 = (void *)showInAppSearchResultsProtocol_value;
  showInAppSearchResultsProtocol_value = v0;
}

+ (LNSystemProtocol)showStringSearchResultsInAppProtocol
{
  if (showStringSearchResultsInAppProtocol_onceToken != -1) {
    dispatch_once(&showStringSearchResultsInAppProtocol_onceToken, &__block_literal_global_290);
  }
  id v2 = (void *)showStringSearchResultsInAppProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __56__LNSystemProtocol_showStringSearchResultsInAppProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ShowSearchResultsInApp"];
  v1 = (void *)showStringSearchResultsInAppProtocol_value;
  showStringSearchResultsInAppProtocol_value = v0;
}

+ (LNSystemProtocol)showSearchResultsInAppProtocol
{
  if (showSearchResultsInAppProtocol_onceToken != -1) {
    dispatch_once(&showSearchResultsInAppProtocol_onceToken, &__block_literal_global_288);
  }
  id v2 = (void *)showSearchResultsInAppProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __50__LNSystemProtocol_showSearchResultsInAppProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ShowSearchResultsInApp"];
  v1 = (void *)showSearchResultsInAppProtocol_value;
  showSearchResultsInAppProtocol_value = v0;
}

+ (LNSystemProtocol)playVideoProtocol
{
  if (playVideoProtocol_onceToken != -1) {
    dispatch_once(&playVideoProtocol_onceToken, &__block_literal_global_286);
  }
  id v2 = (void *)playVideoProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __37__LNSystemProtocol_playVideoProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PlayVideo"];
  v1 = (void *)playVideoProtocol_value;
  playVideoProtocol_value = v0;
}

+ (id)sendMessageProtocol
{
  if (sendMessageProtocol_onceToken != -1) {
    dispatch_once(&sendMessageProtocol_onceToken, &__block_literal_global_284);
  }
  id v2 = (void *)sendMessageProtocol_value;
  return v2;
}

void __39__LNSystemProtocol_sendMessageProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SendMessage"];
  v1 = (void *)sendMessageProtocol_value;
  sendMessageProtocol_value = v0;
}

+ (LNSystemProtocol)setMailMessageIsReadProtocol
{
  if (setMailMessageIsReadProtocol_onceToken != -1) {
    dispatch_once(&setMailMessageIsReadProtocol_onceToken, &__block_literal_global_282);
  }
  id v2 = (void *)setMailMessageIsReadProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __48__LNSystemProtocol_setMailMessageIsReadProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SetMailMessageIsRead"];
  v1 = (void *)setMailMessageIsReadProtocol_value;
  setMailMessageIsReadProtocol_value = v0;
}

+ (LNSystemProtocol)sendMailProtocol
{
  if (sendMailProtocol_onceToken != -1) {
    dispatch_once(&sendMailProtocol_onceToken, &__block_literal_global_280);
  }
  id v2 = (void *)sendMailProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __36__LNSystemProtocol_sendMailProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SendMail"];
  v1 = (void *)sendMailProtocol_value;
  sendMailProtocol_value = v0;
}

+ (LNSystemProtocol)assistantInvocableIntentProtocol
{
  if (assistantInvocableIntentProtocol_onceToken != -1) {
    dispatch_once(&assistantInvocableIntentProtocol_onceToken, &__block_literal_global_278);
  }
  id v2 = (void *)assistantInvocableIntentProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __52__LNSystemProtocol_assistantInvocableIntentProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.AssistantInvocableIntent"];
  v1 = (void *)assistantInvocableIntentProtocol_value;
  assistantInvocableIntentProtocol_value = v0;
}

+ (LNSystemProtocol)assistantIntentProtocol
{
  if (assistantIntentProtocol_onceToken != -1) {
    dispatch_once(&assistantIntentProtocol_onceToken, &__block_literal_global_276);
  }
  id v2 = (void *)assistantIntentProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __43__LNSystemProtocol_assistantIntentProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.AssistantIntent"];
  v1 = (void *)assistantIntentProtocol_value;
  assistantIntentProtocol_value = v0;
}

+ (LNSystemProtocol)urlRepresentableProtocol
{
  if (urlRepresentableProtocol_onceToken_7663 != -1) {
    dispatch_once(&urlRepresentableProtocol_onceToken_7663, &__block_literal_global_274);
  }
  id v2 = (void *)urlRepresentableProtocol_value_7664;
  return (LNSystemProtocol *)v2;
}

void __44__LNSystemProtocol_urlRepresentableProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.URLRepresentable"];
  v1 = (void *)urlRepresentableProtocol_value_7664;
  urlRepresentableProtocol_value_7664 = v0;
}

void __50__LNSystemProtocol_pushToTalkTransmissionProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PushToTalkTransmission"];
  v1 = (void *)pushToTalkTransmissionProtocol_value;
  pushToTalkTransmissionProtocol_value = v0;
}

+ (LNSystemProtocol)zoomProtocol
{
  if (zoomProtocol_onceToken != -1) {
    dispatch_once(&zoomProtocol_onceToken, &__block_literal_global_270);
  }
  id v2 = (void *)zoomProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __32__LNSystemProtocol_zoomProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Zoom"];
  v1 = (void *)zoomProtocol_value;
  zoomProtocol_value = v0;
}

+ (LNSystemProtocol)xpcListenerProtocol
{
  if (xpcListenerProtocol_onceToken != -1) {
    dispatch_once(&xpcListenerProtocol_onceToken, &__block_literal_global_268);
  }
  id v2 = (void *)xpcListenerProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __39__LNSystemProtocol_xpcListenerProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.XPCListener"];
  v1 = (void *)xpcListenerProtocol_value;
  xpcListenerProtocol_value = v0;
}

+ (LNSystemProtocol)controlConfigurationProtocol
{
  if (controlConfigurationProtocol_onceToken != -1) {
    dispatch_once(&controlConfigurationProtocol_onceToken, &__block_literal_global_266);
  }
  id v2 = (void *)controlConfigurationProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __48__LNSystemProtocol_controlConfigurationProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ControlConfiguration"];
  v1 = (void *)controlConfigurationProtocol_value;
  controlConfigurationProtocol_value = v0;
}

+ (LNSystemProtocol)widgetConfigurationProtocol
{
  if (widgetConfigurationProtocol_onceToken != -1) {
    dispatch_once(&widgetConfigurationProtocol_onceToken, &__block_literal_global_264);
  }
  id v2 = (void *)widgetConfigurationProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __47__LNSystemProtocol_widgetConfigurationProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.WidgetConfiguration"];
  v1 = (void *)widgetConfigurationProtocol_value;
  widgetConfigurationProtocol_value = v0;
}

+ (LNSystemProtocol)undoSystemProtocol
{
  if (undoSystemProtocol_onceToken != -1) {
    dispatch_once(&undoSystemProtocol_onceToken, &__block_literal_global_262);
  }
  id v2 = (void *)undoSystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __38__LNSystemProtocol_undoSystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Undo"];
  v1 = (void *)undoSystemProtocol_value;
  undoSystemProtocol_value = v0;
}

+ (LNSystemProtocol)undoableProtocol
{
  if (undoableProtocol_onceToken != -1) {
    dispatch_once(&undoableProtocol_onceToken, &__block_literal_global_260);
  }
  id v2 = (void *)undoableProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __36__LNSystemProtocol_undoableProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Undoable"];
  v1 = (void *)undoableProtocol_value;
  undoableProtocol_value = v0;
}

+ (LNSystemProtocol)toggleProtocol
{
  if (toggleProtocol_onceToken != -1) {
    dispatch_once(&toggleProtocol_onceToken, &__block_literal_global_258);
  }
  id v2 = (void *)toggleProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __34__LNSystemProtocol_toggleProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Toggle"];
  v1 = (void *)toggleProtocol_value;
  toggleProtocol_value = v0;
}

+ (LNSystemProtocol)systemFrameworkProtocol
{
  if (systemFrameworkProtocol_onceToken != -1) {
    dispatch_once(&systemFrameworkProtocol_onceToken, &__block_literal_global_256);
  }
  id v2 = (void *)systemFrameworkProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __43__LNSystemProtocol_systemFrameworkProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SystemFramework"];
  v1 = (void *)systemFrameworkProtocol_value;
  systemFrameworkProtocol_value = v0;
}

+ (LNSystemProtocol)stingProtocol
{
  if (stingProtocol_onceToken != -1) {
    dispatch_once(&stingProtocol_onceToken, &__block_literal_global_254);
  }
  id v2 = (void *)stingProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __33__LNSystemProtocol_stingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Sting"];
  v1 = (void *)stingProtocol_value;
  stingProtocol_value = v0;
}

+ (LNSystemProtocol)startWorkoutProtocol
{
  if (startWorkoutProtocol_onceToken != -1) {
    dispatch_once(&startWorkoutProtocol_onceToken, &__block_literal_global_252);
  }
  id v2 = (void *)startWorkoutProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __40__LNSystemProtocol_startWorkoutProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.StartWorkout"];
  v1 = (void *)startWorkoutProtocol_value;
  startWorkoutProtocol_value = v0;
}

+ (LNSystemProtocol)startDiveProtocol
{
  if (startDiveProtocol_onceToken != -1) {
    dispatch_once(&startDiveProtocol_onceToken, &__block_literal_global_250);
  }
  id v2 = (void *)startDiveProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __37__LNSystemProtocol_startDiveProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.StartDive"];
  v1 = (void *)startDiveProtocol_value;
  startDiveProtocol_value = v0;
}

+ (LNSystemProtocol)setValueProtocol
{
  if (setValueProtocol_onceToken != -1) {
    dispatch_once(&setValueProtocol_onceToken, &__block_literal_global_248);
  }
  id v2 = (void *)setValueProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __36__LNSystemProtocol_setValueProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SetValue"];
  v1 = (void *)setValueProtocol_value;
  setValueProtocol_value = v0;
}

void __43__LNSystemProtocol_sessionStartingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SessionStarting"];
  v1 = (void *)sessionStartingProtocol_value;
  sessionStartingProtocol_value = v0;
}

+ (LNSystemProtocol)searchSystemProtocol
{
  if (searchSystemProtocol_onceToken != -1) {
    dispatch_once(&searchSystemProtocol_onceToken, &__block_literal_global_244);
  }
  id v2 = (void *)searchSystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __40__LNSystemProtocol_searchSystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Search"];
  v1 = (void *)searchSystemProtocol_value;
  searchSystemProtocol_value = v0;
}

+ (LNSystemProtocol)scrollProtocol
{
  if (scrollProtocol_onceToken != -1) {
    dispatch_once(&scrollProtocol_onceToken, &__block_literal_global_242);
  }
  id v2 = (void *)scrollProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __34__LNSystemProtocol_scrollProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Scroll"];
  v1 = (void *)scrollProtocol_value;
  scrollProtocol_value = v0;
}

+ (LNSystemProtocol)saveEntitySystemProtocol
{
  if (saveEntitySystemProtocol_onceToken != -1) {
    dispatch_once(&saveEntitySystemProtocol_onceToken, &__block_literal_global_240);
  }
  id v2 = (void *)saveEntitySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __44__LNSystemProtocol_saveEntitySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.SaveEntity"];
  v1 = (void *)saveEntitySystemProtocol_value;
  saveEntitySystemProtocol_value = v0;
}

+ (LNSystemProtocol)resumeWorkoutProtocol
{
  if (resumeWorkoutProtocol_onceToken != -1) {
    dispatch_once(&resumeWorkoutProtocol_onceToken, &__block_literal_global_238);
  }
  id v2 = (void *)resumeWorkoutProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __41__LNSystemProtocol_resumeWorkoutProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ResumeWorkout"];
  v1 = (void *)resumeWorkoutProtocol_value;
  resumeWorkoutProtocol_value = v0;
}

+ (LNSystemProtocol)resizeProtocol
{
  if (resizeProtocol_onceToken != -1) {
    dispatch_once(&resizeProtocol_onceToken, &__block_literal_global_236);
  }
  id v2 = (void *)resizeProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __34__LNSystemProtocol_resizeProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Resize"];
  v1 = (void *)resizeProtocol_value;
  resizeProtocol_value = v0;
}

+ (LNSystemProtocol)requiresMDMChecksProtocol
{
  if (requiresMDMChecksProtocol_onceToken != -1) {
    dispatch_once(&requiresMDMChecksProtocol_onceToken, &__block_literal_global_234);
  }
  id v2 = (void *)requiresMDMChecksProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __45__LNSystemProtocol_requiresMDMChecksProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.RequiresMDMChecks"];
  v1 = (void *)requiresMDMChecksProtocol_value;
  requiresMDMChecksProtocol_value = v0;
}

+ (LNSystemProtocol)putEntityInContainerProtocol
{
  if (putEntityInContainerProtocol_onceToken != -1) {
    dispatch_once(&putEntityInContainerProtocol_onceToken, &__block_literal_global_232);
  }
  id v2 = (void *)putEntityInContainerProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __48__LNSystemProtocol_putEntityInContainerProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PutEntityInContainer"];
  v1 = (void *)putEntityInContainerProtocol_value;
  putEntityInContainerProtocol_value = v0;
}

+ (LNSystemProtocol)propertyUpdaterProtocol
{
  if (propertyUpdaterProtocol_onceToken != -1) {
    dispatch_once(&propertyUpdaterProtocol_onceToken, &__block_literal_global_230);
  }
  id v2 = (void *)propertyUpdaterProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __43__LNSystemProtocol_propertyUpdaterProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PropertyUpdater"];
  v1 = (void *)propertyUpdaterProtocol_value;
  propertyUpdaterProtocol_value = v0;
}

+ (LNSystemProtocol)progressReportingProtocol
{
  if (progressReportingProtocol_onceToken != -1) {
    dispatch_once(&progressReportingProtocol_onceToken, &__block_literal_global_228);
  }
  id v2 = (void *)progressReportingProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __45__LNSystemProtocol_progressReportingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ProgressReporting"];
  v1 = (void *)progressReportingProtocol_value;
  progressReportingProtocol_value = v0;
}

+ (LNSystemProtocol)previewEntityProtocol
{
  if (previewEntityProtocol_onceToken != -1) {
    dispatch_once(&previewEntityProtocol_onceToken, &__block_literal_global_226);
  }
  id v2 = (void *)previewEntityProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __41__LNSystemProtocol_previewEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PreviewEntity"];
  v1 = (void *)previewEntityProtocol_value;
  previewEntityProtocol_value = v0;
}

+ (LNSystemProtocol)pauseWorkoutProtocol
{
  if (pauseWorkoutProtocol_onceToken != -1) {
    dispatch_once(&pauseWorkoutProtocol_onceToken, &__block_literal_global_224);
  }
  id v2 = (void *)pauseWorkoutProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __40__LNSystemProtocol_pauseWorkoutProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.PauseWorkout"];
  v1 = (void *)pauseWorkoutProtocol_value;
  pauseWorkoutProtocol_value = v0;
}

+ (LNSystemProtocol)pasteSystemProtocol
{
  if (pasteSystemProtocol_onceToken != -1) {
    dispatch_once(&pasteSystemProtocol_onceToken, &__block_literal_global_222);
  }
  id v2 = (void *)pasteSystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __39__LNSystemProtocol_pasteSystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Paste"];
  v1 = (void *)pasteSystemProtocol_value;
  pasteSystemProtocol_value = v0;
}

+ (LNSystemProtocol)openEntitySystemProtocol
{
  if (openEntitySystemProtocol_onceToken != -1) {
    dispatch_once(&openEntitySystemProtocol_onceToken, &__block_literal_global_220);
  }
  id v2 = (void *)openEntitySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __44__LNSystemProtocol_openEntitySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.OpenEntity"];
  v1 = (void *)openEntitySystemProtocol_value;
  openEntitySystemProtocol_value = v0;
}

+ (LNSystemProtocol)navigateSequentiallyProtocol
{
  if (navigateSequentiallyProtocol_onceToken != -1) {
    dispatch_once(&navigateSequentiallyProtocol_onceToken, &__block_literal_global_218);
  }
  id v2 = (void *)navigateSequentiallyProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __48__LNSystemProtocol_navigateSequentiallyProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.NavigateSequentially"];
  v1 = (void *)navigateSequentiallyProtocol_value;
  navigateSequentiallyProtocol_value = v0;
}

+ (LNSystemProtocol)moveSpatialProtocol
{
  if (moveSpatialProtocol_onceToken != -1) {
    dispatch_once(&moveSpatialProtocol_onceToken, &__block_literal_global_216);
  }
  id v2 = (void *)moveSpatialProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __39__LNSystemProtocol_moveSpatialProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.MoveSpatial"];
  v1 = (void *)moveSpatialProtocol_value;
  moveSpatialProtocol_value = v0;
}

void __49__LNSystemProtocol_foregroundContinuableProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ForegroundContinuable"];
  v1 = (void *)foregroundContinuableProtocol_value;
  foregroundContinuableProtocol_value = v0;
}

+ (LNSystemProtocol)favoriteEntityProtocol
{
  if (favoriteEntityProtocol_onceToken != -1) {
    dispatch_once(&favoriteEntityProtocol_onceToken, &__block_literal_global_210);
  }
  id v2 = (void *)favoriteEntityProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __42__LNSystemProtocol_favoriteEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.FavoriteEntity"];
  v1 = (void *)favoriteEntityProtocol_value;
  favoriteEntityProtocol_value = v0;
}

+ (LNSystemProtocol)exitMarkupProtocol
{
  if (exitMarkupProtocol_onceToken != -1) {
    dispatch_once(&exitMarkupProtocol_onceToken, &__block_literal_global_208);
  }
  id v2 = (void *)exitMarkupProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __38__LNSystemProtocol_exitMarkupProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ExitMarkup"];
  v1 = (void *)exitMarkupProtocol_value;
  exitMarkupProtocol_value = v0;
}

+ (LNSystemProtocol)entityUpdatingProtocol
{
  if (entityUpdatingProtocol_onceToken != -1) {
    dispatch_once(&entityUpdatingProtocol_onceToken, &__block_literal_global_206);
  }
  id v2 = (void *)entityUpdatingProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __42__LNSystemProtocol_entityUpdatingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.EntityUpdating"];
  v1 = (void *)entityUpdatingProtocol_value;
  entityUpdatingProtocol_value = v0;
}

+ (LNSystemProtocol)enterMarkupProtocol
{
  if (enterMarkupProtocol_onceToken != -1) {
    dispatch_once(&enterMarkupProtocol_onceToken, &__block_literal_global_204);
  }
  id v2 = (void *)enterMarkupProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __39__LNSystemProtocol_enterMarkupProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.EnterMarkup"];
  v1 = (void *)enterMarkupProtocol_value;
  enterMarkupProtocol_value = v0;
}

+ (LNSystemProtocol)duplicateEntitySystemProtocol
{
  if (duplicateEntitySystemProtocol_onceToken != -1) {
    dispatch_once(&duplicateEntitySystemProtocol_onceToken, &__block_literal_global_202);
  }
  id v2 = (void *)duplicateEntitySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __49__LNSystemProtocol_duplicateEntitySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.DuplicateEntity"];
  v1 = (void *)duplicateEntitySystemProtocol_value;
  duplicateEntitySystemProtocol_value = v0;
}

+ (LNSystemProtocol)deleteEntitySystemProtocol
{
  if (deleteEntitySystemProtocol_onceToken != -1) {
    dispatch_once(&deleteEntitySystemProtocol_onceToken, &__block_literal_global_200);
  }
  id v2 = (void *)deleteEntitySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __46__LNSystemProtocol_deleteEntitySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.DeleteEntity"];
  v1 = (void *)deleteEntitySystemProtocol_value;
  deleteEntitySystemProtocol_value = v0;
}

+ (LNSystemProtocol)cutSystemProtocol
{
  if (cutSystemProtocol_onceToken != -1) {
    dispatch_once(&cutSystemProtocol_onceToken, &__block_literal_global_198);
  }
  id v2 = (void *)cutSystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __37__LNSystemProtocol_cutSystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Cut"];
  v1 = (void *)cutSystemProtocol_value;
  cutSystemProtocol_value = v0;
}

+ (LNSystemProtocol)cutEntityProtocol
{
  if (cutEntityProtocol_onceToken != -1) {
    dispatch_once(&cutEntityProtocol_onceToken, &__block_literal_global_196);
  }
  id v2 = (void *)cutEntityProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __37__LNSystemProtocol_cutEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CutEntity"];
  v1 = (void *)cutEntityProtocol_value;
  cutEntityProtocol_value = v0;
}

+ (LNSystemProtocol)createEntitySystemProtocol
{
  if (createEntitySystemProtocol_onceToken != -1) {
    dispatch_once(&createEntitySystemProtocol_onceToken, &__block_literal_global_194);
  }
  id v2 = (void *)createEntitySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __46__LNSystemProtocol_createEntitySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CreateEntity"];
  v1 = (void *)createEntitySystemProtocol_value;
  createEntitySystemProtocol_value = v0;
}

+ (LNSystemProtocol)copySystemProtocol
{
  if (copySystemProtocol_onceToken != -1) {
    dispatch_once(&copySystemProtocol_onceToken, &__block_literal_global_192);
  }
  id v2 = (void *)copySystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __38__LNSystemProtocol_copySystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Copy"];
  v1 = (void *)copySystemProtocol_value;
  copySystemProtocol_value = v0;
}

+ (LNSystemProtocol)copyEntityProtocol
{
  if (copyEntityProtocol_onceToken != -1) {
    dispatch_once(&copyEntityProtocol_onceToken, &__block_literal_global_190);
  }
  id v2 = (void *)copyEntityProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __38__LNSystemProtocol_copyEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CopyEntity"];
  v1 = (void *)copyEntityProtocol_value;
  copyEntityProtocol_value = v0;
}

+ (LNSystemProtocol)conditionallyEnabledProtocol
{
  if (conditionallyEnabledProtocol_onceToken != -1) {
    dispatch_once(&conditionallyEnabledProtocol_onceToken, &__block_literal_global_188);
  }
  id v2 = (void *)conditionallyEnabledProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __48__LNSystemProtocol_conditionallyEnabledProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ConditionallyEnabled"];
  v1 = (void *)conditionallyEnabledProtocol_value;
  conditionallyEnabledProtocol_value = v0;
}

+ (LNSystemProtocol)closeEntityProtocol
{
  if (closeEntityProtocol_onceToken != -1) {
    dispatch_once(&closeEntityProtocol_onceToken, &__block_literal_global_186);
  }
  id v2 = (void *)closeEntityProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __39__LNSystemProtocol_closeEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.CloseEntity"];
  v1 = (void *)closeEntityProtocol_value;
  closeEntityProtocol_value = v0;
}

+ (LNSystemProtocol)changeBinarySettingSystemProtocol
{
  if (changeBinarySettingSystemProtocol_onceToken != -1) {
    dispatch_once(&changeBinarySettingSystemProtocol_onceToken, &__block_literal_global_184);
  }
  id v2 = (void *)changeBinarySettingSystemProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __53__LNSystemProtocol_changeBinarySettingSystemProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.ChangeBinarySetting"];
  v1 = (void *)changeBinarySettingSystemProtocol_value;
  changeBinarySettingSystemProtocol_value = v0;
}

+ (LNSystemProtocol)cancelProtocol
{
  if (cancelProtocol_onceToken != -1) {
    dispatch_once(&cancelProtocol_onceToken, &__block_literal_global_182);
  }
  id v2 = (void *)cancelProtocol_value;
  return (LNSystemProtocol *)v2;
}

void __34__LNSystemProtocol_cancelProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.Cancel"];
  v1 = (void *)cancelProtocol_value;
  cancelProtocol_value = v0;
}

void __42__LNSystemProtocol_audioRecordingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.AudioRecording"];
  v1 = (void *)audioRecordingProtocol_value;
  audioRecordingProtocol_value = v0;
}

void __41__LNSystemProtocol_audioStartingProtocol__block_invoke()
{
  id v2 = +[LNSystemProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.link.systemProtocol.AudioStarting"];
  v1 = (void *)audioStartingProtocol_value;
  audioStartingProtocol_value = v0;
}

- (int64_t)kind
{
  v3 = [(id)objc_opt_class() systemProtocolKindsByIdentifier];
  uint64_t v4 = [(LNSystemProtocol *)self identifier];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 23;
  }

  return v6;
}

+ (id)ofKind:(int64_t)a3
{
  if (a3 == 23)
  {
    v3 = 0;
  }
  else
  {
    if (a3 == 13) {
      int64_t v4 = 14;
    }
    else {
      int64_t v4 = a3;
    }
    id v5 = [a1 systemProtocolKindsByIdentifier];
    int64_t v6 = [NSNumber numberWithInteger:v4];
    id v7 = [v5 allKeysForObject:v6];
    id v8 = [v7 firstObject];

    if (v8)
    {
      v3 = +[LNSystemProtocol protocolWithIdentifier:v8];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (LNSystemProtocol)protocolWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 protocolOrNilWithIdentifier:v4];
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:@"InitNotImplemented", @"%@ is not a valid LNSystemProtocolIdentifier", v4 format];
  }

  return (LNSystemProtocol *)v5;
}

+ (id)systemProtocolKindsByIdentifier
{
  v5[21] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.link.systemProtocol.ChangeBinarySetting";
  v4[1] = @"com.apple.link.systemProtocol.DeleteEntity";
  v5[0] = &unk_1EEDCE710;
  v5[1] = &unk_1EEDCE728;
  v4[2] = @"com.apple.link.systemProtocol.DuplicateEntity";
  v4[3] = @"com.apple.link.systemProtocol.OpenEntity";
  v5[2] = &unk_1EEDCE740;
  v5[3] = &unk_1EEDCE758;
  v4[4] = @"com.apple.link.systemProtocol.SaveEntity";
  v4[5] = @"com.apple.link.systemProtocol.Undo";
  v5[4] = &unk_1EEDCE770;
  v5[5] = &unk_1EEDCE788;
  v4[6] = @"com.apple.link.systemProtocol.CreateEntity";
  v4[7] = @"com.apple.link.systemProtocol.Search";
  v5[6] = &unk_1EEDCE7A0;
  v5[7] = &unk_1EEDCE7B8;
  v4[8] = @"com.apple.link.systemProtocol.Copy";
  v4[9] = @"com.apple.link.systemProtocol.Paste";
  v5[8] = &unk_1EEDCE7D0;
  v5[9] = &unk_1EEDCE7E8;
  v4[10] = @"com.apple.link.systemProtocol.Cut";
  v4[11] = @"com.apple.link.systemProtocol.PutEntityInContainer";
  v5[10] = &unk_1EEDCE800;
  v5[11] = &unk_1EEDCE818;
  v4[12] = @"com.apple.link.systemProtocol.FavoriteEntity";
  v4[13] = @"com.apple.link.systemProtocol.CloseEntity";
  v5[12] = &unk_1EEDCE830;
  v5[13] = &unk_1EEDCE848;
  v4[14] = @"com.apple.link.systemProtocol.Sting";
  v4[15] = @"com.apple.link.systemProtocol.Cancel";
  v5[14] = &unk_1EEDCE860;
  v5[15] = &unk_1EEDCE878;
  v4[16] = @"com.apple.link.systemProtocol.NavigateSequentially";
  v4[17] = @"com.apple.link.systemProtocol.MoveSpatial";
  v5[16] = &unk_1EEDCE890;
  v5[17] = &unk_1EEDCE8A8;
  v4[18] = @"com.apple.link.systemProtocol.Scroll";
  v4[19] = @"com.apple.link.systemProtocol.Resize";
  v5[18] = &unk_1EEDCE8C0;
  v5[19] = &unk_1EEDCE8D8;
  v4[20] = @"com.apple.link.systemProtocol.Zoom";
  v5[20] = &unk_1EEDCE8F0;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:21];
  return v2;
}

@end