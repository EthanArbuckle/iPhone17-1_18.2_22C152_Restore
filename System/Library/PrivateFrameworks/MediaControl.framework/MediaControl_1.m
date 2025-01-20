uint64_t sub_2559DB824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;
  uint64_t vars8;

  switch(a5)
  {
    case 0:
    case 1:
    case 2:
      swift_bridgeObjectRetain();
      goto LABEL_6;
    case 3:
    case 4:
LABEL_6:
      result = swift_bridgeObjectRetain();
      break;
    case 5:
    case 6:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2559DB8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    case 3:
    case 4:
LABEL_6:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 5:
    case 6:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2559DB994(char a1)
{
  if (a1) {
    return 0x6E6F6973736573;
  }
  else {
    return 1835365481;
  }
}

uint64_t sub_2559DB9C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6579297 && a2 == 0xE300000000000000;
  if (v2 || (sub_2559E13D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65766F6D6572 && a2 == 0xE600000000000000;
    if (v6 || (sub_2559E13D0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 7628147 && a2 == 0xE300000000000000;
      if (v7 || (sub_2559E13D0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000002559F0D70 || (sub_2559E13D0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x7669746341746573 && a2 == 0xED00006D65744965;
        if (v8 || (sub_2559E13D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x66666F646E6168 && a2 == 0xE700000000000000;
          if (v9 || (sub_2559E13D0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x6C6F72746E6F63 && a2 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v11 = sub_2559E13D0();
            swift_bridgeObjectRelease();
            if (v11) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

unint64_t sub_2559DBC94(char a1)
{
  unint64_t result = 6579297;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65766F6D6572;
      break;
    case 2:
      unint64_t result = 7628147;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x7669746341746573;
      break;
    case 5:
      unint64_t result = 0x66666F646E6168;
      break;
    case 6:
      unint64_t result = 0x6C6F72746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2559DBD74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973736573 && a2 == 0xE700000000000000;
  if (v2 || (sub_2559E13D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1835365481 && a2 == 0xE400000000000000;
    if (v6 || (sub_2559E13D0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_2559E13D0();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_2559DBEB4(char a1)
{
  if (!a1) {
    return 0x6E6F6973736573;
  }
  if (a1 == 1) {
    return 1835365481;
  }
  return 0x747865746E6F63;
}

uint64_t sub_2559DBF04(uint64_t a1, uint64_t a2)
{
  if (a1 == 1835365481 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2559E13D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2559DBF7C()
{
  return 1835365481;
}

uint64_t sub_2559DBF8C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6973736573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2559E13D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2559DC014()
{
  return 0x6E6F6973736573;
}

uint64_t sub_2559DC02C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_12_7() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973736573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = OUTLINED_FUNCTION_12_7();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2559DC0F4()
{
  return sub_2559DB994(*v0);
}

uint64_t sub_2559DC0FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DC02C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2559DC124(uint64_t a1)
{
  unint64_t v2 = sub_2559DCFF0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC160(uint64_t a1)
{
  unint64_t v2 = sub_2559DCFF0();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2559DC19C()
{
  return sub_2559DBC94(*v0);
}

uint64_t sub_2559DC1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DB9C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2559DC1CC(uint64_t a1)
{
  unint64_t v2 = sub_2559DD03C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC208(uint64_t a1)
{
  unint64_t v2 = sub_2559DD03C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC244(uint64_t a1)
{
  unint64_t v2 = sub_2559DCE28();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC280(uint64_t a1)
{
  unint64_t v2 = sub_2559DCE28();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC2BC()
{
  return sub_2559DBEB4(*v0);
}

uint64_t sub_2559DC2C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DBD74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2559DC2EC(uint64_t a1)
{
  unint64_t v2 = sub_2559DCE74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC328(uint64_t a1)
{
  unint64_t v2 = sub_2559DCE74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC364(uint64_t a1)
{
  unint64_t v2 = sub_2559DCFA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC3A0(uint64_t a1)
{
  unint64_t v2 = sub_2559DCFA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC3E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DBF04(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2559DC40C(uint64_t a1)
{
  unint64_t v2 = sub_2559DCEC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC448(uint64_t a1)
{
  unint64_t v2 = sub_2559DCEC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DBF8C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2559DC4B4(uint64_t a1)
{
  unint64_t v2 = sub_2559DCF0C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC4F0(uint64_t a1)
{
  unint64_t v2 = sub_2559DCF0C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2559DC52C(uint64_t a1)
{
  unint64_t v2 = sub_2559DCF58();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DC568(uint64_t a1)
{
  unint64_t v2 = sub_2559DCF58();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RoutingInteraction.Action.encode(to:)()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v118 = v1;
  char v3 = v2;
  char v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_2559DED9C(0, &qword_269F01E30, (uint64_t (*)(void))sub_2559DCE28, (uint64_t)&type metadata for RoutingInteraction.Action.ControlCodingKeys, MEMORY[0x263F8E0C0]);
  v114[17] = v5;
  OUTLINED_FUNCTION_8();
  v114[6] = v6;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_21_0();
  v114[16] = v8;
  OUTLINED_FUNCTION_20_3(v9, &qword_269F01E40, (uint64_t (*)(void))sub_2559DCE74, (uint64_t)&type metadata for RoutingInteraction.Action.HandoffCodingKeys);
  v114[19] = v10;
  OUTLINED_FUNCTION_8();
  v114[0] = v11;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_21_0();
  v114[18] = v13;
  OUTLINED_FUNCTION_20_3(v14, &qword_269F01E50, (uint64_t (*)(void))sub_2559DCEC0, (uint64_t)&type metadata for RoutingInteraction.Action.SetActiveItemCodingKeys);
  v114[15] = v15;
  OUTLINED_FUNCTION_8();
  v114[5] = v16;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_21_0();
  v114[14] = v18;
  OUTLINED_FUNCTION_20_3(v19, &qword_269F01E60, (uint64_t (*)(void))sub_2559DCF0C, (uint64_t)&type metadata for RoutingInteraction.Action.SetActiveSessionCodingKeys);
  v114[13] = v20;
  OUTLINED_FUNCTION_8();
  v114[4] = v21;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_21_0();
  v114[11] = v23;
  OUTLINED_FUNCTION_20_3(v24, &qword_269F01E70, (uint64_t (*)(void))sub_2559DCF58, (uint64_t)&type metadata for RoutingInteraction.Action.SetCodingKeys);
  v114[12] = v25;
  OUTLINED_FUNCTION_8();
  v114[3] = v26;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_21_0();
  v114[10] = v28;
  OUTLINED_FUNCTION_20_3(v29, &qword_269F01E80, (uint64_t (*)(void))sub_2559DCFA4, (uint64_t)&type metadata for RoutingInteraction.Action.RemoveCodingKeys);
  v114[9] = v30;
  OUTLINED_FUNCTION_8();
  v114[2] = v31;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_21_0();
  v114[8] = v33;
  OUTLINED_FUNCTION_20_3(v34, &qword_269F01E90, (uint64_t (*)(void))sub_2559DCFF0, (uint64_t)&type metadata for RoutingInteraction.Action.AddCodingKeys);
  v114[7] = v35;
  OUTLINED_FUNCTION_8();
  v114[1] = v36;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_43_2();
  sub_2559DED9C(0, &qword_269F01EA0, (uint64_t (*)(void))sub_2559DD03C, (uint64_t)&type metadata for RoutingInteraction.Action.CodingKeys, v4);
  uint64_t v119 = v38;
  OUTLINED_FUNCTION_8();
  uint64_t v117 = v39;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v40);
  v42 = (char *)v114 - v41;
  uint64_t v44 = *v0;
  uint64_t v43 = v0[1];
  v115 = (char *)v0[2];
  uint64_t v116 = v43;
  v114[20] = v0[3];
  uint64_t v45 = *((unsigned __int8 *)v0 + 32);
  uint64_t v46 = v3[3];
  __swift_project_boxed_opaque_existential_1(v3, v46);
  sub_2559DD03C();
  v47 = v42;
  sub_2559E14C0();
  switch(v45)
  {
    case 1:
      LOBYTE(v120) = 1;
      sub_2559DCFA4();
      uint64_t v48 = v119;
      sub_2559E12A0();
      OUTLINED_FUNCTION_18_6();
      OUTLINED_FUNCTION_61_3();
      if (!v1)
      {
        LOBYTE(v120) = 1;
        OUTLINED_FUNCTION_38_4();
      }
      OUTLINED_FUNCTION_36_3();
      OUTLINED_FUNCTION_18_0();
      v57(v49, v50, v51, v52, v53, v54, v55, v56);
      (*(void (**)(char *, uint64_t))(v117 + 8))(v42, v48);
      goto LABEL_15;
    case 2:
      LOBYTE(v120) = 2;
      sub_2559DCF58();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_18_6();
      OUTLINED_FUNCTION_37_3();
      if (!v1)
      {
        LOBYTE(v120) = 1;
        sub_2559E1310();
      }
      goto LABEL_13;
    case 3:
      LOBYTE(v120) = 3;
      sub_2559DCF0C();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_37_3();
      goto LABEL_13;
    case 4:
      LOBYTE(v120) = 4;
      sub_2559DCEC0();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_37_3();
      goto LABEL_13;
    case 5:
      uint64_t v116 = *(void *)(v44 + 32);
      uint64_t v70 = *(void *)(v44 + 48);
      LOBYTE(v120) = 5;
      sub_2559DCE74();
      swift_retain();
      sub_2559E12A0();
      LOBYTE(v120) = 0;
      uint64_t v71 = v118;
      sub_2559E1310();
      if (v71)
      {
        swift_release();
        OUTLINED_FUNCTION_18_0();
        v80(v72, v73, v74, v75, v76, v77, v78, v79);
        v68 = (ValueMetadata *)OUTLINED_FUNCTION_59_2();
LABEL_14:
        v67(v68, v69);
      }
      else
      {
        LOBYTE(v120) = 1;
        sub_2559E1310();
        uint64_t v120 = v70;
        type metadata accessor for RoutingInteraction.Action.HandoffContext();
        sub_2559DEE84(&qword_269F01EB0);
        sub_2559E1360();
        OUTLINED_FUNCTION_18_0();
        v104(v96, v97, v98, v99, v100, v101, v102, v103);
        OUTLINED_FUNCTION_59_2();
        OUTLINED_FUNCTION_18_0();
        v113(v105, v106, v107, v108, v109, v110, v111, v112);
        swift_release();
      }
LABEL_15:
      OUTLINED_FUNCTION_2_0();
      return;
    case 6:
      uint64_t v116 = *(void *)(v44 + 16);
      char v81 = *(unsigned char *)(v44 + 24);
      uint64_t v82 = *(void *)(v44 + 32);
      uint64_t v83 = *(void *)(v44 + 40);
      char v84 = *(unsigned char *)(v44 + 48);
      uint64_t v86 = *(void *)(v44 + 56);
      uint64_t v85 = *(void *)(v44 + 64);
      LOBYTE(v120) = 6;
      sub_2559DCE28();
      v115 = v47;
      sub_2559E12A0();
      uint64_t v120 = v116;
      char v121 = v81;
      uint64_t v122 = v82;
      uint64_t v123 = v83;
      char v124 = v84;
      uint64_t v125 = v86;
      uint64_t v126 = v85;
      sub_2559742B0();
      sub_2559E1360();
      OUTLINED_FUNCTION_18_0();
      v95(v87, v88, v89, v90, v91, v92, v93, v94);
      (*(void (**)(char *, uint64_t))(v117 + 8))(v115, v119);
      goto LABEL_15;
    default:
      LOBYTE(v120) = 0;
      sub_2559DCFF0();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_18_6();
      OUTLINED_FUNCTION_61_3();
      if (!v1)
      {
        LOBYTE(v120) = 1;
        OUTLINED_FUNCTION_38_4();
      }
      OUTLINED_FUNCTION_36_3();
LABEL_13:
      OUTLINED_FUNCTION_18_0();
      v66(v58, v59, v60, v61, v62, v63, v64, v65);
      v67 = *(void (**)(ValueMetadata *, uint64_t))(v117 + 8);
      v68 = &type metadata for RoutingInteraction.Action.CodingKeys;
      uint64_t v69 = v46;
      goto LABEL_14;
  }
}

unint64_t sub_2559DCE28()
{
  unint64_t result = qword_269F01E38;
  if (!qword_269F01E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E38);
  }
  return result;
}

unint64_t sub_2559DCE74()
{
  unint64_t result = qword_269F01E48;
  if (!qword_269F01E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E48);
  }
  return result;
}

unint64_t sub_2559DCEC0()
{
  unint64_t result = qword_269F01E58;
  if (!qword_269F01E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E58);
  }
  return result;
}

unint64_t sub_2559DCF0C()
{
  unint64_t result = qword_269F01E68;
  if (!qword_269F01E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E68);
  }
  return result;
}

unint64_t sub_2559DCF58()
{
  unint64_t result = qword_269F01E78;
  if (!qword_269F01E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E78);
  }
  return result;
}

unint64_t sub_2559DCFA4()
{
  unint64_t result = qword_269F01E88;
  if (!qword_269F01E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E88);
  }
  return result;
}

unint64_t sub_2559DCFF0()
{
  unint64_t result = qword_269F01E98;
  if (!qword_269F01E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01E98);
  }
  return result;
}

unint64_t sub_2559DD03C()
{
  unint64_t result = qword_269F01EA8;
  if (!qword_269F01EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01EA8);
  }
  return result;
}

uint64_t RoutingInteraction.Action.hashValue.getter()
{
  return sub_2559E14A0();
}

void RoutingInteraction.Action.init(from:)()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v129 = v0;
  unint64_t v2 = v1;
  uint64_t v119 = v3;
  char v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_2559DED9C(0, &qword_269F01EB8, (uint64_t (*)(void))sub_2559DCE28, (uint64_t)&type metadata for RoutingInteraction.Action.ControlCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v117 = v5;
  OUTLINED_FUNCTION_8();
  uint64_t v127 = v6;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_21_0();
  uint64_t v126 = v8;
  OUTLINED_FUNCTION_21_4(v9, &qword_269F01EC0, (uint64_t (*)(void))sub_2559DCE74, (uint64_t)&type metadata for RoutingInteraction.Action.HandoffCodingKeys);
  uint64_t v116 = v10;
  OUTLINED_FUNCTION_8();
  uint64_t v118 = v11;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_21_0();
  uint64_t v122 = v13;
  OUTLINED_FUNCTION_21_4(v14, &qword_269F01EC8, (uint64_t (*)(void))sub_2559DCEC0, (uint64_t)&type metadata for RoutingInteraction.Action.SetActiveItemCodingKeys);
  uint64_t v125 = v15;
  OUTLINED_FUNCTION_8();
  uint64_t v112 = v16;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_21_0();
  uint64_t v124 = v18;
  OUTLINED_FUNCTION_21_4(v19, &qword_269F01ED0, (uint64_t (*)(void))sub_2559DCF0C, (uint64_t)&type metadata for RoutingInteraction.Action.SetActiveSessionCodingKeys);
  uint64_t v114 = v20;
  OUTLINED_FUNCTION_8();
  uint64_t v111 = v21;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_21_0();
  uint64_t v121 = v23;
  OUTLINED_FUNCTION_21_4(v24, &qword_269F01ED8, (uint64_t (*)(void))sub_2559DCF58, (uint64_t)&type metadata for RoutingInteraction.Action.SetCodingKeys);
  uint64_t v115 = v25;
  OUTLINED_FUNCTION_8();
  uint64_t v110 = v26;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_21_0();
  uint64_t v123 = v28;
  OUTLINED_FUNCTION_21_4(v29, &qword_269F01EE0, (uint64_t (*)(void))sub_2559DCFA4, (uint64_t)&type metadata for RoutingInteraction.Action.RemoveCodingKeys);
  uint64_t v113 = v30;
  OUTLINED_FUNCTION_8();
  uint64_t v109 = v31;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_21_0();
  uint64_t v120 = v33;
  OUTLINED_FUNCTION_21_4(v34, &qword_269F01EE8, (uint64_t (*)(void))sub_2559DCFF0, (uint64_t)&type metadata for RoutingInteraction.Action.AddCodingKeys);
  uint64_t v36 = v35;
  OUTLINED_FUNCTION_8();
  uint64_t v108 = v37;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v101 - v39;
  sub_2559DED9C(0, &qword_269F01EF0, (uint64_t (*)(void))sub_2559DD03C, (uint64_t)&type metadata for RoutingInteraction.Action.CodingKeys, v4);
  uint64_t v42 = v41;
  OUTLINED_FUNCTION_8();
  uint64_t v44 = v43;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_21_0();
  uint64_t v46 = v2[3];
  uint64_t v128 = (uint64_t)v2;
  v47 = v2;
  uint64_t v49 = v48;
  __swift_project_boxed_opaque_existential_1(v47, v46);
  sub_2559DD03C();
  uint64_t v50 = v129;
  sub_2559E14B0();
  if (v50) {
    goto LABEL_14;
  }
  v104 = v40;
  uint64_t v103 = v36;
  uint64_t v106 = 0;
  uint64_t v51 = v123;
  uint64_t v52 = v127;
  uint64_t v107 = v44;
  uint64_t v129 = v49;
  uint64_t v53 = sub_2559E1280();
  if (!*(void *)(v53 + 16))
  {
LABEL_7:
    uint64_t v60 = sub_2559E10C0();
    swift_allocError();
    uint64_t v62 = v61;
    sub_25597BB74();
    *uint64_t v62 = &type metadata for RoutingInteraction.Action;
    uint64_t v63 = v129;
    sub_2559E1190();
    sub_2559E10A0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v60 - 8) + 104))(v62, *MEMORY[0x263F8DCB0], v60);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_10_4();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v63, v42);
LABEL_14:
    uint64_t v99 = v128;
    goto LABEL_15;
  }
  uint64_t v54 = v42;
  uint64_t v102 = *(unsigned __int8 *)(v53 + 32);
  uint64_t v55 = sub_25598BC50(1);
  uint64_t v57 = v56;
  unint64_t v59 = v58;
  swift_bridgeObjectRelease();
  uint64_t v105 = v55;
  if (v57 != v59 >> 1)
  {
    uint64_t v42 = v54;
    goto LABEL_7;
  }
  switch(v102)
  {
    case 1:
      sub_2559DCFA4();
      OUTLINED_FUNCTION_8_8();
      OUTLINED_FUNCTION_56_4();
      uint64_t v64 = sub_2559E1200();
      OUTLINED_FUNCTION_13_6(v64);
      uint64_t v68 = sub_2559E1200();
      uint64_t v126 = v107 + 8;
      uint64_t v83 = v68;
      uint64_t v85 = v89;
      uint64_t v90 = OUTLINED_FUNCTION_39_4();
      v91(v90);
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_18_0();
      v92();
      goto LABEL_18;
    case 2:
      sub_2559DCF58();
      OUTLINED_FUNCTION_8_8();
      OUTLINED_FUNCTION_56_4();
      uint64_t v65 = v115;
      OUTLINED_FUNCTION_40_3();
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_13_6(v69);
      uint64_t v83 = OUTLINED_FUNCTION_40_3();
      uint64_t v85 = v70;
      (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v51, v65);
      OUTLINED_FUNCTION_2_4();
      uint64_t v93 = OUTLINED_FUNCTION_62_2();
      v94(v93);
      goto LABEL_18;
    case 3:
      sub_2559DCF0C();
      OUTLINED_FUNCTION_16_5();
      sub_2559E1200();
      OUTLINED_FUNCTION_10_4();
      uint64_t v75 = v74;
      unint64_t v59 = v76;
      OUTLINED_FUNCTION_18_0();
      v77();
      OUTLINED_FUNCTION_2_4();
      goto LABEL_16;
    case 4:
      sub_2559DCEC0();
      OUTLINED_FUNCTION_16_5();
      OUTLINED_FUNCTION_40_3();
      OUTLINED_FUNCTION_10_4();
      uint64_t v75 = v71;
      unint64_t v59 = v72;
      OUTLINED_FUNCTION_18_0();
      v73();
      OUTLINED_FUNCTION_2_4();
LABEL_16:
      OUTLINED_FUNCTION_19_1();
      v78();
      goto LABEL_17;
    case 5:
      sub_2559DCE74();
      OUTLINED_FUNCTION_8_8();
      v66 = (void *)swift_allocObject();
      OUTLINED_FUNCTION_56_4();
      v66[2] = sub_2559E1200();
      v66[3] = v79;
      v66[4] = sub_2559E1200();
      v66[5] = v95;
      type metadata accessor for RoutingInteraction.Action.HandoffContext();
      sub_2559DEE84(&qword_269F01EF8);
      sub_2559E1250();
      OUTLINED_FUNCTION_19_1();
      v96();
      OUTLINED_FUNCTION_2_4();
      uint64_t v97 = OUTLINED_FUNCTION_7_6();
      v98(v97);
      unint64_t v59 = 0;
      uint64_t v83 = 0;
      uint64_t v85 = 0;
      uint64_t v99 = v128;
      uint64_t v100 = v119;
      uint64_t v75 = (uint64_t)v66;
      goto LABEL_20;
    case 6:
      sub_2559DCE28();
      OUTLINED_FUNCTION_16_5();
      uint64_t v75 = swift_allocObject();
      sub_2559745BC();
      sub_2559E1250();
      OUTLINED_FUNCTION_10_4();
      uint64_t v80 = OUTLINED_FUNCTION_53_4();
      v81(v80);
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_19_1();
      v82();
      unint64_t v59 = 0;
LABEL_17:
      uint64_t v83 = 0;
      uint64_t v85 = 0;
      uint64_t v99 = v128;
      break;
    default:
      sub_2559DCFF0();
      OUTLINED_FUNCTION_16_5();
      OUTLINED_FUNCTION_56_4();
      sub_2559E1200();
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_13_6(v67);
      uint64_t v83 = sub_2559E1200();
      uint64_t v85 = v84;
      uint64_t v86 = OUTLINED_FUNCTION_52_4();
      v87(v86);
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_19_1();
      v88();
LABEL_18:
      uint64_t v75 = v127;
      uint64_t v99 = v128;
      break;
  }
  uint64_t v100 = v119;
LABEL_20:
  *(void *)uint64_t v100 = v75;
  *(void *)(v100 + 8) = v59;
  *(void *)(v100 + 16) = v83;
  *(void *)(v100 + 24) = v85;
  *(unsigned char *)(v100 + 32) = v102;
LABEL_15:
  __swift_destroy_boxed_opaque_existential_0(v99);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_2559DDE04()
{
  return sub_2559E14A0();
}

void sub_2559DDE54()
{
}

void sub_2559DDE6C()
{
}

uint64_t RoutingInteraction.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RoutingInteraction.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_2559DB824(v2, v3, v4, v5, v6);
}

__n128 RoutingInteraction.init(action:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 v8 = *a1;
  unint64_t v3 = a1[1].n128_u64[0];
  unint64_t v4 = a1[1].n128_u64[1];
  unsigned __int8 v5 = a1[2].n128_u8[0];
  a2->n128_u64[0] = sub_25598C528(15);
  a2->n128_u64[1] = v6;
  __n128 result = v8;
  a2[1] = v8;
  a2[2].n128_u64[0] = v3;
  a2[2].n128_u64[1] = v4;
  a2[3].n128_u8[0] = v5;
  return result;
}

unint64_t RoutingInteraction.description.getter()
{
  OUTLINED_FUNCTION_17_5();
  sub_2559E1070();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2559E0D70();
  swift_bridgeObjectRelease();
  sub_2559E0D70();
  uint64_t v0 = OUTLINED_FUNCTION_54_4();
  sub_2559DB824(v0, v1, v2, v3, v4);
  RoutingInteraction.Action.description.getter();
  sub_2559E0D70();
  swift_bridgeObjectRelease();
  uint64_t v5 = OUTLINED_FUNCTION_54_4();
  sub_2559DB8DC(v5, v6, v7, v8, v9);
  sub_2559E0D70();
  return 0xD000000000000022;
}

uint64_t static RoutingInteraction.add(item:to:)()
{
  OUTLINED_FUNCTION_58_2();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25598C528(15);
  *(void *)uint64_t v0 = result;
  *(void *)(v0 + 8) = v6;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v2;
  *(unsigned char *)(v0 + 48) = 0;
  return result;
}

uint64_t static RoutingInteraction.remove(item:to:)()
{
  OUTLINED_FUNCTION_58_2();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25598C528(15);
  *(void *)uint64_t v0 = result;
  *(void *)(v0 + 8) = v6;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v2;
  *(unsigned char *)(v0 + 48) = 1;
  return result;
}

uint64_t static RoutingInteraction.setActive(session:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = sub_25598C528(15);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 3;
  return result;
}

uint64_t static RoutingInteraction.setActive(item:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = sub_25598C528(15);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 4;
  return result;
}

uint64_t static RoutingInteraction.control(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  char v7 = *((unsigned char *)a1 + 32);
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v3;
  *(unsigned char *)(v10 + 24) = v4;
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v6;
  *(unsigned char *)(v10 + 48) = v7;
  *(void *)(v10 + 56) = v9;
  *(void *)(v10 + 64) = v8;
  sub_25595CDAC();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25598C528(15);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 6;
  return result;
}

uint64_t static RoutingInteraction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v3 = *(_OWORD *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 48);
  long long v5 = *(_OWORD *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 48);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    goto LABEL_6;
  }
  long long v15 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 16);
  long long v13 = *(_OWORD *)(a2 + 32);
  long long v14 = *(_OWORD *)(a2 + 16);
  char v9 = sub_2559E13D0();
  long long v6 = v13;
  long long v5 = v14;
  long long v3 = v15;
  long long v2 = v16;
  char v10 = v9;
  char v11 = 0;
  if (v10)
  {
LABEL_6:
    v19[0] = v2;
    v19[1] = v3;
    char v20 = v4;
    v17[0] = v5;
    v17[1] = v6;
    char v18 = v7;
    char v11 = static RoutingInteraction.Action.== infix(_:_:)((uint64_t)v19, (uint64_t)v17);
  }
  return v11 & 1;
}

uint64_t RoutingInteraction.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2559E0D40();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2559DE324(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_2559E13D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_2559E13D0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2559DE418(char a1)
{
  if (a1) {
    return 0x6E6F69746361;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_2559DE450()
{
  return sub_2559DE418(*v0);
}

uint64_t sub_2559DE458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2559DE324(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2559DE480(uint64_t a1)
{
  unint64_t v2 = sub_2559DED04();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2559DE4BC(uint64_t a1)
{
  unint64_t v2 = sub_2559DED04();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RoutingInteraction.encode(to:)()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v18 = v1;
  long long v3 = v2;
  sub_2559DED9C(0, &qword_269F01F00, (uint64_t (*)(void))sub_2559DED04, (uint64_t)&type metadata for RoutingInteraction.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_8();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v14 - v9;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v16 = *(void *)(v0 + 24);
  uint64_t v17 = v11;
  uint64_t v12 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 40);
  uint64_t v15 = v12;
  char v24 = *(unsigned char *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2559DED04();
  sub_2559E14C0();
  LOBYTE(v19) = 0;
  uint64_t v13 = v18;
  sub_2559E1310();
  if (!v13)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v16;
    uint64_t v21 = v15;
    uint64_t v22 = v14;
    char v23 = v24;
    sub_2559DED50();
    sub_2559E1360();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  OUTLINED_FUNCTION_2_0();
}

uint64_t RoutingInteraction.hashValue.getter()
{
  return sub_2559E14A0();
}

void RoutingInteraction.init(from:)()
{
  OUTLINED_FUNCTION_1_2();
  unint64_t v2 = v1;
  uint64_t v17 = v3;
  sub_2559DED9C(0, &qword_269F01F18, (uint64_t (*)(void))sub_2559DED04, (uint64_t)&type metadata for RoutingInteraction.CodingKeys, MEMORY[0x263F8E040]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_43_2();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2559DED04();
  OUTLINED_FUNCTION_57_3();
  sub_2559E14B0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    LOBYTE(v18) = 0;
    uint64_t v5 = sub_2559E1200();
    uint64_t v7 = v6;
    sub_2559DEE04();
    swift_bridgeObjectRetain();
    sub_2559E1250();
    OUTLINED_FUNCTION_19_1();
    v8();
    swift_bridgeObjectRetain();
    uint64_t v9 = OUTLINED_FUNCTION_65_3();
    sub_2559DB824(v9, v10, v11, v12, v22);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v17 = v5;
    *(void *)(v17 + 8) = v7;
    *(void *)(v17 + 16) = v18;
    *(void *)(v17 + 24) = v19;
    *(void *)(v17 + 32) = v20;
    *(void *)(v17 + 40) = v21;
    *(unsigned char *)(v17 + 48) = v22;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
    swift_bridgeObjectRelease();
    uint64_t v13 = OUTLINED_FUNCTION_65_3();
    sub_2559DB8DC(v13, v14, v15, v16, v22);
  }
  OUTLINED_FUNCTION_2_0();
}

void sub_2559DE934()
{
}

void sub_2559DE94C()
{
}

uint64_t sub_2559DE96C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_255958110(v3);
}

void *sub_2559DE980(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_25598C528(15);
  v2[3] = v5;
  v2[4] = a1;
  v2[5] = a2;
  sub_255958110(0);
  return v2;
}

void *ContinuousInteraction.deinit()
{
  uint64_t v1 = v0;
  uint64_t v3 = v0 + 4;
  uint64_t v2 = (void (*)(void, void))v0[4];
  if (v2)
  {
    uint64_t v4 = qword_269EFF9E8;
    swift_retain();
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2559E0AE0();
    __swift_project_value_buffer(v5, (uint64_t)qword_269F02068);
    swift_retain_n();
    uint64_t v6 = sub_2559E0AD0();
    os_log_type_t v7 = sub_2559E0EF0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = v15;
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v9 = sub_2559E14F0();
      sub_25595C36C(v9, v10, &v16);
      sub_2559E0FB0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      uint64_t v12 = v1[2];
      unint64_t v11 = v1[3];
      swift_bridgeObjectRetain();
      sub_25595C36C(v12, v11, &v16);
      sub_2559E0FB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_255954000, v6, v7, "[%s]<%s> Dealloc with finalizer still set.", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2929B0](v15, -1, -1);
      MEMORY[0x25A2929B0](v8, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v13 = v1[4];
    *uint64_t v3 = 0;
    v3[1] = 0;
    sub_255958110(v13);
    v2(v1[2], v1[3]);
    sub_255958110((uint64_t)v2);
  }
  swift_bridgeObjectRelease();
  sub_255958110(v1[4]);
  return v1;
}

uint64_t ContinuousInteraction.__deallocating_deinit()
{
  ContinuousInteraction.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_2559DEC80()
{
  sub_25595CFB4();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2559DECC4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_15_0();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

unint64_t sub_2559DED04()
{
  unint64_t result = qword_269F01F08;
  if (!qword_269F01F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F08);
  }
  return result;
}

unint64_t sub_2559DED50()
{
  unint64_t result = qword_269F01F10;
  if (!qword_269F01F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F10);
  }
  return result;
}

void sub_2559DED9C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unint64_t sub_2559DEE04()
{
  unint64_t result = qword_269F01F20;
  if (!qword_269F01F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F20);
  }
  return result;
}

uint64_t sub_2559DEE50()
{
  return sub_2559DEE84(&qword_269F01F28);
}

uint64_t sub_2559DEE84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RoutingInteraction.Action.HandoffContext();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2559DEEC8()
{
  unint64_t result = qword_269F01F30;
  if (!qword_269F01F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F30);
  }
  return result;
}

unint64_t sub_2559DEF18()
{
  unint64_t result = qword_269F01F38;
  if (!qword_269F01F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F38);
  }
  return result;
}

uint64_t sub_2559DEF64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2559DA530();
  *a1 = result;
  return result;
}

uint64_t destroy for RoutingInteraction(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);

  return sub_2559DB8DC(v2, v3, v4, v5, v6);
}

uint64_t initializeWithCopy for RoutingInteraction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  char v8 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_2559DB824(v4, v5, v6, v7, v8);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  return a1;
}

uint64_t assignWithCopy for RoutingInteraction(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_2559DB824(v4, v5, v6, v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  char v12 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_2559DB8DC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RoutingInteraction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v10;
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v5;
  sub_2559DB8DC(v6, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for RoutingInteraction(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RoutingInteraction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction()
{
  return &type metadata for RoutingInteraction;
}

uint64_t destroy for RoutingInteraction.Action(uint64_t a1)
{
  return sub_2559DB8DC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for RoutingInteraction.Action(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2559DB824(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for RoutingInteraction.Action(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2559DB824(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_2559DB8DC(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for RoutingInteraction.Action(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_2559DB8DC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for RoutingInteraction.Action(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 6) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RoutingInteraction.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2559DF3B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_2559DF3BC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action()
{
  return &type metadata for RoutingInteraction.Action;
}

uint64_t method lookup function for RoutingInteraction.Action.HandoffContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RoutingInteraction.Action.HandoffContext);
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.sourcePlayerPath.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.sourcePlayerPath.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.sourcePlayerPath.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.__allocating_init(sourceBundleIdentifier:mediaTitle:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of RoutingInteraction.Action.HandoffContext.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t type metadata accessor for ContinuousInteraction()
{
  return self;
}

uint64_t method lookup function for ContinuousInteraction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContinuousInteraction);
}

ValueMetadata *type metadata accessor for RoutingInteraction.CodingKeys()
{
  return &type metadata for RoutingInteraction.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RoutingInteraction.Action.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RoutingInteraction.Action.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2559DF6DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.CodingKeys()
{
  return &type metadata for RoutingInteraction.Action.CodingKeys;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.AddCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.AddCodingKeys;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.RemoveCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.RemoveCodingKeys;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.SetCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.SetCodingKeys;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.SetActiveSessionCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.SetActiveSessionCodingKeys;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.SetActiveItemCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.SetActiveItemCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for RoutingInteraction.Action.HandoffCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2559DF834);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.HandoffCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.HandoffCodingKeys;
}

unsigned char *_s12MediaControl18RoutingInteractionV6ActionO26SetActiveSessionCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2559DF908);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.ControlCodingKeys()
{
  return &type metadata for RoutingInteraction.Action.ControlCodingKeys;
}

unsigned char *_s12MediaControl18RoutingInteractionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2559DFA0CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RoutingInteraction.Action.HandoffContext.CodingKeys()
{
  return &type metadata for RoutingInteraction.Action.HandoffContext.CodingKeys;
}

unint64_t sub_2559DFA48()
{
  unint64_t result = qword_269F01F40;
  if (!qword_269F01F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F40);
  }
  return result;
}

unint64_t sub_2559DFA98()
{
  unint64_t result = qword_269F01F48;
  if (!qword_269F01F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F48);
  }
  return result;
}

unint64_t sub_2559DFAE8()
{
  unint64_t result = qword_269F01F50;
  if (!qword_269F01F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F50);
  }
  return result;
}

unint64_t sub_2559DFB38()
{
  unint64_t result = qword_269F01F58;
  if (!qword_269F01F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F58);
  }
  return result;
}

unint64_t sub_2559DFB88()
{
  unint64_t result = qword_269F01F60;
  if (!qword_269F01F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F60);
  }
  return result;
}

unint64_t sub_2559DFBD8()
{
  unint64_t result = qword_269F01F68;
  if (!qword_269F01F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F68);
  }
  return result;
}

unint64_t sub_2559DFC28()
{
  unint64_t result = qword_269F01F70;
  if (!qword_269F01F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F70);
  }
  return result;
}

unint64_t sub_2559DFC78()
{
  unint64_t result = qword_269F01F78;
  if (!qword_269F01F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F78);
  }
  return result;
}

unint64_t sub_2559DFCC8()
{
  unint64_t result = qword_269F01F80;
  if (!qword_269F01F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F80);
  }
  return result;
}

unint64_t sub_2559DFD18()
{
  unint64_t result = qword_269F01F88;
  if (!qword_269F01F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F88);
  }
  return result;
}

unint64_t sub_2559DFD68()
{
  unint64_t result = qword_269F01F90;
  if (!qword_269F01F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F90);
  }
  return result;
}

unint64_t sub_2559DFDB8()
{
  unint64_t result = qword_269F01F98;
  if (!qword_269F01F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01F98);
  }
  return result;
}

unint64_t sub_2559DFE08()
{
  unint64_t result = qword_269F01FA0;
  if (!qword_269F01FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FA0);
  }
  return result;
}

unint64_t sub_2559DFE58()
{
  unint64_t result = qword_269F01FA8;
  if (!qword_269F01FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FA8);
  }
  return result;
}

unint64_t sub_2559DFEA8()
{
  unint64_t result = qword_269F01FB0;
  if (!qword_269F01FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FB0);
  }
  return result;
}

unint64_t sub_2559DFEF8()
{
  unint64_t result = qword_269F01FB8;
  if (!qword_269F01FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FB8);
  }
  return result;
}

unint64_t sub_2559DFF48()
{
  unint64_t result = qword_269F01FC0;
  if (!qword_269F01FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FC0);
  }
  return result;
}

unint64_t sub_2559DFF98()
{
  unint64_t result = qword_269F01FC8;
  if (!qword_269F01FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FC8);
  }
  return result;
}

unint64_t sub_2559DFFE8()
{
  unint64_t result = qword_269F01FD0;
  if (!qword_269F01FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FD0);
  }
  return result;
}

unint64_t sub_2559E0038()
{
  unint64_t result = qword_269F01FD8;
  if (!qword_269F01FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FD8);
  }
  return result;
}

unint64_t sub_2559E0088()
{
  unint64_t result = qword_269F01FE0;
  if (!qword_269F01FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FE0);
  }
  return result;
}

unint64_t sub_2559E00D8()
{
  unint64_t result = qword_269F01FE8;
  if (!qword_269F01FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FE8);
  }
  return result;
}

unint64_t sub_2559E0128()
{
  unint64_t result = qword_269F01FF0;
  if (!qword_269F01FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FF0);
  }
  return result;
}

unint64_t sub_2559E0178()
{
  unint64_t result = qword_269F01FF8;
  if (!qword_269F01FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F01FF8);
  }
  return result;
}

unint64_t sub_2559E01C8()
{
  unint64_t result = qword_269F02000;
  if (!qword_269F02000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02000);
  }
  return result;
}

unint64_t sub_2559E0218()
{
  unint64_t result = qword_269F02008;
  if (!qword_269F02008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02008);
  }
  return result;
}

unint64_t sub_2559E0268()
{
  unint64_t result = qword_269F02010;
  if (!qword_269F02010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02010);
  }
  return result;
}

unint64_t sub_2559E02B8()
{
  unint64_t result = qword_269F02018;
  if (!qword_269F02018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02018);
  }
  return result;
}

unint64_t sub_2559E0308()
{
  unint64_t result = qword_269F02020;
  if (!qword_269F02020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02020);
  }
  return result;
}

unint64_t sub_2559E0358()
{
  unint64_t result = qword_269F02028;
  if (!qword_269F02028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F02028);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_2559E13D0();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_2559E12A0();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_2559E1180();
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  return sub_2559E13D0();
}

uint64_t OUTLINED_FUNCTION_13_6(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  *(unsigned char *)(v1 - 65) = 1;
  return v1 - 65;
}

uint64_t OUTLINED_FUNCTION_15_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_2559E1180();
}

uint64_t OUTLINED_FUNCTION_18_6()
{
  *(unsigned char *)(v1 - 144) = 0;
  return v0;
}

void OUTLINED_FUNCTION_20_3(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  sub_2559DED9C(0, a2, a3, a4, v4);
}

void OUTLINED_FUNCTION_21_4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  sub_2559DED9C(0, a2, a3, a4, v4);
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return sub_2559DB824(v3, v2, v1, v0, 5);
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  return sub_2559DB824(v3, v2, v1, v0, 1);
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return sub_2559DB824(v3, v2, v1, v0, 0);
}

uint64_t OUTLINED_FUNCTION_33_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_4()
{
  return sub_2559DB824(v3, v2, v1, v0, 2);
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return sub_2559E1310();
}

uint64_t OUTLINED_FUNCTION_38_4()
{
  return sub_2559E1310();
}

uint64_t OUTLINED_FUNCTION_39_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return sub_2559E1200();
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  return sub_2559DB824(v3, v2, v1, v0, 5);
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_2559DB8DC(v3, v2, v1, v0, 5);
}

uint64_t OUTLINED_FUNCTION_43_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return sub_2559DB824(v3, v2, v1, v0, 1);
}

uint64_t OUTLINED_FUNCTION_46_4()
{
  return sub_2559DB8DC(v3, v2, v1, v0, 1);
}

uint64_t OUTLINED_FUNCTION_47_3()
{
  return sub_2559DB824(v3, v2, v1, v0, 0);
}

uint64_t OUTLINED_FUNCTION_48_4()
{
  return sub_2559DB8DC(v3, v2, v1, v0, 0);
}

uint64_t OUTLINED_FUNCTION_49_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_4()
{
  return sub_2559DB824(v3, v2, v1, v0, 2);
}

uint64_t OUTLINED_FUNCTION_51_4()
{
  return sub_2559DB8DC(v3, v2, v1, v0, 2);
}

uint64_t OUTLINED_FUNCTION_52_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_4()
{
  *(unsigned char *)(v0 - 65) = 0;
  return v0 - 65;
}

uint64_t OUTLINED_FUNCTION_57_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  return sub_2559E1070();
}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return sub_2559E1310();
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_64_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65_3()
{
  return v0;
}

uint64_t sub_2559E0980()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2559E0990()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2559E09A0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2559E09B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2559E09C0()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_2559E09D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2559E09E0()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_2559E09F0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2559E0A00()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2559E0A10()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2559E0A20()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2559E0A30()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2559E0A40()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2559E0A60()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2559E0A70()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2559E0A80()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_2559E0A90()
{
  return MEMORY[0x270FA1810]();
}

uint64_t sub_2559E0AA0()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_2559E0AB0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2559E0AC0()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2559E0AD0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2559E0AE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2559E0AF0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2559E0B00()
{
  return MEMORY[0x270FA1A88]();
}

uint64_t sub_2559E0B10()
{
  return MEMORY[0x270FA1AB8]();
}

uint64_t sub_2559E0B20()
{
  return MEMORY[0x270FA1AC0]();
}

uint64_t sub_2559E0B30()
{
  return MEMORY[0x270FA1AF0]();
}

uint64_t sub_2559E0B40()
{
  return MEMORY[0x270FA1B30]();
}

uint64_t sub_2559E0B50()
{
  return MEMORY[0x270FA1B40]();
}

uint64_t sub_2559E0B60()
{
  return MEMORY[0x270FA1B48]();
}

uint64_t sub_2559E0B70()
{
  return MEMORY[0x270FA1B88]();
}

uint64_t sub_2559E0B80()
{
  return MEMORY[0x270FA1B90]();
}

uint64_t sub_2559E0B90()
{
  return MEMORY[0x270FA1C88]();
}

uint64_t sub_2559E0BA0()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t sub_2559E0BB0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2559E0BC0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2559E0BD0()
{
  return MEMORY[0x270FA09B8]();
}

uint64_t sub_2559E0BE0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2559E0BF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2559E0C00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2559E0C10()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2559E0C20()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2559E0C30()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2559E0C40()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_2559E0C50()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_2559E0C60()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2559E0C70()
{
  return MEMORY[0x270EF1820]();
}

uint64_t sub_2559E0C80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2559E0C90()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2559E0CA0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2559E0CB0()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_2559E0CC0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2559E0CD0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2559E0CE0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2559E0CF0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2559E0D00()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2559E0D10()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2559E0D20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2559E0D30()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2559E0D40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2559E0D50()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2559E0D60()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2559E0D70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2559E0D80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2559E0D90()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2559E0DA0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2559E0DB0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2559E0DC0()
{
  return MEMORY[0x270F9DAC8]();
}

uint64_t sub_2559E0DD0()
{
  return MEMORY[0x270F9DB48]();
}

uint64_t sub_2559E0DE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2559E0DF0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2559E0E00()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2559E0E10()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2559E0E20()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2559E0E30()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2559E0E40()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2559E0E50()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2559E0E60()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2559E0E70()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_2559E0E80()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2559E0E90()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2559E0EA0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2559E0EB0()
{
  return MEMORY[0x270FA2B98]();
}

uint64_t sub_2559E0EC0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2559E0ED0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2559E0EE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2559E0EF0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2559E0F00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2559E0F10()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2559E0F20()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2559E0F30()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2559E0F40()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2559E0F50()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2559E0F60()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2559E0F70()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2559E0F80()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2559E0F90()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2559E0FA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2559E0FB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2559E0FC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2559E0FD0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2559E0FF0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2559E1000()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_2559E1010()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2559E1020()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2559E1030()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2559E1040()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2559E1050()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2559E1060()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_2559E1070()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2559E1080()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2559E1090()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2559E10A0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2559E10B0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_2559E10C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2559E10D0()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_2559E10E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2559E10F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2559E1100()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2559E1110()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2559E1120()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_2559E1130()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2559E1140()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2559E1150()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2559E1160()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2559E1170()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2559E1180()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2559E1190()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2559E11A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2559E11B0()
{
  return MEMORY[0x270F9F288]();
}

uint64_t sub_2559E11C0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_2559E11D0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2559E11E0()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_2559E11F0()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_2559E1200()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2559E1210()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2559E1220()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2559E1230()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_2559E1240()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2559E1250()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2559E1260()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_2559E1270()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_2559E1280()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2559E1290()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2559E12A0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2559E12B0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2559E12C0()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_2559E12D0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2559E12E0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2559E12F0()
{
  return MEMORY[0x270F9F3F0]();
}

uint64_t sub_2559E1300()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_2559E1310()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2559E1320()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2559E1330()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2559E1340()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_2559E1350()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2559E1360()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2559E1370()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_2559E1380()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_2559E1390()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_2559E13A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2559E13B0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2559E13C0()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2559E13D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2559E13F0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2559E1400()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2559E1410()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2559E1420()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2559E1430()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2559E1440()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2559E1450()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2559E1460()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2559E1470()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2559E1480()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2559E1490()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2559E14A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2559E14B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2559E14C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2559E14F0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x270EF4EB0]();
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

uint64_t MSVGetCurrentThreadPriority()
{
  return MEMORY[0x270F4A368]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

int flsl(uint64_t a1)
{
  return MEMORY[0x270ED99B0](a1);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}