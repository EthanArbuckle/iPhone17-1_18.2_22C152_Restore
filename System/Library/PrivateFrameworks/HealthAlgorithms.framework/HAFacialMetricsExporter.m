@interface HAFacialMetricsExporter
- (HAFacialMetricsExporter)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (NSData)packet;
- (id)sr_dictionaryRepresentation;
- (unsigned)packetType;
@end

@implementation HAFacialMetricsExporter

- (HAFacialMetricsExporter)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HAFacialMetricsExporter;
  v8 = [(HAFacialMetricsExporter *)&v16 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v8->_packet, a3);
  if ((unint64_t)[v7 length] <= 3)
  {
    v10 = ha_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[HAFacialMetricsExporter initWithBinarySampleRepresentation:metadata:timestamp:](v10);
    }
LABEL_5:

LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  [v7 getBytes:&v9->_packetType length:4];
  unsigned int v11 = [(HAFacialMetricsExporter *)v9 packetType];
  if (v11 >= 6)
  {
    v10 = ha_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[HAFacialMetricsExporter initWithBinarySampleRepresentation:metadata:timestamp:](buf, [(HAFacialMetricsExporter *)v9 packetType], v10);
    }
    goto LABEL_5;
  }
  uint64_t v12 = qword_222795638[v11];
  if ([v7 length] != v12)
  {
    v14 = ha_get_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[HAFacialMetricsExporter initWithBinarySampleRepresentation:metadata:timestamp:](buf, v12, [v7 length], v14);
    }

    goto LABEL_15;
  }
  v13 = v9;
LABEL_16:

  return v13;
}

- (id)sr_dictionaryRepresentation
{
  v230[8] = *MEMORY[0x263EF8340];
  id v208 = (id)objc_opt_new();
  v229[0] = @"lock_session_id";
  v206 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v230[0] = v206;
  v229[1] = @"lock_session_relative_timestamp";
  v204 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v230[1] = v204;
  v229[2] = @"messages_session_id";
  v202 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v230[2] = v202;
  v229[3] = @"message_session_relative_timestamp";
  v200 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v230[3] = v200;
  v229[4] = @"pose";
  v227[0] = @"rotation";
  LODWORD(v2) = *(_DWORD *)(a1 + 72);
  v198 = [NSNumber numberWithFloat:v2];
  v225[0] = v198;
  LODWORD(v3) = *(_DWORD *)(a1 + 76);
  v196 = [NSNumber numberWithFloat:v3];
  v225[1] = v196;
  LODWORD(v4) = *(_DWORD *)(a1 + 80);
  v194 = [NSNumber numberWithFloat:v4];
  v225[2] = v194;
  v193 = [MEMORY[0x263EFF8C0] arrayWithObjects:v225 count:3];
  v226[0] = v193;
  LODWORD(v5) = *(_DWORD *)(a1 + 84);
  v192 = [NSNumber numberWithFloat:v5];
  v224[0] = v192;
  LODWORD(v6) = *(_DWORD *)(a1 + 88);
  v191 = [NSNumber numberWithFloat:v6];
  v224[1] = v191;
  LODWORD(v7) = *(_DWORD *)(a1 + 92);
  v190 = [NSNumber numberWithFloat:v7];
  v224[2] = v190;
  v189 = [MEMORY[0x263EFF8C0] arrayWithObjects:v224 count:3];
  v226[1] = v189;
  LODWORD(v8) = *(_DWORD *)(a1 + 96);
  v188 = [NSNumber numberWithFloat:v8];
  v223[0] = v188;
  LODWORD(v9) = *(_DWORD *)(a1 + 100);
  v187 = [NSNumber numberWithFloat:v9];
  v223[1] = v187;
  LODWORD(v10) = *(_DWORD *)(a1 + 104);
  v186 = [NSNumber numberWithFloat:v10];
  v223[2] = v186;
  v185 = [MEMORY[0x263EFF8C0] arrayWithObjects:v223 count:3];
  v226[2] = v185;
  v184 = [MEMORY[0x263EFF8C0] arrayWithObjects:v226 count:3];
  v227[1] = @"translation";
  v228[0] = v184;
  LODWORD(v11) = *(_DWORD *)(a1 + 108);
  v183 = [NSNumber numberWithFloat:v11];
  v222[0] = v183;
  LODWORD(v12) = *(_DWORD *)(a1 + 112);
  v182 = [NSNumber numberWithFloat:v12];
  v222[1] = v182;
  LODWORD(v13) = *(_DWORD *)(a1 + 116);
  v181 = [NSNumber numberWithFloat:v13];
  v222[2] = v181;
  v180 = [MEMORY[0x263EFF8C0] arrayWithObjects:v222 count:3];
  v228[1] = v180;
  v179 = [NSDictionary dictionaryWithObjects:v228 forKeys:v227 count:2];
  v230[4] = v179;
  v229[5] = @"gaze";
  LODWORD(v14) = *(_DWORD *)(a1 + 160);
  v178 = [NSNumber numberWithFloat:v14];
  v221[0] = v178;
  LODWORD(v15) = *(_DWORD *)(a1 + 164);
  v177 = [NSNumber numberWithFloat:v15];
  v221[1] = v177;
  LODWORD(v16) = *(_DWORD *)(a1 + 168);
  v176 = [NSNumber numberWithFloat:v16];
  v221[2] = v176;
  v175 = [MEMORY[0x263EFF8C0] arrayWithObjects:v221 count:3];
  v230[5] = v175;
  v229[6] = @"blendshapes";
  v219[0] = @"eye_blink_left";
  LODWORD(v17) = *(_DWORD *)(a1 + 172);
  v174 = [NSNumber numberWithFloat:v17];
  v220[0] = v174;
  v219[1] = @"eye_blink_right";
  LODWORD(v18) = *(_DWORD *)(a1 + 176);
  v173 = [NSNumber numberWithFloat:v18];
  v220[1] = v173;
  v219[2] = @"eye_squint_left";
  LODWORD(v19) = *(_DWORD *)(a1 + 180);
  v172 = [NSNumber numberWithFloat:v19];
  v220[2] = v172;
  v219[3] = @"eye_squint_right";
  LODWORD(v20) = *(_DWORD *)(a1 + 184);
  v171 = [NSNumber numberWithFloat:v20];
  v220[3] = v171;
  v219[4] = @"eye_look_down_left";
  LODWORD(v21) = *(_DWORD *)(a1 + 188);
  v170 = [NSNumber numberWithFloat:v21];
  v220[4] = v170;
  v219[5] = @"eye_look_down_right";
  LODWORD(v22) = *(_DWORD *)(a1 + 192);
  v169 = [NSNumber numberWithFloat:v22];
  v220[5] = v169;
  v219[6] = @"eye_look_in_left";
  LODWORD(v23) = *(_DWORD *)(a1 + 196);
  v168 = [NSNumber numberWithFloat:v23];
  v220[6] = v168;
  v219[7] = @"eye_look_in_right";
  LODWORD(v24) = *(_DWORD *)(a1 + 200);
  v167 = [NSNumber numberWithFloat:v24];
  v220[7] = v167;
  v219[8] = @"eye_wide_left";
  LODWORD(v25) = *(_DWORD *)(a1 + 204);
  v166 = [NSNumber numberWithFloat:v25];
  v220[8] = v166;
  v219[9] = @"eye_wide_right";
  LODWORD(v26) = *(_DWORD *)(a1 + 208);
  v165 = [NSNumber numberWithFloat:v26];
  v220[9] = v165;
  v219[10] = @"eye_look_out_left";
  LODWORD(v27) = *(_DWORD *)(a1 + 212);
  v164 = [NSNumber numberWithFloat:v27];
  v220[10] = v164;
  v219[11] = @"eye_look_out_right";
  LODWORD(v28) = *(_DWORD *)(a1 + 216);
  v163 = [NSNumber numberWithFloat:v28];
  v220[11] = v163;
  v219[12] = @"eye_look_up_left";
  LODWORD(v29) = *(_DWORD *)(a1 + 220);
  v162 = [NSNumber numberWithFloat:v29];
  v220[12] = v162;
  v219[13] = @"eye_look_up_right";
  LODWORD(v30) = *(_DWORD *)(a1 + 224);
  v161 = [NSNumber numberWithFloat:v30];
  v220[13] = v161;
  v219[14] = @"brow_down_left";
  LODWORD(v31) = *(_DWORD *)(a1 + 228);
  v160 = [NSNumber numberWithFloat:v31];
  v220[14] = v160;
  v219[15] = @"brow_down_right";
  LODWORD(v32) = *(_DWORD *)(a1 + 232);
  v159 = [NSNumber numberWithFloat:v32];
  v220[15] = v159;
  v219[16] = @"brow_inner_up";
  LODWORD(v33) = *(_DWORD *)(a1 + 236);
  v158 = [NSNumber numberWithFloat:v33];
  v220[16] = v158;
  v219[17] = @"brow_outer_up_left";
  LODWORD(v34) = *(_DWORD *)(a1 + 240);
  v157 = [NSNumber numberWithFloat:v34];
  v220[17] = v157;
  v219[18] = @"brow_outer_up_right";
  LODWORD(v35) = *(_DWORD *)(a1 + 244);
  v156 = [NSNumber numberWithFloat:v35];
  v220[18] = v156;
  v219[19] = @"jaw_open";
  LODWORD(v36) = *(_DWORD *)(a1 + 248);
  v155 = [NSNumber numberWithFloat:v36];
  v220[19] = v155;
  v219[20] = @"mouth_close";
  LODWORD(v37) = *(_DWORD *)(a1 + 252);
  v154 = [NSNumber numberWithFloat:v37];
  v220[20] = v154;
  v219[21] = @"jaw_left";
  LODWORD(v38) = *(_DWORD *)(a1 + 256);
  v153 = [NSNumber numberWithFloat:v38];
  v220[21] = v153;
  v219[22] = @"jaw_right";
  LODWORD(v39) = *(_DWORD *)(a1 + 260);
  v152 = [NSNumber numberWithFloat:v39];
  v220[22] = v152;
  v219[23] = @"jaw_forward";
  LODWORD(v40) = *(_DWORD *)(a1 + 264);
  v151 = [NSNumber numberWithFloat:v40];
  v220[23] = v151;
  v219[24] = @"mouth_upper_up_left";
  LODWORD(v41) = *(_DWORD *)(a1 + 268);
  v150 = [NSNumber numberWithFloat:v41];
  v220[24] = v150;
  v219[25] = @"mouth_upper_up_right";
  LODWORD(v42) = *(_DWORD *)(a1 + 272);
  v149 = [NSNumber numberWithFloat:v42];
  v220[25] = v149;
  v219[26] = @"mouth_lower_down_left";
  LODWORD(v43) = *(_DWORD *)(a1 + 276);
  v148 = [NSNumber numberWithFloat:v43];
  v220[26] = v148;
  v219[27] = @"mouth_lower_down_right";
  LODWORD(v44) = *(_DWORD *)(a1 + 280);
  v147 = [NSNumber numberWithFloat:v44];
  v220[27] = v147;
  v219[28] = @"mouth_roll_upper";
  LODWORD(v45) = *(_DWORD *)(a1 + 284);
  v146 = [NSNumber numberWithFloat:v45];
  v220[28] = v146;
  v219[29] = @"mouth_roll_lower";
  LODWORD(v46) = *(_DWORD *)(a1 + 288);
  v145 = [NSNumber numberWithFloat:v46];
  v220[29] = v145;
  v219[30] = @"mouth_smile_left";
  LODWORD(v47) = *(_DWORD *)(a1 + 292);
  v144 = [NSNumber numberWithFloat:v47];
  v220[30] = v144;
  v219[31] = @"mouth_smile_right";
  LODWORD(v48) = *(_DWORD *)(a1 + 296);
  v143 = [NSNumber numberWithFloat:v48];
  v220[31] = v143;
  v219[32] = @"mouth_dimple_left";
  LODWORD(v49) = *(_DWORD *)(a1 + 300);
  v142 = [NSNumber numberWithFloat:v49];
  v220[32] = v142;
  v219[33] = @"mouth_dimple_right";
  LODWORD(v50) = *(_DWORD *)(a1 + 304);
  v141 = [NSNumber numberWithFloat:v50];
  v220[33] = v141;
  v219[34] = @"mouth_stretch_left";
  LODWORD(v51) = *(_DWORD *)(a1 + 308);
  v140 = [NSNumber numberWithFloat:v51];
  v220[34] = v140;
  v219[35] = @"mouth_stretch_right";
  LODWORD(v52) = *(_DWORD *)(a1 + 312);
  v139 = [NSNumber numberWithFloat:v52];
  v220[35] = v139;
  v219[36] = @"mouth_frown_left";
  LODWORD(v53) = *(_DWORD *)(a1 + 316);
  v138 = [NSNumber numberWithFloat:v53];
  v220[36] = v138;
  v219[37] = @"mouth_frown_right";
  LODWORD(v54) = *(_DWORD *)(a1 + 320);
  v137 = [NSNumber numberWithFloat:v54];
  v220[37] = v137;
  v219[38] = @"mouth_press_left";
  LODWORD(v55) = *(_DWORD *)(a1 + 324);
  v136 = [NSNumber numberWithFloat:v55];
  v220[38] = v136;
  v219[39] = @"mouth_press_right";
  LODWORD(v56) = *(_DWORD *)(a1 + 328);
  v135 = [NSNumber numberWithFloat:v56];
  v220[39] = v135;
  v219[40] = @"mouth_pucker";
  LODWORD(v57) = *(_DWORD *)(a1 + 332);
  v134 = [NSNumber numberWithFloat:v57];
  v220[40] = v134;
  v219[41] = @"mouth_funnel";
  LODWORD(v58) = *(_DWORD *)(a1 + 336);
  v133 = [NSNumber numberWithFloat:v58];
  v220[41] = v133;
  v219[42] = @"mouth_left";
  LODWORD(v59) = *(_DWORD *)(a1 + 340);
  v132 = [NSNumber numberWithFloat:v59];
  v220[42] = v132;
  v219[43] = @"mouth_right";
  LODWORD(v60) = *(_DWORD *)(a1 + 344);
  v131 = [NSNumber numberWithFloat:v60];
  v220[43] = v131;
  v219[44] = @"mouth_shrug_lower";
  LODWORD(v61) = *(_DWORD *)(a1 + 348);
  v130 = [NSNumber numberWithFloat:v61];
  v220[44] = v130;
  v219[45] = @"mouth_shrug_upper";
  LODWORD(v62) = *(_DWORD *)(a1 + 352);
  v129 = [NSNumber numberWithFloat:v62];
  v220[45] = v129;
  v219[46] = @"nose_sneer_left";
  LODWORD(v63) = *(_DWORD *)(a1 + 356);
  v128 = [NSNumber numberWithFloat:v63];
  v220[46] = v128;
  v219[47] = @"nose_sneer_right";
  LODWORD(v64) = *(_DWORD *)(a1 + 360);
  v127 = [NSNumber numberWithFloat:v64];
  v220[47] = v127;
  v219[48] = @"cheek_puff";
  LODWORD(v65) = *(_DWORD *)(a1 + 364);
  v126 = [NSNumber numberWithFloat:v65];
  v220[48] = v126;
  v219[49] = @"cheek_squint_left";
  LODWORD(v66) = *(_DWORD *)(a1 + 368);
  v125 = [NSNumber numberWithFloat:v66];
  v220[49] = v125;
  v219[50] = @"cheek_squint_right";
  LODWORD(v67) = *(_DWORD *)(a1 + 372);
  v124 = [NSNumber numberWithFloat:v67];
  v220[50] = v124;
  v123 = [NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:51];
  v230[6] = v123;
  v229[7] = @"face_positions";
  v217[0] = @"expressions";
  v215[0] = @"brow_furrow_and_eyes_wide_and_mouth_pressed_tight";
  LODWORD(v68) = *(_DWORD *)(a1 + 376);
  v122 = [NSNumber numberWithFloat:v68];
  v216[0] = v122;
  v215[1] = @"baseline";
  LODWORD(v69) = *(_DWORD *)(a1 + 380);
  v121 = [NSNumber numberWithFloat:v69];
  v216[1] = v121;
  v215[2] = @"nose_wrinkle_or_upper_lip_raise";
  LODWORD(v70) = *(_DWORD *)(a1 + 384);
  v120 = [NSNumber numberWithFloat:v70];
  v216[2] = v120;
  v215[3] = @"brow_raise_with_furrow_and_eye_widen_and_mouth_stretch";
  LODWORD(v71) = *(_DWORD *)(a1 + 388);
  v119 = [NSNumber numberWithFloat:v71];
  v216[3] = v119;
  v215[4] = @"lip_raise_and_cheek_raise";
  LODWORD(v72) = *(_DWORD *)(a1 + 392);
  v118 = [NSNumber numberWithFloat:v72];
  v216[4] = v118;
  v215[5] = @"inner_brow_raise_and_mouth_corner_depress";
  LODWORD(v73) = *(_DWORD *)(a1 + 396);
  v117 = [NSNumber numberWithFloat:v73];
  v216[5] = v117;
  v215[6] = @"brow_raise_without_furrow_and_eye_widen_and_jaw_drop";
  LODWORD(v74) = *(_DWORD *)(a1 + 400);
  v116 = [NSNumber numberWithFloat:v74];
  v216[6] = v116;
  v115 = [NSDictionary dictionaryWithObjects:v216 forKeys:v215 count:7];
  v218[0] = v115;
  v217[1] = @"key_actions";
  v213[0] = @"inner_brow_raise";
  LODWORD(v75) = *(_DWORD *)(a1 + 404);
  v114 = [NSNumber numberWithFloat:v75];
  v214[0] = v114;
  v213[1] = @"brow_raise_with_furrow";
  LODWORD(v76) = *(_DWORD *)(a1 + 408);
  v113 = [NSNumber numberWithFloat:v76];
  v214[1] = v113;
  v213[2] = @"brow_raise_without_furrow";
  LODWORD(v77) = *(_DWORD *)(a1 + 412);
  v112 = [NSNumber numberWithFloat:v77];
  v214[2] = v112;
  v213[3] = @"brow_furrow";
  LODWORD(v78) = *(_DWORD *)(a1 + 416);
  v79 = [NSNumber numberWithFloat:v78];
  v214[3] = v79;
  v213[4] = @"mouth_corner_depress";
  LODWORD(v80) = *(_DWORD *)(a1 + 420);
  v81 = [NSNumber numberWithFloat:v80];
  v214[4] = v81;
  v213[5] = @"mouth_stretch";
  LODWORD(v82) = *(_DWORD *)(a1 + 424);
  v83 = [NSNumber numberWithFloat:v82];
  v214[5] = v83;
  v213[6] = @"mouth_pressed_or_tight";
  LODWORD(v84) = *(_DWORD *)(a1 + 428);
  v85 = [NSNumber numberWithFloat:v84];
  v214[6] = v85;
  v213[7] = @"nose_wrinkle";
  LODWORD(v86) = *(_DWORD *)(a1 + 432);
  v87 = [NSNumber numberWithFloat:v86];
  v214[7] = v87;
  v88 = [NSDictionary dictionaryWithObjects:v214 forKeys:v213 count:8];
  v218[1] = v88;
  v89 = [NSDictionary dictionaryWithObjects:v218 forKeys:v217 count:2];
  v230[7] = v89;
  v90 = [NSDictionary dictionaryWithObjects:v230 forKeys:v229 count:8];
  [v208 addEntriesFromDictionary:v90];

  v211[0] = @"session_id";
  v207 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  v212[0] = v207;
  v211[1] = @"session_flags_enum";
  v205 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v212[1] = v205;
  v211[2] = @"geometry_left_eye";
  LODWORD(v91) = *(_DWORD *)(a1 + 120);
  v203 = [NSNumber numberWithFloat:v91];
  v210[0] = v203;
  LODWORD(v92) = *(_DWORD *)(a1 + 124);
  v201 = [NSNumber numberWithFloat:v92];
  v210[1] = v201;
  LODWORD(v93) = *(_DWORD *)(a1 + 128);
  v199 = [NSNumber numberWithFloat:v93];
  v210[2] = v199;
  v197 = [MEMORY[0x263EFF8C0] arrayWithObjects:v210 count:3];
  v212[2] = v197;
  v211[3] = @"geometry_right_eye";
  LODWORD(v94) = *(_DWORD *)(a1 + 132);
  v195 = [NSNumber numberWithFloat:v94];
  v209[0] = v195;
  LODWORD(v95) = *(_DWORD *)(a1 + 136);
  v96 = [NSNumber numberWithFloat:v95];
  v209[1] = v96;
  LODWORD(v97) = *(_DWORD *)(a1 + 140);
  v98 = [NSNumber numberWithFloat:v97];
  v209[2] = v98;
  v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v209 count:3];
  v212[3] = v99;
  v211[4] = @"left_eye_pitch";
  LODWORD(v100) = *(_DWORD *)(a1 + 144);
  v101 = [NSNumber numberWithFloat:v100];
  v212[4] = v101;
  v211[5] = @"left_eye_yaw";
  LODWORD(v102) = *(_DWORD *)(a1 + 148);
  v103 = [NSNumber numberWithFloat:v102];
  v212[5] = v103;
  v211[6] = @"right_eye_pitch";
  LODWORD(v104) = *(_DWORD *)(a1 + 152);
  v105 = [NSNumber numberWithFloat:v104];
  v212[6] = v105;
  v211[7] = @"right_eye_yaw";
  LODWORD(v106) = *(_DWORD *)(a1 + 156);
  v107 = [NSNumber numberWithFloat:v106];
  v212[7] = v107;
  v108 = [NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:8];
  [v208 addEntriesFromDictionary:v108];

  v109 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1 + 4];
  v110 = [v109 UUIDString];
  [v208 setObject:v110 forKeyedSubscript:@"track_index"];

  return v208;
}

- (NSData)packet
{
  return self->_packet;
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void).cxx_destruct
{
}

- (void)initWithBinarySampleRepresentation:(os_log_t)log metadata:timestamp:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22275A000, log, OS_LOG_TYPE_FAULT, "facial metrics packet is too small", v1, 2u);
}

- (void)initWithBinarySampleRepresentation:(uint64_t)a3 metadata:(os_log_t)log timestamp:.cold.2(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_fault_impl(&dword_22275A000, log, OS_LOG_TYPE_FAULT, "invalid packet length: expected %zu, got %zu", buf, 0x16u);
}

- (void)initWithBinarySampleRepresentation:(uint8_t *)buf metadata:(int)a2 timestamp:(os_log_t)log .cold.3(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_fault_impl(&dword_22275A000, log, OS_LOG_TYPE_FAULT, "unrecognized facial metrics packet type (%u)", buf, 8u);
}

@end