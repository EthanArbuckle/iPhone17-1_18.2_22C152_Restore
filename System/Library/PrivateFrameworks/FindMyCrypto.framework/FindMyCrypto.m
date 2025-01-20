ValueMetadata *type metadata accessor for P256PrivateKey()
{
  return &type metadata for P256PrivateKey;
}

ValueMetadata *type metadata accessor for SymmetricKey256()
{
  return &type metadata for SymmetricKey256;
}

uint64_t sub_24E3003EC()
{
  if (*v0) {
    return 0x6574707972636E65;
  }
  else {
    return 0x727574616E676973;
  }
}

uint64_t getEnumTagSinglePayload for KeyRepresentableInternal(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t destroy for KeyRepresentableInternal(uint64_t a1)
{
  return sub_24E3013A8(*(void *)a1, *(void *)(a1 + 8));
}

ValueMetadata *type metadata accessor for EncryptAndSignEnvelope()
{
  return &type metadata for EncryptAndSignEnvelope;
}

uint64_t storeEnumTagSinglePayload for KeyRepresentableInternal(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_24E3004F8()
{
  return 1635017060;
}

uint64_t storeEnumTagSinglePayload for EncryptAndSignEnvelope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EncryptAndSignEnvelope(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

ValueMetadata *type metadata accessor for EncryptAndSignEnvelope.CodingKeys()
{
  return &type metadata for EncryptAndSignEnvelope.CodingKeys;
}

uint64_t sub_24E3005BC()
{
  return 7955819;
}

ValueMetadata *type metadata accessor for P256PublicKey()
{
  return &type metadata for P256PublicKey;
}

uint64_t sub_24E3005DC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return EncryptAndSignEnvelope.init(from:)(a1, a2);
}

uint64_t sub_24E3005F4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return SymmetricKey256.init(from:)(a1, a2);
}

uint64_t SymmetricKey256.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D24B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E300778();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E300778()
{
  unint64_t result = qword_2698D24B0;
  if (!qword_2698D24B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24B0);
  }
  return result;
}

uint64_t sub_24E3007CC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return P256PrivateKey.init(from:)(a1, a2);
}

uint64_t P256PrivateKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2448);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3009A4();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E300950()
{
  unint64_t result = qword_2698D1F28;
  if (!qword_2698D1F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F28);
  }
  return result;
}

unint64_t sub_24E3009A4()
{
  unint64_t result = qword_2698D2440;
  if (!qword_2698D2440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2440);
  }
  return result;
}

uint64_t sub_24E3009F8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return KeyRepresentableInternal.init(from:)(a1, a2);
}

uint64_t KeyRepresentableInternal.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1FE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E300BD0();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300B7C();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E300B7C()
{
  unint64_t result = qword_2698D1FF0;
  if (!qword_2698D1FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FF0);
  }
  return result;
}

unint64_t sub_24E300BD0()
{
  unint64_t result = qword_2698D1FD8;
  if (!qword_2698D1FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FD8);
  }
  return result;
}

uint64_t P256PrivateKey.publicKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_24E318210();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_24E3181A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  long long v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v11 = v1[1];
  uint64_t v21 = *v1;
  unint64_t v22 = v11;
  sub_24E301950(v21, v11);
  sub_24E318170();
  sub_24E318150();
  uint64_t v12 = sub_24E3181F0();
  unint64_t v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  switch(v14 >> 62)
  {
    case 1uLL:
      LODWORD(v15) = HIDWORD(v12) - v12;
      if (!__OFSUB__(HIDWORD(v12), v12))
      {
        uint64_t v15 = (int)v15;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_9;
    case 2uLL:
      uint64_t v17 = *(void *)(v12 + 16);
      uint64_t v16 = *(void *)(v12 + 24);
      BOOL v18 = __OFSUB__(v16, v17);
      uint64_t v15 = v16 - v17;
      if (!v18) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      goto LABEL_10;
    case 3uLL:
      goto LABEL_10;
    default:
      uint64_t v15 = BYTE6(v14);
LABEL_6:
      if (v15 == 64)
      {
        uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
        *a1 = v12;
        a1[1] = v14;
      }
      else
      {
LABEL_10:
        sub_24E3013A8(v12, v14);
        sub_24E318350();
        __break(1u);
        uint64_t result = swift_unexpectedError();
        __break(1u);
      }
      return result;
  }
}

uint64_t sub_24E300EB8(void *a1)
{
  return EncryptAndSignEnvelope.encode(to:)(a1);
}

uint64_t EncryptAndSignEnvelope.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D20D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v9 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E301074();
  sub_24E3184A0();
  uint64_t v16 = v8;
  uint64_t v17 = v7;
  char v18 = 0;
  sub_24E3010C8();
  uint64_t v10 = v15;
  sub_24E3183B0();
  if (!v10)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v13;
    char v18 = 1;
    sub_24E3183B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24E301074()
{
  unint64_t result = qword_2698D20D8;
  if (!qword_2698D20D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20D8);
  }
  return result;
}

unint64_t sub_24E3010C8()
{
  unint64_t result = qword_2698D1FE0;
  if (!qword_2698D1FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FE0);
  }
  return result;
}

uint64_t destroy for EncryptAndSignEnvelope(uint64_t *a1)
{
  sub_24E3013A8(*a1, a1[1]);
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];

  return sub_24E3013A8(v2, v3);
}

uint64_t EncryptAndSignEnvelope.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D20E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E301074();
  sub_24E318490();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v16 = a2;
  char v19 = 0;
  sub_24E300B7C();
  sub_24E318380();
  uint64_t v9 = v17;
  unint64_t v10 = v18;
  char v19 = 1;
  sub_24E301950(v17, v18);
  sub_24E318380();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v17;
  unint64_t v12 = v18;
  sub_24E301950(v9, v10);
  sub_24E301950(v11, v12);
  sub_24E3013A8(v9, v10);
  uint64_t v13 = v16;
  *uint64_t v16 = v9;
  v13[1] = v10;
  v13[2] = v11;
  v13[3] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_24E3013A8(v9, v10);
  return sub_24E3013A8(v11, v12);
}

uint64_t sub_24E3013A8(uint64_t a1, unint64_t a2)
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

NSObject *decryptAndValidate(envelope:symmetricKey:publicKey:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E318120();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388]();
  v47 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_24E3181D0();
  uint64_t v48 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24E318210();
  uint64_t v50 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  uint64_t v15 = a1[2];
  uint64_t v16 = a1[3];
  uint64_t v49 = v15;
  uint64_t v17 = *a2;
  unint64_t v18 = a2[1];
  unint64_t v19 = a3[1];
  uint64_t v52 = *a3;
  unint64_t v53 = v19;
  sub_24E301950(v52, v19);
  v20 = v54;
  sub_24E318200();
  if (!v20)
  {
    uint64_t v42 = v17;
    v43 = v16;
    v54 = v12;
    uint64_t v21 = v51;
    uint64_t v44 = v10;
    uint64_t v52 = v13;
    unint64_t v53 = v14;
    sub_24E301950(v13, v14);
    sub_24E301DA8();
    sub_24E3181C0();
    unint64_t v22 = v9;
    uint64_t v23 = v49;
    unint64_t v24 = (unint64_t)v43;
    uint64_t v52 = v49;
    unint64_t v53 = (unint64_t)v43;
    char v25 = sub_24E3181E0();
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v52 = v42;
      unint64_t v53 = v18;
      sub_24E301950(v42, v18);
      v27 = v47;
      sub_24E318100();
      sub_24E301950(v23, v24);
      uint64_t v37 = sub_24E301E5C(v23, v24);
      unint64_t v39 = v38;
      v40 = v27;
      uint64_t v16 = sub_24E3180B0();
      sub_24E3013A8(v37, v39);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v40, v46);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v22, v21);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v54, v26);
    }
    else
    {
      v28 = v22;
      uint64_t v29 = v21;
      if (qword_2698D1E88 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_24E3180A0();
      __swift_project_value_buffer(v30, (uint64_t)qword_2698D2588);
      uint64_t v16 = sub_24E318080();
      os_log_type_t v31 = sub_24E3182C0();
      BOOL v32 = os_log_type_enabled(v16, v31);
      uint64_t v33 = v50;
      uint64_t v34 = v48;
      if (v32)
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_24E2FF000, v16, v31, "Invalid ECDSASignature", v35, 2u);
        MEMORY[0x253339480](v35, -1, -1);
      }

      sub_24E30B1E0();
      swift_allocError();
      unsigned char *v36 = 0;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v29);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v54, v44);
    }
  }
  return v16;
}

uint64_t *initializeBufferWithCopyOfBuffer for KeyRepresentableInternal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_24E301950(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_24E301950(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t encryptAndSign(data:symmetricKey:privateKey:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  v41 = a5;
  uint64_t v9 = sub_24E3181D0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v40 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v42 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24E3181A0();
  uint64_t v43 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v44 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D20E8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24E318120();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *a3;
  unint64_t v21 = a3[1];
  uint64_t v22 = *a4;
  unint64_t v23 = a4[1];
  uint64_t v47 = a1;
  unint64_t v48 = a2;
  uint64_t v45 = v20;
  unint64_t v46 = v21;
  sub_24E301950(v20, v21);
  sub_24E318100();
  uint64_t v24 = sub_24E3180D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 1, 1, v24);
  sub_24E301DA8();
  unint64_t v25 = v49;
  uint64_t v26 = sub_24E3180C0();
  if (v25)
  {
    sub_24E301DFC((uint64_t)v15);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  else
  {
    uint64_t v38 = v26;
    unint64_t v49 = v27;
    sub_24E301DFC((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    uint64_t v47 = v22;
    unint64_t v48 = v23;
    sub_24E301950(v22, v23);
    uint64_t v29 = v44;
    sub_24E318170();
    uint64_t v30 = v38;
    unint64_t v31 = v49;
    uint64_t v47 = v38;
    unint64_t v48 = v49;
    BOOL v32 = v42;
    sub_24E318190();
    uint64_t v33 = sub_24E3181B0();
    uint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v32, v39);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v29, v12);
    v36 = v41;
    uint64_t *v41 = v33;
    v36[1] = v35;
    v36[2] = v30;
    v36[3] = v31;
  }
  return result;
}

unint64_t sub_24E301DA8()
{
  unint64_t result = qword_2698D1F00;
  if (!qword_2698D1F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F00);
  }
  return result;
}

uint64_t sub_24E301DFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D20E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E301E5C(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (!__OFSUB__(HIDWORD(result), result))
      {
        uint64_t v4 = (int)v4;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_10;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
LABEL_10:
      __break(1u);
      break;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
LABEL_6:
      if (v4 > 27)
      {
        unint64_t result = sub_24E301F78(result, a2);
      }
      else
      {
LABEL_7:
        uint64_t v8 = sub_24E3180E0();
        sub_24E30C15C();
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F04538], v8);
        swift_willThrow();
        unint64_t result = sub_24E3013A8(v3, a2);
      }
      break;
  }
  return result;
}

uint64_t sub_24E301F78(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_24E301950(a1, a2);
      sub_24E301950(v5, v6);
      uint64_t v8 = (unsigned char *)sub_24E317F00();
      if (v8)
      {
        uint64_t v9 = sub_24E317F30();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_24E317F20();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_24E30221C(v8, v13, &v27);
      sub_24E3013A8(v5, v6);
LABEL_27:
      sub_24E3013A8(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_24E301950(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_24E317F00();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_24E317F30();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_24E317F20();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        unint64_t v23 = v22;
      }
      else {
        unint64_t v23 = 0;
      }
      sub_24E30221C(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_24E301950(a1, a2);
      BOOL v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_24E301950(a1, a2);
      BOOL v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_24E30221C(v26, v7, &v27);
      goto LABEL_27;
  }
}

unsigned char *sub_24E30221C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_24E316BD4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_24E316C98((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_24E302294((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_24E302294(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24E317F40();
  swift_allocObject();
  uint64_t result = sub_24E317EF0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for KeyRepresentableInternal.CodingKeys()
{
  return &type metadata for KeyRepresentableInternal.CodingKeys;
}

unint64_t sub_24E302430()
{
  unint64_t result = qword_2698D2010;
  if (!qword_2698D2010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2010);
  }
  return result;
}

unint64_t sub_24E302484()
{
  unint64_t result = qword_2698D2018;
  if (!qword_2698D2018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2018);
  }
  return result;
}

unint64_t sub_24E3024E0()
{
  unint64_t result = qword_2698D2100;
  if (!qword_2698D2100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2100);
  }
  return result;
}

unint64_t sub_24E302534()
{
  unint64_t result = qword_2698D2108;
  if (!qword_2698D2108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2108);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymmetricKey256.CodingKeys()
{
  return &type metadata for SymmetricKey256.CodingKeys;
}

unint64_t sub_24E3025A0()
{
  unint64_t result = qword_2698D24F8;
  if (!qword_2698D24F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24F8);
  }
  return result;
}

unint64_t sub_24E3025F4()
{
  unint64_t result = qword_2698D2500;
  if (!qword_2698D2500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2500);
  }
  return result;
}

ValueMetadata *type metadata accessor for P256PrivateKey.CodingKeys()
{
  return &type metadata for P256PrivateKey.CodingKeys;
}

unint64_t sub_24E302660()
{
  unint64_t result = qword_2698D2488;
  if (!qword_2698D2488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2488);
  }
  return result;
}

unint64_t sub_24E3026B4()
{
  unint64_t result = qword_2698D2490;
  if (!qword_2698D2490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2490);
  }
  return result;
}

uint64_t sub_24E302708()
{
  uint64_t v0 = sub_24E3180A0();
  __swift_allocate_value_buffer(v0, qword_2698D2570);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2698D2570);
  if (qword_2698D1EA8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2698D25B8);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

double TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)@<D0>(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, unint64_t a4@<X3>, long long *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8 = *((void *)a5 + 2);
  long long v9 = *a1;
  long long v18 = *a2;
  long long v19 = v9;
  long long v17 = *a3;
  long long v15 = *a5;
  uint64_t v16 = v8;
  sub_24E302858((uint64_t *)&v19, (uint64_t *)&v18, (uint64_t *)&v17, (unint64_t *)&v15, a4, (uint64_t *)v20);
  if (!v6)
  {
    uint64_t v11 = v21;
    double result = *(double *)v20;
    long long v12 = v20[1];
    long long v13 = v20[2];
    long long v14 = v20[3];
    *(_OWORD *)a6 = v20[0];
    *(_OWORD *)(a6 + 16) = v12;
    *(_OWORD *)(a6 + 32) = v13;
    *(_OWORD *)(a6 + 48) = v14;
    *(void *)(a6 + 64) = v11;
  }
  return result;
}

uint64_t sub_24E302858@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  unint64_t v6 = a1[1];
  uint64_t v49 = *a1;
  uint64_t v7 = *a2;
  unint64_t v45 = a2[1];
  uint64_t v8 = *a3;
  unint64_t v9 = a3[1];
  unint64_t v11 = *a4;
  uint64_t v10 = a4[1];
  unint64_t v12 = a4[2];
  if (!a5)
  {
    sub_24E30407C(v49, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v8, v9);
    sub_24E304188(v11, v10, v12);
    sub_24E3041A4();
    swift_allocError();
    return swift_willThrow();
  }
  if (v12 >> 60 == 15)
  {
    sub_24E301950(v8, v9);
    sub_24E301950(v8, v9);
    sub_24E302F0C(v49, v6);
    sub_24E301950(v7, v45);
    uint64_t v14 = v8;
    unint64_t v15 = v9;
    uint64_t v16 = a5;
  }
  else
  {
    os_log_t log = (os_log_t)(a5 - v11);
    if (a5 >= v11)
    {
      sub_24E301950(v8, v9);
      sub_24E302F0C(v49, v6);
      sub_24E301950(v7, v45);
      sub_24E3041F8(v11, v10, v12);
      if (qword_2698D1E80 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_24E3180A0();
      __swift_project_value_buffer(v21, (uint64_t)qword_2698D2570);
      sub_24E301950(v10, v12);
      uint64_t v22 = sub_24E318080();
      os_log_type_t v36 = sub_24E3182B0();
      if (os_log_type_enabled(v22, v36))
      {
        uint64_t v35 = v22;
        *(void *)typea = v9;
        unint64_t v23 = v6;
        uint64_t v24 = v7;
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 134218240;
        unint64_t v47 = v11;
        sub_24E3182E0();
        uint64_t v26 = v10;
        uint64_t result = sub_24E304188(v11, v10, v12);
        *(_WORD *)(v25 + 12) = 2048;
        if (a5 < (unint64_t)log)
        {
          __break(1u);
          return result;
        }
        unint64_t v47 = a5 - (void)log;
        sub_24E3182E0();
        _os_log_impl(&dword_24E2FF000, v35, v36, "KeyGenerationHint hint.index:%llu saved %llu ratchet iterations", (uint8_t *)v25, 0x16u);
        MEMORY[0x253339480](v25, -1, -1);

        uint64_t v27 = v11;
        uint64_t v14 = v10;
        unint64_t v15 = v12;
        sub_24E304188(v27, v26, v12);
        uint64_t v7 = v24;
        unint64_t v6 = v23;
        unint64_t v9 = *(void *)typea;
      }
      else
      {
        sub_24E304188(v11, v10, v12);
        sub_24E304188(v11, v10, v12);

        uint64_t v14 = v10;
        unint64_t v15 = v12;
      }
      uint64_t v16 = (uint64_t)log;
    }
    else
    {
      sub_24E301950(v8, v9);
      sub_24E302F0C(v49, v6);
      sub_24E301950(v7, v45);
      if (qword_2698D1E80 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_24E3180A0();
      __swift_project_value_buffer(v18, (uint64_t)qword_2698D2570);
      sub_24E301950(v10, v12);
      long long v19 = sub_24E318080();
      os_log_type_t type = sub_24E3182D0();
      if (os_log_type_enabled(v19, type))
      {
        loga = v19;
        uint64_t v20 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134218240;
        sub_24E3182E0();
        sub_24E304188(v11, v10, v12);
        *(_WORD *)(v20 + 12) = 2048;
        unint64_t v47 = a5;
        sub_24E3182E0();
        _os_log_impl(&dword_24E2FF000, loga, type, "Ignoring KeyGenerationHint: hint.index (%llu) > initialRatchetsToSkip(%llu)", (uint8_t *)v20, 0x16u);
        MEMORY[0x253339480](v20, -1, -1);

        sub_24E304188(v11, v10, v12);
      }
      else
      {
        sub_24E304188(v11, v10, v12);
        sub_24E304188(v11, v10, v12);
      }
      uint64_t v16 = a5 - 1;
      sub_24E301950(v8, v9);
      uint64_t v14 = v8;
      unint64_t v15 = v9;
    }
  }
  uint64_t v28 = v14;
  v46[0] = v14;
  v46[1] = v15;
  sub_24E309468(v46, v16, (uint64_t *)&v47);
  if (v44)
  {
    sub_24E3013A8(v8, v9);
    sub_24E3013A8(v7, v45);
    uint64_t v29 = v49;
    sub_24E30407C(v49, v6);
    sub_24E30407C(v29, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v8, v9);
    uint64_t v30 = v14;
    unint64_t v31 = v15;
  }
  else
  {
    uint64_t v41 = v8;
    uint64_t v32 = v49;
    unint64_t v43 = a5;
    uint64_t v33 = v47;
    unint64_t v34 = v48;
    sub_24E301950(v47, v48);
    sub_24E3013A8(v28, v15);
    sub_24E302F0C(v32, v6);
    sub_24E301950(v7, v45);
    sub_24E301950(v41, v9);
    sub_24E301950(v33, v34);
    sub_24E3013A8(v33, v34);
    sub_24E3013A8(v41, v9);
    sub_24E3013A8(v7, v45);
    sub_24E30407C(v32, v6);
    *a6 = v32;
    a6[1] = v6;
    a6[2] = v7;
    a6[3] = v45;
    a6[4] = v41;
    a6[5] = v9;
    a6[6] = v43;
    a6[7] = v33;
    a6[8] = v34;
    sub_24E30407C(v32, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v41, v9);
    uint64_t v30 = v33;
    unint64_t v31 = v34;
  }
  return sub_24E3013A8(v30, v31);
}

uint64_t TokenSequence.makeIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 56);
  unint64_t v8 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  long long v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 40) = v10;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  sub_24E302F0C(v2, v3);
  sub_24E301950(v4, v5);
  sub_24E301950(v6, v10);

  return sub_24E301950(v7, v8);
}

uint64_t sub_24E302F0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E301950(a1, a2);
  }
  return a1;
}

__n128 TokenSequence.next()@<Q0>(uint64_t a1@<X8>)
{
  unint64_t v3 = *((void *)v1 + 8);
  long long v4 = *v1;
  uint64_t v5 = *((void *)v1 + 7);
  uint64_t v6 = *((void *)v1 + 6);
  long long v11 = v1[1];
  long long v12 = v4;
  *(void *)&long long v10 = v5;
  *((void *)&v10 + 1) = v3;
  sub_24E301950(v5, v3);
  sub_24E308CE8((uint64_t *)&v12, (uint64_t *)&v11, &v10, (uint64_t)(v1 + 3), (uint64_t)v1 + 56, v13);
  __n128 result = (__n128)v13[0];
  long long v8 = v13[1];
  long long v9 = v13[2];
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v3;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = v9;
  return result;
}

__n128 sub_24E30315C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 32);
  long long v5 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = v2;
  return result;
}

uint64_t sub_24E303178()
{
  return 0;
}

uint64_t sub_24E303180()
{
  return 2;
}

void *sub_24E303188()
{
  long long v1 = *(_OWORD *)(v0 + 48);
  v5[2] = *(_OWORD *)(v0 + 32);
  v5[3] = v1;
  uint64_t v6 = *(void *)(v0 + 64);
  long long v2 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v2;
  long long v3 = sub_24E303C68((uint64_t)v5);
  sub_24E304090(v5, (void (*)(void, void))sub_24E30407C, (void (*)(uint64_t, uint64_t))sub_24E3013A8);
  return v3;
}

uint64_t sub_24E303204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E303248(a1, a2, a3);
}

uint64_t sub_24E303248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(v3 + 48);
  long long v39 = *(_OWORD *)(v3 + 32);
  long long v40 = v6;
  unint64_t v41 = *(void *)(v3 + 64);
  long long v7 = *(_OWORD *)(v3 + 16);
  long long v37 = *(_OWORD *)v3;
  long long v38 = v7;
  if (!a2)
  {
    uint64_t v8 = 0;
    long long v20 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(a1 + 48) = v20;
    *(void *)(a1 + 64) = *(void *)(v3 + 64);
    long long v21 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v3;
    *(_OWORD *)(a1 + 16) = v21;
    return v8;
  }
  uint64_t v8 = a3;
  if (!a3) {
    goto LABEL_6;
  }
  uint64_t v9 = a2;
  long long v43 = *(_OWORD *)(v3 + 16);
  sub_24E303C00(v3, (uint64_t)v42);
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v12 = *((void *)&v40 + 1);
      unint64_t v11 = v41;
      uint64_t v13 = v40;
      sub_24E303C00((uint64_t)v42, (uint64_t)v35);
      long long v34 = v43;
      *(void *)&long long v33 = v12;
      *((void *)&v33 + 1) = v11;
      sub_24E301950(v12, v11);
      sub_24E308CE8(v35, (uint64_t *)&v34, &v33, (uint64_t)&v40, (uint64_t)&v40 + 8, v36);
      ++v10;
      long long v14 = v36[0];
      long long v15 = v36[1];
      long long v16 = v36[2];
      *(void *)uint64_t v9 = v13;
      *(void *)(v9 + 8) = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)(v9 + 24) = v14;
      *(_OWORD *)(v9 + 40) = v15;
      *(_OWORD *)(v9 + 56) = v16;
      v9 += 72;
    }
    while (v8 != v10);
LABEL_6:
    unint64_t v17 = v41;
    long long v18 = v38;
    *(_OWORD *)a1 = v37;
    *(_OWORD *)(a1 + 16) = v18;
    long long v19 = v40;
    *(_OWORD *)(a1 + 32) = v39;
    *(_OWORD *)(a1 + 48) = v19;
    *(void *)(a1 + 64) = v17;
    return v8;
  }
  __break(1u);
  swift_once();
  uint64_t v22 = sub_24E3180A0();
  __swift_project_value_buffer(v22, (uint64_t)qword_2698D2570);
  id v23 = v4;
  uint64_t v24 = sub_24E318080();
  os_log_type_t v25 = sub_24E3182C0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 138543362;
    *(void *)&v36[0] = sub_24E317F50();
    sub_24E3182E0();
    void *v27 = *(void *)&v36[0];
    MEMORY[0x2533393A0](v4);
    _os_log_impl(&dword_24E2FF000, v24, v25, "Error in TokenSequence: %{public}@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1EC8);
    swift_arrayDestroy();
    MEMORY[0x253339480](v27, -1, -1);
    MEMORY[0x253339480](v26, -1, -1);

    MEMORY[0x2533393A0](v4);
  }
  else
  {
    MEMORY[0x2533393A0](v4);
    MEMORY[0x2533393A0](v4);
  }
  unint64_t v28 = v41;
  long long v29 = v38;
  *(_OWORD *)a1 = v37;
  *(_OWORD *)(a1 + 16) = v29;
  long long v30 = v40;
  *(_OWORD *)(a1 + 32) = v39;
  *(_OWORD *)(a1 + 48) = v30;
  *(void *)(a1 + 64) = v28;
  return v5;
}

uint64_t sub_24E303540()
{
  return sub_24E318260();
}

uint64_t *sub_24E303568@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v5 = *a2 + 1;
  if (*a2 == -1)
  {
    __break(1u);
  }
  else
  {
    id v23 = a4;
    uint64_t v6 = result[2];
    uint64_t v20 = *result;
    unint64_t v21 = result[1];
    unint64_t v7 = result[3];
    uint64_t v8 = result[4];
    unint64_t v9 = result[5];
    *a2 = v5;
    uint64_t v10 = *a3;
    unint64_t v11 = a3[1];
    *a3 = v8;
    a3[1] = v9;
    sub_24E301950(v8, v9);
    sub_24E3013A8(v10, v11);
    sub_24E301950(v8, v9);
    uint64_t v12 = sub_24E318230();
    unint64_t v14 = v13;
    sub_24E301950(v8, v9);
    uint64_t v15 = sub_24E309C08(v8, v9, v12, v14, 32);
    if (v4)
    {
      sub_24E3013A8(v8, v9);
      sub_24E3013A8(v12, v14);
      return (uint64_t *)sub_24E3013A8(v8, v9);
    }
    else
    {
      uint64_t v17 = v15;
      unint64_t v18 = v16;
      sub_24E3013A8(v8, v9);
      sub_24E30C2E0(v17, v18, (uint64_t *)&v22);
      sub_24E3013A8(v12, v14);
      sub_24E3013A8(v8, v9);
      long long v19 = v23;
      *id v23 = v22;
      v19[2] = v6;
      v19[3] = v7;
      v19[4] = v20;
      v19[5] = v21;
      sub_24E301950(v6, v7);
      return (uint64_t *)sub_24E302F0C(v20, v21);
    }
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24E303740()
{
  unint64_t result = qword_2698D1ED0;
  if (!qword_2698D1ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1ED0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenSequence(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TokenSequence(uint64_t *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >> 60 != 15) {
    sub_24E3013A8(*a1, v2);
  }
  sub_24E3013A8(a1[2], a1[3]);
  sub_24E3013A8(a1[4], a1[5]);
  uint64_t v3 = a1[7];
  unint64_t v4 = a1[8];

  return sub_24E3013A8(v3, v4);
}

uint64_t initializeWithCopy for TokenSequence(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_24E301950(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_24E301950(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  sub_24E301950(v8, v9);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = a2[7];
  *(void *)(a1 + 48) = a2[6];
  unint64_t v11 = a2[8];
  sub_24E301950(v10, v11);
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  return a1;
}

uint64_t *assignWithCopy for TokenSequence(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *a2;
      sub_24E301950(*a2, a2[1]);
      uint64_t v7 = *a1;
      unint64_t v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_24E3013A8(v7, v8);
      goto LABEL_8;
    }
    sub_24E3039C8((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *a2;
  sub_24E301950(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  uint64_t v9 = a2[2];
  unint64_t v10 = a2[3];
  sub_24E301950(v9, v10);
  uint64_t v11 = a1[2];
  unint64_t v12 = a1[3];
  a1[2] = v9;
  a1[3] = v10;
  sub_24E3013A8(v11, v12);
  uint64_t v13 = a2[4];
  unint64_t v14 = a2[5];
  sub_24E301950(v13, v14);
  uint64_t v15 = a1[4];
  unint64_t v16 = a1[5];
  a1[4] = v13;
  a1[5] = v14;
  sub_24E3013A8(v15, v16);
  a1[6] = a2[6];
  uint64_t v18 = a2[7];
  unint64_t v17 = a2[8];
  sub_24E301950(v18, v17);
  uint64_t v19 = a1[7];
  unint64_t v20 = a1[8];
  a1[7] = v18;
  a1[8] = v17;
  sub_24E3013A8(v19, v20);
  return a1;
}

uint64_t sub_24E3039C8(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TokenSequence(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a1;
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      sub_24E3013A8(v6, v4);
      goto LABEL_6;
    }
    sub_24E3039C8(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_24E3013A8(v7, v8);
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_24E3013A8(v9, v10);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a1 + 56);
  unint64_t v13 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v11;
  sub_24E3013A8(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenSequence(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 24) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 24) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TokenSequence(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2)
    {
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenSequence()
{
  return &type metadata for TokenSequence;
}

void type metadata accessor for SecKey()
{
  if (!qword_2698D1ED8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2698D1ED8);
    }
  }
}

uint64_t sub_24E303C00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_24E303C68(uint64_t a1)
{
  long long v58 = *(_OWORD *)(a1 + 16);
  sub_24E303C00(a1, (uint64_t)v57);
  long long v2 = *(_OWORD *)(a1 + 48);
  long long v54 = *(_OWORD *)(a1 + 32);
  long long v55 = v2;
  unint64_t v56 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v52 = *(_OWORD *)a1;
  long long v53 = v3;
  uint64_t v4 = &v55;
  sub_24E304090((void *)a1, (void (*)(void, void))sub_24E302F0C, (void (*)(uint64_t, uint64_t))sub_24E301950);
  uint64_t v5 = 0;
  unint64_t v45 = (void *)MEMORY[0x263F8EE78];
  for (uint64_t i = MEMORY[0x263F8EE78] + 32; ; i += 72)
  {
    uint64_t v8 = *((void *)&v55 + 1);
    unint64_t v7 = v56;
    uint64_t v9 = v55;
    sub_24E303C00((uint64_t)v57, (uint64_t)v48);
    long long v47 = v58;
    *(void *)&long long v46 = v8;
    *((void *)&v46 + 1) = v7;
    sub_24E301950(v8, v7);
    sub_24E308CE8(v48, (uint64_t *)&v47, &v46, (uint64_t)v4, (uint64_t)&v55 + 8, &v49);
    long long v10 = v49;
    long long v11 = v50;
    long long v12 = v51;
    if (!v5) {
      break;
    }
    unint64_t v13 = v45;
    BOOL v14 = __OFSUB__(v5--, 1);
    if (v14) {
      goto LABEL_27;
    }
LABEL_19:
    unint64_t v45 = v13;
    *(void *)uint64_t i = v9;
    *(void *)(i + 8) = v8;
    *(void *)(i + 16) = v7;
    *(_OWORD *)(i + 24) = v10;
    *(_OWORD *)(i + 40) = v11;
    *(_OWORD *)(i + 56) = v12;
  }
  unint64_t v15 = v45[3];
  if ((uint64_t)((v15 >> 1) + 0x4000000000000000) < 0) {
    goto LABEL_28;
  }
  long long v42 = v51;
  long long v43 = v50;
  long long v44 = v49;
  unint64_t v16 = v4;
  int64_t v17 = v15 & 0xFFFFFFFFFFFFFFFELL;
  if (v17 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1EE8);
  uint64_t v19 = (void *)swift_allocObject();
  int64_t v20 = _swift_stdlib_malloc_size(v19) - 32;
  unint64_t v21 = v45;
  uint64_t v22 = v20 / 72;
  v19[2] = v18;
  v19[3] = 2 * (v20 / 72);
  unint64_t v23 = (unint64_t)(v19 + 4);
  uint64_t v24 = v45[3] >> 1;
  if (v45[2])
  {
    if (v19 != v45 || v23 >= (unint64_t)&v45[9 * v24 + 4])
    {
      memmove(v19 + 4, v45 + 4, 72 * v24);
      unint64_t v21 = v45;
    }
    v21[2] = 0;
  }
  uint64_t i = v23 + 72 * v24;
  uint64_t v26 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
  swift_release();
  unint64_t v13 = v19;
  uint64_t v4 = v16;
  long long v11 = v43;
  long long v10 = v44;
  long long v12 = v42;
  BOOL v14 = __OFSUB__(v26, 1);
  uint64_t v5 = v26 - 1;
  if (!v14) {
    goto LABEL_19;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  swift_once();
  uint64_t v27 = sub_24E3180A0();
  __swift_project_value_buffer(v27, (uint64_t)qword_2698D2570);
  id v28 = 0;
  long long v29 = sub_24E318080();
  os_log_type_t v30 = sub_24E3182C0();
  if (os_log_type_enabled(v29, v30))
  {
    unint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v31 = 138543362;
    uint64_t v33 = sub_24E317F50();
    *(void *)&long long v49 = v33;
    sub_24E3182E0();
    *uint64_t v32 = v33;
    MEMORY[0x2533393A0](0);
    _os_log_impl(&dword_24E2FF000, v29, v30, "Error in TokenSequence: %{public}@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1EC8);
    swift_arrayDestroy();
    MEMORY[0x253339480](v32, -1, -1);
    MEMORY[0x253339480](v31, -1, -1);

    MEMORY[0x2533393A0](0);
  }
  else
  {
    MEMORY[0x2533393A0](0);
    MEMORY[0x2533393A0](0);
  }
  long long v34 = v53;
  long long v35 = v54;
  uint64_t v36 = *((void *)&v55 + 1);
  unint64_t v37 = v56;
  sub_24E30407C(v52, *((unint64_t *)&v52 + 1));
  sub_24E3013A8(v34, *((unint64_t *)&v34 + 1));
  sub_24E3013A8(v35, *((unint64_t *)&v35 + 1));
  sub_24E3013A8(v36, v37);
  __n128 result = v45;
  unint64_t v39 = v45[3];
  if (v39 >= 2)
  {
    unint64_t v40 = v39 >> 1;
    BOOL v14 = __OFSUB__(v40, v5);
    uint64_t v41 = v40 - v5;
    if (v14) {
      __break(1u);
    }
    else {
      v45[2] = v41;
    }
  }
  return result;
}

uint64_t sub_24E30407C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E3013A8(a1, a2);
  }
  return a1;
}

void *sub_24E304090(void *a1, void (*a2)(void, void), void (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  a2(*a1, a1[1]);
  a3(v5, v6);
  a3(v7, v8);
  a3(v9, v10);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24E304188(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    return sub_24E3013A8(a2, a3);
  }
  return result;
}

unint64_t sub_24E3041A4()
{
  unint64_t result = qword_2698D1EF0;
  if (!qword_2698D1EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1EF0);
  }
  return result;
}

uint64_t sub_24E3041F8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    return sub_24E301950(a2, a3);
  }
  return result;
}

uint64_t static Advertisement.length.getter()
{
  return 28;
}

uint64_t Advertisement.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t Advertisement.hint.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24E301950(v1, v2);
  uint64_t v3 = sub_24E317E70();
  sub_24E304870(v3, v1, v2, v8);
  uint64_t v4 = v8[0];
  unint64_t v5 = v8[1];
  uint64_t v6 = sub_24E317FF0();
  sub_24E3013A8(v4, v5);
  return v6;
}

uint64_t Advertisement.address.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24E301950(v1, v2);
  uint64_t v3 = sub_24E317E70();
  sub_24E304870(v3, v1, v2, &v5);
  return v5;
}

uint64_t Advertisement.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 Advertisement.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

double Advertisement.init(macAddress:pubKey2:ek:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  double v8 = COERCE_DOUBLE(sub_24E317E60());
  unint64_t v10 = v9;
  *(double *)&long long v13 = v8;
  *((void *)&v13 + 1) = v9;
  sub_24E301950(*(uint64_t *)&v8, v9);
  sub_24E317FF0();
  sub_24E3013A8(*(uint64_t *)&v8, v10);
  sub_24E317FC0();
  sub_24E301950(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_24E301950(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_24E301950(a2, a3);
  sub_24E3052C8(a2, a3);
  sub_24E3013A8(a2, a3);
  uint64_t v11 = sub_24E317E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  sub_24E3013A8(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_24E3013A8(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_24E3013A8(a2, a3);
  double result = v8;
  *a4 = v13;
  return result;
}

uint64_t Advertisement.description.getter()
{
  return sub_24E318270();
}

uint64_t Advertisement.hashed.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_24E317E90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  unint64_t v7 = v1[1];
  uint64_t v13 = v8;
  unint64_t v14 = v7;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F3C9C0], v3);
  sub_24E301950(v8, v7);
  sub_24E301DA8();
  uint64_t v9 = sub_24E317EA0();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t result = sub_24E3013A8(v13, v14);
  *a1 = v9;
  a1[1] = v11;
  return result;
}

uint64_t sub_24E3045EC()
{
  return 1;
}

uint64_t sub_24E3045F8()
{
  return sub_24E318450();
}

uint64_t sub_24E304628()
{
  return 0;
}

void sub_24E304634(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24E304640(uint64_t a1)
{
  unint64_t v2 = sub_24E305540();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E30467C(uint64_t a1)
{
  unint64_t v2 = sub_24E305540();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Advertisement.encode(to:)(void *a1)
{
  return sub_24E304BD4(a1, &qword_2698D1F08, (void (*)(void))sub_24E305540);
}

uint64_t Advertisement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_24E304D6C(a1, &qword_2698D1F20, (void (*)(void))sub_24E305540, a2);
}

uint64_t sub_24E304730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 sub_24E30473C@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E304748()
{
  return sub_24E318270();
}

uint64_t sub_24E30478C()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_24E3047C0()
{
  return 28;
}

uint64_t sub_24E3047C8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return Advertisement.init(from:)(a1, a2);
}

uint64_t sub_24E3047E0(void *a1)
{
  return Advertisement.encode(to:)(a1);
}

uint64_t sub_24E304804@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E316EB4(*(void *)a1, *(void *)(a1 + 8), a2);
}

double Advertisement.nearOwner.getter@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  sub_24E301950(v4, v3);
  sub_24E304870(6, v4, v3, (uint64_t *)&v6);
  double result = *(double *)&v6;
  *a1 = v6;
  return result;
}

uint64_t sub_24E304870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v10 = (int)a2;
      uint64_t v9 = a2 >> 32;
      break;
    case 2uLL:
      uint64_t v10 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v11 = sub_24E3051DC(v10, v9, a2, a3);
  if (a1 && (v11 & 0x8000000000000000) == 0 && v11 < a1)
  {
    switch((int)v5)
    {
      case 1:
        uint64_t v12 = a2 >> 32;
        goto LABEL_12;
      case 2:
        uint64_t v12 = *(void *)(a2 + 24);
        goto LABEL_14;
      default:
        goto LABEL_16;
    }
  }
  uint64_t v12 = sub_24E305160(v10, a1, a2, a3);
  uint64_t v13 = 0;
  switch((int)v5)
  {
    case 1:
LABEL_12:
      uint64_t v13 = (int)a2;
      break;
    case 2:
LABEL_14:
      uint64_t v13 = *(void *)(a2 + 16);
      break;
    default:
      break;
  }
  if (v12 < v13)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x24E3049DCLL);
  }
LABEL_16:
  uint64_t v14 = sub_24E317FB0();
  uint64_t v16 = v15;
  uint64_t result = sub_24E3013A8(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

uint64_t static HashedAdvertisement.length.getter()
{
  return 32;
}

uint64_t sub_24E304A14()
{
  return sub_24E318480();
}

uint64_t sub_24E304A58()
{
  return sub_24E318480();
}

uint64_t sub_24E304A98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24E3183E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24E304B20(uint64_t a1)
{
  unint64_t v2 = sub_24E3055E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E304B5C(uint64_t a1)
{
  unint64_t v2 = sub_24E3055E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HashedAdvertisement.encode(to:)(void *a1)
{
  return sub_24E304BD4(a1, &qword_2698D1F30, (void (*)(void))sub_24E3055E8);
}

uint64_t sub_24E304BD4(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v12 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v3;
  uint64_t v11 = v3[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v12();
  sub_24E3184A0();
  uint64_t v13 = v9;
  uint64_t v14 = v11;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t HashedAdvertisement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_24E304D6C(a1, &qword_2698D1F40, (void (*)(void))sub_24E3055E8, a2);
}

uint64_t sub_24E304D6C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v13 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v15 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24E318490();
  if (!v4)
  {
    uint64_t v10 = v13;
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v7);
    *uint64_t v10 = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E304EE4()
{
  return 32;
}

uint64_t sub_24E304EEC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return HashedAdvertisement.init(from:)(a1, a2);
}

uint64_t sub_24E304F04(void *a1)
{
  return HashedAdvertisement.encode(to:)(a1);
}

uint64_t sub_24E304F1C()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24E318440();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t sub_24E304F80()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  sub_24E301950(v2, v1);
  sub_24E317FD0();

  return sub_24E3013A8(v2, v1);
}

uint64_t sub_24E304FE0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24E318440();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t sub_24E305040(void *a1)
{
  return sub_24E316F50(*a1, a1[1]);
}

uint64_t sub_24E30504C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24E301950(*a1, v3);
  sub_24E301950(v4, v5);
  char v6 = sub_24E306DC0(v2, v3, v4, v5);
  sub_24E3013A8(v4, v5);
  sub_24E3013A8(v2, v3);
  return v6 & 1;
}

uint64_t sub_24E3050CC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24E317F00();
  if (!result || (uint64_t result = sub_24E317F30(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24E317F20();
      return sub_24E317FA0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24E305160(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < result || result < v7)
  {
LABEL_10:
    __break(1u);
    JUMPOUT(0x24E3051CCLL);
  }
  return result;
}

uint64_t sub_24E3051DC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v4 < a1 || v5 > a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < a2 || v7 > a2) {
    goto LABEL_16;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t result = a2 - a1;
  if (v8)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x24E3052A8);
  }
  return result;
}

uint64_t sub_24E3052C8(uint64_t a1, unint64_t a2)
{
  v10[5] = *MEMORY[0x263EF8340];
  v10[3] = MEMORY[0x263F06F78];
  v10[4] = MEMORY[0x263F06F68];
  v10[0] = a1;
  v10[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v10, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5) {
        __break(1u);
      }
      sub_24E301950(a1, a2);
      sub_24E301950(v5, v6);
      sub_24E3050CC((int)v5, v5 >> 32);
      sub_24E3013A8(v5, v6);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v8 = *(void *)(v5 + 24);
      sub_24E301950(a1, a2);
      swift_retain();
      swift_retain();
      sub_24E3050CC(v7, v8);
      swift_release();
      swift_release();
      break;
    default:
      sub_24E301950(a1, a2);
      sub_24E317FA0();
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

unint64_t sub_24E3054EC()
{
  unint64_t result = qword_2698D1EF8;
  if (!qword_2698D1EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1EF8);
  }
  return result;
}

unint64_t sub_24E305540()
{
  unint64_t result = qword_2698D1F10;
  if (!qword_2698D1F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F10);
  }
  return result;
}

unint64_t sub_24E305594()
{
  unint64_t result = qword_2698D1F18;
  if (!qword_2698D1F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F18);
  }
  return result;
}

unint64_t sub_24E3055E8()
{
  unint64_t result = qword_2698D1F38;
  if (!qword_2698D1F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F38);
  }
  return result;
}

unint64_t sub_24E30563C(uint64_t a1)
{
  unint64_t result = sub_24E305664();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E305664()
{
  unint64_t result = qword_2698D1F48;
  if (!qword_2698D1F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F48);
  }
  return result;
}

uint64_t sub_24E3056B8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24E305930(a1, a2, a3, (uint64_t (*)(void))sub_24E30570C, (uint64_t (*)(void))sub_24E305760, (uint64_t (*)(void))sub_24E3057B4, (uint64_t (*)(void))sub_24E3054EC);
}

unint64_t sub_24E30570C()
{
  unint64_t result = qword_2698D1F50;
  if (!qword_2698D1F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F50);
  }
  return result;
}

unint64_t sub_24E305760()
{
  unint64_t result = qword_2698D1F58;
  if (!qword_2698D1F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F58);
  }
  return result;
}

unint64_t sub_24E3057B4()
{
  unint64_t result = qword_2698D1F60;
  if (!qword_2698D1F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F60);
  }
  return result;
}

unint64_t sub_24E30580C()
{
  unint64_t result = qword_2698D1F68;
  if (!qword_2698D1F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F68);
  }
  return result;
}

unint64_t sub_24E305860(uint64_t a1)
{
  unint64_t result = sub_24E305888();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E305888()
{
  unint64_t result = qword_2698D1F70;
  if (!qword_2698D1F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F70);
  }
  return result;
}

uint64_t sub_24E3058DC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24E305930(a1, a2, a3, (uint64_t (*)(void))sub_24E305994, (uint64_t (*)(void))sub_24E3059E8, (uint64_t (*)(void))sub_24E305A3C, (uint64_t (*)(void))sub_24E305A90);
}

uint64_t sub_24E305930(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  a1[3] = a6();
  uint64_t result = a7();
  a1[4] = result;
  return result;
}

unint64_t sub_24E305994()
{
  unint64_t result = qword_2698D1F78;
  if (!qword_2698D1F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F78);
  }
  return result;
}

unint64_t sub_24E3059E8()
{
  unint64_t result = qword_2698D1F80;
  if (!qword_2698D1F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F80);
  }
  return result;
}

unint64_t sub_24E305A3C()
{
  unint64_t result = qword_2698D1F88;
  if (!qword_2698D1F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F88);
  }
  return result;
}

unint64_t sub_24E305A90()
{
  unint64_t result = qword_2698D1F90;
  if (!qword_2698D1F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F90);
  }
  return result;
}

unint64_t sub_24E305AE8()
{
  unint64_t result = qword_2698D1F98;
  if (!qword_2698D1F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1F98);
  }
  return result;
}

uint64_t *assignWithTake for KeyRepresentableInternal(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_24E3013A8(v3, v4);
  return a1;
}

ValueMetadata *type metadata accessor for Advertisement()
{
  return &type metadata for Advertisement;
}

uint64_t *assignWithCopy for KeyRepresentableInternal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_24E301950(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_24E3013A8(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for HashedAdvertisement()
{
  return &type metadata for HashedAdvertisement;
}

uint64_t sub_24E305BF4()
{
  return 0;
}

ValueMetadata *type metadata accessor for HashedAdvertisement.CodingKeys()
{
  return &type metadata for HashedAdvertisement.CodingKeys;
}

uint64_t getEnumTagSinglePayload for KeyRepresentableInternal.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s12FindMyCrypto19HashedAdvertisementV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E305CFCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Advertisement.CodingKeys()
{
  return &type metadata for Advertisement.CodingKeys;
}

unint64_t sub_24E305D38()
{
  unint64_t result = qword_2698D1FA0;
  if (!qword_2698D1FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FA0);
  }
  return result;
}

unint64_t sub_24E305D90()
{
  unint64_t result = qword_2698D1FA8;
  if (!qword_2698D1FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FA8);
  }
  return result;
}

unint64_t sub_24E305DE8()
{
  unint64_t result = qword_2698D1FB0;
  if (!qword_2698D1FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FB0);
  }
  return result;
}

unint64_t sub_24E305E40()
{
  unint64_t result = qword_2698D1FB8;
  if (!qword_2698D1FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FB8);
  }
  return result;
}

unint64_t sub_24E305E98()
{
  unint64_t result = qword_2698D1FC0;
  if (!qword_2698D1FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FC0);
  }
  return result;
}

unint64_t sub_24E305EF0()
{
  unint64_t result = qword_2698D1FC8;
  if (!qword_2698D1FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FC8);
  }
  return result;
}

uint64_t KeyRepresenting.init(rawValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *(void *)(a4 + 8);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 48);
  sub_24E301950(a1, a2);
  uint64_t v12 = v11(a3, v10);
  sub_24E306468(a1, a2, v12, &v18);
  uint64_t v13 = v18;
  unint64_t v14 = v19;
  uint64_t v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 24);
  sub_24E301950(v18, v19);
  v15(&v18, a3, a4);
  sub_24E3013A8(a1, a2);
  sub_24E3013A8(v13, v14);
  uint64_t v16 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56);

  return v16(a5, 0, 1, a3);
}

uint64_t KeyRepresenting.rawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 40))();
}

uint64_t KeyRepresentableError.description.getter()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v1 = *(void *)(v0 + 8);
  if (!*(unsigned char *)(v0 + 16))
  {
    sub_24E318300();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000019;
    sub_24E3183D0();
    sub_24E318240();
    swift_bridgeObjectRelease();
    sub_24E318240();
    sub_24E3183D0();
    sub_24E318240();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_24E301950(v2, v1);
    sub_24E318300();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000018;
    sub_24E301DA8();
    sub_24E317EB0();
    sub_24E318240();
    swift_bridgeObjectRelease();
    sub_24E318240();
    sub_24E3065A4(v2, v1, 1);
    return v4;
  }
  if (v2 | v1) {
    return 0x64696C61766E692ELL;
  }
  else {
    return 0x7479426F72657A2ELL;
  }
}

uint64_t static KeyRepresenting.random()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 48))();
  uint64_t v5 = MEMORY[0x253338C70](v4);
  return KeyRepresentable<>.init(data:)(v5, v6, a1, a2);
}

uint64_t KeyRepresentable<>.init(data:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a4 + 8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 48);
  sub_24E301950(a1, a2);
  uint64_t v11 = v10(a3, v9);
  sub_24E306468(a1, a2, v11, &v18);
  if (v4)
  {
    uint64_t v12 = a1;
    unint64_t v13 = a2;
  }
  else
  {
    uint64_t v15 = v18;
    unint64_t v14 = v19;
    int64_t v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 24);
    sub_24E301950(v18, v19);
    v17(&v18, a3, a4);
    sub_24E3013A8(a1, a2);
    uint64_t v12 = v15;
    unint64_t v13 = v14;
  }
  return sub_24E3013A8(v12, v13);
}

uint64_t sub_24E306468@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  unint64_t v4 = a2 >> 62;
  uint64_t v7 = result;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      if (v8 == a3)
      {
LABEL_13:
        *a4 = result;
        a4[1] = a2;
        return result;
      }
      if (!v4)
      {
        uint64_t v12 = BYTE6(a2);
        goto LABEL_16;
      }
      if (v4 != 1)
      {
        uint64_t v14 = *(void *)(result + 16);
        uint64_t v13 = *(void *)(result + 24);
        uint64_t v12 = v13 - v14;
        if (!__OFSUB__(v13, v14)) {
          goto LABEL_16;
        }
LABEL_20:
        __break(1u);
        JUMPOUT(0x24E306594);
      }
      if (__OFSUB__(HIDWORD(result), result))
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v12 = HIDWORD(result) - (int)result;
LABEL_16:
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v15 = a3;
      *(void *)(v15 + 8) = v12;
      *(unsigned char *)(v15 + 16) = 0;
      swift_willThrow();
      return sub_24E3013A8(v7, a2);
    case 2uLL:
      uint64_t v10 = *(void *)(result + 16);
      uint64_t v9 = *(void *)(result + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      if (!a3) {
        goto LABEL_13;
      }
      uint64_t v12 = 0;
      goto LABEL_16;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E3065A4(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 == 1) {
    return sub_24E3013A8(a1, a2);
  }
  return a1;
}

uint64_t KeyRepresentableInternal.hash(into:)()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  sub_24E301950(v2, v1);
  sub_24E317FD0();

  return sub_24E3013A8(v2, v1);
}

uint64_t static KeyRepresentableInternal.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_24E306DC0(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

uint64_t sub_24E30662C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24E3183E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24E3066B4(uint64_t a1)
{
  unint64_t v2 = sub_24E300BD0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E3066F0(uint64_t a1)
{
  unint64_t v2 = sub_24E300BD0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t KeyRepresentableInternal.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1FD0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E300BD0();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E3010C8();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t KeyRepresentableInternal.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24E318440();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t sub_24E3068DC(void *a1)
{
  return KeyRepresentableInternal.encode(to:)(a1);
}

uint64_t sub_24E3068F4(uint64_t a1, uint64_t a2)
{
  return sub_24E306DC0(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

uint64_t SecurityKeyRepresentable.init(rawValue:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(void))(a2 + 16))();
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);

  return v5(a3, 0, 1, a1);
}

id LocationDecryptionKey.rawValue.getter()
{
  return *v0;
}

uint64_t LocationDecryptionKey.init(secKey:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_24E30699C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *sub_24E3069A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_24E3069B0@<X0>(void **a1@<X8>)
{
  unint64_t v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_24E3069BC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_24E301950(a2, a3);
      uint64_t v10 = (char *)sub_24E317F00();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_24E317F30();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_24E317F20();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x24E306C20);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_24E3013A8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      int64_t v17 = (char *)sub_24E317F00();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_24E317F30();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_24E317F20();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_24E306C30(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_24E3069BC((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_24E306D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_24E317F00();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_24E317F30();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_24E317F20();
  sub_24E3069BC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_24E306DC0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x24E307028);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_24E301950(a3, a4);
                  sub_24E301950(a1, a2);
                  char v17 = sub_24E306D08((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_24E3013A8(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_24E301950(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_24E306D08(v21, v22, v20, a3, a4);
                  sub_24E3013A8(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_24E301950(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_24E301950(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_24E306C30(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_24E3013A8(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_24E30705C()
{
  unint64_t result = qword_2698D1FF8;
  if (!qword_2698D1FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D1FF8);
  }
  return result;
}

unint64_t sub_24E3070B0(uint64_t a1)
{
  unint64_t result = sub_24E3070D8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E3070D8()
{
  unint64_t result = qword_2698D2000;
  if (!qword_2698D2000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2000);
  }
  return result;
}

uint64_t sub_24E307130(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 == 1) {
    return sub_24E301950(a1, a2);
  }
  return a1;
}

uint64_t destroy for KeyRepresentableError(uint64_t a1)
{
  return sub_24E3065A4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s12FindMyCrypto21KeyRepresentableErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24E307130(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for KeyRepresentableError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24E307130(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24E3065A4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for KeyRepresentableError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24E3065A4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyRepresentableError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for KeyRepresentableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E3072E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24E3072F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeyRepresentableError()
{
  return &type metadata for KeyRepresentableError;
}

uint64_t dispatch thunk of KeyRepresentable.data.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static KeyRepresentable.length.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of KeyRepresenting.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KeyRepresenting.init(key:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for KeyRepresentableInternal()
{
  return &type metadata for KeyRepresentableInternal;
}

uint64_t dispatch thunk of SecurityKeyRepresentable.init(secKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *type metadata accessor for LocationDecryptionKey()
{
  return &type metadata for LocationDecryptionKey;
}

unsigned char *storeEnumTagSinglePayload for KeyRepresentableInternal.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E307440);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E30746C()
{
  unint64_t result = qword_2698D2008;
  if (!qword_2698D2008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2008);
  }
  return result;
}

unint64_t sub_24E3074C0()
{
  unint64_t result = qword_2698D2020;
  if (!qword_2698D2020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2020);
  }
  return result;
}

uint64_t KeyGenerationHint.index.getter()
{
  return *(void *)v0;
}

uint64_t KeyGenerationHint.sharedSecret.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  unint64_t v3 = *(void *)(v1 + 16);
  *a1 = v2;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t KeyGenerationHint.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  sub_24E318470();
  sub_24E301950(v1, v2);
  sub_24E317FD0();

  return sub_24E3013A8(v1, v2);
}

uint64_t static KeyGenerationHint.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v3 = a2[1];
  unint64_t v2 = a2[2];
  uint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  sub_24E301950(v5, v4);
  sub_24E301950(v3, v2);
  char v6 = sub_24E306DC0(v5, v4, v3, v2);
  sub_24E3013A8(v3, v2);
  sub_24E3013A8(v5, v4);
  return v6 & 1;
}

BOOL sub_24E30762C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24E307644()
{
  return sub_24E318480();
}

uint64_t sub_24E30768C()
{
  return sub_24E318450();
}

uint64_t sub_24E3076B8()
{
  return sub_24E318480();
}

uint64_t sub_24E3076FC()
{
  if (*v0) {
    return 0x6553646572616873;
  }
  else {
    return 0x7865646E69;
  }
}

uint64_t sub_24E30773C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E30838C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24E307764(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24E307770(uint64_t a1)
{
  unint64_t v2 = sub_24E307DD4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E3077AC(uint64_t a1)
{
  unint64_t v2 = sub_24E307DD4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t KeyGenerationHint.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2028);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E307DD4();
  sub_24E3184A0();
  LOBYTE(v12) = 0;
  sub_24E3183C0();
  if (!v2)
  {
    uint64_t v12 = v11;
    uint64_t v13 = v10;
    char v14 = 1;
    sub_24E307E28();
    sub_24E3183B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t KeyGenerationHint.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  sub_24E318440();
  sub_24E318470();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t KeyGenerationHint.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2040);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E307DD4();
  sub_24E318490();
  if (!v2)
  {
    LOBYTE(v12) = 0;
    uint64_t v9 = sub_24E318390();
    char v13 = 1;
    sub_24E307E7C();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v10 = v12;
    *(void *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E307BAC()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  sub_24E318440();
  sub_24E318470();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t sub_24E307C28()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  sub_24E318470();
  sub_24E301950(v1, v2);
  sub_24E317FD0();

  return sub_24E3013A8(v1, v2);
}

uint64_t sub_24E307C94()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  sub_24E318440();
  sub_24E318470();
  sub_24E301950(v1, v2);
  sub_24E317FD0();
  sub_24E3013A8(v1, v2);
  return sub_24E318480();
}

uint64_t sub_24E307D0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return KeyGenerationHint.init(from:)(a1, a2);
}

uint64_t sub_24E307D24(void *a1)
{
  return KeyGenerationHint.encode(to:)(a1);
}

uint64_t sub_24E307D3C(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v3 = a2[1];
  unint64_t v2 = a2[2];
  uint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  sub_24E301950(v5, v4);
  sub_24E301950(v3, v2);
  char v6 = sub_24E306DC0(v5, v4, v3, v2);
  sub_24E3013A8(v3, v2);
  sub_24E3013A8(v5, v4);
  return v6 & 1;
}

unint64_t sub_24E307DD4()
{
  unint64_t result = qword_2698D2030;
  if (!qword_2698D2030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2030);
  }
  return result;
}

unint64_t sub_24E307E28()
{
  unint64_t result = qword_2698D2038;
  if (!qword_2698D2038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2038);
  }
  return result;
}

unint64_t sub_24E307E7C()
{
  unint64_t result = qword_2698D2048;
  if (!qword_2698D2048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2048);
  }
  return result;
}

unint64_t sub_24E307ED4()
{
  unint64_t result = qword_2698D2050;
  if (!qword_2698D2050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2050);
  }
  return result;
}

uint64_t destroy for KeyGenerationHint(uint64_t a1)
{
  return sub_24E3013A8(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

void *_s12FindMyCrypto17KeyGenerationHintVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  unint64_t v4 = a2[2];
  sub_24E301950(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for KeyGenerationHint(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = a2[2];
  sub_24E301950(v3, v4);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_24E3013A8(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for KeyGenerationHint(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  sub_24E3013A8(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyGenerationHint(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for KeyGenerationHint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyGenerationHint()
{
  return &type metadata for KeyGenerationHint;
}

uint64_t getEnumTagSinglePayload for KeyGenerationHint.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for KeyGenerationHint.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E308238);
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

uint64_t sub_24E308260(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E308268(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KeyGenerationHint.CodingKeys()
{
  return &type metadata for KeyGenerationHint.CodingKeys;
}

unint64_t sub_24E308288()
{
  unint64_t result = qword_2698D2058;
  if (!qword_2698D2058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2058);
  }
  return result;
}

unint64_t sub_24E3082E0()
{
  unint64_t result = qword_2698D2060;
  if (!qword_2698D2060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2060);
  }
  return result;
}

unint64_t sub_24E308338()
{
  unint64_t result = qword_2698D2068;
  if (!qword_2698D2068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2068);
  }
  return result;
}

uint64_t sub_24E30838C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_24E3183E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6553646572616873 && a2 == 0xEC00000074657263)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E3183E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t static IntermediateKey.length.getter()
{
  return 32;
}

uint64_t IntermediateKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t IntermediateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 IntermediateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E3084E4(uint64_t a1)
{
  unint64_t v2 = sub_24E3086A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E308520(uint64_t a1)
{
  unint64_t v2 = sub_24E3086A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntermediateKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2070);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  char v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3086A8();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24E3086A8()
{
  unint64_t result = qword_2698D2078;
  if (!qword_2698D2078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2078);
  }
  return result;
}

uint64_t IntermediateKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2080);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3086A8();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E308868(uint64_t a1)
{
  unint64_t result = sub_24E308890();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E308890()
{
  unint64_t result = qword_2698D2088;
  if (!qword_2698D2088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2088);
  }
  return result;
}

unint64_t sub_24E3088E4(void *a1)
{
  a1[1] = sub_24E308924();
  a1[2] = sub_24E308978();
  a1[3] = sub_24E3089CC();
  unint64_t result = sub_24E308A20();
  a1[4] = result;
  return result;
}

unint64_t sub_24E308924()
{
  unint64_t result = qword_2698D2090;
  if (!qword_2698D2090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2090);
  }
  return result;
}

unint64_t sub_24E308978()
{
  unint64_t result = qword_2698D2098;
  if (!qword_2698D2098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2098);
  }
  return result;
}

unint64_t sub_24E3089CC()
{
  unint64_t result = qword_2698D20A0;
  if (!qword_2698D20A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20A0);
  }
  return result;
}

unint64_t sub_24E308A20()
{
  unint64_t result = qword_2698D20A8;
  if (!qword_2698D20A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20A8);
  }
  return result;
}

uint64_t sub_24E308A74@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IntermediateKey.init(from:)(a1, a2);
}

uint64_t sub_24E308A8C(void *a1)
{
  return IntermediateKey.encode(to:)(a1);
}

unint64_t sub_24E308AA8()
{
  unint64_t result = qword_2698D20B0;
  if (!qword_2698D20B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntermediateKey()
{
  return &type metadata for IntermediateKey;
}

unsigned char *storeEnumTagSinglePayload for IntermediateKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E308BA8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntermediateKey.CodingKeys()
{
  return &type metadata for IntermediateKey.CodingKeys;
}

unint64_t sub_24E308BE4()
{
  unint64_t result = qword_2698D20B8;
  if (!qword_2698D20B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20B8);
  }
  return result;
}

unint64_t sub_24E308C3C()
{
  unint64_t result = qword_2698D20C0;
  if (!qword_2698D20C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20C0);
  }
  return result;
}

unint64_t sub_24E308C94()
{
  unint64_t result = qword_2698D20C8;
  if (!qword_2698D20C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20C8);
  }
  return result;
}

uint64_t sub_24E308CE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  return sub_24E308D14(a1, a2, a3, a4, a5, (void (*)(_OWORD *__return_ptr, long long *, uint64_t, uint64_t))sub_24E303568, a6);
}

uint64_t sub_24E308D14@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(_OWORD *__return_ptr, long long *, uint64_t, uint64_t)@<X5>, _OWORD *a7@<X8>)
{
  void (*v58)(_OWORD *__return_ptr, long long *, uint64_t, uint64_t);
  long long v59;
  uint64_t v60;
  unint64_t v61;
  long long v62;
  _OWORD v63[4];
  unint64_t v64;

  uint64_t v13 = *a1;
  unint64_t v12 = a1[1];
  uint64_t v14 = *a2;
  unint64_t v15 = a2[1];
  v59 = *a3;
  uint64_t result = sub_24E309468((uint64_t *)&v59, 1, (uint64_t *)v63);
  if (!v7)
  {
    uint64_t v56 = a4;
    uint64_t v57 = a5;
    long long v58 = a6;
    long long v55 = a7;
    v64 = v12;
    long long v17 = v63[0];
    uint64_t v18 = sub_24E318230();
    unint64_t v20 = v19;
    sub_24E301950(v17, *((unint64_t *)&v17 + 1));
    uint64_t v21 = sub_24E309C08(v17, *((unint64_t *)&v17 + 1), v18, v20, 72);
    unint64_t v23 = v22;
    sub_24E3013A8(v17, *((unint64_t *)&v17 + 1));
    sub_24E30C1B4(v21, v23, (uint64_t *)v63);
    sub_24E3013A8(v18, v20);
    long long v24 = v63[0];
    unint64_t v25 = v64;
    if (v64 >> 60 == 15)
    {
      sub_24E301950(*(uint64_t *)&v63[0], *((unint64_t *)&v63[0] + 1));
      sub_24E301950(v14, v15);
      uint64_t v26 = sub_24E30A29C(v14, v15);
      long long v53 = sub_24E30AA74(v26, 0, v24, *((unint64_t *)&v24 + 1));
      MEMORY[0x253339220](v26);
      sub_24E3013A8(v14, v15);
      sub_24E3013A8(v24, *((unint64_t *)&v24 + 1));
      uint64_t v28 = sub_24E309A04((uint64_t)v53, 0);
      uint64_t v30 = v28;
      unint64_t v31 = v29;
      sub_24E301950(v28, v29);
      if (qword_2698D1E90 != -1) {
        swift_once();
      }
      if (sub_24E306DC0(v30, v31, qword_2698D2180, *(unint64_t *)algn_2698D2188))
      {
        sub_24E3074C0();
        swift_allocError();
        *(void *)uint64_t v32 = 0;
        *(void *)(v32 + 8) = 0;
        *(unsigned char *)(v32 + 16) = 2;
        swift_willThrow();
        sub_24E3013A8(v30, v31);
        sub_24E3013A8(v24, *((unint64_t *)&v24 + 1));
        uint64_t v41 = v30;
        unint64_t v42 = v31;
LABEL_3:
        sub_24E3013A8(v41, v42);
        return sub_24E3013A8(v17, *((unint64_t *)&v17 + 1));
      }
      long long v38 = sub_24E30A08C(v30, v31);
      sub_24E3013A8((uint64_t)v38, v40);
      sub_24E306468(v30, v31, 57, (uint64_t *)v63);
      unint64_t v49 = *((void *)&v63[0] + 1);
      uint64_t v50 = *(void *)&v63[0];
      MEMORY[0x253339220](v53);
      sub_24E3013A8(v30, v31);
      uint64_t v44 = v13;
    }
    else
    {
      sub_24E302F0C(v13, v64);
      sub_24E301950(v24, *((unint64_t *)&v24 + 1));
      uint64_t v27 = sub_24E30A29C(v13, v25);
      uint64_t v33 = sub_24E30AA74(v27, 1, v24, *((unint64_t *)&v24 + 1));
      MEMORY[0x253339220](v27);
      sub_24E3013A8(v24, *((unint64_t *)&v24 + 1));
      uint64_t v34 = sub_24E309A04((uint64_t)v33, 1);
      unint64_t v36 = v35;
      uint64_t v37 = sub_24E309A04((uint64_t)v33, 0);
      unint64_t v52 = v39;
      uint64_t v54 = v37;
      sub_24E301950(v34, v36);
      PrivateKey.init(data:)(v34, v36, (uint64_t *)v63);
      long long v51 = v63[0];
      sub_24E301950(v54, v52);
      if (qword_2698D1E90 != -1) {
        swift_once();
      }
      if (sub_24E306DC0(v54, v52, qword_2698D2180, *(unint64_t *)algn_2698D2188))
      {
        sub_24E3074C0();
        swift_allocError();
        *(void *)uint64_t v43 = 0;
        *(void *)(v43 + 8) = 0;
        *(unsigned char *)(v43 + 16) = 2;
        swift_willThrow();
        sub_24E3013A8(v54, v52);
        sub_24E3013A8(v51, *((unint64_t *)&v51 + 1));
        sub_24E30407C(v13, v25);
        sub_24E3013A8(v24, *((unint64_t *)&v24 + 1));
        sub_24E3013A8(v34, v36);
        uint64_t v41 = v54;
        unint64_t v42 = v52;
        goto LABEL_3;
      }
      unint64_t v45 = sub_24E30A08C(v54, v52);
      sub_24E3013A8((uint64_t)v45, v48);
      sub_24E306468(v54, v52, 57, (uint64_t *)v63);
      unint64_t v49 = *((void *)&v63[0] + 1);
      uint64_t v50 = *(void *)&v63[0];
      MEMORY[0x253339220](v33);
      sub_24E3013A8(v54, v52);
      sub_24E3013A8(v34, v36);
      sub_24E30407C(v13, v64);
      unint64_t v25 = *((void *)&v51 + 1);
      uint64_t v44 = v51;
    }
    *(void *)&v59 = v44;
    *((void *)&v59 + 1) = v25;
    v60 = v50;
    v61 = v49;
    v62 = v17;
    sub_24E301950(v17, *((unint64_t *)&v17 + 1));
    sub_24E302F0C(v50, v49);
    v58(v63, &v59, v56, v57);
    sub_24E3013A8(v24, *((unint64_t *)&v24 + 1));
    sub_24E30407C(v50, v49);
    sub_24E3013A8(v17, *((unint64_t *)&v17 + 1));
    sub_24E30407C(v44, v25);
    sub_24E3013A8(v50, v49);
    uint64_t result = sub_24E3013A8(v17, *((unint64_t *)&v17 + 1));
    long long v46 = v63[1];
    long long v47 = v63[2];
    *long long v55 = v63[0];
    v55[1] = v46;
    v55[2] = v47;
  }
  return result;
}

uint64_t sub_24E309468@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  sub_24E301950(*a1, v6);
  uint64_t v7 = sub_24E318230();
  unint64_t v9 = v8;
  if (!a2)
  {
    uint64_t v13 = v5;
    unint64_t v14 = v6;
LABEL_12:
    uint64_t result = sub_24E3013A8(v7, v9);
    *a3 = v13;
    a3[1] = v14;
    return result;
  }
  while (2)
  {
    long long v10 = (void *)MEMORY[0x253339280]();
    sub_24E301950(v5, v6);
    uint64_t v11 = sub_24E309C08(v5, v6, v7, v9, 32);
    if (v3)
    {
      uint64_t v21 = v5;
      unint64_t v22 = v6;
      goto LABEL_22;
    }
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    sub_24E3013A8(v5, v6);
    unint64_t v15 = v14 >> 62;
    switch(v14 >> 62)
    {
      case 1uLL:
        LODWORD(v16) = HIDWORD(v13) - v13;
        if (__OFSUB__(HIDWORD(v13), v13))
        {
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        uint64_t v16 = (int)v16;
LABEL_8:
        if (v16 == 32)
        {
          sub_24E3013A8(v5, v6);
          uint64_t v5 = v13;
          unint64_t v6 = v14;
          if (!--a2) {
            goto LABEL_12;
          }
          continue;
        }
        if (v15)
        {
          if (v15 == 1)
          {
            if (!__OFSUB__(HIDWORD(v13), v13))
            {
              uint64_t v23 = HIDWORD(v13) - (int)v13;
              goto LABEL_21;
            }
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            JUMPOUT(0x24E309688);
          }
          uint64_t v25 = *(void *)(v13 + 16);
          uint64_t v24 = *(void *)(v13 + 24);
          uint64_t v23 = v24 - v25;
          if (__OFSUB__(v24, v25)) {
            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v23 = BYTE6(v14);
        }
LABEL_21:
        sub_24E3074C0();
        swift_allocError();
        *(void *)uint64_t v26 = 32;
        *(void *)(v26 + 8) = v23;
        *(unsigned char *)(v26 + 16) = 0;
        swift_willThrow();
        uint64_t v21 = v13;
        unint64_t v22 = v14;
LABEL_22:
        sub_24E3013A8(v21, v22);
        sub_24E3013A8(v7, v9);
        return sub_24E3013A8(v5, v6);
      case 2uLL:
        uint64_t v18 = *(void *)(v13 + 16);
        uint64_t v17 = *(void *)(v13 + 24);
        BOOL v19 = __OFSUB__(v17, v18);
        uint64_t v16 = v17 - v18;
        if (!v19) {
          goto LABEL_8;
        }
        goto LABEL_24;
      case 3uLL:
        uint64_t v23 = 0;
        goto LABEL_21;
      default:
        uint64_t v16 = BYTE6(v14);
        goto LABEL_8;
    }
  }
}

uint64_t sub_24E309698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E30BFE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E3096C0(uint64_t a1)
{
  unint64_t v2 = sub_24E301074();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E3096FC(uint64_t a1)
{
  unint64_t v2 = sub_24E301074();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E309748()
{
  int Pair = CCECCryptorGeneratePair();
  if (Pair)
  {
    char v1 = Pair;
    Swift::Int v2 = Pair;
    if (qword_2698D1E88 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24E3180A0();
    __swift_project_value_buffer(v3, (uint64_t)qword_2698D2588);
    unsigned int v4 = sub_24E318080();
    os_log_type_t v5 = sub_24E3182C0();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v6 = 67109120;
      char v14 = v1;
      sub_24E3182E0();
      _os_log_impl(&dword_24E2FF000, v4, v5, "CCECCryptorGeneratePair failed. Status: %d", v6, 8u);
      MEMORY[0x253339480](v6, -1, -1);
    }

    CryptoError.init(rawValue:)(v2);
    sub_24E30B1E0();
    swift_allocError();
    if (v14 == 14) {
      char v8 = 9;
    }
    else {
      char v8 = v14;
    }
  }
  else
  {
    if (qword_2698D1E88 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24E3180A0();
    __swift_project_value_buffer(v10, (uint64_t)qword_2698D2588);
    uint64_t v11 = sub_24E318080();
    os_log_type_t v12 = sub_24E3182C0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_24E2FF000, v11, v12, "Private key is not available.", v13, 2u);
      MEMORY[0x253339480](v13, -1, -1);
    }

    sub_24E30B1E0();
    swift_allocError();
    char v8 = 12;
  }
  *uint64_t v7 = v8;
  return swift_willThrow();
}

uint64_t sub_24E309A04(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2 == 1) {
    uint64_t v3 = 85;
  }
  else {
    uint64_t v3 = 57;
  }
  uint64_t v14 = v3;
  uint64_t v16 = sub_24E30B7B4(v3);
  unint64_t v17 = v4;
  int v5 = sub_24E30B48C(&v16);
  if (v2) {
    return sub_24E3013A8(v16, v17);
  }
  int v6 = v5;
  if (v5)
  {
    if (qword_2698D1E88 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24E3180A0();
    __swift_project_value_buffer(v7, (uint64_t)qword_2698D2588);
    char v8 = sub_24E318080();
    os_log_type_t v9 = sub_24E3182C0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67109120;
      LODWORD(v15) = v6;
      sub_24E3182E0();
      _os_log_impl(&dword_24E2FF000, v8, v9, "Error running CCECCryptorExportKey. Code: %d", v10, 8u);
      MEMORY[0x253339480](v10, -1, -1);
    }

    CryptoError.init(rawValue:)(v6);
    sub_24E30B1E0();
    swift_allocError();
    if (v15 == 14) {
      char v12 = 9;
    }
    else {
      char v12 = v15;
    }
    *uint64_t v11 = v12;
    swift_willThrow();
    return sub_24E3013A8(v16, v17);
  }
  sub_24E304870(v14, v16, v17, &v15);
  return v15;
}

uint64_t sub_24E309C08(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int v6 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v25 = sub_24E30B7B4(a5);
  unint64_t v26 = v11;
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
        goto LABEL_25;
      }
      sub_24E301950(a1, a2);
      sub_24E301950(a3, a4);
      int v6 = sub_24E30BF04((int)a3, a3 >> 32, a4 & 0x3FFFFFFFFFFFFFFFLL, a3, a4, a1, a2, &v25);
      sub_24E3013A8(a3, a4);
      sub_24E3013A8(a1, a2);
      if (v5) {
        return sub_24E3013A8(v25, v26);
      }
      goto LABEL_12;
    case 2uLL:
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v13 = *(void *)(a3 + 24);
      sub_24E301950(a1, a2);
      sub_24E301950(a3, a4);
      swift_retain();
      swift_retain();
      int v14 = sub_24E30BF04(v12, v13, a4 & 0x3FFFFFFFFFFFFFFFLL, a3, a4, a1, a2, &v25);
      if (v5)
      {
        swift_release();
        swift_release();
LABEL_10:
        sub_24E3013A8(a3, a4);
        sub_24E3013A8(a1, a2);
        return sub_24E3013A8(v25, v26);
      }
      int v6 = v14;
      swift_release();
      swift_release();
      sub_24E3013A8(a3, a4);
      sub_24E3013A8(a1, a2);
LABEL_12:
      if (v6)
      {
LABEL_13:
        a2 = v6;
        if (qword_2698D1E88 != -1) {
LABEL_25:
        }
          swift_once();
        uint64_t v15 = sub_24E3180A0();
        __swift_project_value_buffer(v15, (uint64_t)qword_2698D2588);
        uint64_t v16 = sub_24E318080();
        os_log_type_t v17 = sub_24E3182C0();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v18 = 67109120;
          LODWORD(v24[0]) = v6;
          sub_24E3182E0();
          _os_log_impl(&dword_24E2FF000, v16, v17, "Error running CCDeriveKey. Code: %d.", v18, 8u);
          MEMORY[0x253339480](v18, -1, -1);
        }

        CryptoError.init(rawValue:)(a2);
        int v19 = LOBYTE(v24[0]);
        sub_24E30B1E0();
        swift_allocError();
        if (v19 == 14) {
          char v21 = 9;
        }
        else {
          char v21 = v19;
        }
        char *v20 = v21;
        swift_willThrow();
        return sub_24E3013A8(v25, v26);
      }
      return v25;
    case 3uLL:
      memset(v24, 0, 14);
      sub_24E301950(a1, a2);
      sub_24E30A78C((uint64_t)v24, a3, a4, a1, a2, &v25, &v23);
      if (v5) {
        goto LABEL_10;
      }
      sub_24E3013A8(a3, a4);
      sub_24E3013A8(a1, a2);
LABEL_22:
      int v6 = v23;
      if (!v23) {
        return v25;
      }
      goto LABEL_13;
    default:
      v24[0] = a3;
      LOWORD(v24[1]) = a4;
      BYTE2(v24[1]) = BYTE2(a4);
      BYTE3(v24[1]) = BYTE3(a4);
      BYTE4(v24[1]) = BYTE4(a4);
      BYTE5(v24[1]) = BYTE5(a4);
      sub_24E301950(a1, a2);
      sub_24E30A78C((uint64_t)v24, a3, a4, a1, a2, &v25, &v23);
      sub_24E3013A8(a3, a4);
      sub_24E3013A8(a1, a2);
      if (!v5) {
        goto LABEL_22;
      }
      return sub_24E3013A8(v25, v26);
  }
}

uint8_t *sub_24E30A08C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24E30A29C(a1, a2);
  if (v2)
  {
    if (qword_2698D1E88 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24E3180A0();
    __swift_project_value_buffer(v6, (uint64_t)qword_2698D2588);
    id v7 = v2;
    char v8 = sub_24E318080();
    os_log_type_t v9 = sub_24E3182C0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 138543362;
      uint64_t v13 = sub_24E317F50();
      sub_24E3182E0();
      *uint64_t v10 = v13;
      MEMORY[0x2533393A0](v2);
      _os_log_impl(&dword_24E2FF000, v8, v9, "Error deriving advertisementKey: %{public}@", v3, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698D1EC8);
      swift_arrayDestroy();
      MEMORY[0x253339480](v10, -1, -1);
      MEMORY[0x253339480](v3, -1, -1);
    }
    else
    {
      MEMORY[0x2533393A0](v2);
    }

    sub_24E30C108();
    swift_allocError();
    *unint64_t v11 = 0;
    swift_willThrow();
    MEMORY[0x2533393A0](v2);
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v3 = (uint8_t *)sub_24E309A04(v4, 0);
    MEMORY[0x253339220](v5);
  }
  return v3;
}

uint64_t sub_24E30A29C(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 > a1 >> 32)
      {
        __break(1u);
        goto LABEL_30;
      }
      sub_24E301950(a1, a2);
      if (sub_24E317F00())
      {
        if (__OFSUB__((int)a1, sub_24E317F30())) {
          goto LABEL_31;
        }
        sub_24E317F20();
        if (__OFSUB__(HIDWORD(a1), a1)) {
          goto LABEL_32;
        }
        int v4 = CCECCryptorImportKey();
        sub_24E3013A8(a1, a2);
        if (v4) {
          goto LABEL_19;
        }
        goto LABEL_13;
      }
      sub_24E317F20();
      sub_24E30B1E0();
      swift_allocError();
      *uint64_t v18 = 3;
      swift_willThrow();
      return sub_24E3013A8(a1, a2);
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      swift_retain();
      swift_retain();
      if (!sub_24E317F00())
      {
        sub_24E317F20();
        sub_24E30B1E0();
        swift_allocError();
        *os_log_type_t v17 = 3;
        swift_willThrow();
        swift_release();
        return swift_release();
      }
      if (__OFSUB__(v5, sub_24E317F30()))
      {
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_24E317F20();
      if (__OFSUB__(*(void *)(a1 + 24), *(void *)(a1 + 16)))
      {
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      int v4 = CCECCryptorImportKey();
      swift_release();
      swift_release();
      if (v4) {
        goto LABEL_19;
      }
LABEL_13:
      if (qword_2698D1E88 != -1) {
LABEL_34:
      }
        swift_once();
      uint64_t v6 = sub_24E3180A0();
      __swift_project_value_buffer(v6, (uint64_t)qword_2698D2588);
      id v7 = sub_24E318080();
      os_log_type_t v8 = sub_24E3182C0();
      if (os_log_type_enabled(v7, v8))
      {
        os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v9 = 0;
        _os_log_impl(&dword_24E2FF000, v7, v8, "CryptoUtil: diversifyKey: CryptorRef was not populated as expected.", v9, 2u);
        MEMORY[0x253339480](v9, -1, -1);
      }

      sub_24E30B1E0();
      swift_allocError();
      char v11 = 9;
LABEL_26:
      *uint64_t v10 = v11;
      return swift_willThrow();
    case 3uLL:
      char v19 = 0;
      goto LABEL_18;
    default:
      char v19 = a1;
LABEL_18:
      int v4 = CCECCryptorImportKey();
      if (!v4) {
        goto LABEL_13;
      }
LABEL_19:
      if (qword_2698D1E88 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_24E3180A0();
      __swift_project_value_buffer(v12, (uint64_t)qword_2698D2588);
      uint64_t v13 = sub_24E318080();
      os_log_type_t v14 = sub_24E3182C0();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 67109120;
        char v19 = v4;
        sub_24E3182E0();
        _os_log_impl(&dword_24E2FF000, v13, v14, "Error running CCECCryptorImportKey. Code: %d", v15, 8u);
        MEMORY[0x253339480](v15, -1, -1);
      }

      CryptoError.init(rawValue:)(v4);
      sub_24E30B1E0();
      swift_allocError();
      if (v19 == 14) {
        char v11 = 9;
      }
      else {
        char v11 = v19;
      }
      goto LABEL_26;
  }
}

uint64_t sub_24E30A78C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, uint64_t *a6@<X6>, int *a7@<X8>)
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v17[0] = 0;
    switch(a3 >> 62)
    {
      case 1uLL:
        if (!__OFSUB__(HIDWORD(a2), a2)) {
          goto LABEL_7;
        }
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        return result;
      case 2uLL:
        if (!__OFSUB__(*(void *)(a2 + 24), *(void *)(a2 + 16))) {
          goto LABEL_7;
        }
        goto LABEL_22;
      default:
LABEL_7:
        uint64_t result = CCKDFParametersCreateAnsiX963();
        if (!result)
        {
          switch(a5 >> 62)
          {
            case 1uLL:
              if ((int)a4 > a4 >> 32) {
                goto LABEL_23;
              }
              sub_24E301950(a4, a5);
              uint64_t result = sub_24E30BDE8((int)a4, a5 & 0x3FFFFFFFFFFFFFFFLL, a6, (uint64_t)v17, a4, a5);
              if (!v7) {
                *a7 = result;
              }
              return result;
            case 2uLL:
              uint64_t v15 = *(void *)(a4 + 16);
              sub_24E301950(a4, a5);
              swift_retain();
              swift_retain();
              int v14 = sub_24E30BDE8(v15, a5 & 0x3FFFFFFFFFFFFFFFLL, a6, (uint64_t)v17, a4, a5);
              swift_release();
              uint64_t result = swift_release();
              if (!v7) {
                goto LABEL_9;
              }
              return result;
            case 3uLL:
              memset(v16, 0, 14);
              goto LABEL_19;
            default:
              v16[0] = a4;
              LOWORD(v16[1]) = a5;
              BYTE2(v16[1]) = BYTE2(a5);
              BYTE3(v16[1]) = BYTE3(a5);
              BYTE4(v16[1]) = BYTE4(a5);
              BYTE5(v16[1]) = BYTE5(a5);
LABEL_19:
              int v14 = sub_24E30B968(a6, (uint64_t)v17, (uint64_t)v16, a4, a5);
              uint64_t result = sub_24E3013A8(a4, a5);
              if (!v7) {
                goto LABEL_9;
              }
              return result;
          }
        }
        int v14 = -4300;
LABEL_9:
        *a7 = v14;
        break;
    }
  }
  else
  {
    sub_24E30B1E0();
    swift_allocError();
    *uint64_t v12 = 3;
    return swift_willThrow();
  }
  return result;
}

uint8_t *sub_24E30AA74(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_24E317FE0();
  char v17 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(a3), a3)) {
        goto LABEL_5;
      }
      __break(1u);
LABEL_20:
      __break(1u);
      __break(1u);
      __break(1u);
      __break(1u);
      __break(1u);
      return result;
    case 2uLL:
      if (!__OFSUB__(*(void *)(a3 + 24), *(void *)(a3 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_20;
    default:
LABEL_5:
      uint64_t v6 = (uint8_t *)CCECCryptorTwinDiversifyKey();
      if (v6)
      {
        if (qword_2698D1E88 != -1) {
          swift_once();
        }
        uint64_t v12 = sub_24E3180A0();
        __swift_project_value_buffer(v12, (uint64_t)qword_2698D2588);
        uint64_t v13 = sub_24E318080();
        os_log_type_t v14 = sub_24E3182C0();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v15 = 67109120;
          char v17 = (char)v6;
          sub_24E3182E0();
          _os_log_impl(&dword_24E2FF000, v13, v14, "Error running CCECCryptorTwinDiversifyKey. Code: %d.", v15, 8u);
          MEMORY[0x253339480](v15, -1, -1);
        }

        CryptoError.init(rawValue:)((int)v6);
        sub_24E30B1E0();
        swift_allocError();
        if (v17 == 14) {
          char v11 = 9;
        }
        else {
          char v11 = v17;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (qword_2698D1E88 != -1) {
          swift_once();
        }
        uint64_t v7 = sub_24E3180A0();
        __swift_project_value_buffer(v7, (uint64_t)qword_2698D2588);
        os_log_type_t v8 = sub_24E318080();
        os_log_type_t v9 = sub_24E3182C0();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v6 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl(&dword_24E2FF000, v8, v9, "CryptoUtil: diversifyKey: CryptorRef was not populated as expected.", v6, 2u);
          MEMORY[0x253339480](v6, -1, -1);
        }

        sub_24E30B1E0();
        swift_allocError();
        char v11 = 9;
      }
      *uint64_t v10 = v11;
      swift_willThrow();
      sub_24E3013A8(0, 0xC000000000000000);
      return v6;
  }
}

uint64_t sub_24E30B15C()
{
  uint64_t v0 = sub_24E3180A0();
  __swift_allocate_value_buffer(v0, qword_2698D2588);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698D2588);
  return sub_24E318090();
}

unint64_t sub_24E30B1E0()
{
  unint64_t result = qword_2698D20F0;
  if (!qword_2698D20F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20F0);
  }
  return result;
}

uint64_t *initializeWithCopy for EncryptAndSignEnvelope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24E301950(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_24E301950(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for EncryptAndSignEnvelope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_24E301950(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_24E3013A8(v6, v7);
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_24E301950(v9, v8);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_24E3013A8(v10, v11);
  return a1;
}

uint64_t *assignWithTake for EncryptAndSignEnvelope(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_24E3013A8(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_24E3013A8(v6, v7);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for EncryptAndSignEnvelope.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x24E30B40CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unint64_t sub_24E30B438()
{
  unint64_t result = qword_2698D20F8;
  if (!qword_2698D20F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D20F8);
  }
  return result;
}

uint64_t sub_24E30B48C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v5 = v1 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_24E319550;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v7 = v2 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
      if (v7 < (int)v2) {
        goto LABEL_21;
      }
      if (sub_24E317F00() && __OFSUB__((int)v2, sub_24E317F30())) {
        goto LABEL_22;
      }
      sub_24E317F40();
      swift_allocObject();
      uint64_t v9 = sub_24E317EE0();
      swift_release();
      uint64_t v5 = v9;
      uint64_t v7 = v2 >> 32;
LABEL_14:
      if (v7 < (int)v2) {
        goto LABEL_19;
      }
      if (!sub_24E317F00()) {
        goto LABEL_24;
      }
      if (__OFSUB__((int)v2, sub_24E317F30())) {
        goto LABEL_20;
      }
      sub_24E317F20();
      uint64_t result = CCECCryptorExportKey();
      *a1 = v2;
      a1[1] = v5 | 0x4000000000000000;
      break;
    case 2uLL:
      uint64_t v11 = v1 & 0x3FFFFFFFFFFFFFFFLL;
      sub_24E317F70();
      uint64_t v8 = *(void *)(v2 + 16);
      if (!sub_24E317F00())
      {
        __break(1u);
LABEL_24:
        __break(1u);
        JUMPOUT(0x24E30B7A4);
      }
      if (__OFSUB__(v8, sub_24E317F30()))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
      }
      sub_24E317F20();
      uint64_t result = CCECCryptorExportKey();
      *a1 = v2;
      a1[1] = v11 | 0x8000000000000000;
      break;
    case 3uLL:
      return CCECCryptorExportKey();
    default:
      LOWORD(v10) = a1[1];
      BYTE2(v10) = BYTE2(a1[1]);
      HIBYTE(v10) = BYTE3(a1[1]);
      __int16 v12 = WORD2(a1[1]);
      unsigned __int8 v13 = BYTE6(a1[1]);
      uint64_t result = CCECCryptorExportKey();
      *a1 = v2;
      a1[1] = v10 | ((unint64_t)v12 << 32) | ((unint64_t)HIBYTE(v12) << 40) | ((unint64_t)v13 << 48);
      return result;
  }
  return result;
}

uint64_t sub_24E30B7B4(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_24E317F40();
      swift_allocObject();
      sub_24E317F10();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24E317F90();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_24E30B854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (!sub_24E317F00()) {
    goto LABEL_11;
  }
  if (__OFSUB__(a1, sub_24E317F30()))
  {
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    JUMPOUT(0x24E30B958);
  }
  sub_24E317F20();
  switch(a6 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 2uLL:
      if (!__OFSUB__(*(void *)(a5 + 24), *(void *)(a5 + 16))) {
        goto LABEL_7;
      }
      goto LABEL_10;
    default:
LABEL_7:
      uint64_t v9 = CCDeriveKey();
      CCKDFParametersDestroy();
      return v9;
  }
}

uint64_t sub_24E30B968(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v12 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_24E319550;
      sub_24E301950(a4, a5);
      sub_24E301950(a4, a5);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v14 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_19;
      }
      if (v14 < (int)v6) {
        goto LABEL_23;
      }
      uint64_t v15 = a3;
      if (sub_24E317F00() && __OFSUB__((int)v6, sub_24E317F30())) {
        goto LABEL_24;
      }
      sub_24E317F40();
      swift_allocObject();
      uint64_t v19 = sub_24E317EE0();
      swift_release();
      uint64_t v12 = v19;
      uint64_t v14 = v6 >> 32;
      a3 = v15;
LABEL_19:
      if (v14 < (int)v6)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
      }
      sub_24E301950(a4, a5);
      uint64_t v18 = sub_24E30B854((int)v6, v12, a2, a3, a4, a5);
      sub_24E3013A8(a4, a5);
      sub_24E3013A8(a4, a5);
      sub_24E3013A8(a4, a5);
      *a1 = v6;
      a1[1] = v12 | 0x4000000000000000;
      return v18;
    case 2uLL:
      uint64_t v22 = *a1;
      uint64_t v24 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      sub_24E301950(a4, a5);
      sub_24E301950(a4, a5);
      uint64_t v16 = a3;
      sub_24E317F70();
      uint64_t v17 = *(void *)(v22 + 16);
      sub_24E301950(a4, a5);
      uint64_t v18 = sub_24E30B854(v17, v24, a2, v16, a4, a5);
      sub_24E3013A8(a4, a5);
      sub_24E3013A8(a4, a5);
      sub_24E3013A8(a4, a5);
      *a1 = v22;
      a1[1] = v24 | 0x8000000000000000;
      return v18;
    case 3uLL:
      switch(a5 >> 62)
      {
        case 1uLL:
          if (!__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_17;
          }
          goto LABEL_27;
        case 2uLL:
          if (!__OFSUB__(*(void *)(a4 + 24), *(void *)(a4 + 16))) {
            goto LABEL_17;
          }
          goto LABEL_28;
        default:
LABEL_17:
          uint64_t v18 = CCDeriveKey();
          CCKDFParametersDestroy();
          break;
      }
      return v18;
    default:
      LOWORD(v23) = a1[1];
      BYTE2(v23) = BYTE2(a1[1]);
      HIBYTE(v23) = BYTE3(a1[1]);
      __int16 v25 = WORD2(a1[1]);
      unsigned __int8 v26 = BYTE6(a1[1]);
      switch(a5 >> 62)
      {
        case 1uLL:
          if (!__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_13;
          }
          goto LABEL_25;
        case 2uLL:
          if (!__OFSUB__(*(void *)(a4 + 24), *(void *)(a4 + 16))) {
            goto LABEL_13;
          }
          goto LABEL_26;
        default:
LABEL_13:
          uint64_t v18 = CCDeriveKey();
          CCKDFParametersDestroy();
          *a1 = v6;
          a1[1] = v23 | ((unint64_t)v25 << 32) | ((unint64_t)HIBYTE(v25) << 40) | ((unint64_t)v26 << 48);
          break;
      }
      return v18;
  }
}

uint64_t sub_24E30BDE8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = sub_24E317F00();
  if (!v13)
  {
    sub_24E317F20();
    sub_24E30B1E0();
    swift_allocError();
    *uint64_t v18 = 3;
    swift_willThrow();
    sub_24E3013A8(a5, a6);
    return v7;
  }
  uint64_t v14 = v13;
  uint64_t result = sub_24E317F30();
  BOOL v16 = __OFSUB__(a1, result);
  uint64_t v17 = a1 - result;
  if (!v16)
  {
    sub_24E317F20();
    sub_24E301950(a5, a6);
    uint64_t v7 = sub_24E30B968(a3, a4, v14 + v17, a5, a6);
    sub_24E3013A8(a5, a6);
    sub_24E3013A8(a5, a6);
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E30BF04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t *a8)
{
  uint64_t result = sub_24E317F00();
  uint64_t v16 = result;
  if (result)
  {
    uint64_t result = sub_24E317F30();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v16 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_24E317F20();
  uint64_t result = sub_24E30A78C(v16, a4, a5, a6, a7, a8, (int *)&v18);
  if (!v17) {
    return v18;
  }
  return result;
}

uint64_t sub_24E30BFE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x727574616E676973 && a2 == 0xE900000000000065;
  if (v2 || (sub_24E3183E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574707972636E65 && a2 == 0xED00006174614464)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E3183E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_24E30C108()
{
  unint64_t result = qword_2698D2110;
  if (!qword_2698D2110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2110);
  }
  return result;
}

unint64_t sub_24E30C15C()
{
  unint64_t result = qword_2698D2118;
  if (!qword_2698D2118)
  {
    sub_24E3180E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2118);
  }
  return result;
}

uint64_t sub_24E30C1B4@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v3 = a2 >> 62;
  uint64_t v5 = result;
  uint64_t v6 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 == 72)
      {
        *a3 = result;
        a3[1] = a2;
        return result;
      }
      if (!v3)
      {
        uint64_t v6 = BYTE6(a2);
        goto LABEL_14;
      }
      if (v3 != 1)
      {
        uint64_t v12 = *(void *)(result + 16);
        uint64_t v11 = *(void *)(result + 24);
        uint64_t v6 = v11 - v12;
        if (!__OFSUB__(v11, v12)) {
          goto LABEL_14;
        }
LABEL_18:
        __break(1u);
        JUMPOUT(0x24E30C2D0);
      }
      if (__OFSUB__(HIDWORD(result), result))
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v6 = HIDWORD(result) - (int)result;
LABEL_14:
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v13 = 72;
      *(void *)(v13 + 8) = v6;
      *(unsigned char *)(v13 + 16) = 0;
      swift_willThrow();
      return sub_24E3013A8(v5, a2);
    case 2uLL:
      uint64_t v9 = *(void *)(result + 16);
      uint64_t v8 = *(void *)(result + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_16;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E30C2E0@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v3 = a2 >> 62;
  uint64_t v5 = result;
  uint64_t v6 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 == 32)
      {
        *a3 = result;
        a3[1] = a2;
        return result;
      }
      if (!v3)
      {
        uint64_t v6 = BYTE6(a2);
        goto LABEL_14;
      }
      if (v3 != 1)
      {
        uint64_t v12 = *(void *)(result + 16);
        uint64_t v11 = *(void *)(result + 24);
        uint64_t v6 = v11 - v12;
        if (!__OFSUB__(v11, v12)) {
          goto LABEL_14;
        }
LABEL_18:
        __break(1u);
        JUMPOUT(0x24E30C3FCLL);
      }
      if (__OFSUB__(HIDWORD(result), result))
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v6 = HIDWORD(result) - (int)result;
LABEL_14:
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v13 = 32;
      *(void *)(v13 + 8) = v6;
      *(unsigned char *)(v13 + 16) = 0;
      swift_willThrow();
      return sub_24E3013A8(v5, a2);
    case 2uLL:
      uint64_t v9 = *(void *)(result + 16);
      uint64_t v8 = *(void *)(result + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_16;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E30C40C@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v3 = a2 >> 62;
  uint64_t v5 = result;
  uint64_t v6 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 == 28)
      {
        *a3 = result;
        a3[1] = a2;
        return result;
      }
      if (!v3)
      {
        uint64_t v6 = BYTE6(a2);
        goto LABEL_14;
      }
      if (v3 != 1)
      {
        uint64_t v12 = *(void *)(result + 16);
        uint64_t v11 = *(void *)(result + 24);
        uint64_t v6 = v11 - v12;
        if (!__OFSUB__(v11, v12)) {
          goto LABEL_14;
        }
LABEL_18:
        __break(1u);
        JUMPOUT(0x24E30C528);
      }
      if (__OFSUB__(HIDWORD(result), result))
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v6 = HIDWORD(result) - (int)result;
LABEL_14:
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v13 = 28;
      *(void *)(v13 + 8) = v6;
      *(unsigned char *)(v13 + 16) = 0;
      swift_willThrow();
      return sub_24E3013A8(v5, a2);
    case 2uLL:
      uint64_t v9 = *(void *)(result + 16);
      uint64_t v8 = *(void *)(result + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_16;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t DiversifiedRootKeys.intermediateKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E302F0C(v2, v3);
}

uint64_t DiversifiedRootKeys.publicKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t DiversifiedRootKeys.privateKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  unint64_t v3 = *(void *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_24E302F0C(v2, v3);
}

uint64_t DiversifiedRootKeys.hash(into:)()
{
  unint64_t v2 = v0[1];
  uint64_t v1 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  unint64_t v5 = v0[5];
  if (v2 >> 60 == 15)
  {
    sub_24E318460();
  }
  else
  {
    uint64_t v6 = *v0;
    sub_24E318460();
    sub_24E301950(v6, v2);
    sub_24E317FD0();
    sub_24E30407C(v6, v2);
  }
  sub_24E301950(v1, v4);
  sub_24E317FD0();
  sub_24E3013A8(v1, v4);
  if (v5 >> 60 == 15) {
    return sub_24E318460();
  }
  sub_24E318460();
  sub_24E301950(v3, v5);
  sub_24E317FD0();

  return sub_24E30407C(v3, v5);
}

BOOL sub_24E30C690(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E30C6A4()
{
  uint64_t v1 = 0x654B63696C627570;
  if (*v0 != 1) {
    uint64_t v1 = 0x4B65746176697270;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x64656D7265746E69;
  }
}

uint64_t sub_24E30C714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E30DBBC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24E30C73C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24E30C748(uint64_t a1)
{
  unint64_t v2 = sub_24E30D2CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E30C784(uint64_t a1)
{
  unint64_t v2 = sub_24E30D2CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DiversifiedRootKeys.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2120);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v9 = v1[2];
  uint64_t v18 = v1[3];
  uint64_t v19 = v9;
  uint64_t v10 = v1[4];
  uint64_t v16 = v1[5];
  uint64_t v17 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30D2CC();
  sub_24E3184A0();
  uint64_t v21 = v8;
  uint64_t v22 = v7;
  char v23 = 0;
  sub_24E308978();
  uint64_t v11 = v20;
  sub_24E3183A0();
  if (!v11)
  {
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    char v23 = 1;
    sub_24E30D320();
    sub_24E3183B0();
    uint64_t v21 = v12;
    uint64_t v22 = v13;
    char v23 = 2;
    sub_24E30D374();
    sub_24E3183A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DiversifiedRootKeys.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  unint64_t v6 = v0[5];
  sub_24E318440();
  sub_24E318460();
  if (v2 >> 60 != 15)
  {
    sub_24E301950(v1, v2);
    sub_24E317FD0();
    sub_24E30407C(v1, v2);
  }
  sub_24E301950(v3, v4);
  sub_24E317FD0();
  sub_24E3013A8(v3, v4);
  sub_24E318460();
  if (v6 >> 60 != 15)
  {
    sub_24E301950(v5, v6);
    sub_24E317FD0();
    sub_24E30407C(v5, v6);
  }
  return sub_24E318480();
}

uint64_t DiversifiedRootKeys.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2140);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30D2CC();
  sub_24E318490();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v25 = 0;
  sub_24E308924();
  sub_24E318370();
  uint64_t v10 = v23;
  unint64_t v9 = v24;
  char v25 = 1;
  sub_24E302F0C(v23, v24);
  sub_24E30D3C8();
  sub_24E318380();
  unint64_t v22 = v9;
  uint64_t v11 = v23;
  char v25 = 2;
  unint64_t v21 = v24;
  sub_24E301950(v23, v24);
  sub_24E30D41C();
  v20[1] = 0;
  sub_24E318370();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v23;
  unint64_t v13 = v24;
  uint64_t v14 = v11;
  uint64_t v15 = v10;
  uint64_t v16 = v10;
  unint64_t v17 = v22;
  sub_24E302F0C(v16, v22);
  unint64_t v18 = v21;
  sub_24E301950(v14, v21);
  sub_24E302F0C(v12, v13);
  sub_24E3013A8(v14, v18);
  sub_24E30407C(v15, v17);
  *a2 = v15;
  a2[1] = v17;
  a2[2] = v14;
  a2[3] = v18;
  a2[4] = v12;
  a2[5] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_24E30407C(v15, v17);
  sub_24E3013A8(v14, v18);
  return sub_24E30407C(v12, v13);
}

uint64_t sub_24E30CE00()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  unint64_t v6 = v0[5];
  sub_24E318440();
  sub_24E318460();
  if (v2 >> 60 != 15)
  {
    sub_24E301950(v1, v2);
    sub_24E317FD0();
    sub_24E30407C(v1, v2);
  }
  sub_24E301950(v3, v4);
  sub_24E317FD0();
  sub_24E3013A8(v3, v4);
  sub_24E318460();
  if (v6 >> 60 != 15)
  {
    sub_24E301950(v5, v6);
    sub_24E317FD0();
    sub_24E30407C(v5, v6);
  }
  return sub_24E318480();
}

uint64_t sub_24E30CF18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DiversifiedRootKeys.init(from:)(a1, a2);
}

uint64_t sub_24E30CF30(void *a1)
{
  return DiversifiedRootKeys.encode(to:)(a1);
}

uint64_t DiversifiedRootKeys.advertisement.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void *)(v1 + 24);
  sub_24E301950(v3, v4);
  sub_24E301950(v3, v4);
  uint64_t v5 = sub_24E30A08C(v3, v4);
  unint64_t v7 = v6;
  sub_24E3013A8(v3, v4);
  sub_24E30C40C((uint64_t)v5, v7, a1);

  return sub_24E3013A8(v3, v4);
}

BOOL _s12FindMyCrypto19DiversifiedRootKeysV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  uint64_t v19 = a1[4];
  unint64_t v20 = a1[5];
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  unint64_t v11 = a2[5];
  if (v3 >> 60 == 15)
  {
    if (v7 >> 60 == 15) {
      goto LABEL_8;
    }
LABEL_5:
    sub_24E302F0C(v2, v3);
    sub_24E302F0C(v6, v7);
    sub_24E30407C(v2, v3);
    uint64_t v12 = v6;
LABEL_6:
    sub_24E30407C(v12, v7);
    return 0;
  }
  if (v7 >> 60 == 15) {
    goto LABEL_5;
  }
  uint64_t v18 = a2[4];
  sub_24E302F0C(v2, v3);
  sub_24E302F0C(v6, v7);
  char v13 = sub_24E306DC0(v2, v3, v6, v7);
  sub_24E30407C(v6, v7);
  sub_24E30407C(v2, v3);
  uint64_t v10 = v18;
  if ((v13 & 1) == 0) {
    return 0;
  }
LABEL_8:
  uint64_t v14 = v10;
  sub_24E301950(v4, v5);
  sub_24E301950(v8, v9);
  char v15 = sub_24E306DC0(v4, v5, v8, v9);
  sub_24E3013A8(v8, v9);
  sub_24E3013A8(v4, v5);
  if ((v15 & 1) == 0) {
    return 0;
  }
  unint64_t v7 = v11;
  if (v20 >> 60 == 15)
  {
    if (v11 >> 60 == 15) {
      return 1;
    }
    goto LABEL_13;
  }
  if (v11 >> 60 == 15)
  {
LABEL_13:
    sub_24E302F0C(v19, v20);
    sub_24E302F0C(v14, v11);
    sub_24E30407C(v19, v20);
    uint64_t v12 = v14;
    goto LABEL_6;
  }
  sub_24E302F0C(v19, v20);
  sub_24E302F0C(v14, v11);
  char v16 = sub_24E306DC0(v19, v20, v14, v11);
  sub_24E30407C(v14, v11);
  sub_24E30407C(v19, v20);
  return (v16 & 1) != 0;
}

unint64_t sub_24E30D2CC()
{
  unint64_t result = qword_2698D2128;
  if (!qword_2698D2128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2128);
  }
  return result;
}

unint64_t sub_24E30D320()
{
  unint64_t result = qword_2698D2130;
  if (!qword_2698D2130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2130);
  }
  return result;
}

unint64_t sub_24E30D374()
{
  unint64_t result = qword_2698D2138;
  if (!qword_2698D2138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2138);
  }
  return result;
}

unint64_t sub_24E30D3C8()
{
  unint64_t result = qword_2698D2148;
  if (!qword_2698D2148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2148);
  }
  return result;
}

unint64_t sub_24E30D41C()
{
  unint64_t result = qword_2698D2150;
  if (!qword_2698D2150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2150);
  }
  return result;
}

unint64_t sub_24E30D474()
{
  unint64_t result = qword_2698D2160;
  if (!qword_2698D2160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2160);
  }
  return result;
}

uint64_t destroy for DiversifiedRootKeys(uint64_t *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >> 60 != 15) {
    sub_24E3013A8(*a1, v2);
  }
  uint64_t result = sub_24E3013A8(a1[2], a1[3]);
  unint64_t v4 = a1[5];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = a1[4];
    return sub_24E3013A8(v5, v4);
  }
  return result;
}

uint64_t initializeWithCopy for DiversifiedRootKeys(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_24E301950(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_24E301950(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = a2 + 4;
  unint64_t v9 = a2[5];
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v10 = *v8;
    sub_24E301950(*v8, v9);
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v9;
  }
  return a1;
}

uint64_t *assignWithCopy for DiversifiedRootKeys(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 == 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v5 = *a2;
      sub_24E301950(*a2, a2[1]);
      *a1 = v5;
      a1[1] = v4;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
    sub_24E30D720((uint64_t)a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v6 = *a2;
  sub_24E301950(*a2, a2[1]);
  uint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  *a1 = v6;
  a1[1] = v4;
  sub_24E3013A8(v7, v8);
LABEL_8:
  uint64_t v9 = a2[2];
  unint64_t v10 = a2[3];
  sub_24E301950(v9, v10);
  uint64_t v11 = a1[2];
  unint64_t v12 = a1[3];
  a1[2] = v9;
  a1[3] = v10;
  sub_24E3013A8(v11, v12);
  char v13 = a2 + 4;
  unint64_t v14 = a2[5];
  if ((unint64_t)a1[5] >> 60 != 15)
  {
    if (v14 >> 60 != 15)
    {
      uint64_t v16 = *v13;
      sub_24E301950(*v13, v14);
      uint64_t v17 = a1[4];
      unint64_t v18 = a1[5];
      a1[4] = v16;
      a1[5] = v14;
      sub_24E3013A8(v17, v18);
      return a1;
    }
    sub_24E3039C8((uint64_t)(a1 + 4));
    goto LABEL_13;
  }
  if (v14 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v13;
    return a1;
  }
  uint64_t v15 = *v13;
  sub_24E301950(*v13, v14);
  a1[4] = v15;
  a1[5] = v14;
  return a1;
}

uint64_t sub_24E30D720(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DiversifiedRootKeys(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v5 = *(void *)(a2 + 8);
  if (v5 >> 60 == 15)
  {
    sub_24E30D720(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  uint64_t v6 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  sub_24E3013A8(v6, v4);
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_24E3013A8(v7, v8);
  uint64_t v9 = (void *)(a2 + 32);
  unint64_t v10 = *(void *)(a1 + 40);
  if (v10 >> 60 != 15)
  {
    unint64_t v11 = *(void *)(a2 + 40);
    if (v11 >> 60 != 15)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(void *)(a1 + 32) = *v9;
      *(void *)(a1 + 40) = v11;
      sub_24E3013A8(v12, v10);
      return a1;
    }
    sub_24E3039C8(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for DiversifiedRootKeys(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 24) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 24) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DiversifiedRootKeys(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiversifiedRootKeys()
{
  return &type metadata for DiversifiedRootKeys;
}

uint64_t getEnumTagSinglePayload for DiversifiedRootKeys.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DiversifiedRootKeys.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E30DA74);
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

unsigned char *sub_24E30DA9C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DiversifiedRootKeys.CodingKeys()
{
  return &type metadata for DiversifiedRootKeys.CodingKeys;
}

unint64_t sub_24E30DAB8()
{
  unint64_t result = qword_2698D2168;
  if (!qword_2698D2168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2168);
  }
  return result;
}

unint64_t sub_24E30DB10()
{
  unint64_t result = qword_2698D2170;
  if (!qword_2698D2170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2170);
  }
  return result;
}

unint64_t sub_24E30DB68()
{
  unint64_t result = qword_2698D2178;
  if (!qword_2698D2178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2178);
  }
  return result;
}

uint64_t sub_24E30DBBC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64656D7265746E69 && a2 == 0xEF79654B65746169;
  if (v2 || (sub_24E3183E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079 || (sub_24E3183E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4B65746176697270 && a2 == 0xEA00000000007965)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24E3183E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t PublicKey.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (qword_2698D1E90 != -1) {
    swift_once();
  }
  if (sub_24E306DC0(a1, a2, qword_2698D2180, *(unint64_t *)algn_2698D2188))
  {
    sub_24E3074C0();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 2;
    swift_willThrow();
    return sub_24E3013A8(a1, a2);
  }
  else
  {
    uint64_t v9 = sub_24E30A08C(a1, a2);
    if (v3)
    {
      MEMORY[0x2533393A0](v3);
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v11 = a1;
      *(void *)(v11 + 8) = a2;
      *(unsigned char *)(v11 + 16) = 1;
      return swift_willThrow();
    }
    else
    {
      sub_24E3013A8((uint64_t)v9, v10);
      uint64_t result = sub_24E306468(a1, a2, 57, (uint64_t *)&v12);
      *a3 = v12;
    }
  }
  return result;
}

uint64_t PublicKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t PublicKey.advertisement.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  sub_24E301950(*v1, v3);
  uint64_t v5 = sub_24E30A08C(v4, v3);
  unint64_t v7 = v6;
  sub_24E3013A8(v4, v3);
  return sub_24E30C40C((uint64_t)v5, v7, a1);
}

uint64_t static PublicKey.length.getter()
{
  return 57;
}

char *sub_24E30E01C()
{
  sub_24E317F40();
  swift_allocObject();
  uint64_t v1 = 0x3900000000;
  uint64_t v2 = sub_24E317F10();
  uint64_t result = sub_24E3167C0((int *)&v1, 0);
  qword_2698D2180 = v1;
  *(void *)algn_2698D2188 = v2 | 0x4000000000000000;
  return result;
}

uint64_t PublicKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 PublicKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E30E0B4(uint64_t a1)
{
  unint64_t v2 = sub_24E30E428();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E30E0F0(uint64_t a1)
{
  unint64_t v2 = sub_24E30E428();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PublicKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2190);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30E428();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PublicKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D21A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30E428();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E30E3E4()
{
  return 57;
}

uint64_t sub_24E30E3EC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PublicKey.init(from:)(a1, a2);
}

uint64_t sub_24E30E404(void *a1)
{
  return PublicKey.encode(to:)(a1);
}

uint64_t sub_24E30E41C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E316F54(*(void *)a1, *(void *)(a1 + 8), a2);
}

unint64_t sub_24E30E428()
{
  unint64_t result = qword_2698D2198;
  if (!qword_2698D2198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2198);
  }
  return result;
}

unint64_t sub_24E30E47C(uint64_t a1)
{
  unint64_t result = sub_24E30E4A4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E30E4A4()
{
  unint64_t result = qword_2698D21A8;
  if (!qword_2698D21A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21A8);
  }
  return result;
}

unint64_t sub_24E30E4F8(void *a1)
{
  a1[1] = sub_24E30D3C8();
  a1[2] = sub_24E30D320();
  a1[3] = sub_24E30E538();
  unint64_t result = sub_24E30E58C();
  a1[4] = result;
  return result;
}

unint64_t sub_24E30E538()
{
  unint64_t result = qword_2698D21B0;
  if (!qword_2698D21B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21B0);
  }
  return result;
}

unint64_t sub_24E30E58C()
{
  unint64_t result = qword_2698D21B8;
  if (!qword_2698D21B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21B8);
  }
  return result;
}

unint64_t sub_24E30E5E4()
{
  unint64_t result = qword_2698D21C0;
  if (!qword_2698D21C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PublicKey()
{
  return &type metadata for PublicKey;
}

unsigned char *storeEnumTagSinglePayload for PublicKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E30E6E4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PublicKey.CodingKeys()
{
  return &type metadata for PublicKey.CodingKeys;
}

unint64_t sub_24E30E720()
{
  unint64_t result = qword_2698D21C8;
  if (!qword_2698D21C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21C8);
  }
  return result;
}

unint64_t sub_24E30E778()
{
  unint64_t result = qword_2698D21D0;
  if (!qword_2698D21D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21D0);
  }
  return result;
}

unint64_t sub_24E30E7D0()
{
  unint64_t result = qword_2698D21D8;
  if (!qword_2698D21D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21D8);
  }
  return result;
}

FindMyCrypto::CryptoError_optional __swiftcall CryptoError.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 1;
  switch(rawValue)
  {
    case -4320:
      char *v1 = 13;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4319:
    case -4318:
    case -4317:
    case -4316:
    case -4315:
    case -4314:
    case -4313:
    case -4312:
      goto LABEL_6;
    case -4311:
      char *v1 = 12;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4310:
      char *v1 = 11;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4309:
      char *v1 = 10;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4308:
      char *v1 = 9;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4307:
      char *v1 = 8;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4306:
      char *v1 = 7;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4305:
      char *v1 = 6;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4304:
      char *v1 = 5;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4303:
      char *v1 = 4;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4302:
      char *v1 = 3;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4301:
      char *v1 = 2;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4300:
      goto LABEL_5;
    default:
      if (rawValue)
      {
LABEL_6:
        char *v1 = 14;
      }
      else
      {
        char v2 = 0;
LABEL_5:
        char *v1 = v2;
      }
      return (FindMyCrypto::CryptoError_optional)rawValue;
  }
}

uint64_t CryptoError.rawValue.getter()
{
  return qword_24E319D38[*v0];
}

BOOL sub_24E30E96C(char *a1, char *a2)
{
  return qword_24E319D38[*a1] == qword_24E319D38[*a2];
}

uint64_t sub_24E30E990()
{
  return sub_24E318480();
}

uint64_t sub_24E30E9E0()
{
  return sub_24E318450();
}

uint64_t sub_24E30EA18()
{
  return sub_24E318480();
}

FindMyCrypto::CryptoError_optional sub_24E30EA64(Swift::Int *a1)
{
  return CryptoError.init(rawValue:)(*a1);
}

void sub_24E30EA6C(void *a1@<X8>)
{
  *a1 = qword_24E319D38[*v1];
}

uint64_t sub_24E30EA84(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24E30EF3C();
  unint64_t v5 = sub_24E30EF90();

  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

BOOL static CryptoTokenError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CryptoTokenError.hash(into:)()
{
  return sub_24E318450();
}

uint64_t CryptoTokenError.hashValue.getter()
{
  return sub_24E318480();
}

unint64_t sub_24E30EB68()
{
  unint64_t result = qword_2698D21E0;
  if (!qword_2698D21E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21E0);
  }
  return result;
}

unint64_t sub_24E30EBC0()
{
  unint64_t result = qword_2698D21E8;
  if (!qword_2698D21E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CryptoError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CryptoError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x24E30ED70);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CryptoError()
{
  return &type metadata for CryptoError;
}

uint64_t getEnumTagSinglePayload for CryptoTokenError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CryptoTokenError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24E30EF04);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CryptoTokenError()
{
  return &type metadata for CryptoTokenError;
}

unint64_t sub_24E30EF3C()
{
  unint64_t result = qword_2698D21F0;
  if (!qword_2698D21F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21F0);
  }
  return result;
}

unint64_t sub_24E30EF90()
{
  unint64_t result = qword_2698D21F8;
  if (!qword_2698D21F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D21F8);
  }
  return result;
}

uint64_t static P256PublicKey.length.getter()
{
  return 64;
}

char *sub_24E30EFF4()
{
  sub_24E317F40();
  swift_allocObject();
  uint64_t v1 = 0x4000000000;
  uint64_t v2 = sub_24E317F10();
  unint64_t result = sub_24E3167C0((int *)&v1, 0);
  qword_2698D2200 = v1;
  *(void *)algn_2698D2208 = v2 | 0x4000000000000000;
  return result;
}

uint64_t P256PublicKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t P256PublicKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 P256PublicKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t P256PublicKey.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (qword_2698D1E98 != -1) {
    swift_once();
  }
  if (sub_24E306DC0(a1, a2, qword_2698D2200, *(unint64_t *)algn_2698D2208))
  {
    sub_24E3074C0();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 2;
    swift_willThrow();
    return sub_24E3013A8(a1, a2);
  }
  else
  {
    uint64_t v9 = sub_24E30A08C(a1, a2);
    if (v3)
    {
      MEMORY[0x2533393A0](v3);
      sub_24E3074C0();
      swift_allocError();
      *(void *)uint64_t v11 = a1;
      *(void *)(v11 + 8) = a2;
      *(unsigned char *)(v11 + 16) = 1;
      return swift_willThrow();
    }
    else
    {
      sub_24E3013A8((uint64_t)v9, v10);
      uint64_t result = sub_24E306468(a1, a2, 64, (uint64_t *)&v12);
      *a3 = v12;
    }
  }
  return result;
}

uint64_t sub_24E30F214(uint64_t a1)
{
  unint64_t v2 = sub_24E30F588();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E30F250(uint64_t a1)
{
  unint64_t v2 = sub_24E30F588();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t P256PublicKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2210);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30F588();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t P256PublicKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2220);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30F588();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E30F544()
{
  return 64;
}

uint64_t sub_24E30F54C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return P256PublicKey.init(from:)(a1, a2);
}

uint64_t sub_24E30F564(void *a1)
{
  return P256PublicKey.encode(to:)(a1);
}

uint64_t sub_24E30F57C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E316FF0(*(void *)a1, *(void *)(a1 + 8), a2);
}

unint64_t sub_24E30F588()
{
  unint64_t result = qword_2698D2218;
  if (!qword_2698D2218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2218);
  }
  return result;
}

unint64_t sub_24E30F5DC(uint64_t a1)
{
  unint64_t result = sub_24E30F604();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E30F604()
{
  unint64_t result = qword_2698D2228;
  if (!qword_2698D2228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2228);
  }
  return result;
}

unint64_t sub_24E30F658(void *a1)
{
  a1[1] = sub_24E30F698();
  a1[2] = sub_24E30F6EC();
  a1[3] = sub_24E30F740();
  unint64_t result = sub_24E30F794();
  a1[4] = result;
  return result;
}

unint64_t sub_24E30F698()
{
  unint64_t result = qword_2698D2230;
  if (!qword_2698D2230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2230);
  }
  return result;
}

unint64_t sub_24E30F6EC()
{
  unint64_t result = qword_2698D2238;
  if (!qword_2698D2238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2238);
  }
  return result;
}

unint64_t sub_24E30F740()
{
  unint64_t result = qword_2698D2240;
  if (!qword_2698D2240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2240);
  }
  return result;
}

unint64_t sub_24E30F794()
{
  unint64_t result = qword_2698D2248;
  if (!qword_2698D2248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2248);
  }
  return result;
}

unint64_t sub_24E30F7EC()
{
  unint64_t result = qword_2698D2250;
  if (!qword_2698D2250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2250);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for P256PublicKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E30F8DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for P256PublicKey.CodingKeys()
{
  return &type metadata for P256PublicKey.CodingKeys;
}

unint64_t sub_24E30F918()
{
  unint64_t result = qword_2698D2258;
  if (!qword_2698D2258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2258);
  }
  return result;
}

unint64_t sub_24E30F970()
{
  unint64_t result = qword_2698D2260;
  if (!qword_2698D2260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2260);
  }
  return result;
}

unint64_t sub_24E30F9C8()
{
  unint64_t result = qword_2698D2268;
  if (!qword_2698D2268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2268);
  }
  return result;
}

uint64_t SharedSecretKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t static SharedSecretKey.length.getter()
{
  return 32;
}

uint64_t SharedSecretKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 SharedSecretKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E30FA70(uint64_t a1)
{
  unint64_t v2 = sub_24E30FC34();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E30FAAC(uint64_t a1)
{
  unint64_t v2 = sub_24E30FC34();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SharedSecretKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2270);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30FC34();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24E30FC34()
{
  unint64_t result = qword_2698D2278;
  if (!qword_2698D2278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2278);
  }
  return result;
}

uint64_t SharedSecretKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2280);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E30FC34();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E30FDF4(uint64_t a1)
{
  unint64_t result = sub_24E30FE1C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E30FE1C()
{
  unint64_t result = qword_2698D2288;
  if (!qword_2698D2288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2288);
  }
  return result;
}

unint64_t sub_24E30FE70(void *a1)
{
  a1[1] = sub_24E307E7C();
  a1[2] = sub_24E307E28();
  a1[3] = sub_24E30FEB0();
  unint64_t result = sub_24E30FF04();
  a1[4] = result;
  return result;
}

unint64_t sub_24E30FEB0()
{
  unint64_t result = qword_2698D2290;
  if (!qword_2698D2290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2290);
  }
  return result;
}

unint64_t sub_24E30FF04()
{
  unint64_t result = qword_2698D2298;
  if (!qword_2698D2298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2298);
  }
  return result;
}

uint64_t sub_24E30FF58@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return SharedSecretKey.init(from:)(a1, a2);
}

uint64_t sub_24E30FF70(void *a1)
{
  return SharedSecretKey.encode(to:)(a1);
}

unint64_t sub_24E30FF8C()
{
  unint64_t result = qword_2698D22A0;
  if (!qword_2698D22A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D22A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedSecretKey()
{
  return &type metadata for SharedSecretKey;
}

unsigned char *storeEnumTagSinglePayload for SharedSecretKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E31008CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedSecretKey.CodingKeys()
{
  return &type metadata for SharedSecretKey.CodingKeys;
}

unint64_t sub_24E3100C8()
{
  unint64_t result = qword_2698D22A8;
  if (!qword_2698D22A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D22A8);
  }
  return result;
}

unint64_t sub_24E310120()
{
  unint64_t result = qword_2698D22B0;
  if (!qword_2698D22B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D22B0);
  }
  return result;
}

unint64_t sub_24E310178()
{
  unint64_t result = qword_2698D22B8;
  if (!qword_2698D22B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D22B8);
  }
  return result;
}

uint64_t TimeBasedKey.index.getter()
{
  return *(void *)v0;
}

uint64_t TimeBasedKey.index.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*TimeBasedKey.index.modify())()
{
  return nullsub_1;
}

uint64_t TimeBasedKey.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeBasedKey() + 20);
  uint64_t v4 = sub_24E317ED0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for TimeBasedKey()
{
  uint64_t result = qword_2698D22C8;
  if (!qword_2698D22C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TimeBasedKey.keyMaterial.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for TimeBasedKey() + 24));
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  unint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  unint64_t v9 = v3[5];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_24E302F0C(v4, v5);
  sub_24E301950(v6, v7);

  return sub_24E302F0C(v8, v9);
}

uint64_t TimeBasedKey.description.getter()
{
  uint64_t v1 = v0;
  v20[0] = 0x203A74766441;
  v20[1] = 0xE600000000000000;
  uint64_t v2 = (uint64_t *)((char *)v0 + *(int *)(type metadata accessor for TimeBasedKey() + 24));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  unint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  sub_24E301950(v5, v6);
  sub_24E301950(v5, v6);
  sub_24E302F0C(v3, v4);
  sub_24E301950(v5, v6);
  sub_24E302F0C(v7, v8);
  unint64_t v9 = sub_24E30A08C(v5, v6);
  unint64_t v11 = v10;
  sub_24E3013A8(v5, v6);
  sub_24E30C40C((uint64_t)v9, v11, v19);
  sub_24E3013A8(v5, v6);
  sub_24E30407C(v3, v4);
  sub_24E3013A8(v5, v6);
  sub_24E30407C(v7, v8);
  uint64_t v12 = v19[0];
  unint64_t v13 = v19[1];
  sub_24E301DA8();
  sub_24E317EB0();
  sub_24E3013A8(v12, v13);
  sub_24E318240();
  swift_bridgeObjectRelease();
  sub_24E318240();
  uint64_t v15 = v20[0];
  uint64_t v14 = v20[1];
  strcpy((char *)v20, "index: ");
  v20[1] = 0xE700000000000000;
  v19[0] = *v1;
  sub_24E3183D0();
  sub_24E318240();
  swift_bridgeObjectRelease();
  sub_24E318240();
  v20[0] = v15;
  v20[1] = v14;
  swift_bridgeObjectRetain();
  sub_24E318240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = v20[0];
  uint64_t v16 = v20[1];
  v20[0] = 0;
  v20[1] = 0xE000000000000000;
  sub_24E318300();
  swift_bridgeObjectRelease();
  strcpy((char *)v20, "dateInterval: ");
  HIBYTE(v20[1]) = -18;
  sub_24E317ED0();
  sub_24E3106B4();
  sub_24E3183D0();
  sub_24E318240();
  swift_bridgeObjectRelease();
  v20[0] = v17;
  v20[1] = v16;
  swift_bridgeObjectRetain();
  sub_24E318240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20[0];
}

unint64_t sub_24E3106B4()
{
  unint64_t result = qword_2698D22C0;
  if (!qword_2698D22C0)
  {
    sub_24E317ED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D22C0);
  }
  return result;
}

unint64_t TimeBasedKey.debugDescription.getter()
{
  return 0xD000000000000015;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimeBasedKey(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    unint64_t v8 = (char *)a1 + v7;
    unint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24E317ED0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (char *)v4 + v11;
    unint64_t v13 = (uint64_t *)((char *)a2 + v11);
    unint64_t v14 = *(uint64_t *)((char *)a2 + v11 + 8);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    }
    else
    {
      uint64_t v16 = *v13;
      sub_24E301950(*v13, v14);
      *(void *)uint64_t v12 = v16;
      *((void *)v12 + 1) = v14;
    }
    uint64_t v17 = v13[2];
    unint64_t v18 = v13[3];
    sub_24E301950(v17, v18);
    *((void *)v12 + 2) = v17;
    *((void *)v12 + 3) = v18;
    uint64_t v19 = v13 + 4;
    unint64_t v20 = v13[5];
    if (v20 >> 60 == 15)
    {
      *((_OWORD *)v12 + 2) = *(_OWORD *)v19;
    }
    else
    {
      uint64_t v21 = *v19;
      sub_24E301950(*v19, v13[5]);
      *((void *)v12 + 4) = v21;
      *((void *)v12 + 5) = v20;
    }
  }
  return v4;
}

uint64_t destroy for TimeBasedKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24E317ED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  unint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_24E3013A8(*v6, v7);
  }
  uint64_t result = sub_24E3013A8(v6[2], v6[3]);
  unint64_t v9 = v6[5];
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = v6[4];
    return sub_24E3013A8(v10, v9);
  }
  return result;
}

void *initializeWithCopy for TimeBasedKey(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E317ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (void *)((char *)a2 + v10);
  unint64_t v13 = *(void *)((char *)a2 + v10 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  }
  else
  {
    uint64_t v14 = *v12;
    sub_24E301950(*v12, v13);
    *(void *)uint64_t v11 = v14;
    *((void *)v11 + 1) = v13;
  }
  uint64_t v15 = v12[2];
  unint64_t v16 = v12[3];
  sub_24E301950(v15, v16);
  *((void *)v11 + 2) = v15;
  *((void *)v11 + 3) = v16;
  uint64_t v17 = v12 + 4;
  unint64_t v18 = v12[5];
  if (v18 >> 60 == 15)
  {
    *((_OWORD *)v11 + 2) = *(_OWORD *)v17;
  }
  else
  {
    uint64_t v19 = *v17;
    sub_24E301950(*v17, v12[5]);
    *((void *)v11 + 4) = v19;
    *((void *)v11 + 5) = v18;
  }
  return a1;
}

void *assignWithCopy for TimeBasedKey(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E317ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  unint64_t v13 = *(void *)((char *)a2 + v10 + 8);
  if (*(void *)((char *)a1 + v10 + 8) >> 60 == 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v14 = *v12;
      sub_24E301950(*v12, v13);
      *uint64_t v11 = v14;
      v11[1] = v13;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
    sub_24E30D720((uint64_t)v11);
LABEL_6:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  uint64_t v15 = *v12;
  sub_24E301950(*v12, v13);
  uint64_t v16 = *v11;
  unint64_t v17 = v11[1];
  *uint64_t v11 = v15;
  v11[1] = v13;
  sub_24E3013A8(v16, v17);
LABEL_8:
  uint64_t v18 = v12[2];
  unint64_t v19 = v12[3];
  sub_24E301950(v18, v19);
  uint64_t v20 = v11[2];
  unint64_t v21 = v11[3];
  v11[2] = v18;
  v11[3] = v19;
  sub_24E3013A8(v20, v21);
  unint64_t v22 = v12 + 4;
  unint64_t v23 = v12[5];
  if ((unint64_t)v11[5] >> 60 != 15)
  {
    if (v23 >> 60 != 15)
    {
      uint64_t v25 = *v22;
      sub_24E301950(*v22, v12[5]);
      uint64_t v26 = v11[4];
      unint64_t v27 = v11[5];
      v11[4] = v25;
      v11[5] = v23;
      sub_24E3013A8(v26, v27);
      return a1;
    }
    sub_24E3039C8((uint64_t)(v11 + 4));
    goto LABEL_13;
  }
  if (v23 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)v11 + 2) = *(_OWORD *)v22;
    return a1;
  }
  uint64_t v24 = *v22;
  sub_24E301950(*v22, v12[5]);
  v11[4] = v24;
  v11[5] = v23;
  return a1;
}

void *initializeWithTake for TimeBasedKey(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E317ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (_OWORD *)((char *)a1 + v10);
  uint64_t v12 = (_OWORD *)((char *)a2 + v10);
  long long v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  v11[2] = v12[2];
  return a1;
}

void *assignWithTake for TimeBasedKey(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E317ED0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (uint64_t)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  unint64_t v13 = *(void *)((char *)a1 + v10 + 8);
  if (v13 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v14 = *((void *)v12 + 1);
  if (v14 >> 60 == 15)
  {
    sub_24E30D720(v11);
LABEL_4:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)v11;
  *(void *)uint64_t v11 = *(void *)v12;
  *(void *)(v11 + 8) = v14;
  sub_24E3013A8(v15, v13);
LABEL_6:
  uint64_t v16 = *(void *)(v11 + 16);
  unint64_t v17 = *(void *)(v11 + 24);
  *(_OWORD *)(v11 + 16) = *((_OWORD *)v12 + 1);
  sub_24E3013A8(v16, v17);
  uint64_t v18 = v12 + 32;
  unint64_t v19 = *(void *)(v11 + 40);
  if (v19 >> 60 != 15)
  {
    unint64_t v20 = *((void *)v12 + 5);
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *(void *)(v11 + 32);
      *(void *)(v11 + 32) = *v18;
      *(void *)(v11 + 40) = v20;
      sub_24E3013A8(v21, v19);
      return a1;
    }
    sub_24E3039C8(v11 + 32);
  }
  *(_OWORD *)(v11 + 32) = *(_OWORD *)v18;
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeBasedKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E310EF0);
}

uint64_t sub_24E310EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E317ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 24) >> 60;
    if (((4 * v12) & 0xC) != 0) {
      return 16 - ((4 * v12) & 0xC | (v12 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for TimeBasedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E310FDC);
}

uint64_t sub_24E310FDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24E317ED0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    uint64_t v13 = a1 + *(int *)(a4 + 24);
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_24E3110AC()
{
  uint64_t result = sub_24E317ED0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = a1;
  uint64_t v7 = sub_24E318070();
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v69 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24E3180A0();
  uint64_t v10 = *(void *)(v9 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E318060();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v66 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v72 = (char *)&v58 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v58 - v20;
  v65 = v22;
  if (a4 == 15)
  {
    LODWORD(v62) = 0;
  }
  else
  {
    if (a4 != 1440)
    {
      uint64_t v75 = 0;
      unint64_t v76 = 0xE000000000000000;
      sub_24E318300();
      swift_bridgeObjectRelease();
      uint64_t v75 = 0xD000000000000018;
      unint64_t v76 = 0x800000024E31D250;
      uint64_t v74 = a4;
      sub_24E3183D0();
      sub_24E318240();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24E318350();
      __break(1u);
      return result;
    }
    LODWORD(v62) = 1;
  }
  sub_24E318010();
  sub_24E318000();
  sub_24E311F80(&qword_2698D22D8, MEMORY[0x263F07490]);
  char v23 = sub_24E318220();
  uint64_t v67 = v14;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  if (v23) {
    uint64_t v25 = a2;
  }
  else {
    uint64_t v25 = a3;
  }
  v24(v72, v25, v13);
  v68 = v21;
  sub_24E318030();
  double v27 = v26 / ((double)a4 * 60.0);
  if ((~*(void *)&v27 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v27 <= -1.0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v27 >= 1.84467441e19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((unint64_t)v27 == -1)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v77 = (unint64_t)v27 + 1;
  if (qword_2698D1E88 != -1) {
LABEL_27:
  }
    swift_once();
  uint64_t v28 = v9;
  uint64_t v29 = __swift_project_value_buffer(v9, (uint64_t)qword_2698D2588);
  uint64_t v30 = v10;
  unint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v32 = v12;
  uint64_t v63 = v28;
  v31(v12, v29, v28);
  uint64_t v33 = v65;
  v24(v65, a2, v13);
  uint64_t v34 = v66;
  v24(v66, a3, v13);
  unint64_t v36 = v69;
  uint64_t v35 = v70;
  uint64_t v37 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v64, v71);
  long long v38 = sub_24E318080();
  os_log_type_t v39 = sub_24E3182A0();
  int v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v75 = v64;
    *(_DWORD *)uint64_t v41 = 136447491;
    BOOL v42 = v62 == 0;
    if (v62) {
      uint64_t v43 = 0x61646E6F6365732ELL;
    }
    else {
      uint64_t v43 = 0x7972616D6972702ELL;
    }
    os_log_t v62 = v38;
    if (v42) {
      unint64_t v44 = 0xE800000000000000;
    }
    else {
      unint64_t v44 = 0xEA00000000007972;
    }
    uint64_t v74 = sub_24E311EAC(v43, v44, &v75);
    sub_24E3182E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2048;
    swift_beginAccess();
    uint64_t v73 = v77;
    sub_24E3182E0();
    *(_WORD *)(v41 + 22) = 2082;
    int v60 = v40;
    sub_24E311F80(&qword_2698D22E0, MEMORY[0x263F07490]);
    uint64_t v61 = v30;
    uint64_t v45 = sub_24E3183D0();
    uint64_t v73 = sub_24E311EAC(v45, v46, &v75);
    sub_24E3182E0();
    swift_bridgeObjectRelease();
    v59 = v32;
    long long v47 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
    v47((uint64_t)v33, v13);
    *(_WORD *)(v41 + 32) = 2082;
    uint64_t v48 = sub_24E3183D0();
    uint64_t v73 = sub_24E311EAC(v48, v49, &v75);
    sub_24E3182E0();
    swift_bridgeObjectRelease();
    v47((uint64_t)v34, v13);
    *(_WORD *)(v41 + 42) = 2160;
    uint64_t v73 = 1752392040;
    sub_24E3182E0();
    *(_WORD *)(v41 + 52) = 2081;
    sub_24E311F80(&qword_2698D22E8, MEMORY[0x263F07508]);
    uint64_t v50 = v69;
    uint64_t v51 = v71;
    uint64_t v52 = sub_24E3183D0();
    uint64_t v73 = sub_24E311EAC(v52, v53, &v75);
    sub_24E3182E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v50, v51);
    os_log_t v54 = v62;
    _os_log_impl(&dword_24E2FF000, v62, (os_log_type_t)v60, "Bucket [%{public}s] calculated to ‣%llu baseTime: %{public}s date: %{public}s  beacon: %{private,mask.hash}s.", (uint8_t *)v41, 0x3Eu);
    uint64_t v55 = v64;
    swift_arrayDestroy();
    MEMORY[0x253339480](v55, -1, -1);
    MEMORY[0x253339480](v41, -1, -1);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v59, v63);
    v47((uint64_t)v72, v13);
    v47((uint64_t)v68, v13);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
    uint64_t v56 = *(void (**)(char *, uint64_t))(v67 + 8);
    v56(v34, v13);
    v56(v33, v13);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v63);
    v56(v72, v13);
    v56(v68, v13);
  }
  swift_beginAccess();
  return v77;
}

uint64_t dateInterval(baseTime:bucket:bucketSizeInMinutes:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v5 = sub_24E318060();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  int v40 = (char *)&v37 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v37 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)&v37 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v37 - v23;
  if (!a2)
  {
    os_log_type_t v39 = a1;
    uint64_t v42 = v6;
    uint64_t v25 = v16;
    if (qword_2698D1E88 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24E3180A0();
    __swift_project_value_buffer(v26, (uint64_t)qword_2698D2588);
    double v27 = sub_24E318080();
    os_log_type_t v28 = sub_24E3182C0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_24E2FF000, v27, v28, "Caller attempted to calculate dateInterval for bucket 0!", v29, 2u);
      MEMORY[0x253339480](v29, -1, -1);
    }

    a2 = 1;
    uint64_t v16 = v25;
    uint64_t v6 = v42;
    a1 = v39;
  }
  uint64_t v38 = a2;
  sub_24E318010();
  sub_24E318000();
  uint64_t v30 = v24;
  unint64_t v31 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v31(v19, a1, v5);
  uint64_t v32 = v22;
  sub_24E318020();
  os_log_type_t v39 = v30;
  v31(v19, v30, v5);
  sub_24E318020();
  v31(v19, v16, v5);
  sub_24E318020();
  sub_24E318050();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v42 = v6 + 8;
  v33(v11, v5);
  uint64_t v34 = v40;
  sub_24E318040();
  if (v38 == 1) {
    uint64_t v35 = v32;
  }
  else {
    uint64_t v35 = v16;
  }
  v31(v19, v35, v5);
  v31(v41, v34, v5);
  sub_24E317EC0();
  v33(v34, v5);
  v33(v16, v5);
  v33(v32, v5);
  return ((uint64_t (*)(char *, uint64_t))v33)(v39, v5);
}

uint64_t sub_24E311EAC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E311FC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E312184((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24E312184((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24E311F80(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E311FC8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24E3182F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E3121E0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_24E318320();
  if (!v8)
  {
    sub_24E318340();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E318360();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_24E312184(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E3121E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E312278(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E312458(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E312458(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E312278(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_24E3123F0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E318310();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E318340();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E318250();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E318360();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E318340();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E3123F0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D22F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E312458(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698D22F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24E318360();
  __break(1u);
  return result;
}

uint64_t sub_24E3125A8()
{
  uint64_t v0 = sub_24E3180A0();
  __swift_allocate_value_buffer(v0, qword_2698D25A0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2698D25A0);
  if (qword_2698D1EA8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2698D25B8);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

double TokenAsyncSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)@<D0>(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, unint64_t a4@<X3>, long long *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8 = *((void *)a5 + 2);
  long long v9 = *a1;
  long long v18 = *a2;
  long long v19 = v9;
  long long v17 = *a3;
  long long v15 = *a5;
  uint64_t v16 = v8;
  sub_24E3126F8((uint64_t *)&v19, (uint64_t *)&v18, (uint64_t *)&v17, (unint64_t *)&v15, a4, (uint64_t *)v20);
  if (!v6)
  {
    uint64_t v11 = v21;
    double result = *(double *)v20;
    long long v12 = v20[1];
    long long v13 = v20[2];
    long long v14 = v20[3];
    *(_OWORD *)a6 = v20[0];
    *(_OWORD *)(a6 + 16) = v12;
    *(_OWORD *)(a6 + 32) = v13;
    *(_OWORD *)(a6 + 48) = v14;
    *(void *)(a6 + 64) = v11;
  }
  return result;
}

uint64_t sub_24E3126F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  unint64_t v6 = a1[1];
  uint64_t v49 = *a1;
  uint64_t v7 = *a2;
  unint64_t v45 = a2[1];
  uint64_t v8 = *a3;
  unint64_t v9 = a3[1];
  unint64_t v11 = *a4;
  uint64_t v10 = a4[1];
  unint64_t v12 = a4[2];
  if (!a5)
  {
    sub_24E30407C(v49, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v8, v9);
    sub_24E304188(v11, v10, v12);
    sub_24E3041A4();
    swift_allocError();
    return swift_willThrow();
  }
  if (v12 >> 60 == 15)
  {
    sub_24E301950(v8, v9);
    sub_24E301950(v8, v9);
    sub_24E302F0C(v49, v6);
    sub_24E301950(v7, v45);
    uint64_t v14 = v8;
    unint64_t v15 = v9;
    uint64_t v16 = a5;
  }
  else
  {
    os_log_t log = (os_log_t)(a5 - v11);
    if (a5 >= v11)
    {
      sub_24E301950(v8, v9);
      sub_24E302F0C(v49, v6);
      sub_24E301950(v7, v45);
      sub_24E3041F8(v11, v10, v12);
      if (qword_2698D1EA0 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_24E3180A0();
      __swift_project_value_buffer(v21, (uint64_t)qword_2698D25A0);
      sub_24E301950(v10, v12);
      unint64_t v22 = sub_24E318080();
      os_log_type_t v36 = sub_24E3182B0();
      if (os_log_type_enabled(v22, v36))
      {
        uint64_t v35 = v22;
        *(void *)typea = v9;
        unint64_t v23 = v6;
        uint64_t v24 = v7;
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 134218240;
        unint64_t v47 = v11;
        sub_24E3182E0();
        uint64_t v26 = v10;
        uint64_t result = sub_24E304188(v11, v10, v12);
        *(_WORD *)(v25 + 12) = 2048;
        if (a5 < (unint64_t)log)
        {
          __break(1u);
          return result;
        }
        unint64_t v47 = a5 - (void)log;
        sub_24E3182E0();
        _os_log_impl(&dword_24E2FF000, v35, v36, "KeyGenerationHint hint.index:%llu saved %llu ratchet iterations", (uint8_t *)v25, 0x16u);
        MEMORY[0x253339480](v25, -1, -1);

        uint64_t v27 = v11;
        uint64_t v14 = v10;
        unint64_t v15 = v12;
        sub_24E304188(v27, v26, v12);
        uint64_t v7 = v24;
        unint64_t v6 = v23;
        unint64_t v9 = *(void *)typea;
      }
      else
      {
        sub_24E304188(v11, v10, v12);
        sub_24E304188(v11, v10, v12);

        uint64_t v14 = v10;
        unint64_t v15 = v12;
      }
      uint64_t v16 = (uint64_t)log;
    }
    else
    {
      sub_24E301950(v8, v9);
      sub_24E302F0C(v49, v6);
      sub_24E301950(v7, v45);
      if (qword_2698D1EA0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_24E3180A0();
      __swift_project_value_buffer(v18, (uint64_t)qword_2698D25A0);
      sub_24E301950(v10, v12);
      long long v19 = sub_24E318080();
      os_log_type_t type = sub_24E3182D0();
      if (os_log_type_enabled(v19, type))
      {
        loga = v19;
        uint64_t v20 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134218240;
        sub_24E3182E0();
        sub_24E304188(v11, v10, v12);
        *(_WORD *)(v20 + 12) = 2048;
        unint64_t v47 = a5;
        sub_24E3182E0();
        _os_log_impl(&dword_24E2FF000, loga, type, "Ignoring KeyGenerationHint: hint.index (%llu) > initialRatchetsToSkip(%llu)", (uint8_t *)v20, 0x16u);
        MEMORY[0x253339480](v20, -1, -1);

        sub_24E304188(v11, v10, v12);
      }
      else
      {
        sub_24E304188(v11, v10, v12);
        sub_24E304188(v11, v10, v12);
      }
      uint64_t v16 = a5 - 1;
      sub_24E301950(v8, v9);
      uint64_t v14 = v8;
      unint64_t v15 = v9;
    }
  }
  uint64_t v28 = v14;
  v46[0] = v14;
  v46[1] = v15;
  sub_24E309468(v46, v16, (uint64_t *)&v47);
  if (v44)
  {
    sub_24E3013A8(v8, v9);
    sub_24E3013A8(v7, v45);
    uint64_t v29 = v49;
    sub_24E30407C(v49, v6);
    sub_24E30407C(v29, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v8, v9);
    uint64_t v30 = v14;
    unint64_t v31 = v15;
  }
  else
  {
    uint64_t v41 = v8;
    uint64_t v32 = v49;
    unint64_t v43 = a5;
    uint64_t v33 = v47;
    unint64_t v34 = v48;
    sub_24E301950(v47, v48);
    sub_24E3013A8(v28, v15);
    sub_24E302F0C(v32, v6);
    sub_24E301950(v7, v45);
    sub_24E301950(v41, v9);
    sub_24E301950(v33, v34);
    sub_24E3013A8(v33, v34);
    sub_24E3013A8(v41, v9);
    sub_24E3013A8(v7, v45);
    sub_24E30407C(v32, v6);
    *a6 = v32;
    a6[1] = v6;
    a6[2] = v7;
    a6[3] = v45;
    a6[4] = v41;
    a6[5] = v9;
    a6[6] = v43;
    a6[7] = v33;
    a6[8] = v34;
    sub_24E30407C(v32, v6);
    sub_24E3013A8(v7, v45);
    sub_24E3013A8(v41, v9);
    uint64_t v30 = v33;
    unint64_t v31 = v34;
  }
  return sub_24E3013A8(v30, v31);
}

uint64_t TokenAsyncSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 56);
  unint64_t v8 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  long long v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 40) = v10;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  sub_24E302F0C(v2, v3);
  sub_24E301950(v4, v5);
  sub_24E301950(v6, v10);

  return sub_24E301950(v7, v8);
}

double TokenAsyncSequence.next()@<D0>(uint64_t a1@<X8>)
{
  if (sub_24E318290())
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0xF000000000000000;
    *(void *)&long long v7 = 0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
  }
  else
  {
    uint64_t v3 = *((void *)v1 + 7);
    unint64_t v4 = *((void *)v1 + 8);
    uint64_t v5 = *((void *)v1 + 6);
    long long v6 = *v1;
    long long v12 = v1[1];
    long long v13 = v6;
    *(void *)&long long v11 = v3;
    *((void *)&v11 + 1) = v4;
    sub_24E301950(v3, v4);
    sub_24E308CE8((uint64_t *)&v13, (uint64_t *)&v12, &v11, (uint64_t)(v1 + 3), (uint64_t)v1 + 56, v14);
    long long v7 = v14[0];
    long long v8 = v14[1];
    long long v9 = v14[2];
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v3;
    *(void *)(a1 + 16) = v4;
    *(_OWORD *)(a1 + 24) = v7;
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = v9;
  }
  return *(double *)&v7;
}

uint64_t sub_24E312FF4(uint64_t a1)
{
  TokenAsyncSequence.next()(a1);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return sub_24E3131EC(v2);
}

uint64_t sub_24E313078(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v4 = sub_24E318280();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return MEMORY[0x270FA2498](sub_24E313114, v4, v6);
}

uint64_t sub_24E313114()
{
  v1.n128_f64[0] = TokenAsyncSequence.next()(*(void *)(v0 + 16));
  uint64_t v2 = *(uint64_t (**)(__n128))(v0 + 8);
  return v2(v1);
}

unint64_t sub_24E31317C()
{
  unint64_t result = qword_2698D22F8[0];
  if (!qword_2698D22F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698D22F8);
  }
  return result;
}

uint64_t sub_24E3131D0()
{
  return MEMORY[0x263F8E658];
}

ValueMetadata *type metadata accessor for TokenAsyncSequence()
{
  return &type metadata for TokenAsyncSequence;
}

uint64_t sub_24E3131EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t AntiTrackingKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t static AntiTrackingKey.length.getter()
{
  return 72;
}

uint64_t AntiTrackingKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

__n128 AntiTrackingKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E31324C(uint64_t a1)
{
  unint64_t v2 = sub_24E313410();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E313288(uint64_t a1)
{
  unint64_t v2 = sub_24E313410();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AntiTrackingKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2310);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E313410();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24E313410()
{
  unint64_t result = qword_2698D2318;
  if (!qword_2698D2318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2318);
  }
  return result;
}

uint64_t AntiTrackingKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2320);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E313410();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24E3135D0(uint64_t a1)
{
  unint64_t result = sub_24E3135F8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E3135F8()
{
  unint64_t result = qword_2698D2328;
  if (!qword_2698D2328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2328);
  }
  return result;
}

uint64_t sub_24E31364C()
{
  return 72;
}

unint64_t sub_24E313654(void *a1)
{
  a1[1] = sub_24E313694();
  a1[2] = sub_24E3136E8();
  a1[3] = sub_24E31373C();
  unint64_t result = sub_24E313790();
  a1[4] = result;
  return result;
}

unint64_t sub_24E313694()
{
  unint64_t result = qword_2698D2330;
  if (!qword_2698D2330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2330);
  }
  return result;
}

unint64_t sub_24E3136E8()
{
  unint64_t result = qword_2698D2338;
  if (!qword_2698D2338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2338);
  }
  return result;
}

unint64_t sub_24E31373C()
{
  unint64_t result = qword_2698D2340;
  if (!qword_2698D2340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2340);
  }
  return result;
}

unint64_t sub_24E313790()
{
  unint64_t result = qword_2698D2348;
  if (!qword_2698D2348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2348);
  }
  return result;
}

uint64_t sub_24E3137E4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return AntiTrackingKey.init(from:)(a1, a2);
}

uint64_t sub_24E3137FC(void *a1)
{
  return AntiTrackingKey.encode(to:)(a1);
}

unint64_t sub_24E313818()
{
  unint64_t result = qword_2698D2350;
  if (!qword_2698D2350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2350);
  }
  return result;
}

uint64_t sub_24E31386C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E31708C(*(void *)a1, *(void *)(a1 + 8), a2);
}

ValueMetadata *type metadata accessor for AntiTrackingKey()
{
  return &type metadata for AntiTrackingKey;
}

unsigned char *storeEnumTagSinglePayload for AntiTrackingKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E313924);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AntiTrackingKey.CodingKeys()
{
  return &type metadata for AntiTrackingKey.CodingKeys;
}

unint64_t sub_24E313960()
{
  unint64_t result = qword_2698D2358;
  if (!qword_2698D2358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2358);
  }
  return result;
}

unint64_t sub_24E3139B8()
{
  unint64_t result = qword_2698D2360;
  if (!qword_2698D2360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2360);
  }
  return result;
}

unint64_t sub_24E313A10()
{
  unint64_t result = qword_2698D2368;
  if (!qword_2698D2368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2368);
  }
  return result;
}

uint64_t sub_24E313A64()
{
  uint64_t v0 = sub_24E3180A0();
  __swift_allocate_value_buffer(v0, qword_2698D25B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698D25B8);
  return sub_24E318090();
}

__n128 NearOwnerAdvertisement.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t static NearOwnerAdvertisement.length.getter()
{
  return 6;
}

uint64_t NearOwnerAdvertisement.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t NearOwnerAdvertisement.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

double NearOwnerAdvertisement.init(macAddress:ek:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double v4 = COERCE_DOUBLE(sub_24E317E60());
  unint64_t v6 = v5;
  *(double *)&long long v9 = v4;
  *((void *)&v9 + 1) = v5;
  sub_24E301950(*(uint64_t *)&v4, v5);
  sub_24E317FF0();
  sub_24E3013A8(*(uint64_t *)&v4, v6);
  sub_24E317FC0();
  uint64_t v7 = sub_24E317E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  double result = v4;
  *a2 = v9;
  return result;
}

uint64_t NearOwnerAdvertisement.description.getter()
{
  return sub_24E318270();
}

uint64_t sub_24E313C34(uint64_t a1)
{
  unint64_t v2 = sub_24E314040();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E313C70(uint64_t a1)
{
  unint64_t v2 = sub_24E314040();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NearOwnerAdvertisement.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2378);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E314040();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t NearOwnerAdvertisement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2388);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E314040();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E313F64()
{
  return sub_24E318270();
}

uint64_t sub_24E313FA8()
{
  return 6;
}

uint64_t sub_24E313FB0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return NearOwnerAdvertisement.init(from:)(a1, a2);
}

uint64_t sub_24E313FC8(void *a1)
{
  return NearOwnerAdvertisement.encode(to:)(a1);
}

uint64_t sub_24E313FE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E317128(*(void *)a1, *(void *)(a1 + 8), a2);
}

unint64_t sub_24E313FEC()
{
  unint64_t result = qword_2698D2370;
  if (!qword_2698D2370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2370);
  }
  return result;
}

unint64_t sub_24E314040()
{
  unint64_t result = qword_2698D2380;
  if (!qword_2698D2380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2380);
  }
  return result;
}

unint64_t sub_24E314094(uint64_t a1)
{
  unint64_t result = sub_24E3140BC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E3140BC()
{
  unint64_t result = qword_2698D2390;
  if (!qword_2698D2390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2390);
  }
  return result;
}

unint64_t sub_24E314110(void *a1)
{
  a1[1] = sub_24E314150();
  a1[2] = sub_24E3141A4();
  a1[3] = sub_24E3141F8();
  unint64_t result = sub_24E313FEC();
  a1[4] = result;
  return result;
}

unint64_t sub_24E314150()
{
  unint64_t result = qword_2698D2398;
  if (!qword_2698D2398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2398);
  }
  return result;
}

unint64_t sub_24E3141A4()
{
  unint64_t result = qword_2698D23A0;
  if (!qword_2698D23A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23A0);
  }
  return result;
}

unint64_t sub_24E3141F8()
{
  unint64_t result = qword_2698D23A8;
  if (!qword_2698D23A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23A8);
  }
  return result;
}

unint64_t sub_24E314250()
{
  unint64_t result = qword_2698D23B0;
  if (!qword_2698D23B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for NearOwnerAdvertisement()
{
  return &type metadata for NearOwnerAdvertisement;
}

unsigned char *storeEnumTagSinglePayload for NearOwnerAdvertisement.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E314350);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NearOwnerAdvertisement.CodingKeys()
{
  return &type metadata for NearOwnerAdvertisement.CodingKeys;
}

unint64_t sub_24E31438C()
{
  unint64_t result = qword_2698D23B8;
  if (!qword_2698D23B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23B8);
  }
  return result;
}

unint64_t sub_24E3143E4()
{
  unint64_t result = qword_2698D23C0;
  if (!qword_2698D23C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23C0);
  }
  return result;
}

unint64_t sub_24E31443C()
{
  unint64_t result = qword_2698D23C8;
  if (!qword_2698D23C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23C8);
  }
  return result;
}

uint64_t GeneratedTokens.hint.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  unint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t GeneratedTokens.diversifiedRootKeys.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[3];
  unint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  unint64_t v5 = v1[6];
  uint64_t v7 = v1[7];
  unint64_t v6 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v7;
  a1[5] = v6;
  sub_24E302F0C(v2, v3);
  sub_24E301950(v4, v5);

  return sub_24E302F0C(v7, v6);
}

uint64_t GeneratedTokens.hash(into:)()
{
  uint64_t v1 = v0[1];
  unint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  unint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  unint64_t v7 = v0[6];
  uint64_t v6 = v0[7];
  unint64_t v8 = v0[8];
  sub_24E318470();
  sub_24E301950(v1, v3);
  sub_24E317FD0();
  sub_24E3013A8(v1, v3);
  sub_24E318460();
  sub_24E302F0C(v2, v5);
  sub_24E301950(v4, v7);
  sub_24E302F0C(v6, v8);
  if (v5 >> 60 != 15)
  {
    sub_24E302F0C(v2, v5);
    sub_24E317FD0();
    sub_24E30407C(v2, v5);
  }
  sub_24E301950(v4, v7);
  sub_24E317FD0();
  sub_24E3013A8(v4, v7);
  sub_24E318460();
  if (v8 >> 60 != 15)
  {
    sub_24E301950(v6, v8);
    sub_24E317FD0();
    sub_24E30407C(v6, v8);
  }
  sub_24E30407C(v2, v5);
  sub_24E3013A8(v4, v7);

  return sub_24E30407C(v6, v8);
}

uint64_t sub_24E3146D0()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 1953393000;
  }
}

uint64_t sub_24E314708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E315700(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E314730(uint64_t a1)
{
  unint64_t v2 = sub_24E314E84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E31476C(uint64_t a1)
{
  unint64_t v2 = sub_24E314E84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeneratedTokens.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D23D0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = *v1;
  uint64_t v9 = *((void *)v1 + 2);
  uint64_t v8 = *((void *)v1 + 3);
  uint64_t v17 = *((void *)v1 + 4);
  uint64_t v18 = v8;
  uint64_t v10 = *((void *)v1 + 5);
  uint64_t v15 = *((void *)v1 + 6);
  uint64_t v16 = v10;
  uint64_t v11 = *((void *)v1 + 7);
  uint64_t v13 = *((void *)v1 + 8);
  uint64_t v14 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E314E84();
  sub_24E3184A0();
  long long v20 = v19;
  uint64_t v21 = v9;
  char v25 = 0;
  sub_24E314ED8();
  sub_24E3183B0();
  if (!v2)
  {
    *(void *)&long long v20 = v18;
    *((void *)&v20 + 1) = v17;
    uint64_t v21 = v16;
    uint64_t v22 = v15;
    uint64_t v23 = v14;
    uint64_t v24 = v13;
    char v25 = 1;
    sub_24E314F2C();
    sub_24E3183B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t GeneratedTokens.hashValue.getter()
{
  return sub_24E318480();
}

uint64_t GeneratedTokens.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D23F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E314E84();
  sub_24E318490();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v36 = 0;
  sub_24E314F80();
  sub_24E318380();
  uint64_t v9 = v31;
  uint64_t v29 = v30;
  unint64_t v10 = v32;
  char v36 = 1;
  sub_24E301950(v31, v32);
  sub_24E314FD4();
  sub_24E318380();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v30;
  unint64_t v12 = v31;
  uint64_t v26 = v30;
  unint64_t v27 = v31;
  unint64_t v13 = v32;
  uint64_t v28 = v32;
  uint64_t v14 = v34;
  unint64_t v24 = v33;
  unint64_t v25 = v35;
  sub_24E301950(v9, v10);
  sub_24E302F0C(v11, v12);
  uint64_t v15 = v13;
  unint64_t v16 = v24;
  sub_24E301950(v15, v24);
  uint64_t v17 = v14;
  uint64_t v18 = v14;
  unint64_t v19 = v25;
  sub_24E302F0C(v17, v25);
  sub_24E3013A8(v9, v10);
  *a2 = v29;
  a2[1] = v9;
  uint64_t v21 = v26;
  unint64_t v20 = v27;
  a2[2] = v10;
  a2[3] = v21;
  uint64_t v22 = v28;
  a2[4] = v20;
  a2[5] = v22;
  a2[6] = v16;
  a2[7] = v18;
  a2[8] = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_24E3013A8(v9, v10);
  sub_24E30407C(v21, v27);
  sub_24E3013A8(v28, v16);
  return sub_24E30407C(v18, v19);
}

uint64_t sub_24E314C9C()
{
  return sub_24E318480();
}

uint64_t sub_24E314CFC()
{
  return sub_24E318480();
}

uint64_t sub_24E314D54@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeneratedTokens.init(from:)(a1, a2);
}

uint64_t sub_24E314D6C(void *a1)
{
  return GeneratedTokens.encode(to:)(a1);
}

BOOL _s12FindMyCrypto15GeneratedTokensV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  long long v13 = *(_OWORD *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 24);
  long long v11 = *(_OWORD *)(a2 + 24);
  long long v12 = *(_OWORD *)(a1 + 56);
  long long v9 = *(_OWORD *)(a2 + 56);
  long long v10 = *(_OWORD *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v2 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  sub_24E301950(v5, v4);
  sub_24E301950(v3, v2);
  char v6 = sub_24E306DC0(v5, v4, v3, v2);
  sub_24E3013A8(v3, v2);
  sub_24E3013A8(v5, v4);
  if (v6)
  {
    v16[0] = v14;
    v16[1] = v13;
    void v16[2] = v12;
    v15[0] = v11;
    v15[1] = v10;
    v15[2] = v9;
    return _s12FindMyCrypto19DiversifiedRootKeysV2eeoiySbAC_ACtFZ_0((uint64_t *)v16, (uint64_t *)v15);
  }
  else
  {
    return 0;
  }
}

unint64_t sub_24E314E84()
{
  unint64_t result = qword_2698D23D8;
  if (!qword_2698D23D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23D8);
  }
  return result;
}

unint64_t sub_24E314ED8()
{
  unint64_t result = qword_2698D23E0;
  if (!qword_2698D23E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23E0);
  }
  return result;
}

unint64_t sub_24E314F2C()
{
  unint64_t result = qword_2698D23E8;
  if (!qword_2698D23E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23E8);
  }
  return result;
}

unint64_t sub_24E314F80()
{
  unint64_t result = qword_2698D23F8;
  if (!qword_2698D23F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D23F8);
  }
  return result;
}

unint64_t sub_24E314FD4()
{
  unint64_t result = qword_2698D2400;
  if (!qword_2698D2400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2400);
  }
  return result;
}

unint64_t sub_24E31502C()
{
  unint64_t result = qword_2698D2408;
  if (!qword_2698D2408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2408);
  }
  return result;
}

uint64_t destroy for GeneratedTokens(void *a1)
{
  sub_24E3013A8(a1[1], a1[2]);
  unint64_t v2 = a1[4];
  if (v2 >> 60 != 15) {
    sub_24E3013A8(a1[3], v2);
  }
  uint64_t result = sub_24E3013A8(a1[5], a1[6]);
  unint64_t v4 = a1[8];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = a1[7];
    return sub_24E3013A8(v5, v4);
  }
  return result;
}

uint64_t initializeWithCopy for GeneratedTokens(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  unint64_t v5 = a2[2];
  sub_24E301950(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v6 = a2 + 3;
  unint64_t v7 = a2[4];
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v6;
  }
  else
  {
    uint64_t v8 = *v6;
    sub_24E301950(*v6, a2[4]);
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = v7;
  }
  uint64_t v9 = a2[5];
  unint64_t v10 = a2[6];
  sub_24E301950(v9, v10);
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  long long v11 = a2 + 7;
  unint64_t v12 = a2[8];
  if (v12 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)v11;
  }
  else
  {
    uint64_t v13 = *v11;
    sub_24E301950(*v11, v12);
    *(void *)(a1 + 56) = v13;
    *(void *)(a1 + 64) = v12;
  }
  return a1;
}

void *assignWithCopy for GeneratedTokens(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_24E301950(v4, v5);
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_24E3013A8(v6, v7);
  uint64_t v8 = a2 + 3;
  unint64_t v9 = a2[4];
  if (a1[4] >> 60 == 15)
  {
    if (v9 >> 60 != 15)
    {
      uint64_t v10 = *v8;
      sub_24E301950(*v8, a2[4]);
      a1[3] = v10;
      a1[4] = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
    sub_24E30D720((uint64_t)(a1 + 3));
LABEL_6:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)v8;
    goto LABEL_8;
  }
  uint64_t v11 = *v8;
  sub_24E301950(*v8, a2[4]);
  uint64_t v12 = a1[3];
  unint64_t v13 = a1[4];
  a1[3] = v11;
  a1[4] = v9;
  sub_24E3013A8(v12, v13);
LABEL_8:
  uint64_t v14 = a2[5];
  unint64_t v15 = a2[6];
  sub_24E301950(v14, v15);
  uint64_t v16 = a1[5];
  unint64_t v17 = a1[6];
  a1[5] = v14;
  a1[6] = v15;
  sub_24E3013A8(v16, v17);
  uint64_t v18 = a2 + 7;
  unint64_t v19 = a2[8];
  if (a1[8] >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      uint64_t v21 = *v18;
      sub_24E301950(*v18, v19);
      uint64_t v22 = a1[7];
      unint64_t v23 = a1[8];
      a1[7] = v21;
      a1[8] = v19;
      sub_24E3013A8(v22, v23);
      return a1;
    }
    sub_24E3039C8((uint64_t)(a1 + 7));
    goto LABEL_13;
  }
  if (v19 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)(a1 + 7) = *(_OWORD *)v18;
    return a1;
  }
  uint64_t v20 = *v18;
  sub_24E301950(*v18, v19);
  a1[7] = v20;
  a1[8] = v19;
  return a1;
}

uint64_t assignWithTake for GeneratedTokens(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  sub_24E3013A8(v5, v6);
  unint64_t v7 = (_OWORD *)(a2 + 24);
  unint64_t v8 = *(void *)(a1 + 32);
  if (v8 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v9 >> 60 == 15)
  {
    sub_24E30D720(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *v7;
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)v7;
  *(void *)(a1 + 32) = v9;
  sub_24E3013A8(v10, v8);
LABEL_6:
  uint64_t v11 = *(void *)(a1 + 40);
  unint64_t v12 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_24E3013A8(v11, v12);
  unint64_t v13 = (void *)(a2 + 56);
  unint64_t v14 = *(void *)(a1 + 64);
  if (v14 >> 60 != 15)
  {
    unint64_t v15 = *(void *)(a2 + 64);
    if (v15 >> 60 != 15)
    {
      uint64_t v16 = *(void *)(a1 + 56);
      *(void *)(a1 + 56) = *v13;
      *(void *)(a1 + 64) = v15;
      sub_24E3013A8(v16, v14);
      return a1;
    }
    sub_24E3039C8(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for GeneratedTokens(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for GeneratedTokens(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneratedTokens()
{
  return &type metadata for GeneratedTokens;
}

unsigned char *storeEnumTagSinglePayload for GeneratedTokens.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24E3155C0);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneratedTokens.CodingKeys()
{
  return &type metadata for GeneratedTokens.CodingKeys;
}

unint64_t sub_24E3155FC()
{
  unint64_t result = qword_2698D2410;
  if (!qword_2698D2410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2410);
  }
  return result;
}

unint64_t sub_24E315654()
{
  unint64_t result = qword_2698D2418;
  if (!qword_2698D2418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2418);
  }
  return result;
}

unint64_t sub_24E3156AC()
{
  unint64_t result = qword_2698D2420;
  if (!qword_2698D2420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2420);
  }
  return result;
}

uint64_t sub_24E315700(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953393000 && a2 == 0xE400000000000000;
  if (v2 || (sub_24E3183E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024E31D4B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E3183E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t static P256PrivateKey.length.getter()
{
  return 32;
}

char *sub_24E3157E8()
{
  sub_24E317F40();
  swift_allocObject();
  uint64_t v1 = 0x2000000000;
  uint64_t v2 = sub_24E317F10();
  unint64_t result = sub_24E3167C0((int *)&v1, 0);
  qword_2698D2428 = v1;
  unk_2698D2430 = v2 | 0x4000000000000000;
  return result;
}

uint64_t P256PrivateKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t P256PrivateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t static P256PrivateKey.random()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24E3181A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E318180();
  uint64_t v6 = sub_24E318160();
  unint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return P256PrivateKey.init(data:)(v6, v8, a1);
}

uint64_t P256PrivateKey.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (qword_2698D1EB0 != -1) {
    swift_once();
  }
  uint64_t result = sub_24E306DC0(a1, a2, qword_2698D2428, unk_2698D2430);
  if ((result & 1) == 0)
  {
    unint64_t v8 = a2 >> 62;
    uint64_t v9 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v10) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_21:
          __break(1u);
        }
        else
        {
          uint64_t v10 = (int)v10;
LABEL_10:
          if (v10 == 32)
          {
            *a3 = a1;
            a3[1] = a2;
            return result;
          }
          if (!v8)
          {
            uint64_t v9 = BYTE6(a2);
            goto LABEL_18;
          }
          if (v8 != 1)
          {
            uint64_t v15 = *(void *)(a1 + 16);
            uint64_t v14 = *(void *)(a1 + 24);
            uint64_t v9 = v14 - v15;
            if (!__OFSUB__(v14, v15)) {
              goto LABEL_18;
            }
LABEL_23:
            __break(1u);
            JUMPOUT(0x24E315B64);
          }
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_18:
            sub_24E3074C0();
            swift_allocError();
            *(void *)uint64_t v16 = 32;
            *(void *)(v16 + 8) = v9;
            *(unsigned char *)(v16 + 16) = 0;
            goto LABEL_19;
          }
        }
        __break(1u);
        goto LABEL_23;
      case 2uLL:
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v11 = *(void *)(a1 + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        uint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_10;
        }
        goto LABEL_21;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v10 = BYTE6(a2);
        goto LABEL_10;
    }
  }
  sub_24E3074C0();
  swift_allocError();
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  *(unsigned char *)(v7 + 16) = 2;
LABEL_19:
  swift_willThrow();
  return sub_24E3013A8(a1, a2);
}

__n128 P256PrivateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E315B80(uint64_t a1)
{
  unint64_t v2 = sub_24E3009A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E315BBC(uint64_t a1)
{
  unint64_t v2 = sub_24E3009A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t P256PrivateKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2438);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3009A4();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24E315D44(void *a1)
{
  return P256PrivateKey.encode(to:)(a1);
}

unint64_t sub_24E315D6C(uint64_t a1)
{
  unint64_t result = sub_24E315D94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E315D94()
{
  unint64_t result = qword_2698D2450;
  if (!qword_2698D2450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2450);
  }
  return result;
}

unint64_t sub_24E315DE8(void *a1)
{
  a1[1] = sub_24E315E28();
  a1[2] = sub_24E315E7C();
  a1[3] = sub_24E315ED0();
  unint64_t result = sub_24E315F24();
  a1[4] = result;
  return result;
}

unint64_t sub_24E315E28()
{
  unint64_t result = qword_2698D2458;
  if (!qword_2698D2458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2458);
  }
  return result;
}

unint64_t sub_24E315E7C()
{
  unint64_t result = qword_2698D2460;
  if (!qword_2698D2460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2460);
  }
  return result;
}

unint64_t sub_24E315ED0()
{
  unint64_t result = qword_2698D2468;
  if (!qword_2698D2468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2468);
  }
  return result;
}

unint64_t sub_24E315F24()
{
  unint64_t result = qword_2698D2470;
  if (!qword_2698D2470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2470);
  }
  return result;
}

unint64_t sub_24E315F7C()
{
  unint64_t result = qword_2698D2478;
  if (!qword_2698D2478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2478);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for P256PrivateKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E31606CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E316098()
{
  unint64_t result = qword_2698D2480;
  if (!qword_2698D2480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2480);
  }
  return result;
}

uint64_t static SymmetricKey256.length.getter()
{
  return 32;
}

char *sub_24E3160F4()
{
  sub_24E317F40();
  swift_allocObject();
  uint64_t v1 = 0x2000000000;
  uint64_t v2 = sub_24E317F10();
  unint64_t result = sub_24E3167C0((int *)&v1, 0);
  qword_2698D2498 = v1;
  unk_2698D24A0 = v2 | 0x4000000000000000;
  return result;
}

uint64_t SymmetricKey256.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t SymmetricKey256.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t static SymmetricKey256.random()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24E318140();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24E318120();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E318130();
  sub_24E318110();
  sub_24E3180F0();
  uint64_t v7 = v11;
  unint64_t v8 = v12;
  sub_24E301950(v11, v12);
  SymmetricKey256.init(data:)(v7, v8, a1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_24E3013A8(v7, v8);
}

uint64_t sub_24E316358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _OWORD v14[3] = MEMORY[0x263F8D3E8];
  v14[4] = MEMORY[0x263F07B80];
  v14[0] = a1;
  v14[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v14, MEMORY[0x263F8D3E8]);
  uint64_t v5 = (unsigned char *)*v4;
  if (*v4 && (uint64_t v6 = (unsigned char *)v4[1], v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      uint64_t v8 = sub_24E316BD4(v5, v6);
      unint64_t v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      uint64_t v8 = sub_24E316C98((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v13 | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = sub_24E302294((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
}

uint64_t SymmetricKey256.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (qword_2698D1EB8 != -1) {
    swift_once();
  }
  uint64_t result = sub_24E306DC0(a1, a2, qword_2698D2498, unk_2698D24A0);
  if ((result & 1) == 0)
  {
    unint64_t v8 = a2 >> 62;
    uint64_t v9 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v10) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_21:
          __break(1u);
        }
        else
        {
          uint64_t v10 = (int)v10;
LABEL_10:
          if (v10 == 32)
          {
            *a3 = a1;
            a3[1] = a2;
            return result;
          }
          if (!v8)
          {
            uint64_t v9 = BYTE6(a2);
            goto LABEL_18;
          }
          if (v8 != 1)
          {
            uint64_t v15 = *(void *)(a1 + 16);
            uint64_t v14 = *(void *)(a1 + 24);
            uint64_t v9 = v14 - v15;
            if (!__OFSUB__(v14, v15)) {
              goto LABEL_18;
            }
LABEL_23:
            __break(1u);
            JUMPOUT(0x24E3165C8);
          }
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_18:
            sub_24E3074C0();
            swift_allocError();
            *(void *)uint64_t v16 = 32;
            *(void *)(v16 + 8) = v9;
            *(unsigned char *)(v16 + 16) = 0;
            goto LABEL_19;
          }
        }
        __break(1u);
        goto LABEL_23;
      case 2uLL:
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v11 = *(void *)(a1 + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        uint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_10;
        }
        goto LABEL_21;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v10 = BYTE6(a2);
        goto LABEL_10;
    }
  }
  sub_24E3074C0();
  swift_allocError();
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  *(unsigned char *)(v7 + 16) = 2;
LABEL_19:
  swift_willThrow();
  return sub_24E3013A8(a1, a2);
}

__n128 SymmetricKey256.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E3165E4(uint64_t a1)
{
  unint64_t v2 = sub_24E300778();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E316620(uint64_t a1)
{
  unint64_t v2 = sub_24E300778();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SymmetricKey256.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D24A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E300778();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24E3167A8(void *a1)
{
  return SymmetricKey256.encode(to:)(a1);
}

char *sub_24E3167C0(int *a1, int a2)
{
  __n128 result = (char *)sub_24E317F80();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  __n128 result = (char *)sub_24E317F00();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  __n128 result = (char *)sub_24E317F30();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_24E317F20();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }

  return (char *)memset(&v7[v8], a2, v11);
}

unint64_t sub_24E316854(uint64_t a1)
{
  unint64_t result = sub_24E31687C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E31687C()
{
  unint64_t result = qword_2698D24C0;
  if (!qword_2698D24C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24C0);
  }
  return result;
}

unint64_t sub_24E3168D0(void *a1)
{
  a1[1] = sub_24E316910();
  a1[2] = sub_24E316964();
  a1[3] = sub_24E3169B8();
  unint64_t result = sub_24E316A0C();
  a1[4] = result;
  return result;
}

unint64_t sub_24E316910()
{
  unint64_t result = qword_2698D24C8;
  if (!qword_2698D24C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24C8);
  }
  return result;
}

unint64_t sub_24E316964()
{
  unint64_t result = qword_2698D24D0;
  if (!qword_2698D24D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24D0);
  }
  return result;
}

unint64_t sub_24E3169B8()
{
  unint64_t result = qword_2698D24D8;
  if (!qword_2698D24D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24D8);
  }
  return result;
}

unint64_t sub_24E316A0C()
{
  unint64_t result = qword_2698D24E0;
  if (!qword_2698D24E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24E0);
  }
  return result;
}

unint64_t sub_24E316A64()
{
  unint64_t result = qword_2698D24E8;
  if (!qword_2698D24E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SymmetricKey256.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E316B54);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E316B80()
{
  unint64_t result = qword_2698D24F0;
  if (!qword_2698D24F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D24F0);
  }
  return result;
}

uint64_t sub_24E316BD4(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_24E316C98(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24E317F40();
  swift_allocObject();
  uint64_t result = sub_24E317EF0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24E317F90();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t static TokenSequenceError.== infix(_:_:)()
{
  return 1;
}

uint64_t TokenSequenceError.hash(into:)()
{
  return sub_24E318450();
}

uint64_t TokenSequenceError.hashValue.getter()
{
  return sub_24E318480();
}

unint64_t sub_24E316D8C()
{
  unint64_t result = qword_2698D2508;
  if (!qword_2698D2508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2508);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TokenSequenceError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E316E7CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenSequenceError()
{
  return &type metadata for TokenSequenceError;
}

uint64_t sub_24E316EB4@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E316F40);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 28)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E316F54@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E316FE0);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 57)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E316FF0@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E31707CLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 64)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E31708C@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E317118);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 72)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E317128@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E3171B4);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 6)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E3171C4@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E317250);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 32)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24E317260@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x24E3172ECLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 85)
      {
LABEL_7:
        sub_24E3013A8(result, a2);
        unint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t PrivateKey.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (qword_2698D1EC0 != -1) {
    swift_once();
  }
  uint64_t result = sub_24E306DC0(a1, a2, qword_2698D2510, *(unint64_t *)algn_2698D2518);
  if ((result & 1) == 0)
  {
    unint64_t v8 = a2 >> 62;
    uint64_t v9 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v10) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_21:
          __break(1u);
        }
        else
        {
          uint64_t v10 = (int)v10;
LABEL_10:
          if (v10 == 85)
          {
            *a3 = a1;
            a3[1] = a2;
            return result;
          }
          if (!v8)
          {
            uint64_t v9 = BYTE6(a2);
            goto LABEL_18;
          }
          if (v8 != 1)
          {
            uint64_t v15 = *(void *)(a1 + 16);
            uint64_t v14 = *(void *)(a1 + 24);
            uint64_t v9 = v14 - v15;
            if (!__OFSUB__(v14, v15)) {
              goto LABEL_18;
            }
LABEL_23:
            __break(1u);
            JUMPOUT(0x24E3174A0);
          }
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_18:
            sub_24E3074C0();
            swift_allocError();
            *(void *)uint64_t v16 = 85;
            *(void *)(v16 + 8) = v9;
            *(unsigned char *)(v16 + 16) = 0;
            goto LABEL_19;
          }
        }
        __break(1u);
        goto LABEL_23;
      case 2uLL:
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v11 = *(void *)(a1 + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        uint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_10;
        }
        goto LABEL_21;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v10 = BYTE6(a2);
        goto LABEL_10;
    }
  }
  sub_24E3074C0();
  swift_allocError();
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  *(unsigned char *)(v7 + 16) = 2;
LABEL_19:
  swift_willThrow();
  return sub_24E3013A8(a1, a2);
}

uint64_t PrivateKey.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24E301950(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t static PrivateKey.length.getter()
{
  return 85;
}

char *sub_24E3174EC()
{
  sub_24E317F40();
  swift_allocObject();
  uint64_t v1 = 0x5500000000;
  uint64_t v2 = sub_24E317F10();
  uint64_t result = sub_24E3167C0((int *)&v1, 0);
  qword_2698D2510 = v1;
  *(void *)algn_2698D2518 = v2 | 0x4000000000000000;
  return result;
}

uint64_t PrivateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_24E301950(v2, v3);
}

uint64_t static PrivateKey.random()()
{
  return sub_24E309748();
}

__n128 PrivateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E3175D8(uint64_t a1)
{
  unint64_t v2 = sub_24E317A64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E317614(uint64_t a1)
{
  unint64_t v2 = sub_24E317A64();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PrivateKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2520);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E317A64();
  sub_24E3184A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24E305594();
  sub_24E3183B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PrivateKey.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D2530);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E317A64();
  sub_24E318490();
  if (!v2)
  {
    sub_24E300950();
    sub_24E318380();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E317908()
{
  return 85;
}

uint64_t sub_24E317910@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PrivateKey.init(from:)(a1, a2);
}

uint64_t sub_24E317928(void *a1)
{
  return PrivateKey.encode(to:)(a1);
}

uint64_t sub_24E317940@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24E317260(*(void *)a1, *(void *)(a1 + 8), a2);
}

uint64_t PrivateKey.publicKey.getter@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  sub_24E301950(v4, v3);
  sub_24E304870(57, v4, v3, &v11);
  uint64_t result = v11;
  unint64_t v6 = v12;
  switch(v12 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v11) - v11;
      if (__OFSUB__(HIDWORD(v11), v11))
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        sub_24E3013A8(result, v6);
        sub_24E318350();
        __break(1u);
        JUMPOUT(0x24E317A54);
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 != 57) {
        goto LABEL_10;
      }
      *a1 = v11;
      a1[1] = v6;
      return result;
    case 2uLL:
      uint64_t v9 = *(void *)(v11 + 16);
      uint64_t v8 = *(void *)(v11 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_9;
    case 3uLL:
      goto LABEL_10;
    default:
      uint64_t v7 = BYTE6(v12);
      goto LABEL_6;
  }
}

unint64_t sub_24E317A64()
{
  unint64_t result = qword_2698D2528;
  if (!qword_2698D2528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2528);
  }
  return result;
}

unint64_t sub_24E317AB8(uint64_t a1)
{
  unint64_t result = sub_24E317AE0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24E317AE0()
{
  unint64_t result = qword_2698D2538;
  if (!qword_2698D2538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2538);
  }
  return result;
}

unint64_t sub_24E317B34(void *a1)
{
  a1[1] = sub_24E30D41C();
  a1[2] = sub_24E30D374();
  a1[3] = sub_24E317B74();
  unint64_t result = sub_24E317BC8();
  a1[4] = result;
  return result;
}

unint64_t sub_24E317B74()
{
  unint64_t result = qword_2698D2540;
  if (!qword_2698D2540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2540);
  }
  return result;
}

unint64_t sub_24E317BC8()
{
  unint64_t result = qword_2698D2548;
  if (!qword_2698D2548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2548);
  }
  return result;
}

unint64_t sub_24E317C20()
{
  unint64_t result = qword_2698D2550;
  if (!qword_2698D2550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2550);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateKey()
{
  return &type metadata for PrivateKey;
}

unsigned char *storeEnumTagSinglePayload for PrivateKey.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E317D20);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateKey.CodingKeys()
{
  return &type metadata for PrivateKey.CodingKeys;
}

unint64_t sub_24E317D5C()
{
  unint64_t result = qword_2698D2558;
  if (!qword_2698D2558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2558);
  }
  return result;
}

unint64_t sub_24E317DB4()
{
  unint64_t result = qword_2698D2560;
  if (!qword_2698D2560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2560);
  }
  return result;
}

unint64_t sub_24E317E0C()
{
  unint64_t result = qword_2698D2568;
  if (!qword_2698D2568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D2568);
  }
  return result;
}

uint64_t sub_24E317E60()
{
  return MEMORY[0x270F28BF0]();
}

uint64_t sub_24E317E70()
{
  return MEMORY[0x270F28C08]();
}

uint64_t sub_24E317E80()
{
  return MEMORY[0x270F28C10]();
}

uint64_t sub_24E317E90()
{
  return MEMORY[0x270F28C90]();
}

uint64_t sub_24E317EA0()
{
  return MEMORY[0x270F28E10]();
}

uint64_t sub_24E317EB0()
{
  return MEMORY[0x270F28E18]();
}

uint64_t sub_24E317EC0()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_24E317ED0()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_24E317EE0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_24E317EF0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24E317F00()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24E317F10()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_24E317F20()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24E317F30()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24E317F40()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24E317F50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24E317F60()
{
  return MEMORY[0x270F28E30]();
}

uint64_t sub_24E317F70()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_24E317F80()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_24E317F90()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24E317FA0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_24E317FB0()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_24E317FC0()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_24E317FD0()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_24E317FE0()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_24E317FF0()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_24E318000()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24E318010()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24E318020()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_24E318030()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24E318040()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_24E318050()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24E318060()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E318070()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E318080()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E318090()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E3180A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E3180B0()
{
  return MEMORY[0x270EEA998]();
}

uint64_t sub_24E3180C0()
{
  return MEMORY[0x270EEA9B0]();
}

uint64_t sub_24E3180D0()
{
  return MEMORY[0x270EEA9C0]();
}

uint64_t sub_24E3180E0()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t sub_24E3180F0()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_24E318100()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_24E318110()
{
  return MEMORY[0x270EEAB10]();
}

uint64_t sub_24E318120()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_24E318130()
{
  return MEMORY[0x270EEABF0]();
}

uint64_t sub_24E318140()
{
  return MEMORY[0x270EEAC08]();
}

uint64_t sub_24E318150()
{
  return MEMORY[0x270EEAF60]();
}

uint64_t sub_24E318160()
{
  return MEMORY[0x270EEAF68]();
}

uint64_t sub_24E318170()
{
  return MEMORY[0x270EEAF70]();
}

uint64_t sub_24E318180()
{
  return MEMORY[0x270EEAF88]();
}

uint64_t sub_24E318190()
{
  return MEMORY[0x270EEAF98]();
}

uint64_t sub_24E3181A0()
{
  return MEMORY[0x270EEAFA8]();
}

uint64_t sub_24E3181B0()
{
  return MEMORY[0x270EEAFC0]();
}

uint64_t sub_24E3181C0()
{
  return MEMORY[0x270EEAFC8]();
}

uint64_t sub_24E3181D0()
{
  return MEMORY[0x270EEAFD0]();
}

uint64_t sub_24E3181E0()
{
  return MEMORY[0x270EEAFD8]();
}

uint64_t sub_24E3181F0()
{
  return MEMORY[0x270EEAFE0]();
}

uint64_t sub_24E318200()
{
  return MEMORY[0x270EEAFE8]();
}

uint64_t sub_24E318210()
{
  return MEMORY[0x270EEB028]();
}

uint64_t sub_24E318220()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_24E318230()
{
  return MEMORY[0x270F28E80]();
}

uint64_t sub_24E318240()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E318250()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E318260()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24E318270()
{
  return MEMORY[0x270F28E98]();
}

uint64_t sub_24E318280()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E318290()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24E3182A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24E3182B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24E3182C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E3182D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E3182E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E3182F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E318300()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E318310()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E318320()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E318330()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24E318340()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E318350()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E318360()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E318370()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24E318380()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24E318390()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_24E3183A0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24E3183B0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24E3183C0()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_24E3183D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E3183E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E3183F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E318400()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E318410()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E318420()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E318440()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E318450()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E318460()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24E318470()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24E318480()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E318490()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24E3184A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x270ED7958]();
}

uint64_t CCECCryptorExportKey()
{
  return MEMORY[0x270ED79B8]();
}

uint64_t CCECCryptorGeneratePair()
{
  return MEMORY[0x270ED79C0]();
}

uint64_t CCECCryptorImportKey()
{
  return MEMORY[0x270ED79C8]();
}

uint64_t CCECCryptorRelease()
{
  return MEMORY[0x270ED79D0]();
}

uint64_t CCECCryptorTwinDiversifyKey()
{
  return MEMORY[0x270ED79D8]();
}

uint64_t CCKDFParametersCreateAnsiX963()
{
  return MEMORY[0x270ED7A10]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x270ED7A28]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}