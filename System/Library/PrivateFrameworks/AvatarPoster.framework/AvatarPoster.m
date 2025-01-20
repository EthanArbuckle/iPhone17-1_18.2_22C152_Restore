uint64_t PRPosterBoundingShape.contactsUIBoundingShape.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_269339128);
  MEMORY[0x270FA5388]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248ACE7A0();
  v4 = sub_248ACE7B0();
  v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v3, v4);
  }
  sub_248ACC6E0((uint64_t)v3);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 104))(a1, *MEMORY[0x263EFEB68], v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_248ACC6E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269339128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id AvatarPosterConfiguration.avatarRecord.getter()
{
  uint64_t v0 = sub_248ACE7E0();
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v3 = v0;
  unint64_t v4 = v1;
  v5 = self;
  v6 = (void *)sub_248ACE810();
  id v2 = objc_msgSend(v5, sel_avatarRecordFromData_, v6);
  sub_248ACC7D8(v3, v4);

  return v2;
}

uint64_t sub_248ACC7D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_248ACC7EC(a1, a2);
  }
  return a1;
}

uint64_t sub_248ACC7EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t AvatarPosterConfiguration.debugDescription.getter()
{
  sub_248ACE840();
  sub_248ACE830();
  sub_248ACE7F0();
  sub_248ACE820();
  swift_bridgeObjectRelease();
  sub_248ACE830();
  swift_bridgeObjectRelease();
  sub_248ACE830();
  uint64_t v0 = sub_248ACE7E0();
  if (v1 >> 60 != 15)
  {
    uint64_t v2 = v0;
    unint64_t v3 = v1;
    sub_248ACE800();
    sub_248ACC7D8(v2, v3);
  }
  sub_248ACE830();
  swift_bridgeObjectRelease();
  sub_248ACE830();
  uint64_t v4 = sub_248ACE7C0();
  if (v5 >> 60 != 15)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    sub_248ACE800();
    sub_248ACC7D8(v6, v7);
  }
  sub_248ACE830();
  swift_bridgeObjectRelease();
  sub_248ACE830();
  uint64_t v8 = sub_248ACE7D0();
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = v8;
    unint64_t v11 = v9;
    sub_248ACE800();
    sub_248ACC7D8(v10, v11);
  }
  sub_248ACE830();
  swift_bridgeObjectRelease();
  return 0;
}

id AvatarPosterBackgroundColor.topColor.getter()
{
  return *v0;
}

id AvatarPosterBackgroundColor.bottomColor.getter()
{
  return *(id *)(v0 + 8);
}

AvatarPoster::AvatarPosterBackgroundColor __swiftcall AvatarPosterBackgroundColor.init(topColor:bottomColor:)(UIColor topColor, UIColor bottomColor)
{
  v2->super.isa = topColor.super.isa;
  v2[1].super.isa = bottomColor.super.isa;
  result.bottomColor = bottomColor;
  result.topColor = topColor;
  return result;
}

id sub_248ACCA9C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.658823529, 0.678431373, 0.729411765, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.529411765, 0.549019608, 0.588235294, 1.0);
  qword_269339160 = (uint64_t)v0;
  *(void *)algn_269339168 = result;
  return result;
}

id sub_248ACCB30()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.803921569, 0.97254902, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.709803922, 0.643137255, 0.949019608, 1.0);
  qword_269339170 = (uint64_t)v0;
  *(void *)algn_269339178 = result;
  return result;
}

id sub_248ACCBC8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.701960784, 0.835294118, 0.937254902, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.454901961, 0.698039216, 0.88627451, 1.0);
  qword_269339180 = (uint64_t)v0;
  *(void *)algn_269339188 = result;
  return result;
}

id sub_248ACCC5C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.964705882, 0.721568627, 0.8, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.937254902, 0.490196078, 0.639215686, 1.0);
  qword_269339190 = (uint64_t)v0;
  *(void *)algn_269339198 = result;
  return result;
}

id sub_248ACCCF0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.960784314, 0.850980392, 0.68627451, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.929411765, 0.725490196, 0.431372549, 1.0);
  qword_2693391A0 = (uint64_t)v0;
  *(void *)algn_2693391A8 = result;
  return result;
}

id sub_248ACCD84()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.792156863, 0.949019608, 0.741176471, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.623529412, 0.905882353, 0.529411765, 1.0);
  qword_2693391B0 = (uint64_t)v0;
  *(void *)algn_2693391B8 = result;
  return result;
}

id sub_248ACCE18()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.882352941, 0.776470588, 0.764705882, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.788235294, 0.592156863, 0.57254902, 1.0);
  qword_2693391C0 = (uint64_t)v0;
  *(void *)algn_2693391C8 = result;
  return result;
}

id sub_248ACCEB4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.764705882, 0.662745098, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.894117647, 0.568627451, 0.388235294, 1.0);
  qword_2693391D0 = (uint64_t)v0;
  *(void *)algn_2693391D8 = result;
  return result;
}

id sub_248ACCF50()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.839215686, 0.807843137, 0.870588235, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.705882353, 0.647058824, 0.764705882, 1.0);
  qword_2693391E0 = (uint64_t)v0;
  *(void *)algn_2693391E8 = result;
  return result;
}

id sub_248ACCFE8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.780392157, 0.843137255, 0.905882353, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.603921569, 0.717647059, 0.82745098, 1.0);
  qword_2693391F0 = (uint64_t)v0;
  *(void *)algn_2693391F8 = result;
  return result;
}

id sub_248ACD07C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.815686275, 0.909803922, 0.917647059, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.835294118, 0.847058824, 1.0);
  qword_269339200 = (uint64_t)v0;
  *(void *)algn_269339208 = result;
  return result;
}

id sub_248ACD114()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.941176471, 0.717647059, 0.925490196, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.890196078, 0.48627451, 0.866666667, 1.0);
  qword_269339210 = (uint64_t)v0;
  *(void *)algn_269339218 = result;
  return result;
}

id sub_248ACD1B4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.666666667, 0.941176471, 0.949019608, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.396078431, 0.894117647, 0.905882353, 1.0);
  qword_269339220 = (uint64_t)v0;
  *(void *)algn_269339228 = result;
  return result;
}

id sub_248ACD250()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.694117647, 0.956862745, 0.764705882, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.443137255, 0.921568627, 0.568627451, 1.0);
  qword_269339230 = (uint64_t)v0;
  *(void *)algn_269339238 = result;
  return result;
}

id sub_248ACD2E8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.850980392, 0.831372549, 0.811764706, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.725490196, 0.694117647, 0.654901961, 1.0);
  qword_269339240 = (uint64_t)v0;
  *(void *)algn_269339248 = result;
  return result;
}

id sub_248ACD37C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.901960784, 0.839215686, 0.749019608, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.819607843, 0.705882353, 0.541176471, 1.0);
  qword_269339250 = (uint64_t)v0;
  *(void *)algn_269339258 = result;
  return result;
}

id sub_248ACD410()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.831372549, 0.866666667, 0.815686275, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.690196078, 0.760784314, 0.666666667, 1.0);
  qword_269339260 = (uint64_t)v0;
  *(void *)algn_269339268 = result;
  return result;
}

id sub_248ACD4A8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.560784314, 0.560784314, 0.560784314, 1.0);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.2, 0.2, 0.2, 1.0);
  qword_269339270 = (uint64_t)v0;
  *(void *)algn_269339278 = result;
  return result;
}

id sub_248ACD52C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269339158);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_248ACED20;
  if (qword_269339088 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)qword_269339160;
  uint64_t v2 = *(void **)algn_269339168;
  *(void *)(v0 + 32) = qword_269339160;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = qword_2693390A0;
  id v4 = v1;
  id v5 = v2;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_269339190;
  unint64_t v7 = *(void **)algn_269339198;
  *(void *)(v0 + 48) = qword_269339190;
  *(void *)(v0 + 56) = v7;
  uint64_t v8 = qword_2693390B8;
  id v9 = v6;
  id v10 = v7;
  if (v8 != -1) {
    swift_once();
  }
  unint64_t v11 = (void *)qword_2693391C0;
  v12 = *(void **)algn_2693391C8;
  *(void *)(v0 + 64) = qword_2693391C0;
  *(void *)(v0 + 72) = v12;
  uint64_t v13 = qword_2693390C0;
  id v14 = v11;
  id v15 = v12;
  if (v13 != -1) {
    swift_once();
  }
  v16 = (void *)qword_2693391D0;
  v17 = *(void **)algn_2693391D8;
  *(void *)(v0 + 80) = qword_2693391D0;
  *(void *)(v0 + 88) = v17;
  uint64_t v18 = qword_2693390A8;
  id v19 = v16;
  id v20 = v17;
  if (v18 != -1) {
    swift_once();
  }
  v21 = (void *)qword_2693391A0;
  v22 = *(void **)algn_2693391A8;
  *(void *)(v0 + 96) = qword_2693391A0;
  *(void *)(v0 + 104) = v22;
  uint64_t v23 = qword_2693390B0;
  id v24 = v21;
  id v25 = v22;
  if (v23 != -1) {
    swift_once();
  }
  v26 = (void *)qword_2693391B0;
  v27 = *(void **)algn_2693391B8;
  *(void *)(v0 + 112) = qword_2693391B0;
  *(void *)(v0 + 120) = v27;
  uint64_t v28 = qword_269339098;
  id v29 = v26;
  id v30 = v27;
  if (v28 != -1) {
    swift_once();
  }
  v31 = (void *)qword_269339180;
  v32 = *(void **)algn_269339188;
  *(void *)(v0 + 128) = qword_269339180;
  *(void *)(v0 + 136) = v32;
  uint64_t v33 = qword_269339090;
  id v34 = v31;
  id v35 = v32;
  if (v33 != -1) {
    swift_once();
  }
  v36 = (void *)qword_269339170;
  v37 = *(void **)algn_269339178;
  *(void *)(v0 + 144) = qword_269339170;
  *(void *)(v0 + 152) = v37;
  uint64_t v38 = qword_2693390C8;
  id v39 = v36;
  id v40 = v37;
  if (v38 != -1) {
    swift_once();
  }
  v41 = (void *)qword_2693391E0;
  v42 = *(void **)algn_2693391E8;
  *(void *)(v0 + 160) = qword_2693391E0;
  *(void *)(v0 + 168) = v42;
  uint64_t v43 = qword_2693390D0;
  id v44 = v41;
  id v45 = v42;
  if (v43 != -1) {
    swift_once();
  }
  v46 = (void *)qword_2693391F0;
  v47 = *(void **)algn_2693391F8;
  *(void *)(v0 + 176) = qword_2693391F0;
  *(void *)(v0 + 184) = v47;
  uint64_t v48 = qword_2693390D8;
  id v49 = v46;
  id v50 = v47;
  if (v48 != -1) {
    swift_once();
  }
  v51 = (void *)qword_269339200;
  v52 = *(void **)algn_269339208;
  *(void *)(v0 + 192) = qword_269339200;
  *(void *)(v0 + 200) = v52;
  uint64_t v53 = qword_2693390E0;
  id v54 = v51;
  id v55 = v52;
  if (v53 != -1) {
    swift_once();
  }
  v56 = (void *)qword_269339210;
  v57 = *(void **)algn_269339218;
  *(void *)(v0 + 208) = qword_269339210;
  *(void *)(v0 + 216) = v57;
  uint64_t v58 = qword_2693390E8;
  id v59 = v56;
  id v60 = v57;
  if (v58 != -1) {
    swift_once();
  }
  v61 = (void *)qword_269339220;
  v62 = *(void **)algn_269339228;
  *(void *)(v0 + 224) = qword_269339220;
  *(void *)(v0 + 232) = v62;
  uint64_t v63 = qword_2693390F0;
  id v64 = v61;
  id v65 = v62;
  if (v63 != -1) {
    swift_once();
  }
  v66 = (void *)qword_269339230;
  v67 = *(void **)algn_269339238;
  *(void *)(v0 + 240) = qword_269339230;
  *(void *)(v0 + 248) = v67;
  uint64_t v68 = qword_2693390F8;
  id v69 = v66;
  id v70 = v67;
  if (v68 != -1) {
    swift_once();
  }
  v71 = (void *)qword_269339240;
  v72 = *(void **)algn_269339248;
  *(void *)(v0 + 256) = qword_269339240;
  *(void *)(v0 + 264) = v72;
  uint64_t v73 = qword_269339100;
  id v74 = v71;
  id v75 = v72;
  if (v73 != -1) {
    swift_once();
  }
  v76 = (void *)qword_269339250;
  v77 = *(void **)algn_269339258;
  *(void *)(v0 + 272) = qword_269339250;
  *(void *)(v0 + 280) = v77;
  uint64_t v78 = qword_269339108;
  id v79 = v76;
  id v80 = v77;
  if (v78 != -1) {
    swift_once();
  }
  v81 = (void *)qword_269339260;
  v82 = *(void **)algn_269339268;
  *(void *)(v0 + 288) = qword_269339260;
  *(void *)(v0 + 296) = v82;
  uint64_t v83 = qword_269339110;
  id v84 = v81;
  id v85 = v82;
  if (v83 != -1) {
    swift_once();
  }
  v87 = (void *)qword_269339270;
  uint64_t v86 = *(void *)algn_269339278;
  id v90 = *(id *)algn_269339278;
  *(void *)(v0 + 304) = qword_269339270;
  *(void *)(v0 + 312) = v86;
  off_269339130 = (_UNKNOWN *)v0;
  id v88 = v87;
  return v90;
}

uint64_t AvatarPosterBackgroundColors.getter()
{
  if (qword_269339118 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_248ACDB08()
{
  uint64_t result = sub_248ACDB28();
  qword_269339138 = result;
  return result;
}

uint64_t sub_248ACDB28()
{
  v33[1] = *(double *)MEMORY[0x263EF8340];
  if (qword_269339118 != -1) {
LABEL_22:
  }
    swift_once();
  uint64_t v0 = *((void *)off_269339130 + 2);
  if (v0)
  {
    unint64_t v1 = (void **)(swift_bridgeObjectRetain() + 40);
    double v2 = MEMORY[0x263F8EE80];
    while (1)
    {
      id v5 = *(v1 - 1);
      uint64_t v6 = *v1;
      double v32 = 0.0;
      v33[0] = 0.0;
      double v30 = 0.0;
      double v31 = 0.0;
      id v7 = v5;
      id v8 = v6;
      objc_msgSend(v8, sel_getRed_green_blue_alpha_, v33, &v32, &v31, &v30);
      double v9 = floor(v33[0] * 1000000.0) / 1000000.0;
      double v10 = floor(v32 * 1000000.0) / 1000000.0;
      double v11 = floor(v31 * 1000000.0) / 1000000.0;
      double v12 = floor(v30 * 1000000.0) / 1000000.0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269339140);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_248ACED30;
      *(double *)(v13 + 32) = v9;
      *(double *)(v13 + 40) = v10;
      *(double *)(v13 + 48) = v11;
      *(double *)(v13 + 56) = v12;
      id v14 = v7;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33[0] = v2;
      sub_248ACE144(v13);
      unint64_t v18 = v17;
      uint64_t v19 = *(void *)(*(void *)&v2 + 16);
      BOOL v20 = (v16 & 1) == 0;
      uint64_t v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      char v22 = v16;
      if (*(void *)(*(void *)&v2 + 24) >= v21)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          double v2 = v33[0];
          if (v16) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_248ACE59C();
          double v2 = v33[0];
          if (v22) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        sub_248ACE1B0(v21, isUniquelyReferenced_nonNull_native);
        sub_248ACE144(v13);
        if ((v22 & 1) != (v24 & 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269339148);
          uint64_t result = sub_248ACE870();
          __break(1u);
          return result;
        }
        unint64_t v18 = v23;
        double v2 = v33[0];
        if (v22)
        {
LABEL_4:
          uint64_t v3 = *(void *)(*(void *)&v2 + 56);
          uint64_t v4 = 8 * v18;

          *(void *)(v3 + v4) = v14;
          goto LABEL_5;
        }
      }
      *(void *)(*(void *)&v2 + 8 * (v18 >> 6) + 64) |= 1 << v18;
      uint64_t v25 = 8 * v18;
      *(void *)(*(void *)(*(void *)&v2 + 48) + v25) = v13;
      *(void *)(*(void *)(*(void *)&v2 + 56) + v25) = v14;
      uint64_t v26 = *(void *)(*(void *)&v2 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_21;
      }
      *(void *)(*(void *)&v2 + 16) = v28;
      swift_bridgeObjectRetain();
LABEL_5:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v1 += 2;
      if (!--v0)
      {
        swift_bridgeObjectRelease();
        return *(void *)&v2;
      }
    }
  }
  double v2 = MEMORY[0x263F8EE80];
  return *(void *)&v2;
}

uint64_t AvatarPosterBackgroundColorBottomToTop.getter()
{
  if (qword_269339120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AvatarPosterBackgroundColorBottomToTop.setter(uint64_t a1)
{
  if (qword_269339120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_269339138 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*AvatarPosterBackgroundColorBottomToTop.modify())()
{
  if (qword_269339120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void *initializeBufferWithCopyOfBuffer for AvatarPosterBackgroundColor(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for AvatarPosterBackgroundColor(uint64_t a1)
{
  double v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for AvatarPosterBackgroundColor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for AvatarPosterBackgroundColor(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarPosterBackgroundColor(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarPosterBackgroundColor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterBackgroundColor()
{
  return &type metadata for AvatarPosterBackgroundColor;
}

double sub_248ACE144(uint64_t a1)
{
  sub_248ACE880();
  sub_248ACE744((uint64_t)v4, a1);
  uint64_t v2 = sub_248ACE8B0();
  return sub_248ACE4C0(a1, v2);
}

uint64_t sub_248ACE1B0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269339150);
  char v36 = a2;
  uint64_t result = sub_248ACE860();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v35 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v34) {
          goto LABEL_36;
        }
        unint64_t v18 = v35[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v34) {
            goto LABEL_36;
          }
          unint64_t v18 = v35[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v34)
            {
LABEL_36:
              if ((v36 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_43;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
              if (v33 >= 64) {
                bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v35 = -1 << v33;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_45;
                }
                if (v8 >= v34) {
                  goto LABEL_36;
                }
                unint64_t v18 = v35[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = 8 * v16;
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + v20);
      char v22 = *(void **)(*(void *)(v5 + 56) + v20);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v23 = v22;
      }
      sub_248ACE880();
      sub_248ACE890();
      uint64_t v24 = *(void *)(v21 + 16);
      if (v24)
      {
        uint64_t v25 = v21 + 32;
        do
        {
          v25 += 8;
          sub_248ACE8A0();
          --v24;
        }
        while (v24);
      }
      uint64_t result = sub_248ACE8B0();
      uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v13 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = 8 * v13;
      *(void *)(*(void *)(v7 + 48) + v14) = v21;
      *(void *)(*(void *)(v7 + 56) + v14) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_43:
  *uint64_t v3 = v7;
  return result;
}

double sub_248ACE4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    uint64_t v7 = *(void *)(a1 + 16);
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(v2 + 48) + 8 * v5);
      if (*(void *)(v8 + 16) == v7)
      {
        if (!v7 || v8 == a1) {
          return result;
        }
        double result = *(double *)(v8 + 32);
        if (result == *(double *)(a1 + 32))
        {
          if (v7 == 1) {
            return result;
          }
          double result = *(double *)(v8 + 40);
          if (result == *(double *)(a1 + 40)) {
            break;
          }
        }
      }
LABEL_3:
      unint64_t v5 = (v5 + 1) & v6;
      if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
        return result;
      }
    }
    uint64_t v10 = (double *)(v8 + 48);
    uint64_t v11 = v7 - 2;
    uint64_t v12 = (double *)(a1 + 48);
    while (v11)
    {
      double v13 = *v10++;
      double result = v13;
      double v14 = *v12++;
      --v11;
      if (result != v14) {
        goto LABEL_3;
      }
    }
  }
  return result;
}

id sub_248ACE59C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269339150);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_248ACE850();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain();
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_248ACE744(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_248ACE890();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 8;
      uint64_t result = sub_248ACE8A0();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_248ACE7A0()
{
  return MEMORY[0x270EE40A8]();
}

uint64_t sub_248ACE7B0()
{
  return MEMORY[0x270EE40B0]();
}

uint64_t sub_248ACE7C0()
{
  return MEMORY[0x270EE40B8]();
}

uint64_t sub_248ACE7D0()
{
  return MEMORY[0x270EE40C0]();
}

uint64_t sub_248ACE7E0()
{
  return MEMORY[0x270EE40C8]();
}

uint64_t sub_248ACE7F0()
{
  return MEMORY[0x270EE40D0]();
}

uint64_t sub_248ACE800()
{
  return MEMORY[0x270EF0118]();
}

uint64_t sub_248ACE810()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_248ACE820()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_248ACE830()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_248ACE840()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_248ACE850()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_248ACE860()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_248ACE870()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_248ACE880()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_248ACE890()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_248ACE8A0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_248ACE8B0()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}