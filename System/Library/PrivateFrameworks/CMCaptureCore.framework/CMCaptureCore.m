uint64_t FigCaptureStreamFocusingMethodIsPhaseDetectionBased(int a1)
{
  if ((a1 - 4) > 8) {
    return 0;
  }
  else {
    return byte_21089BE56[a1 - 4];
  }
}

uint64_t FigCaptureStreamFocusingMethodIsContrastBased(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return byte_21089BE4C[a1 - 1];
  }
}

uint64_t FigCaptureComputeImageGainFromMetadata(const __CFDictionary *a1, float *a2)
{
  float v12 = 1.0664;
  unsigned int v10 = 256;
  unsigned int valuePtr = 256;
  unsigned int v9 = 256;
  if (!a1) {
    return 4294954516;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"AGC");
  if (!Value) {
    return 4294954516;
  }
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a1, @"sensorDGain");
  if (!v5) {
    return 4294954516;
  }
  CFNumberGetValue(v5, kCFNumberIntType, &v10);
  CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ispDGain");
  if (!v6) {
    return 4294954516;
  }
  CFNumberGetValue(v6, kCFNumberIntType, &v9);
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ispDGainRangeExpansionFactor");
  if (!v7) {
    return 4294954516;
  }
  CFNumberGetValue(v7, kCFNumberFloat32Type, &v12);
  if (v12 <= 0.0) {
    return 4294954516;
  }
  uint64_t result = 0;
  *a2 = (float)((float)((float)valuePtr * (float)v10) * (float)v9) / (float)(v12 * 16777000.0);
  return result;
}

CFArrayRef FigCaptureCopySerializableKeys()
{
  values[420] = *(void **)MEMORY[0x263EF8340];
  values[0] = @"MetadataDictionary";
  values[1] = @"AEAverage";
  values[2] = @"AGC";
  values[3] = @"ExposureTime";
  values[4] = @"SNR";
  values[5] = @"SensorID";
  values[6] = @"TemporalMotion";
  values[7] = @"ispDGain";
  values[8] = @"sensorDGain";
  values[9] = @"Translation";
  values[10] = @"TransformMatrix";
  values[11] = @"MotionDataError";
  values[12] = @"Acceleration";
  values[13] = @"Attitude";
  values[14] = @"{Diagnostic}";
  values[15] = @"DeviceConfiguration";
  values[16] = @"Defaults";
  values[17] = @"com.apple.avfoundation";
  values[18] = @"com.apple.coremedia";
  values[19] = @"BuildVersion";
  values[20] = @"DeviceModelName";
  values[21] = @"DeviceSerialNumber";
  values[22] = @"Version-AVFCapture";
  values[23] = @"Version-CMCapture";
  values[24] = @"Version-CMCaptureCore";
  values[25] = @"Build";
  values[26] = @"{PrivateClientMetadata}";
  values[27] = @"CaptureFolderClientPath";
  v0 = (void *)*MEMORY[0x263F0F4C8];
  values[28] = @"FilteredDetectedObjectInfo";
  values[29] = v0;
  v1 = (void *)*MEMORY[0x263F0F348];
  values[30] = *(void **)MEMORY[0x263F0F248];
  values[31] = v1;
  v2 = (void *)*MEMORY[0x263F0F2F0];
  values[32] = *(void **)MEMORY[0x263F0F2E8];
  values[33] = v2;
  v3 = (void *)*MEMORY[0x263F0F310];
  values[34] = *(void **)MEMORY[0x263F0F270];
  values[35] = v3;
  v4 = (void *)*MEMORY[0x263F0F1B8];
  values[36] = *(void **)MEMORY[0x263F0F278];
  values[37] = v4;
  CFNumberRef v5 = (void *)*MEMORY[0x263F0F328];
  values[38] = *(void **)MEMORY[0x263F0F298];
  values[39] = v5;
  CFNumberRef v6 = (void *)*MEMORY[0x263F0F290];
  values[40] = *(void **)MEMORY[0x263F0F308];
  values[41] = v6;
  CFNumberRef v7 = (void *)*MEMORY[0x263F0F350];
  values[42] = *(void **)MEMORY[0x263F0F230];
  values[43] = v7;
  v8 = (void *)*MEMORY[0x263F0F2A0];
  values[44] = *(void **)MEMORY[0x263F0F288];
  values[45] = v8;
  unsigned int v9 = (void *)*MEMORY[0x263F0F268];
  values[46] = *(void **)MEMORY[0x263F0F2C8];
  values[47] = v9;
  unsigned int v10 = (void *)*MEMORY[0x263F0F300];
  values[48] = *(void **)MEMORY[0x263F0F280];
  values[49] = v10;
  v11 = (void *)*MEMORY[0x263F0F260];
  values[50] = *(void **)MEMORY[0x263F0F2F8];
  values[51] = v11;
  float v12 = (void *)*MEMORY[0x263F0F250];
  values[52] = v7;
  values[53] = v12;
  v13 = (void *)*MEMORY[0x263F0F2A8];
  values[54] = *(void **)MEMORY[0x263F0F2B8];
  values[55] = v13;
  v14 = (void *)*MEMORY[0x263F0F258];
  values[56] = *(void **)MEMORY[0x263F0F2B0];
  values[57] = v14;
  v15 = (void *)*MEMORY[0x263F0F1C8];
  values[58] = *(void **)MEMORY[0x263F0F1D0];
  values[59] = v15;
  v16 = (void *)*MEMORY[0x263F0F210];
  values[60] = *(void **)MEMORY[0x263F0F208];
  values[61] = v16;
  v17 = (void *)*MEMORY[0x263F0F1E8];
  values[62] = *(void **)MEMORY[0x263F0F200];
  values[63] = v17;
  values[64] = *(void **)MEMORY[0x263F0F1F8];
  values[65] = *(void **)MEMORY[0x263F0F1E0];
  values[66] = *(void **)MEMORY[0x263F0F1D8];
  values[67] = *(void **)MEMORY[0x263F0F1F0];
  values[68] = *(void **)MEMORY[0x263F0F1C0];
  values[69] = *(void **)MEMORY[0x263F0F240];
  values[70] = *(void **)MEMORY[0x263F0F238];
  values[71] = *(void **)MEMORY[0x263F0F338];
  values[72] = *(void **)MEMORY[0x263F0F330];
  values[73] = *(void **)MEMORY[0x263F0F2D0];
  values[74] = *(void **)MEMORY[0x263F0F2E0];
  values[75] = *(void **)MEMORY[0x263F0F2D8];
  values[76] = *(void **)MEMORY[0x263F0F228];
  values[77] = *(void **)MEMORY[0x263F0F320];
  values[78] = *(void **)MEMORY[0x263F0F318];
  values[79] = *(void **)MEMORY[0x263F0F220];
  values[80] = *(void **)MEMORY[0x263F0EFD8];
  values[81] = @"Regions";
  values[82] = @"RollingShutterSkew";
  values[83] = @"AWBGGain";
  values[84] = @"RawMetaData";
  values[85] = @"AFStatus";
  values[86] = @"Histogram_RChannel";
  values[87] = @"Histogram_GChannel";
  values[88] = @"Histogram_BChannel";
  values[89] = @"Histogram_YChannel";
  values[90] = @"CurrentFocusPosition";
  values[91] = @"AEMatrix";
  values[92] = @"BrightnessValue";
  values[93] = @"AFStable";
  values[94] = @"AEStable";
  values[95] = @"AELimitsReached";
  values[96] = @"AWBRGain";
  values[97] = @"FocusPeakSumArray";
  values[98] = @"ExposureBias";
  values[99] = @"Fnumber";
  values[100] = @"NormalizedSNR";
  values[101] = @"FocusWindow";
  values[102] = @"FocusScoresArray";
  values[103] = @"GlobalShutterFlag";
  values[104] = @"AWBStable";
  values[105] = @"ISOSpeedRating";
  values[106] = @"AWBBGain";
  values[107] = @"FlashMode";
  values[108] = @"PortType";
  values[109] = @"BracketedCaptureSequenceNumber";
  values[110] = @"LuxLevel";
  values[111] = @"AverageFocusScore";
  values[112] = @"CurrentFrameRate";
  values[113] = @"CameraDriverName";
  values[114] = @"PreBracketingFrame";
  values[115] = @"FlashCaptureSequence";
  values[116] = @"ReadNoise_1x";
  values[117] = @"ReadNoise_8x";
  values[118] = @"RawSensorWidth";
  values[119] = @"RawSensorHeight";
  values[120] = @"SensorTemperature";
  values[121] = @"RawCropRect";
  values[122] = @"ConversionGain";
  values[123] = @"AETarget";
  values[124] = @"ISOBase";
  values[125] = @"DetectedFacesArray";
  values[126] = @"FaceID";
  values[127] = @"Timestamp";
  values[128] = @"AngleInfoRoll";
  values[129] = @"AngleInfoYaw";
  values[130] = @"AngleInfoPitch";
  values[131] = @"ConfidenceLevel";
  values[132] = @"Rect";
  values[133] = @"LeftEyeRect";
  values[134] = @"RightEyeRect";
  values[135] = @"DetectedObjectsInfo";
  values[136] = @"HumanFaces";
  values[137] = @"HumanHands";
  values[138] = @"HumanBodies";
  values[139] = @"HumanFullBodies";
  values[140] = @"HumanHeads";
  values[141] = @"CatBodies";
  values[142] = @"CatHeads";
  values[143] = @"DogBodies";
  values[144] = @"DogHeads";
  values[145] = @"SalientObjects";
  values[146] = @"SportsBalls";
  values[147] = @"OriginalTimestamp";
  values[148] = @"ObjectsArray";
  values[149] = @"ID";
  values[150] = @"GroupID";
  values[151] = @"Modality";
  values[152] = @"HeatMap";
  values[153] = @"Map";
  values[154] = @"Width";
  values[155] = @"Height";
  values[156] = @"BytesPerRow";
  values[157] = @"FaceMetadataObjectsArray";
  values[158] = @"FaceMetadataObjectsCount";
  values[159] = @"IsFixedPlaneFocus";
  values[160] = @"IsHardFocus";
  values[161] = @"HistogramData";
  values[162] = @"LumaHistogramData";
  values[163] = @"BarcodeMetadataObjectsArray";
  values[164] = @"BarcodeMetadataObjectsCount";
  values[165] = @"SceneStable";
  values[166] = @"SceneStabilityMetric";
  values[167] = @"TrackedFaces";
  values[168] = @"meta";
  values[169] = @"version";
  values[170] = @"tracked_faces";
  values[171] = @"face_id";
  values[172] = @"animation";
  values[173] = @"blendshapes";
  values[174] = @"left_eye_pitch";
  values[175] = @"left_eye_yaw";
  values[176] = @"right_eye_pitch";
  values[177] = @"right_eye_yaw";
  values[178] = @"pose";
  values[179] = @"geometry";
  values[180] = @"vertices";
  values[181] = @"left_eye";
  values[182] = @"right_eye";
  values[183] = @"look_at_point";
  values[184] = @"landmarks";
  values[185] = @"debug";
  values[186] = @"identity_coefficients";
  values[187] = @"blendshape_names";
  values[188] = @"landmark_names";
  values[189] = @"mesh";
  values[190] = @"mesh_vertices";
  values[191] = @"mesh_normals";
  values[192] = @"mesh_tri_indices";
  values[193] = @"mesh_quad_indices";
  values[194] = @"rotation";
  values[195] = @"translation";
  values[196] = @"rgb_camera";
  values[197] = @"intrinsics";
  values[198] = @"extrinsics";
  values[199] = @"raw_data";
  values[200] = @"smooth_data";
  values[201] = @"timestamp";
  values[202] = @"RgbMetaData";
  values[203] = @"TotalGain";
  values[204] = @"confidence";
  values[205] = @"data_failure";
  values[206] = @"image_too_dark";
  values[207] = @"sensor_covered";
  values[208] = @"Timestamp";
  values[209] = @"BarcodeDecodeData";
  values[210] = @"BarcodeRawData";
  values[211] = @"BarcodeType";
  values[212] = @"CodeLocation";
  values[213] = @"LocatorPoints";
  values[214] = @"DecodeConfidence";
  values[215] = @"CodeProperties";
  values[216] = @"BarcodeRect";
  values[217] = @"BarcodeCorners";
  values[218] = @"SymbolVersion";
  values[219] = @"QRMASK";
  values[220] = @"ErrorCorrectionLevel";
  values[221] = @"AztecDataIsCompact";
  values[222] = @"AztecDataLayers";
  values[223] = @"AztecDataCodewords";
  values[224] = @"DataMatrixECC";
  values[225] = @"ModulesWide";
  values[226] = @"ModulesHigh";
  values[227] = @"PDF417IsCompact";
  values[228] = @"DataCodewordsWide";
  values[229] = @"DataCodewordsHigh";
  values[230] = @"ClientSpecifiedMetadata";
  values[231] = @"ClientSpecifiedDebugMetadata";
  values[232] = @"OfflineVideoStabilizationMetadata";
  values[233] = @"StreamReadyForPanoramaCapture";
  values[234] = @"AELocked";
  values[235] = @"AFLocked";
  values[236] = @"AWBLocked";
  values[237] = @"DynamicToneCurveLocked";
  values[238] = @"FramePTS";
  values[239] = @"MotionData";
  values[240] = @"ScalingFactor";
  values[241] = @"FusedMotion";
  values[242] = @"AELimitCurrentToBaseExposureRatio";
  values[243] = @"LTMLocked";
  values[244] = @"AWBComputedRGain";
  values[245] = @"AWBComputedGGain";
  values[246] = @"AWBComputedBGain";
  values[247] = @"CriticalFocusErrorOccurred";
  values[248] = @"LowLightBinnedModeActive";
  values[249] = @"OriginalPresentationTimeStamp";
  values[250] = *(void **)MEMORY[0x263F0F4A0];
  values[251] = @"1";
  values[252] = @"2";
  values[253] = @"3";
  values[254] = @"4";
  values[255] = @"5";
  values[256] = @"6";
  values[257] = @"7";
  values[258] = @"8";
  values[259] = @"9";
  values[260] = @"10";
  values[261] = @"40";
  values[262] = @"11";
  values[263] = @"12";
  values[264] = @"13";
  values[265] = @"14";
  values[266] = @"15";
  values[267] = @"16";
  values[268] = @"17";
  values[269] = @"18";
  values[270] = @"19";
  values[271] = @"20";
  values[272] = @"21";
  values[273] = @"22";
  values[274] = @"23";
  values[275] = @"24";
  values[276] = @"25";
  values[277] = @"26";
  values[278] = @"27";
  values[279] = @"28";
  values[280] = @"29";
  values[281] = @"30";
  values[282] = @"31";
  values[283] = @"32";
  values[284] = @"33";
  values[285] = @"34";
  values[286] = @"35";
  values[287] = @"36";
  values[288] = @"37";
  values[289] = @"38";
  values[290] = @"39";
  values[291] = @"41";
  values[292] = @"42";
  values[293] = @"43";
  values[294] = @"44";
  values[295] = @"45";
  values[296] = @"46";
  values[297] = @"47";
  values[298] = @"48";
  values[299] = @"49";
  values[300] = @"50";
  values[301] = @"51";
  values[302] = @"52";
  values[303] = @"53";
  values[304] = @"54";
  values[305] = @"55";
  values[306] = @"56";
  values[307] = @"57";
  values[308] = @"58";
  values[309] = @"59";
  values[310] = @"60";
  values[311] = @"61";
  values[312] = @"62";
  values[313] = @"63";
  values[314] = @"64";
  values[315] = @"65";
  values[316] = @"66";
  values[317] = @"67";
  values[318] = @"68";
  values[319] = @"69";
  values[320] = @"70";
  values[321] = @"71";
  values[322] = @"72";
  values[323] = @"73";
  values[324] = @"74";
  values[325] = @"75";
  values[326] = @"77";
  values[327] = @"78";
  values[328] = @"79";
  values[329] = @"80";
  values[330] = @"81";
  values[331] = @"82";
  values[332] = @"83";
  values[333] = @"84";
  values[334] = @"85";
  values[335] = @"87";
  values[336] = @"90";
  values[337] = *(void **)MEMORY[0x263F0F518];
  values[338] = *(void **)MEMORY[0x263F0F530];
  values[339] = *(void **)MEMORY[0x263F0F538];
  values[340] = *(void **)MEMORY[0x263F0F550];
  values[341] = *(void **)MEMORY[0x263F0F520];
  values[342] = *(void **)MEMORY[0x263F0F510];
  values[343] = *(void **)MEMORY[0x263F0F558];
  values[344] = *(void **)MEMORY[0x263F0F560];
  values[345] = *(void **)MEMORY[0x263F0F548];
  values[346] = *(void **)MEMORY[0x263F0F1A0];
  values[347] = *(void **)MEMORY[0x263F0F198];
  values[348] = *(void **)MEMORY[0x263F0F138];
  values[349] = *(void **)MEMORY[0x263F0F178];
  values[350] = *(void **)MEMORY[0x263F0F0D8];
  values[351] = *(void **)MEMORY[0x263F0F170];
  values[352] = *(void **)MEMORY[0x263F0F150];
  values[353] = *(void **)MEMORY[0x263F0F148];
  values[354] = *(void **)MEMORY[0x263F0F0F8];
  values[355] = *(void **)MEMORY[0x263F0F190];
  values[356] = *(void **)MEMORY[0x263F0F100];
  values[357] = *(void **)MEMORY[0x263F0F108];
  values[358] = *(void **)MEMORY[0x263F0F128];
  values[359] = *(void **)MEMORY[0x263F0F130];
  values[360] = *(void **)MEMORY[0x263F0F110];
  values[361] = *(void **)MEMORY[0x263F0F118];
  values[362] = *(void **)MEMORY[0x263F0F0C8];
  values[363] = *(void **)MEMORY[0x263F0F0D0];
  values[364] = *(void **)MEMORY[0x263F0F0E0];
  values[365] = *(void **)MEMORY[0x263F0F0E8];
  values[366] = *(void **)MEMORY[0x263F0F0F0];
  values[367] = *(void **)MEMORY[0x263F0F160];
  values[368] = *(void **)MEMORY[0x263F0F120];
  values[369] = *(void **)MEMORY[0x263F0F168];
  values[370] = *(void **)MEMORY[0x263F0F158];
  values[371] = *(void **)MEMORY[0x263F0F188];
  values[372] = *(void **)MEMORY[0x263F0F180];
  values[373] = *(void **)MEMORY[0x263F0F140];
  values[374] = @"FlatDictionaryContent";
  values[375] = @"FlatDictionaryKeySpec";
  values[376] = @"HasCorrespondingVisionData";
  values[377] = @"SynchronizedStreamsCaptureID";
  values[378] = @"DepthMetadata";
  values[379] = @"Quality";
  values[380] = @"Filtered";
  values[381] = @"Accuracy";
  values[382] = @"IntrinsicMatrix";
  values[383] = @"IntrinsicMatrixReferenceDimensions";
  values[384] = @"ExtrinsicMatrix";
  values[385] = @"PixelSize";
  values[386] = @"LensDistortionCoefficients";
  values[387] = @"InverseLensDistortionCoefficients";
  values[388] = @"LensDistortionCenter";
  values[389] = @"DepthDataVersion";
  values[390] = @"PortraitScoreIsHigh";
  values[391] = @"PortraitScore";
  values[392] = @"SimulatedAperture";
  values[393] = @"RenderingParameters";
  values[394] = @"EffectStrength";
  values[395] = @"HasCorrespondingDepthData";
  values[396] = @"TextRegions";
  values[397] = @"TextRegionsCount";
  values[398] = @"BoundingRect";
  values[399] = @"Timestamp";
  values[400] = @"RegionID";
  values[401] = @"AngularOffset";
  values[402] = @"AngularOffsetBoundingRect";
  values[403] = @"Confidence";
  values[404] = @"com.apple.cmio.format_extension.video.only_has_i_frames";
  values[405] = @"com.apple.cmio.format_extension.muxed.video_constituent_format";
  values[406] = @"com.apple.cmio.format_extension.muxed.audio_constituent_format";
  values[407] = @"mjht";
  values[408] = @"TransportLayer";
  values[409] = @"ispDGainRangeExpansionFactor";
  values[410] = @"ScalingFactor";
  values[411] = @"TemporalNoiseReductionBand0Strength";
  values[412] = @"TemporalNoiseReductionBand0StrengthModulationEnabled";
  values[413] = @"NormalizedSNRQsum";
  values[414] = @"88";
  values[415] = @"89";
  values[416] = @"SceneClassificationConfidences";
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values[417] = @"VisualIntelligence";
  values[418] = @"ObjectDetectionCachedResult";
  values[419] = @"92";
  return CFArrayCreate(v18, (const void **)values, 420, MEMORY[0x263EFFF70]);
}

void FigStartCaptureServers()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      FigStartCaptureServers_cold_1();
    }
  }
  else
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CMCapture");
    if (BundleWithIdentifier)
    {
      v1 = BundleWithIdentifier;
      id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"FigCaptureMemoryReporterStart", @"FigExternalStorageDeviceManagerServerStart", @"FigCapturePreloadShaders", @"FigCaptureSourceServerStart", @"FigCameraViewfinderServerStart", @"FigCaptureSessionServerStart", @"FigFlashlightServerStart", @"FigCaptureDeferredContainerManagerServerStart", 0);
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v11;
        CFNumberRef v6 = &_os_log_internal;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v11 != v5) {
              objc_enumerationMutation(v2);
            }
            CFStringRef v8 = *(const __CFString **)(*((void *)&v10 + 1) + 8 * i);
            FunctionPointerForName = (void (*)(void))CFBundleGetFunctionPointerForName(v1, v8);
            if (FunctionPointerForName)
            {
              FunctionPointerForName();
            }
            else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              FigStartCaptureServers_cold_3(buf, (uint64_t)v8, &v15);
            }
          }
          uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
        }
        while (v4);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      FigStartCaptureServers_cold_2();
    }
  }
}

void FigStartCaptureServers_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21088D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Using FigStartCaptureServers() when cameracaptured is enabled is an error.  Not starting camera capture servers.", v0, 2u);
}

void FigStartCaptureServers_cold_2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21088D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not find com.apple.CMCapture", v0, 2u);
}

void FigStartCaptureServers_cold_3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21088D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not find %@", buf, 0xCu);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x270EE45D8](bundle, functionName);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}