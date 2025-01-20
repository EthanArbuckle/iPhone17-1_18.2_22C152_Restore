@interface CPMSStateReader
+ (id)copyCPMSControlStateSnapshots;
+ (id)copyCPMSPmaxState:(int *)a3;
+ (id)getCPMSControlStateSnapshotDictionary:(CPMSPPMControlStateSnapshot *)a3;
+ (id)getPowerBudgetDictionary:(CPMSPPMPowerBudget *)a3;
+ (id)log;
+ (id)timescaleDisplayName:(char)a3;
+ (void)copyCPMSControlStateSnapshots;
@end

@implementation CPMSStateReader

+ (id)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)log_log_0;
  return v2;
}

uint64_t __22__CPMSStateReader_log__block_invoke()
{
  log_log_0 = (uint64_t)os_log_create("com.apple.cpms.control", "framework");
  return MEMORY[0x1F41817F8]();
}

+ (id)copyCPMSPmaxState:(int *)a3
{
  kern_return_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  NSObject *v64;
  int v65;
  id v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *context;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  mach_port_t connection[2];
  size_t v141;
  long long outputStruct;
  long long v143;
  long long v144;
  long long v145;
  long long v146;
  long long v147;
  long long v148;
  long long v149;
  long long v150;
  long long v151;
  long long v152;
  long long v153;
  long long v154;
  long long v155;
  long long v156;
  long long v157;
  uint64_t v158;

  v158 = 0;
  v157 = 0u;
  v156 = 0u;
  v155 = 0u;
  v154 = 0u;
  v153 = 0u;
  v152 = 0u;
  v151 = 0u;
  v150 = 0u;
  v149 = 0u;
  v148 = 0u;
  v147 = 0u;
  v146 = 0u;
  v145 = 0u;
  v144 = 0u;
  v143 = 0u;
  outputStruct = 0u;
  v141 = 264;
  *(void *)connection = 0;
  context = (void *)MEMORY[0x1E0194B40](a1, a2);
  if ((openIOConnectObjectForApplePPM(&connection[1], connection) & 1) == 0)
  {
    v64 = +[CPMSStateReader log];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      +[CPMSStateReader copyCPMSPmaxState:]();
    }
    v82 = 0;
    v81 = 0;
    v80 = 0;
    goto LABEL_4;
  }
  v3 = IOConnectCallMethod(connection[0], 0x22u, 0, 0, 0, 0, 0, 0, &outputStruct, &v141);
  if (!v3)
  {
    v4 = objc_opt_new();
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(unint64_t)outputStruct / 1000000000.0];
    v79 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v82 = v4;
    v81 = (void *)v5;
    v78 = [v4 stringFromDate:v5];
    v128 = [NSNumber numberWithUnsignedLongLong:(void)outputStruct];
    v139 = [NSNumber numberWithBool:BYTE12(outputStruct)];
    v127 = [NSNumber numberWithBool:BYTE13(outputStruct)];
    v138 = [NSNumber numberWithBool:v158];
    v120 = [NSNumber numberWithUnsignedInt:DWORD2(outputStruct)];
    LODWORD(v6) = v143;
    v137 = [NSNumber numberWithFloat:v6];
    LODWORD(v7) = DWORD1(v143);
    v118 = [NSNumber numberWithFloat:v7];
    LODWORD(v8) = DWORD2(v143);
    v136 = [NSNumber numberWithFloat:v8];
    LODWORD(v9) = HIDWORD(v143);
    v135 = [NSNumber numberWithFloat:v9];
    LODWORD(v10) = v144;
    v134 = [NSNumber numberWithFloat:v10];
    LODWORD(v11) = DWORD1(v144);
    v133 = [NSNumber numberWithFloat:v11];
    LODWORD(v12) = DWORD2(v144);
    v77 = [NSNumber numberWithFloat:v12];
    LODWORD(v13) = HIDWORD(v144);
    v132 = [NSNumber numberWithFloat:v13];
    LODWORD(v14) = v145;
    v131 = [NSNumber numberWithFloat:v14];
    LODWORD(v15) = DWORD1(v145);
    v130 = [NSNumber numberWithFloat:v15];
    LODWORD(v16) = DWORD2(v145);
    v129 = [NSNumber numberWithFloat:v16];
    LODWORD(v17) = HIDWORD(v145);
    v126 = [NSNumber numberWithFloat:v17];
    LODWORD(v18) = v146;
    v125 = [NSNumber numberWithFloat:v18];
    LODWORD(v19) = DWORD1(v146);
    v124 = [NSNumber numberWithFloat:v19];
    LODWORD(v20) = DWORD2(v146);
    v123 = [NSNumber numberWithFloat:v20];
    LODWORD(v21) = HIDWORD(v146);
    v76 = [NSNumber numberWithFloat:v21];
    LODWORD(v22) = v147;
    v122 = [NSNumber numberWithFloat:v22];
    LODWORD(v23) = DWORD1(v147);
    v121 = [NSNumber numberWithFloat:v23];
    LODWORD(v24) = DWORD2(v147);
    v119 = [NSNumber numberWithFloat:v24];
    LODWORD(v25) = HIDWORD(v147);
    v117 = [NSNumber numberWithFloat:v25];
    LODWORD(v26) = v148;
    v116 = [NSNumber numberWithFloat:v26];
    LODWORD(v27) = DWORD1(v148);
    v115 = [NSNumber numberWithFloat:v27];
    LODWORD(v28) = DWORD2(v148);
    v114 = [NSNumber numberWithFloat:v28];
    LODWORD(v29) = HIDWORD(v148);
    v75 = [NSNumber numberWithFloat:v29];
    LODWORD(v30) = v149;
    v113 = [NSNumber numberWithFloat:v30];
    LODWORD(v31) = DWORD1(v149);
    v112 = [NSNumber numberWithFloat:v31];
    LODWORD(v32) = DWORD2(v149);
    v111 = [NSNumber numberWithFloat:v32];
    LODWORD(v33) = HIDWORD(v149);
    v110 = [NSNumber numberWithFloat:v33];
    v109 = [NSNumber numberWithBool:v150];
    v108 = [NSNumber numberWithBool:BYTE1(v150)];
    v107 = [NSNumber numberWithBool:BYTE2(v150)];
    LODWORD(v34) = DWORD2(v150);
    v74 = [NSNumber numberWithFloat:v34];
    LODWORD(v35) = HIDWORD(v150);
    v106 = [NSNumber numberWithFloat:v35];
    v105 = [NSNumber numberWithUnsignedInt:v151];
    v104 = [NSNumber numberWithBool:BYTE8(v151)];
    LODWORD(v36) = v152;
    v103 = [NSNumber numberWithFloat:v36];
    LODWORD(v37) = DWORD1(v152);
    v102 = [NSNumber numberWithFloat:v37];
    LODWORD(v38) = DWORD2(v152);
    v101 = [NSNumber numberWithFloat:v38];
    LODWORD(v39) = HIDWORD(v152);
    v100 = [NSNumber numberWithFloat:v39];
    LODWORD(v40) = v153;
    v99 = [NSNumber numberWithFloat:v40];
    LODWORD(v41) = DWORD1(v153);
    v98 = [NSNumber numberWithFloat:v41];
    LODWORD(v42) = DWORD2(v153);
    v97 = [NSNumber numberWithFloat:v42];
    LODWORD(v43) = HIDWORD(v153);
    v96 = [NSNumber numberWithFloat:v43];
    LODWORD(v44) = v154;
    v95 = [NSNumber numberWithFloat:v44];
    LODWORD(v45) = DWORD2(v155);
    v94 = [NSNumber numberWithFloat:v45];
    LODWORD(v46) = DWORD1(v154);
    v93 = [NSNumber numberWithFloat:v46];
    LODWORD(v47) = DWORD2(v157);
    v92 = [NSNumber numberWithFloat:v47];
    LODWORD(v48) = HIDWORD(v157);
    v91 = [NSNumber numberWithFloat:v48];
    LODWORD(v49) = DWORD2(v154);
    v90 = [NSNumber numberWithFloat:v49];
    LODWORD(v50) = HIDWORD(v154);
    v89 = [NSNumber numberWithFloat:v50];
    LODWORD(v51) = DWORD1(v155);
    v88 = [NSNumber numberWithFloat:v51];
    LODWORD(v52) = v155;
    v87 = [NSNumber numberWithFloat:v52];
    LODWORD(v53) = HIDWORD(v155);
    v86 = [NSNumber numberWithFloat:v53];
    LODWORD(v54) = v156;
    v85 = [NSNumber numberWithFloat:v54];
    LODWORD(v55) = DWORD1(v156);
    v56 = [NSNumber numberWithFloat:v55];
    LODWORD(v57) = DWORD2(v156);
    v73 = [NSNumber numberWithFloat:v57];
    LODWORD(v58) = HIDWORD(v156);
    v59 = [NSNumber numberWithFloat:v58];
    LODWORD(v60) = v157;
    v72 = [NSNumber numberWithFloat:v60];
    LODWORD(v61) = DWORD1(v157);
    v62 = [NSNumber numberWithFloat:v61];
    v71 = [NSNumber numberWithBool:BYTE11(v151)];
    v63 = [NSNumber numberWithBool:BYTE13(v151)];
    v70 = [NSNumber numberWithBool:BYTE10(v151)];
    v69 = [NSNumber numberWithBool:BYTE12(v151)];
    v68 = [NSNumber numberWithBool:BYTE9(v151)];
    v64 = v78;
    v80 = objc_msgSend(v79, "initWithObjectsAndKeys:", v78, @"Datetime", v128, @"Timestamp", v139, @"EnableAgingModel", v127, @"UseFreshCallParams", v138, @"UsingSpecificRCParams", v120, @"ChemId", v137, @"MeasuredPb (mW)", v118, @"MeasuredPp (mW)", v136,
                    @"MeasuredPs (mW)",
                    v135,
                    @"MeasuredPu (mW)",
                    v134,
                    @"ShortHorizonPb (mW)",
                    v133,
                    @"ShortHorizonPp (mW)",
                    v77,
                    @"ShortHorizonPs (mW)",
                    v132,
                    @"ShortHorizonPu (mW)",
                    v131,
                    @"PuSouth (mW)",
                    v130,
                    @"PsCutoffVoltage (mV)",
                    v129,
                    @"PuCutoffVoltage (mV)",
                    v126,
                    @"systemLoadFilteredCurrentRc3 (mA)",
                    v125,
                    @"systemLoadFilteredCurrentRc4 (mA)",
                    v124,
                    @"systemLoadRssFiltered (mΩ)",
                    v123,
                    @"WeightFactorModelPs",
                    v76,
                    @"WeightFactorModelPp",
                    v122,
                    @"systemLoadPmaxVoltage (mV)",
                    v121,
                    @"systemLoadPmaxCurrent (mA)",
                    v119,
                    @"AlgoTemperature (°C)",
                    v117,
                    @"Rss (mΩ)",
                    v116,
                    @"WRa (mΩ)",
                    v115,
                    @"Iss (mA)",
                    v114,
                    @"InstantAmperage (mA)",
                    v75,
                    @"Amperage (mA)",
                    v113);

LABEL_4:
    v65 = 0;
    goto LABEL_5;
  }
  v65 = v3;
  v64 = +[CPMSStateReader log];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
    +[CPMSStateReader copyCPMSPmaxState:](v65, v64);
  }
  v82 = 0;
  v81 = 0;
  v80 = 0;
LABEL_5:

  closeIOConnectObjectForApplePPM((unint64_t)&connection[1], connection);
  if (a3 && v65) {
    *a3 = v65;
  }
  v66 = v80;

  return v66;
}

+ (id)copyCPMSControlStateSnapshots
{
  bzero(outputStruct, 0x1BC0uLL);
  *(void *)connection = 0;
  size_t outputStructCnt = 7104;
  v3 = (void *)MEMORY[0x1E0194B40]();
  if ((openIOConnectObjectForApplePPM(&connection[1], connection) & 1) == 0)
  {
    v11 = +[CPMSStateReader log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CPMSStateReader copyCPMSPmaxState:]();
    }
    goto LABEL_14;
  }
  if (IOConnectCallStructMethod(connection[0], 0x1Eu, 0, 0, outputStruct, &outputStructCnt))
  {
    v11 = +[CPMSStateReader log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CPMSStateReader copyCPMSControlStateSnapshots]();
    }
LABEL_14:

    v9 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  size_t v4 = outputStructCnt / 0x378;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(int)(outputStructCnt / 0x378)];
  if ((int)v4 >= 1)
  {
    uint64_t v6 = v4;
    v7 = outputStruct;
    do
    {
      if (*v7)
      {
        v8 = [a1 getCPMSControlStateSnapshotDictionary:v7];
        [v5 addObject:v8];
      }
      v7 += 111;
      --v6;
    }
    while (v6);
  }
  v9 = (void *)[v5 copy];
LABEL_9:
  closeIOConnectObjectForApplePPM((unint64_t)&connection[1], connection);

  return v9;
}

+ (id)getCPMSControlStateSnapshotDictionary:(CPMSPPMControlStateSnapshot *)a3
{
  v66[28] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    for (uint64_t i = 8; i != 36; i += 4)
    {
      LODWORD(v6) = *(_DWORD *)((char *)&a3->var0 + i);
      v8 = [NSNumber numberWithFloat:v6];
      [v5 addObject:v8];
    }
    v64 = v5;
    int v9 = 6;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
    do
    {
      [v10 addObject:&unk_1F35F4BB8];
      --v9;
    }
    while (v9);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    for (uint64_t j = 840; j != 872; j += 4)
    {
      LODWORD(v12) = *(_DWORD *)((char *)&a3->var0 + j);
      v14 = [NSNumber numberWithFloat:v12];
      [v11 addObject:v14];
    }
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    for (uint64_t k = 740; k != 772; k += 4)
    {
      v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&a3->var0 + k)];
      [v15 addObject:v17];
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    for (uint64_t m = 776; m != 788; m += 4)
    {
      v20 = [NSNumber numberWithInt:*(unsigned int *)((char *)&a3->var0 + m)];
      [v18 addObject:v20];
    }
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    for (uint64_t n = 60; n != 400; n += 17)
    {
      v23 = [a1 getPowerBudgetDictionary:(char *)a3 + n];
      if (v23) {
        [v21 addObject:v23];
      }
    }
    v63 = v21;
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    for (iuint64_t i = 400; ii != 740; ii += 17)
    {
      v26 = [a1 getPowerBudgetDictionary:(char *)a3 + ii];
      if (v26) {
        [v24 addObject:v26];
      }
    }
    v65[0] = @"timestamp";
    v62 = [NSNumber numberWithUnsignedLongLong:a3->var0];
    v66[0] = v62;
    v65[1] = @"reason";
    v61 = [NSNumber numberWithUnsignedChar:a3->var9[6].var2[0].var0];
    v66[1] = v61;
    v65[2] = @"overrideFlags";
    v60 = [NSNumber numberWithUnsignedInt:a3->var9[6].var2[0].var1];
    v66[2] = v60;
    v65[3] = @"mode";
    v59 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&a3->var9[6].var0];
    v66[3] = v59;
    v65[4] = @"AllowPolicyRun";
    v58 = [NSNumber numberWithBool:a3->var9[6].var2[1].var0];
    v66[4] = v58;
    v65[5] = @"SystemLoadFraction";
    LODWORD(v27) = a3->var9[6].var2[1].var1;
    v57 = [NSNumber numberWithFloat:v27];
    v66[5] = v57;
    v65[6] = @"droopCE";
    *(float *)&double v28 = a3->var4;
    v56 = [NSNumber numberWithFloat:v28];
    v66[6] = v56;
    v65[7] = @"droopIS";
    *(float *)&double v29 = a3->var5;
    v55 = [NSNumber numberWithFloat:v29];
    v66[7] = v55;
    v65[8] = @"undroopCE";
    *(float *)&double v30 = a3->var6;
    v54 = [NSNumber numberWithFloat:v30];
    v66[8] = v54;
    v65[9] = @"undroopIS";
    *(float *)&double v31 = a3->var7;
    v53 = [NSNumber numberWithFloat:v31];
    v66[9] = v53;
    v65[10] = @"zeroSumCE";
    *(float *)&double v32 = a3->var3;
    v52 = [NSNumber numberWithFloat:v32];
    v66[10] = v52;
    v65[11] = @"servoCEs";
    v51 = (void *)[v64 copy];
    v66[11] = v51;
    v65[12] = @"remCapCEFloors";
    v50 = (void *)[v10 copy];
    v66[12] = v50;
    v65[13] = @"laneCEs";
    v49 = (void *)[v11 copy];
    v66[13] = v49;
    v65[14] = @"peakPowerPressureLevel";
    v48 = [NSNumber numberWithUnsignedInt:a3->var2];
    v66[14] = v48;
    v65[15] = @"batteryPowerConsumption";
    v47 = (void *)[v15 copy];
    v66[15] = v47;
    v65[16] = @"systemCapability";
    v46 = (void *)[v18 copy];
    v66[16] = v46;
    v65[17] = @"systemCapabilitySource";
    v45 = [NSNumber numberWithUnsignedChar:a3->var9[5].var2[1].var0];
    v66[17] = v45;
    v65[18] = @"requestedBudgets";
    v44 = (void *)[v63 copy];
    v66[18] = v44;
    v65[19] = @"grantedBudgets";
    v43 = (void *)[v24 copy];
    v66[19] = v43;
    v65[20] = @"lastEngagedCriticalDroopTimeStamp";
    v42 = [NSNumber numberWithUnsignedLongLong:*(void *)&a3->var9[7].var2[0].var1];
    v66[20] = v42;
    v65[21] = @"lastDisengagedCriticalDroopTimeStamp";
    v41 = [NSNumber numberWithUnsignedLongLong:*(void *)&a3->var9[7].var2[1].var1];
    v66[21] = v41;
    v65[22] = @"lastEngagedPolicyTimeStamp";
    v40 = [NSNumber numberWithUnsignedLongLong:*(void *)&a3->var9[6].var2[2]];
    v66[22] = v40;
    v65[23] = @"lastDisengagedPolicyTimeStamp";
    v39 = [NSNumber numberWithUnsignedLongLong:*(void *)&a3->var9[7].var0];
    v66[23] = v39;
    v65[24] = @"remainingCapacity";
    v33 = [NSNumber numberWithInt:*(unsigned int *)&a3->var9[9].var0];
    v66[24] = v33;
    v65[25] = @"brownoutRiskSysCap";
    v34 = [NSNumber numberWithInt:*(unsigned int *)&a3->var9[9].var2[0].var0];
    v66[25] = v34;
    v65[26] = @"brownoutRiskPu";
    v35 = [NSNumber numberWithInt:a3->var9[9].var2[0].var1];
    v66[26] = v35;
    v65[27] = @"brownoutRiskNotificationEngaged";
    v36 = [NSNumber numberWithBool:a3->var9[9].var2[1].var0];
    v66[27] = v36;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:28];
  }
  else
  {
    v37 = 0;
  }
  return v37;
}

+ (id)getPowerBudgetDictionary:(CPMSPPMPowerBudget *)a3
{
  p_var0 = &a3->var0;
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t var1 = a3->var1;
    if (a3->var1)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:var1];
      uint64_t v6 = 0;
      uint64_t v7 = 5 * var1;
      do
      {
        v18[0] = @"timescale";
        v8 = [NSNumber numberWithChar:(char)p_var0[v6 + 2]];
        v18[1] = @"level";
        v19[0] = v8;
        int v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&p_var0[v6 + 3]];
        v19[1] = v9;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        [v5 addObject:v10];

        v6 += 5;
      }
      while (v7 != v6);
      v11 = clientNames[*p_var0];
      v16[0] = @"clientID";
      double v12 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
      v17[0] = v12;
      v16[1] = @"clientName";
      v13 = [NSString stringWithUTF8String:v11];
      v17[1] = v13;
      v16[2] = @"timescales";
      v14 = (void *)[v5 copy];
      v17[2] = v14;
      p_var0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    }
    else
    {
      p_var0 = 0;
    }
  }
  return p_var0;
}

+ (id)timescaleDisplayName:(char)a3
{
  if (a3 <= 3)
  {
    v5 = objc_msgSend(NSString, "stringWithUTF8String:", timescaleNames[a3], v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)copyCPMSPmaxState:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB92B000, a2, OS_LOG_TYPE_ERROR, "<Error> GetBatteryPmaxState call failed with error %d", (uint8_t *)v2, 8u);
}

+ (void)copyCPMSPmaxState:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> Failed to open connection to ApplePPM", v2, v3, v4, v5, v6);
}

+ (void)copyCPMSControlStateSnapshots
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> failed to get control state", v2, v3, v4, v5, v6);
}

@end