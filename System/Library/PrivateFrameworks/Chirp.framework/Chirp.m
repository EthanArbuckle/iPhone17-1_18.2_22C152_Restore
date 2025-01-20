uint64_t sub_2192C0018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_2192C0020()
{
  uint64_t result = sub_2192D9210();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2192C00B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2192D9210();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
  }
  return a1;
}

uint64_t sub_2192C0184(uint64_t a1)
{
  uint64_t v2 = sub_2192D9210();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_2192C01E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_2192C0264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_2192C02E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_2192C035C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_2192C03D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2192C03EC);
}

uint64_t sub_2192C03EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2192D9210();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_2192C0458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2192C046C);
}

uint64_t sub_2192C046C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2192D9210();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CipherState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2192C04F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  uint64_t result = type metadata accessor for CipherState();
  *(void *)(a2 + *(int *)(result + 36)) = 0;
  return result;
}

uint64_t sub_2192C057C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a6;
  uint64_t v45 = a7;
  uint64_t v43 = a5;
  uint64_t v41 = a4;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v42 = sub_2192D9530();
  uint64_t v40 = *(void *)(v42 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v36 - v11;
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v13 - 8);
  uint64_t v37 = v13;
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)&v36 - v15;
  uint64_t v16 = AssociatedTypeWitness;
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v14);
  v20 = (char *)&v36 - v19;
  uint64_t v21 = *(int *)(a3 + 36);
  uint64_t v22 = v47;
  unint64_t v23 = *(void *)(v47 + v21);
  uint64_t result = sub_2192C0968(v18, v23, v8, v9);
  if (v23 == -1)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v22 + v21) = v23 + 1;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v12, v20, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v12, 0, 1, v16);
    uint64_t v25 = v46;
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 72))(v38, v22, v12, v39, v41, v43, v44, v45, v8, v9);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v42);
    if (v25)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    }
    else
    {
      uint64_t v26 = v37;
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v46 = v16;
      uint64_t v47 = 0;
      uint64_t v28 = AssociatedConformanceWitness;
      v29 = v50;
      uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v26, AssociatedConformanceWitness);
      unint64_t v32 = v31;
      uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v26, v28);
      unint64_t v35 = v34;
      uint64_t v48 = v30;
      unint64_t v49 = v32;
      sub_2192C11C8(v30, v32);
      sub_2192CAC44(v33, v35);
      sub_2192C1220(v33, v35);
      sub_2192C1220(v30, v32);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v26);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v46);
      return v48;
    }
  }
  return result;
}

uint64_t sub_2192C0968(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_2192D94E0();
  *(void *)(v7 + 16) = 4;
  *(_DWORD *)(v7 + 32) = 0;
  v18[0] = v7;
  char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  unint64_t v9 = bswap64(a2);
  if ((v8 & 1) == 0) {
    unint64_t v9 = a2;
  }
  unint64_t v17 = v9;
  sub_2192D0EB4((char *)&v17, (char *)v18);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = v18[0];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v12 = *(void (**)(uint64_t *, uint64_t, unint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  swift_bridgeObjectRetain();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C16538);
  unint64_t v14 = sub_2192C1124();
  v12(&v16, v13, v14, AssociatedTypeWitness, AssociatedConformanceWitness);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2192C0B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v54 = a2;
  uint64_t v55 = a7;
  uint64_t v69 = a1;
  uint64_t v12 = *(void *)(a4 - 8);
  uint64_t v62 = v8;
  uint64_t v63 = v12;
  MEMORY[0x270FA5388](a1);
  unint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = v15;
  uint64_t v56 = *(void *)(*(void *)(v15 + 8) + 8);
  uint64_t v68 = *(void *)(v56 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v57 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v64 = (char *)&v49 - v18;
  uint64_t v19 = *(void *)(a3 + 16);
  uint64_t v20 = *(void *)(a3 + 24);
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v53 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v58 = (char *)&v49 - v21;
  uint64_t v22 = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(v22 - 8);
  uint64_t v67 = v22;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = *(int *)(a3 + 36);
  unint64_t v28 = *(void *)(v7 + v27);
  v65 = (char *)&v49 - v29;
  uint64_t result = sub_2192C0968(v26, v28, v19, v20);
  if (v28 == -1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v51 = a5;
    uint64_t v52 = v7;
    *(void *)(v7 + v27) = v28 + 1;
    uint64_t v31 = sub_2192D94F0();
    unint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 64);
    uint64_t v33 = v19;
    if (v31 < v32(v19, v20))
    {
      sub_2192C108C();
      swift_allocError();
      *unint64_t v34 = 6;
      swift_willThrow();
      goto LABEL_7;
    }
    unint64_t v35 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
    v50 = v25;
    v35(v25, v65, v67);
    uint64_t v63 = *(void *)(v63 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v63)(v14, v69, a4);
    uint64_t v36 = sub_2192D94F0();
    uint64_t v37 = v32(v19, v20);
    BOOL v38 = __OFSUB__(v36, v37);
    uint64_t result = v36 - v37;
    if (!v38)
    {
      sub_2192D9500();
      ((void (*)(char *, uint64_t, uint64_t))v63)(v14, v69, a4);
      v32(v19, v20);
      uint64_t v39 = v57;
      sub_2192D9370();
      uint64_t v40 = v60;
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v42 = *(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
      uint64_t v43 = AssociatedTypeWitness;
      uint64_t v44 = swift_getAssociatedConformanceWitness();
      uint64_t v45 = v58;
      uint64_t v46 = v43;
      uint64_t v47 = v43;
      uint64_t v33 = v40;
      uint64_t v48 = v62;
      v42(v50, v64, v39, v46, v47, v44, v44, v40, AssociatedConformanceWitness);
      if (!v48)
      {
        uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 80))(v45, v52, v54, v51, v55, v19, v20);
        (*(void (**)(char *, uint64_t))(v53 + 8))(v45, v40);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v67);
        return v33;
      }
LABEL_7:
      (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v67);
      return v33;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2192C108C()
{
  unint64_t result = qword_267C16530;
  if (!qword_267C16530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16530);
  }
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

unint64_t sub_2192C1124()
{
  unint64_t result = qword_267C16540;
  if (!qword_267C16540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C16538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16540);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2192C11C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2192C1220(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t dispatch thunk of static NoiseDH.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseDHPrivate.init(rawRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of NoiseDHPublic.noiseRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NoiseDHPublic.init(noiseRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static NoiseDHPublic.noiseRepresentationByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseCipherNonce.init<A>(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.tag.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.ciphertext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.nonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.init<A, B>(nonce:ciphertext:tag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 48))(a1);
}

uint64_t dispatch thunk of static NoiseCipher.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static NoiseCipher.bigEndianNonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static NoiseCipher.tagByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static NoiseCipher.seal<A, B>(_:using:nonce:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 72))(a1, a2);
}

uint64_t dispatch thunk of static NoiseCipher.open<A>(_:using:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t TransportState.readKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CipherState();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v10 - v5;
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v10 - v5, v2 + *(int *)(a1 + 44));
  uint64_t v8 = sub_2192D9210();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a2, v6, v8);
}

uint64_t TransportState.writeKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CipherState();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v10 - v5;
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v10 - v5, v2 + *(int *)(a1 + 40));
  uint64_t v8 = sub_2192D9210();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a2, v6, v8);
}

uint64_t TransportState.encryptOutgoingPayload<A>(_:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_2192D94F0();
  uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(a4 + 24) + 64))(*(void *)(a4 + 16), *(void *)(a4 + 24));
  if (__OFSUB__(0xFFFFLL, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (0xFFFF - result < v11)
  {
    sub_2192C108C();
    swift_allocError();
    *uint64_t v13 = 5;
    return swift_willThrow();
  }
  if (*v6 != 1)
  {
    if ((v6[1] & 1) == 0)
    {
      uint64_t v18 = a2;
      uint64_t v19 = a3;
      goto LABEL_8;
    }
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v18 = a2;
  uint64_t v19 = a3;
LABEL_8:
  uint64_t v14 = type metadata accessor for CipherState();
  unint64_t v15 = sub_2192C17D8();
  return sub_2192C057C(a1, (uint64_t)&v18, v14, a5, MEMORY[0x263F06F78], a6, v15);
}

unint64_t sub_2192C17D8()
{
  unint64_t result = qword_267C16548;
  if (!qword_267C16548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16548);
  }
  return result;
}

uint64_t TransportState.decryptIncomingPayload<A>(_:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = sub_2192D94F0();
  if (result >= 0x10000)
  {
    sub_2192C108C();
    swift_allocError();
    *uint64_t v13 = 5;
    return swift_willThrow();
  }
  if (*v6 != 1)
  {
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    goto LABEL_7;
  }
  if ((v6[1] & 1) == 0)
  {
    uint64_t v16 = a2;
    uint64_t v17 = a3;
LABEL_7:
    uint64_t v14 = type metadata accessor for CipherState();
    unint64_t v15 = sub_2192C17D8();
    return sub_2192C0B10(a1, (uint64_t)&v16, v14, a5, MEMORY[0x263F06F78], a6, v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_2192C195C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_2192C1964()
{
  uint64_t result = type metadata accessor for CipherState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_2192C1A00(char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = &a1[v7];
    unint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_2192D9210();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    uint64_t v12 = type metadata accessor for CipherState();
    *(void *)&v8[*(int *)(v12 + 36)] = *(void *)&v9[*(int *)(v12 + 36)];
    uint64_t v13 = *(int *)(a3 + 44);
    uint64_t v14 = &v4[v13];
    unint64_t v15 = (char *)a2 + v13;
    v11(&v4[v13], v15, v10);
    *(void *)&v14[*(int *)(v12 + 36)] = *(void *)&v15[*(int *)(v12 + 36)];
  }
  return v4;
}

uint64_t sub_2192C1B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_2192D9210();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 44);
  return v8(v6, v5);
}

char *sub_2192C1BE4(char *a1, _WORD *a2, uint64_t a3)
{
  *(_WORD *)a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2192D9210();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  uint64_t v11 = type metadata accessor for CipherState();
  *(void *)&v7[*(int *)(v11 + 36)] = *(void *)&v8[*(int *)(v11 + 36)];
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (char *)a2 + v12;
  v10(&a1[v12], v14, v9);
  *(void *)&v13[*(int *)(v11 + 36)] = *(void *)&v14[*(int *)(v11 + 36)];
  return a1;
}

unsigned char *sub_2192C1CD0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2192D9210();
  uint64_t v10 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = type metadata accessor for CipherState();
  *(void *)&v7[*(int *)(v11 + 36)] = *(void *)&v8[*(int *)(v11 + 36)];
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  v10(&a1[v12], v14, v9);
  *(void *)&v13[*(int *)(v11 + 36)] = *(void *)&v14[*(int *)(v11 + 36)];
  return a1;
}

char *sub_2192C1DC4(char *a1, _WORD *a2, uint64_t a3)
{
  *(_WORD *)a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2192D9210();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = type metadata accessor for CipherState();
  *(void *)&v7[*(int *)(v11 + 36)] = *(void *)&v8[*(int *)(v11 + 36)];
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (char *)a2 + v12;
  v10(&a1[v12], v14, v9);
  *(void *)&v13[*(int *)(v11 + 36)] = *(void *)&v14[*(int *)(v11 + 36)];
  return a1;
}

unsigned char *sub_2192C1EB0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2192D9210();
  uint64_t v10 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = type metadata accessor for CipherState();
  *(void *)&v7[*(int *)(v11 + 36)] = *(void *)&v8[*(int *)(v11 + 36)];
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  v10(&a1[v12], v14, v9);
  *(void *)&v13[*(int *)(v11 + 36)] = *(void *)&v14[*(int *)(v11 + 36)];
  return a1;
}

uint64_t sub_2192C1FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2192C1FB8);
}

uint64_t sub_2192C1FB8(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for CipherState();
    uint64_t v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = &a1[*(int *)(a3 + 40)];
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2192C206C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2192C2080);
}

unsigned char *sub_2192C2080(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = type metadata accessor for CipherState();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 40)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for TransportState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2192C2140@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t v8 = type metadata accessor for TransportState();
  uint64_t v9 = &a5[*(int *)(v8 + 40)];
  uint64_t v10 = type metadata accessor for CipherState();
  uint64_t v13 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  ((void (*)(void *__return_ptr, unsigned char *, uint64_t, uint64_t))v13)((void *)(v10 - 8), v9, a3, v10);
  uint64_t v11 = &a5[*(int *)(v8 + 44)];
  return v13(v11, a4, v10);
}

uint64_t type metadata accessor for SecureBytes.Backing()
{
  uint64_t result = qword_267C16558;
  if (!qword_267C16558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2192C227C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2192C22BC()
{
  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  qword_267C16550 = result;
  return result;
}

char *sub_2192C22F0(char *result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  unsigned int v4 = v3;
  uint64_t v7 = result;
  uint64_t result = (char *)_swift_stdlib_malloc_size(result);
  if ((uint64_t)(result - 32) < a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  size_t v8 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t v9 = v4 + 2;
  uint64_t result = (char *)swift_beginAccess();
  uint64_t v10 = v4[2];
  size_t v11 = v8 - v10;
  if (__OFSUB__(v8, v10))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  BOOL v12 = __OFSUB__(a3, a2);
  size_t v13 = a3 - a2;
  if (v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  BOOL v12 = __OFSUB__(v11, v13);
  size_t v14 = v11 - v13;
  if (v12)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t result = (char *)_swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t result = (char *)memmove((char *)v4 + v10 + 32, &v7[a2 + 32], v13);
  size_t v15 = *v9 + v13;
  if (!__OFADD__(*v9, v13))
  {
    uint64_t result = (char *)swift_beginAccess();
    *uint64_t v9 = v15;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

size_t sub_2192C2404(char a1)
{
  uint64_t v2 = v1;
  size_t v4 = _swift_stdlib_malloc_size(v2) - 32;
  BOOL v5 = v2 + 2;
  size_t result = swift_beginAccess();
  int64_t v7 = v2[2];
  size_t v8 = v4 - v7;
  if (__OFSUB__(v4, v7))
  {
    __break(1u);
    goto LABEL_8;
  }
  BOOL v9 = __OFSUB__(v8, 1);
  size_t v10 = v8 - 1;
  if (v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *((unsigned char *)v2 + v7 + 32) = a1;
  uint64_t v11 = *v5 + 1;
  if (!__OFADD__(*v5, 1))
  {
    size_t result = swift_beginAccess();
    *BOOL v5 = v11;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

size_t sub_2192C24D0(const void *a1, size_t a2)
{
  v3 = v2;
  size_t v6 = _swift_stdlib_malloc_size(v2) - 32;
  int64_t v7 = v2 + 2;
  size_t result = swift_beginAccess();
  int64_t v9 = v3[2];
  size_t v10 = v6 - v9;
  if (__OFSUB__(v6, v9))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v11 = __OFSUB__(v10, a2);
  size_t v12 = v10 - a2;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  size_t result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v9)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!a1) {
    goto LABEL_8;
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    size_t result = (size_t)memmove((char *)v3 + v9 + 32, a1, a2);
LABEL_8:
    if (!__OFADD__(*v7, a2))
    {
      *v7 += a2;
      return result;
    }
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
  return result;
}

size_t sub_2192C25A4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_2192D94F0();
  size_t v3 = _swift_stdlib_malloc_size(v1) - 32;
  size_t result = swift_beginAccess();
  int64_t v5 = v1[2];
  size_t v6 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
    __break(1u);
    goto LABEL_8;
  }
  BOOL v7 = __OFSUB__(v6, v2);
  size_t v8 = v6 - v2;
  if (v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  size_t result = _swift_stdlib_malloc_size(v1);
  if ((uint64_t)(result - 32) < v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  size_t result = sub_2192D9590();
  uint64_t v9 = v1[2];
  BOOL v7 = __OFADD__(v9, v2);
  uint64_t v10 = v9 + v2;
  if (!v7)
  {
    v1[2] = v10;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

size_t sub_2192C2694(int64_t a1)
{
  uint64_t v2 = v1;
  size_t v4 = (char *)*v2;
  size_t result = _swift_stdlib_malloc_size(*v2);
  if ((uint64_t)(result - 32) < a1)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(a1))
    {
      if (a1)
      {
        unsigned int v6 = (a1 - 1) | ((a1 - 1) >> 1) | (((a1 - 1) | ((a1 - 1) >> 1)) >> 2);
        unsigned int v7 = v6 | (v6 >> 4) | ((v6 | (v6 >> 4)) >> 8);
        int v8 = v7 | HIWORD(v7);
        if (v8 == -1) {
          uint64_t v9 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v9 = (v8 + 1);
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      type metadata accessor for SecureBytes.Backing();
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = 0;
      *(void *)(v10 + 24) = v9;
      size_t result = swift_beginAccess();
      uint64_t v11 = *((void *)v4 + 2);
      if ((v11 & 0x8000000000000000) == 0)
      {
        sub_2192C22F0(v4, 0, v11);
        size_t result = swift_release();
        *uint64_t v2 = (const void *)v10;
        return result;
      }
LABEL_14:
      __break(1u);
      return result;
    }
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_2192C2780(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  return sub_2192C5374(v2 + 32, v2 + 32 + *(void *)(v2 + 16), v3) & 1;
}

void sub_2192C27E4(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2192C27EC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(void *)(v3 + 16);
  return result;
}

uint64_t (*sub_2192C2834(unsigned char *a1, void *a2))()
{
  *a1 = *(unsigned char *)(*v2 + *a2 + 32);
  return nullsub_1;
}

uint64_t sub_2192C2870@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = *v2;
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v8 >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v6;
    return swift_retain();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2192C28EC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = v5;
  }
  return result;
}

BOOL sub_2192C293C()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 16) == 0;
}

void sub_2192C2984(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_2192C299C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *(void *)(a4 + 16);
  if (v9 < a3 || (a3 | a1) < 0 || v9 < a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v10 = a3 - a1;
  if (a2 >= 1)
  {
    if (v10 < 0 || v10 >= a2) {
      goto LABEL_11;
    }
    return 0;
  }
  if (v10 <= 0 && v10 > a2) {
    return 0;
  }
LABEL_11:
  uint64_t result = a1 + a2;
  if (__OFADD__(a1, a2))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (result < 0 || v9 < result) {
    goto LABEL_17;
  }
  return result;
}

uint64_t *sub_2192C2A68(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_2192C2A84(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_2192C2AA0(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_2192C2ABC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_2192C2AD4(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_2192C2AEC(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_2192C2AF8()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 16);
}

uint64_t sub_2192C2B38()
{
  return 2;
}

uint64_t sub_2192C2B40()
{
  uint64_t v1 = sub_2192C551C(*v0);
  swift_release();
  return v1;
}

uint64_t sub_2192C2B78(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  return sub_2192C2B80(a1, a2, a3, *v3);
}

uint64_t sub_2192C2B80(uint64_t result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = (void *)result;
  if (!a2)
  {
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = a3;
  if (!a3)
  {
LABEL_14:
    *BOOL v5 = a4;
    v5[1] = v6;
    return v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v8 = *(void *)(a4 + 16);
    if (v8)
    {
      *a2 = *(unsigned char *)(a4 + 32);
      uint64_t v9 = v6 - 1;
      if (v6 != 1)
      {
        uint64_t v10 = 0;
        while (v9 != v10)
        {
          if (__OFSUB__(v8, v10 + 1)) {
            goto LABEL_16;
          }
          if (v8 - 1 == v10) {
            goto LABEL_13;
          }
          a2[v10 + 1] = *(unsigned char *)(a4 + 33 + v10);
          if (v9 == ++v10) {
            goto LABEL_14;
          }
        }
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
LABEL_13:
      uint64_t v6 = v8;
    }
    goto LABEL_14;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_2192C2C58@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2192C2C78(a1, a2, a3);
}

uint64_t sub_2192C2C78@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_2192C43A8(a1, a2, a3);
}

void *sub_2192C2CA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *sub_2192C2CB8(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

void *sub_2192C2CD0@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = *v3;
    uint64_t result = (void *)swift_beginAccess();
    if ((v5 & 0x8000000000000000) == 0 && *(void *)(v6 + 16) >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2192C2D40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_2192C299C(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t sub_2192C2D7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 16);
  if (v7 >= v4 && ((v4 | v3) & 0x8000000000000000) == 0 && v7 >= v3) {
    return v4 - v3;
  }
  __break(1u);
  return result;
}

unsigned char *sub_2192C2DEC(unsigned char *result, void *a2)
{
  *(unsigned char *)(*v2 + *a2 + 32) = *result;
  return result;
}

uint64_t (*sub_2192C2E04(uint64_t a1, uint64_t *a2))(uint64_t result)
{
  uint64_t v3 = *a2;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(*v2 + v3 + 32);
  return sub_2192C2E3C;
}

uint64_t sub_2192C2E3C(uint64_t result)
{
  *(unsigned char *)(**(void **)result + *(void *)(result + 8) + 32) = *(unsigned char *)(result + 16);
  return result;
}

uint64_t sub_2192C2E54(uint64_t *a1, uint64_t *a2)
{
  sub_2192C5404(v2, *a2, a2[1], *a1, a1[1], a1[2]);
  return swift_release();
}

void (*sub_2192C2EA0(void *a1, uint64_t *a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2192C2F48(v4, *a2, a2[1]);
  return sub_2192C2F00;
}

void sub_2192C2F00(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2192C2F48(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v7 = malloc(0x48uLL);
  *a1 = v7;
  v7[7] = a3;
  v7[8] = v3;
  v7[6] = a2;
  uint64_t v8 = *v3;
  uint64_t result = (void (*)(uint64_t **))swift_beginAccess();
  uint64_t v10 = *(void *)(v8 + 16);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v10 >= a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain();
    return sub_2192C3000;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2192C3000(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_2192C5404((uint64_t *)(*a1)[8], v1[6], (*a1)[7], *v1, v1[1], v1[2]);
  swift_release();
  free(v1);
}

uint64_t sub_2192C3050@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2192C55FC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void *sub_2192C307C(void *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (__OFSUB__(*a2, *result))
  {
    __break(1u);
  }
  else if (*a2 != *result)
  {
    uint64_t v5 = *v2 + 32;
    char v6 = *(unsigned char *)(v5 + v3);
    *(unsigned char *)(v5 + v3) = *(unsigned char *)(v5 + v4);
    *(unsigned char *)(v5 + v4) = v6;
  }
  return result;
}

uint64_t sub_2192C30B0()
{
  return sub_2192D93A0();
}

uint64_t sub_2192C30D4()
{
  return sub_2192D9390();
}

uint64_t sub_2192C30F8(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (char *)*v3 + 16;
  uint64_t result = swift_beginAccess();
  int64_t v10 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  BOOL v11 = __OFSUB__(*v8, v10);
  int64_t v12 = *v8 - v10;
  if (v11)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v13 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v4);
    if (result - 32 >= v13)
    {
      if (a2 >= a1) {
        return sub_2192C3614(a1, a2, a3);
      }
      goto LABEL_26;
    }
  }
  if (v13 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v13))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v13)
  {
    unsigned int v14 = (v13 - 1) | ((v13 - 1) >> 1) | (((v13 - 1) | ((v13 - 1) >> 1)) >> 2);
    unsigned int v15 = v14 | (v14 >> 4) | ((v14 | (v14 >> 4)) >> 8);
    int v16 = v15 | HIWORD(v15);
    if (v16 == -1) {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v17 = (v16 + 1);
    }
  }
  else
  {
    uint64_t v17 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = v17;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v18 = (const void *)result;
  uint64_t v19 = (char *)*v4;
  uint64_t result = swift_beginAccess();
  uint64_t v20 = *((void *)v19 + 2);
  if (v20 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_2192C22F0(v19, 0, a1);
  sub_2192C2404(a3);
  sub_2192C22F0((char *)*v4, a2, v20);
  *uint64_t v4 = v18;
  return swift_release();
}

uint64_t sub_2192C3298(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  uint64_t v5 = v4;
  int64_t v10 = (char *)*v4 + 16;
  uint64_t result = swift_beginAccess();
  int64_t v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  BOOL v13 = __OFSUB__(*v10, v12);
  int64_t v14 = *v10 - v12;
  if (v13)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v15 = v14 + a4;
  if (__OFADD__(v14, a4))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1) {
        return sub_2192C3714(a1, a2, a3, a4);
      }
      goto LABEL_26;
    }
  }
  if (v15 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v15))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v15)
  {
    unsigned int v16 = (v15 - 1) | ((v15 - 1) >> 1) | (((v15 - 1) | ((v15 - 1) >> 1)) >> 2);
    unsigned int v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
    int v18 = v17 | HIWORD(v17);
    if (v18 == -1) {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v19 = (v18 + 1);
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = v19;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v20 = (const void *)result;
  uint64_t v21 = (char *)*v5;
  uint64_t result = swift_beginAccess();
  uint64_t v22 = *((void *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_2192C22F0(v21, 0, a1);
  sub_2192C24D0(a3, a4);
  sub_2192C22F0((char *)*v5, a2, v22);
  *uint64_t v5 = v20;
  return swift_release();
}

uint64_t sub_2192C3444(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int64_t v10 = (char *)*v4 + 16;
  uint64_t result = swift_beginAccess();
  int64_t v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  int64_t v13 = *v10 - v12;
  if (__OFSUB__(*v10, v12))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t result = sub_2192D94F0();
  BOOL v14 = __OFADD__(v13, result);
  uint64_t v15 = v13 + result;
  if (v14)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1) {
        return sub_2192C3820(a1, a2, a3, a4);
      }
      goto LABEL_26;
    }
  }
  if (v15 < 0) {
    goto LABEL_22;
  }
  if (HIDWORD(v15))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v15)
  {
    unsigned int v16 = (v15 - 1) | ((v15 - 1) >> 1) | (((v15 - 1) | ((v15 - 1) >> 1)) >> 2);
    unsigned int v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
    int v18 = v17 | HIWORD(v17);
    if (v18 == -1) {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v19 = (v18 + 1);
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = v19;
  if (a1 < 0) {
    goto LABEL_24;
  }
  uint64_t v20 = (const void *)result;
  uint64_t v21 = (char *)*v5;
  uint64_t result = swift_beginAccess();
  uint64_t v22 = *((void *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_2192C22F0(v21, 0, a1);
  sub_2192C25A4();
  sub_2192C22F0((char *)*v5, a2, v22);
  *uint64_t v5 = v20;
  return swift_release();
}

size_t sub_2192C3614(int64_t a1, int64_t a2, size_t a3)
{
  uint64_t v7 = v3 + 2;
  size_t result = swift_beginAccess();
  int64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  int64_t v10 = v3[2];
  int64_t v11 = v10 - v9;
  if (__OFSUB__(v10, v9))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  size_t result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  BOOL v13 = __OFSUB__(1, v9);
  uint64_t v14 = 1 - v9;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_2192C4788(a2, v10, v14);
  size_t result = sub_2192C4850(a3, a1);
  uint64_t v15 = v3[2];
  uint64_t v16 = v15 + v14;
  if (!__OFADD__(v15, v14))
  {
    size_t result = swift_beginAccess();
    *uint64_t v7 = v16;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

size_t sub_2192C3714(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  int64_t v9 = v4 + 2;
  size_t result = swift_beginAccess();
  int64_t v11 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  int64_t v12 = v4[2];
  int64_t v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int64_t v14 = v13 + a4;
  if (__OFADD__(v13, a4))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  size_t result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  BOOL v15 = __OFSUB__(a4, v11);
  uint64_t v16 = a4 - v11;
  if (v15)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v12 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_2192C4788(a2, v12, v16);
  size_t result = (size_t)sub_2192C48C4(a3, a4, a1);
  uint64_t v17 = v4[2];
  uint64_t v18 = v17 + v16;
  if (!__OFADD__(v17, v16))
  {
    size_t result = swift_beginAccess();
    *int64_t v9 = v18;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_2192C3820(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  int64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v14);
  BOOL v15 = v5 + 2;
  uint64_t result = swift_beginAccess();
  int64_t v17 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }
  int64_t v27 = a2;
  int64_t v18 = *v15 - v17;
  if (__OFSUB__(*v15, v17))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t result = sub_2192D94F0();
  BOOL v19 = __OFADD__(v18, result);
  int64_t v20 = v18 + result;
  if (v19)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v26 = a1;
  int64_t v21 = _swift_stdlib_malloc_size(v5) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a4);
  if (v21 < v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t result = sub_2192D94F0();
  uint64_t v22 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t result = v27;
  if (*v15 < v27)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_2192C4788(v27, *v15, v22);
  sub_2192C4980(a3, v26, a4);
  uint64_t result = sub_2192D94F0();
  uint64_t v23 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  BOOL v19 = __OFADD__(*v15, v23);
  int64_t v24 = *v15 + v23;
  if (!v19)
  {
    *BOOL v15 = v24;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_2192C3A08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  int64_t v12 = &v16[-v11];
  int64_t v17 = v3;
  uint64_t result = sub_2192D94D0();
  if (v18 == 1)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    sub_2192D94C0();
    swift_getAssociatedConformanceWitness();
    sub_2192D9580();
    if ((v20 & 1) == 0)
    {
      size_t v14 = v19;
      do
      {
        uint64_t v15 = *v3;
        swift_beginAccess();
        sub_2192C30F8(*(void *)(v15 + 16), *(void *)(v15 + 16), v14);
        sub_2192D9580();
        size_t v14 = v19;
      }
      while (v20 != 1);
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_2192C3C78@<X0>(void *a1@<X8>)
{
  if (qword_267C16520 != -1) {
    swift_once();
  }
  *a1 = qword_267C16550;
  return swift_retain();
}

uint64_t sub_2192C3CE4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_2192C3444(*a1, a1[1], a2, a3);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);
  return v5(a2, a3);
}

uint64_t sub_2192C3D68@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_2192C5AB0(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2192C3D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E2D0](a1, a4, a2, a5, a3);
}

uint64_t sub_2192C3DAC(unsigned __int8 *a1)
{
  uint64_t v2 = *v1;
  size_t v3 = *a1;
  swift_beginAccess();
  return sub_2192C30F8(*(void *)(v2 + 16), *(void *)(v2 + 16), v3);
}

uint64_t sub_2192C3E08(uint64_t a1, uint64_t a2)
{
  sub_2192C3A08(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8);
  return v4(a1, a2);
}

uint64_t sub_2192C3E74(unsigned __int8 *a1, int64_t *a2)
{
  return sub_2192C30F8(*a2, *a2, *a1);
}

uint64_t sub_2192C3E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9E2A0](a1, a2, a5, a3, a6, a4);
}

uint64_t sub_2192C3E9C@<X0>(int64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  int64_t v4 = *a1;
  uint64_t v5 = *v2;
  uint64_t result = swift_beginAccess();
  if (!*(void *)(v5 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }
  int64_t v7 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 >= v4)
  {
    char v8 = *(unsigned char *)(v5 + v4 + 32);
    uint64_t result = sub_2192C58BC(v4, v7);
    *a2 = v8;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2192C3F20(int64_t *a1)
{
  return sub_2192C58BC(*a1, a1[1]);
}

void sub_2192C3F2C(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_2192C3F38()
{
  return 0;
}

int64_t sub_2192C3F40@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  char v6 = *(unsigned char *)(v3 + 32);
  int64_t result = sub_2192C299C(0, 1, v5, v3);
  if ((v7 & 1) == 0)
  {
    if ((result & 0x8000000000000000) == 0)
    {
      int64_t result = sub_2192C58BC(0, result);
      *a1 = v6;
      return result;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

int64_t sub_2192C3FCC(int64_t result)
{
  if (result)
  {
    uint64_t v2 = result;
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v3 = *v1;
      swift_beginAccess();
      int64_t result = sub_2192C299C(0, v2, *(void *)(v3 + 16), v3);
      if (v4)
      {
LABEL_9:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) == 0) {
        return sub_2192C58BC(0, result);
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_2192C4054(char a1)
{
  uint64_t v2 = *v1;
  if (a1)
  {
    swift_beginAccess();
    int64_t v3 = *(void *)(v2 + 16);
    if ((v3 & 0x8000000000000000) == 0) {
      return sub_2192C58BC(0, v3);
    }
    __break(1u);
    goto LABEL_9;
  }
  swift_release();
  if (qword_267C16520 != -1) {
LABEL_9:
  }
    swift_once();
  *uint64_t v1 = qword_267C16550;
  return swift_retain();
}

uint64_t sub_2192C410C(uint64_t (*a1)(char *))
{
  return sub_2192C4124(a1);
}

uint64_t sub_2192C4124(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)(*v1 + 16);
  swift_retain();
  uint64_t result = swift_beginAccess();
  int64_t v7 = 0;
  uint64_t v8 = v4 + 32;
  do
  {
    if (__OFSUB__(*v5, v7))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v7 == *v5) {
      goto LABEL_9;
    }
    char v12 = *(unsigned char *)(v4 + v7 + 32);
    uint64_t result = a1(&v12);
    if (v2) {
      return swift_release();
    }
    if (result)
    {
      uint64_t result = swift_release();
      int64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      while (!__OFSUB__(*v5, v10))
      {
        if (*v5 == v10)
        {
          if (v10 < v7) {
            goto LABEL_29;
          }
          return sub_2192C58BC(v7, v10);
        }
        char v12 = *(unsigned char *)(v8 + v10);
        uint64_t result = a1(&v12);
        if ((result & 1) == 0)
        {
          if (__OFSUB__(v10, v7)) {
            goto LABEL_28;
          }
          if (v10 != v7)
          {
            char v11 = *(unsigned char *)(v8 + v7);
            *(unsigned char *)(v8 + v7) = *(unsigned char *)(v8 + v10);
            *(unsigned char *)(v8 + v10) = v11;
          }
LABEL_14:
          BOOL v9 = __OFADD__(v7++, 1);
          if (v9) {
            goto LABEL_27;
          }
        }
        BOOL v9 = __OFADD__(v10++, 1);
        if (v9) {
          goto LABEL_26;
        }
      }
      goto LABEL_25;
    }
    BOOL v9 = __OFADD__(v7++, 1);
  }
  while (!v9);
  __break(1u);
LABEL_9:
  swift_release();
  int64_t v10 = *(void *)(v4 + 16);
  int64_t v7 = v10;
  return sub_2192C58BC(v7, v10);
}

uint64_t sub_2192C42B4(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3 + 32, a3 + 32 + *(void *)(a3 + 16));
}

uint64_t sub_2192C4330(uint64_t (*a1)(uint64_t, uint64_t))
{
  swift_beginAccess();
  return a1(v1 + 32, v1 + 32 + *(void *)(v1 + 16));
}

uint64_t sub_2192C43A8@<X0>(uint64_t (*a1)(uint64_t, void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t result = a1(v3 + 32, *(void *)(v3 + 16));
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 0, 1, a2);
  }
  return result;
}

uint64_t sub_2192C4464(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  return sub_2192C42B4(a1, a2, *v2);
}

uint64_t sub_2192C4480@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_retain();
}

uint64_t sub_2192C448C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MEMORY[0x270EEE270](a1, a2, a7, a3, a4, a8, a5, a6);
}

uint64_t sub_2192C44B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MEMORY[0x270EEE2A8](a1, a2, a7, a3, a4, a8, a5, a6);
}

uint64_t sub_2192C44D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EEE288](a1, a2, a3, a5, a4);
}

uint64_t sub_2192C44E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return MEMORY[0x270EEE280](a1, a2, a3, a6, a4, a7, a5);
}

uint64_t sub_2192C4500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MEMORY[0x270EEE278](a1, a2, a3, a7, a4, a5, a8, a6);
}

uint64_t sub_2192C451C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EEF210](a1, a4, a2, a5, a3);
}

uint64_t sub_2192C4534()
{
  return sub_2192D9700();
}

uint64_t sub_2192C457C()
{
  return sub_2192D96F0();
}

uint64_t sub_2192C45A8()
{
  return sub_2192D9700();
}

void *sub_2192C45EC(void *result, void *a2)
{
  if (!__OFSUB__(*a2, *result)) {
    return (void *)(*a2 == *result);
  }
  __break(1u);
  return result;
}

BOOL sub_2192C4608(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_2192C461C(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_2192C4630(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_2192C4644(void *a1, void *a2)
{
  return *a2 < *a1;
}

void *sub_2192C4658@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, *v2)) {
    __break(1u);
  }
  else {
    *a2 = *result - *v2;
  }
  return result;
}

void *sub_2192C4674@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*v2, *result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 + *result;
  }
  return result;
}

void *sub_2192C4690(void *result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  if (__OFADD__(*a4, *a6))
  {
    __break(1u);
  }
  else
  {
    *uint64_t result = *a4 + *a6;
    return 0;
  }
  return result;
}

uint64_t sub_2192C46B4()
{
  swift_beginAccess();
  memset_s((void *)(v0 + 32), *(void *)(v0 + 24), 0, *(void *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_2192C4708()
{
  return type metadata accessor for SecureBytes.Backing();
}

ValueMetadata *type metadata accessor for SecureBytes()
{
  return &type metadata for SecureBytes;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SecureBytes.BackingHeader()
{
  return &type metadata for SecureBytes.BackingHeader;
}

size_t sub_2192C4788(size_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  size_t v7 = result;
  __n128 result = _swift_stdlib_malloc_size(v4);
  uint64_t v8 = v7 + a3;
  if (__OFADD__(v7, a3))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  BOOL v9 = __OFADD__(a2, a3);
  uint64_t v10 = a2 + a3;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < v8)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v8 < 1 || (uint64_t)(result - 32) < a2) {
    goto LABEL_15;
  }
  __n128 result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v10)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  _swift_stdlib_malloc_size(v4);
  return (size_t)memmove(&v4[v8 + 32], &v4[v7 + 32], a2 - v7);
}

size_t sub_2192C4850(size_t result, int64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  int64_t v4 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  char v5 = result;
  __n128 result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 >= a2)
  {
    __n128 result = _swift_stdlib_malloc_size(v2);
    *((unsigned char *)v2 + a2 + 32) = v5;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

void *sub_2192C48C4(void *result, size_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v6 = a3 + a2;
  if (__OFADD__(a3, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  size_t v7 = v3;
  uint64_t v8 = result;
  __n128 result = (void *)_swift_stdlib_malloc_size(v7);
  if ((uint64_t)result - 32 < v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v6 < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __n128 result = (void *)_swift_stdlib_malloc_size(v7);
  if (!v8) {
    return result;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  return memmove(&v7[a3 + 32], v8, a2);
}

uint64_t sub_2192C4980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t result = MEMORY[0x270FA5388](a1);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v12 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, a3);
  uint64_t result = sub_2192D94F0();
  int64_t v13 = a2 + result;
  if (__OFADD__(a2, result))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  int64_t v14 = _swift_stdlib_malloc_size(v4) - 32;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a3);
  if (v14 < v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = sub_2192D94F0();
  if (__OFADD__(a2, result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (a2 + result >= a2)
  {
    _swift_stdlib_malloc_size(v4);
    return sub_2192D9590();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2192C4AFC(uint64_t (*a1)(uint64_t, uint64_t))
{
  return sub_2192C4330(a1);
}

unint64_t sub_2192C4B24()
{
  unint64_t result = qword_267C16568;
  if (!qword_267C16568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16568);
  }
  return result;
}

uint64_t sub_2192C4B78()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_2192C4B84()
{
  return MEMORY[0x263F8D720];
}

unint64_t sub_2192C4B94()
{
  unint64_t result = qword_267C16570;
  if (!qword_267C16570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16570);
  }
  return result;
}

unint64_t sub_2192C4BEC()
{
  unint64_t result = qword_267C16578;
  if (!qword_267C16578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16578);
  }
  return result;
}

unint64_t sub_2192C4C44()
{
  unint64_t result = qword_267C16580;
  if (!qword_267C16580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16580);
  }
  return result;
}

unint64_t sub_2192C4C9C()
{
  unint64_t result = qword_267C16588;
  if (!qword_267C16588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16588);
  }
  return result;
}

unint64_t sub_2192C4CF4()
{
  unint64_t result = qword_267C16590;
  if (!qword_267C16590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16590);
  }
  return result;
}

uint64_t sub_2192C4D48()
{
  return sub_2192C5330(&qword_267C16598, &qword_267C165A0);
}

uint64_t sub_2192C4D84()
{
  return sub_2192C514C(&qword_267C165A8, (void (*)(void))sub_2192C4BEC);
}

unint64_t sub_2192C4DD0()
{
  unint64_t result = qword_267C165B8;
  if (!qword_267C165B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C165B8);
  }
  return result;
}

uint64_t sub_2192C4E24()
{
  return sub_2192C514C(&qword_267C165C0, (void (*)(void))sub_2192C4DD0);
}

unint64_t sub_2192C4E70()
{
  unint64_t result = qword_267C165C8;
  if (!qword_267C165C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C165C8);
  }
  return result;
}

uint64_t sub_2192C4EC4()
{
  return sub_2192C514C(&qword_267C165D0, (void (*)(void))sub_2192C4C9C);
}

uint64_t sub_2192C4F0C()
{
  return sub_2192C514C(&qword_267C165D8, (void (*)(void))sub_2192C4C44);
}

unint64_t sub_2192C4F58()
{
  unint64_t result = qword_267C165E0;
  if (!qword_267C165E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C165E0);
  }
  return result;
}

uint64_t sub_2192C4FAC()
{
  return sub_2192C5284(&qword_267C165E8);
}

unint64_t sub_2192C4FE0()
{
  unint64_t result = qword_267C165F8;
  if (!qword_267C165F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C165F8);
  }
  return result;
}

unint64_t sub_2192C5034()
{
  unint64_t result = qword_267C16600;
  if (!qword_267C16600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16600);
  }
  return result;
}

uint64_t sub_2192C5088()
{
  return sub_2192C514C(&qword_267C16608, (void (*)(void))sub_2192C4CF4);
}

uint64_t sub_2192C50D0()
{
  return sub_2192C5284(&qword_267C16610);
}

uint64_t sub_2192C5104()
{
  return sub_2192C514C(&qword_267C16618, (void (*)(void))sub_2192C4F58);
}

uint64_t sub_2192C514C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C165B0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2192C51BC()
{
  return sub_2192C5330(&qword_267C16620, &qword_267C16628);
}

unint64_t sub_2192C51FC()
{
  unint64_t result = qword_267C16630;
  if (!qword_267C16630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16630);
  }
  return result;
}

uint64_t sub_2192C5250()
{
  return sub_2192C5284(&qword_267C16638);
}

uint64_t sub_2192C5284(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C165F0);
    sub_2192C4FE0();
    sub_2192C5034();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2192C52F4()
{
  return sub_2192C5330(&qword_267C16640, &qword_267C165B0);
}

uint64_t sub_2192C5330(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2192C5374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = a2 - a1;
  if (a1) {
    uint64_t v7 = a2 - a1;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7 != *(void *)(a3 + 16)) {
    return 0;
  }
  if (a1) {
    return cc_cmp_safe() == 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2192C5404(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = swift_beginAccess();
  uint64_t v13 = *(void *)(v11 + 16);
  if (v13 < 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (a2 < 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v13 < a3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (__OFSUB__(a3, a2))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (a3 != a2)
  {
    if (__OFSUB__(a5, a4))
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a5 == a4)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    while (a4 < a5)
    {
      *(unsigned char *)(v11 + 32 + a2) = *(unsigned char *)(a6 + 32 + a4);
      uint64_t v14 = a2 + 1;
      if (__OFADD__(a2, 1)) {
        goto LABEL_19;
      }
      if (__OFSUB__(a3, v14)) {
        goto LABEL_20;
      }
      ++a4;
      if (v14 == a3) {
        goto LABEL_6;
      }
      if (__OFSUB__(a5, a4)) {
        goto LABEL_21;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_6:
  if (__OFSUB__(a5, a4))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_2192C551C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  if (v2 <= 0)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16648);
    uint64_t v3 = swift_allocObject();
    size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = 2 * v4 - 64;
  }
  uint64_t v5 = sub_2192C2B80((uint64_t)&v7, (unsigned char *)(v3 + 32), v2, a1);
  swift_retain();
  uint64_t result = swift_release();
  if (v5 == v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2192C55FC(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = v4 + 32;
  uint64_t v8 = v4 + 31;
  do
  {
    char v14 = *(unsigned char *)(v7 + v6);
    char v9 = a1(&v14);
    if (v2) {
      break;
    }
    if (v9)
    {
      if (v6 >= v5 - 1) {
        return v6;
      }
      while (1)
      {
        char v14 = *(unsigned char *)(v8 + v5);
        uint64_t result = a1(&v14);
        uint64_t v11 = v5 - 1;
        if ((result & 1) == 0) {
          break;
        }
        uint64_t v12 = v5 - 2;
        if (__OFSUB__(v11, 1))
        {
          __break(1u);
          goto LABEL_17;
        }
        --v5;
        if (v6 >= v12) {
          return v6;
        }
      }
      if (!__OFSUB__(v11, v6))
      {
        char v13 = *(unsigned char *)(v7 + v6);
        *(unsigned char *)(v7 + v6) = *(unsigned char *)(v8 + v5);
        *(unsigned char *)(v8 + v5--) = v13;
        goto LABEL_3;
      }
LABEL_17:
      __break(1u);
      return result;
    }
LABEL_3:
    ++v6;
  }
  while (v6 < v5);
  return v6;
}

size_t sub_2192C5730()
{
  size_t v1 = _swift_stdlib_malloc_size(v0) - 32;
  size_t result = swift_beginAccess();
  int64_t v3 = v0[2];
  if (__OFSUB__(v1, v3))
  {
    __break(1u);
    goto LABEL_6;
  }
  if (((v1 - v3) & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  size_t result = _swift_stdlib_malloc_size(v0);
  if ((uint64_t)(result - 32) >= v3)
  {
    v0[2] = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

size_t sub_2192C57B4(int64_t a1, int64_t a2)
{
  uint64_t v5 = v2 + 2;
  size_t result = swift_beginAccess();
  int64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }
  int64_t v8 = v2[2];
  if (__OFSUB__(v8, v7))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v8 - v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  BOOL v9 = __OFSUB__(0, v7);
  uint64_t v10 = a1 - a2;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v8 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  size_t result = sub_2192C4788(a2, v8, v10);
  if (a1 < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  size_t result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < a1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t result = _swift_stdlib_malloc_size(v2);
  uint64_t v11 = v2[2];
  uint64_t v12 = v11 + v10;
  if (!__OFADD__(v11, v10))
  {
    size_t result = swift_beginAccess();
    *uint64_t v5 = v12;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_2192C58BC(int64_t a1, int64_t a2)
{
  int64_t v3 = v2;
  uint64_t v6 = (char *)*v2 + 16;
  uint64_t result = swift_beginAccess();
  int64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = *v6 - v8;
  if (__OFSUB__(*v6, v8))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t result = _swift_stdlib_malloc_size(*v3);
    if (result - 32 >= v9)
    {
      if (a2 >= a1) {
        return sub_2192C57B4(a1, a2);
      }
      goto LABEL_24;
    }
  }
  if (v9 < 0) {
    goto LABEL_20;
  }
  if (HIDWORD(v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v9)
  {
    unsigned int v10 = (v9 - 1) | ((v9 - 1) >> 1) | (((v9 - 1) | ((v9 - 1) >> 1)) >> 2);
    unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    int v12 = v11 | HIWORD(v11);
    if (v12 == -1) {
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v13 = (v12 + 1);
    }
  }
  else
  {
    uint64_t v13 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = v13;
  if (a1 < 0) {
    goto LABEL_22;
  }
  char v14 = (const void *)result;
  uint64_t v15 = (char *)*v3;
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *((void *)v15 + 2);
  if (v16 < a2)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }
  sub_2192C22F0(v15, 0, a1);
  sub_2192C5730();
  sub_2192C22F0((char *)*v3, a2, v16);
  const void *v3 = v14;
  return swift_release();
}

uint64_t sub_2192C5A3C(void *a1, size_t a2)
{
  uint64_t v5 = **(void **)(v2 + 16);
  swift_beginAccess();
  return sub_2192C3298(*(void *)(v5 + 16), *(void *)(v5 + 16), a1, a2);
}

uint64_t sub_2192C5AB0(size_t a1, uint64_t a2)
{
  if (qword_267C16520 != -1) {
    swift_once();
  }
  uint64_t result = qword_267C16550;
  uint64_t v5 = qword_267C16550;
  if (!a2) {
    return swift_retain();
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    do
    {
      swift_beginAccess();
      sub_2192C30F8(*(void *)(v5 + 16), *(void *)(v5 + 16), a1);
      --a2;
    }
    while (a2);
    return v5;
  }
  return result;
}

ValueMetadata *type metadata accessor for SecureBytes.Index()
{
  return &type metadata for SecureBytes.Index;
}

uint64_t HandshakeState.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 84);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_2192D9530();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t HandshakeState.e.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 84);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_2192D9530();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*HandshakeState.e.modify())()
{
  return nullsub_1;
}

uint64_t HandshakeState.init(handshakePattern:isInitiator:prologue:psk:responderStaticPriv:responderStaticPublic:initiatorStaticPriv:initiatorStaticPublic:)@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, unint64_t a12, unint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v149 = a8;
  uint64_t v150 = a7;
  uint64_t v151 = a6;
  uint64_t v147 = a5;
  uint64_t v158 = a3;
  unint64_t v159 = a4;
  int v146 = a2;
  uint64_t v160 = a16;
  unint64_t v145 = a13;
  unint64_t v144 = a12;
  uint64_t v142 = a15;
  uint64_t v148 = a10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v153 = sub_2192D9530();
  uint64_t v155 = *(void *)(v153 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v153);
  v132 = (char *)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v130 = (char *)&v125 - v22;
  uint64_t v23 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v131 = (char *)&v125 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v128 = (char *)&v125 - v26;
  uint64_t v143 = a14;
  uint64_t v156 = a11;
  swift_getAssociatedConformanceWitness();
  uint64_t v27 = swift_getAssociatedTypeWitness();
  uint64_t v152 = sub_2192D9530();
  uint64_t v157 = *(void *)(v152 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v152);
  v129 = (char *)&v125 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v126 = (char *)&v125 - v31;
  uint64_t v32 = *(void *)(v27 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  v127 = (char *)&v125 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  v125 = (char *)&v125 - v35;
  unsigned int v154 = *a1;
  unint64_t v36 = *((void *)a1 + 1);
  *(_OWORD *)(a9 + 8) = 0u;
  *(_OWORD *)(a9 + 24) = 0u;
  uint64_t v37 = a9;
  uint64_t v38 = v144;
  uint64_t v163 = a11;
  unint64_t v164 = v144;
  unint64_t v39 = v145;
  uint64_t v165 = v145;
  uint64_t v166 = a14;
  uint64_t v167 = a15;
  uint64_t v168 = v160;
  uint64_t v40 = (int *)type metadata accessor for HandshakeState();
  uint64_t v41 = (char *)(v37 + v40[20]);
  uint64_t v140 = v23;
  uint64_t v43 = *(void (**)(void))(v23 + 56);
  uint64_t v42 = v23 + 56;
  v136 = v41;
  v43();
  uint64_t v44 = v37 + v40[21];
  uint64_t v141 = AssociatedTypeWitness;
  v137 = v43;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v43)(v44, 1, 1, AssociatedTypeWitness);
  uint64_t v45 = (char *)(v37 + v40[22]);
  uint64_t v138 = v32;
  uint64_t v46 = *(void (**)(void))(v32 + 56);
  v134 = v45;
  v46();
  uint64_t v47 = v37 + v40[23];
  uint64_t v139 = v27;
  v135 = v46;
  uint64_t v133 = v32 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v46)(v47, 1, 1, v27);
  uint64_t v48 = v154;
  LOBYTE(v163) = v154;
  unint64_t v161 = v36;
  unint64_t v164 = v36;
  uint64_t v49 = v142;
  uint64_t v50 = v160;
  uint64_t v51 = sub_2192C6B9C((unsigned __int8 *)&v163, v156, v38, v39, v143, v142, v160);
  uint64_t v156 = (uint64_t)v40;
  uint64_t v52 = v37 + v40[25];
  uint64_t v53 = *(void *)(v50 + 8);
  sub_2192D4770(v51, v54, v38, v39, v49, v53, v52);
  uint64_t v163 = v38;
  unint64_t v164 = v39;
  uint64_t v165 = v49;
  uint64_t v166 = v53;
  uint64_t v55 = type metadata accessor for SymmetricState();
  sub_2192D4B64(v158, v159, v55);
  char v56 = v146;
  *(unsigned char *)(v37 + 1) = v146;
  if (v56)
  {
    uint64_t v160 = v42;
    LOBYTE(v163) = v48;
    sub_2192D1184();
    uint64_t v57 = v48;
    uint64_t v58 = v157;
    uint64_t v59 = v141;
    if (v60)
    {
      uint64_t v52 = (uint64_t)v126;
      unint64_t v61 = v152;
      (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v126, v150, v152);
      uint64_t v62 = v138;
      uint64_t v63 = v139;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v138 + 48))(v52, 1, v139) == 1) {
        goto LABEL_42;
      }
      v64 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 32);
      v65 = v125;
      v64(v125, v52, v63);
      uint64_t v66 = *(void (**)(uint64_t, unint64_t))(v58 + 8);
      uint64_t v67 = v134;
      v66((uint64_t)v134, v61);
      v64(v67, (uint64_t)v65, v63);
      ((void (*)(char *, void, uint64_t, uint64_t))v135)(v67, 0, 1, v63);
    }
    LOBYTE(v163) = v57;
    sub_2192D1584();
    if (v68)
    {
      uint64_t v69 = v155;
      v70 = v132;
      uint64_t v71 = v153;
      (*(void (**)(char *, uint64_t, uint64_t))(v155 + 16))(v132, v149, v153);
      uint64_t v72 = v140;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v140 + 48))(v70, 1, v59) == 1)
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
        uint64_t v163 = 0;
        unint64_t v164 = 0xE000000000000000;
        sub_2192D95C0();
        sub_2192D9450();
        char v162 = v154;
        sub_2192D95F0();
        sub_2192D9450();
        goto LABEL_46;
      }
      uint64_t v73 = v59;
      v74 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
      v75 = v131;
      v74(v131, v70, v73);
      v76 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
      v77 = v136;
      v76((uint64_t)v136, v71);
      v74(v77, v75, v73);
      ((void (*)(char *, void, uint64_t, uint64_t))v137)(v77, 0, 1, v73);
      uint64_t v57 = v154;
    }
  }
  else
  {
    LOBYTE(v163) = v48;
    sub_2192D1350();
    uint64_t v57 = v48;
    if (v78)
    {
      uint64_t v79 = v155;
      uint64_t v52 = (uint64_t)v130;
      uint64_t v80 = v153;
      (*(void (**)(char *, uint64_t, uint64_t))(v155 + 16))(v130, v151, v153);
      uint64_t v81 = v140;
      uint64_t v82 = v141;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v140 + 48))(v52, 1, v141) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v52, v80);
        uint64_t v163 = 0;
        unint64_t v164 = 0xE000000000000000;
        sub_2192D95C0();
        sub_2192D9450();
        char v162 = v154;
        sub_2192D95F0();
        sub_2192D9450();
        goto LABEL_46;
      }
      v83 = *(void (**)(char *, uint64_t, uint64_t))(v81 + 32);
      v84 = v128;
      v83(v128, v52, v82);
      v85 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
      v86 = v136;
      v85((uint64_t)v136, v80);
      v83(v86, (uint64_t)v84, v82);
      ((void (*)(char *, void, uint64_t, uint64_t))v137)(v86, 0, 1, v82);
      uint64_t v57 = v154;
    }
    LOBYTE(v163) = v57;
    sub_2192D16AC();
    uint64_t v87 = v157;
    if (v88)
    {
      v89 = v129;
      uint64_t v90 = v152;
      (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v129, v148, v152);
      uint64_t v91 = v138;
      uint64_t v92 = v139;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v138 + 48))(v89, 1, v139) == 1)
      {
        (*(void (**)(char *, uint64_t))(v87 + 8))(v89, v90);
        uint64_t v163 = 0;
        unint64_t v164 = 0xE000000000000000;
        sub_2192D95C0();
        sub_2192D9450();
        char v162 = v57;
        sub_2192D95F0();
        sub_2192D9450();
        goto LABEL_46;
      }
      v93 = *(void (**)(char *, char *, uint64_t))(v91 + 32);
      uint64_t v52 = (uint64_t)v127;
      v93(v127, v89, v92);
      v94 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
      v95 = v134;
      v94((uint64_t)v134, v90);
      v93(v95, (char *)v52, v92);
      ((void (*)(char *, void, uint64_t, uint64_t))v135)(v95, 0, 1, v92);
    }
  }
  uint64_t v58 = v57;
  LOBYTE(v163) = v57;
  uint64_t v96 = sub_2192D1FA0();
  unint64_t v61 = v97;
  uint64_t v99 = v98;
  uint64_t v101 = v100;
  uint64_t v163 = v96;
  unint64_t v164 = v97;
  uint64_t v165 = v98;
  uint64_t v166 = v100;
  if (v161)
  {
    uint64_t v102 = *(void *)(v161 + 16);
    if (v102)
    {
      v103 = (char *)(v161 + 32);
      swift_bridgeObjectRetain();
      do
      {
        char v104 = *v103++;
        char v162 = v104;
        sub_2192D33B0(&v162, &v163);
        --v102;
      }
      while (v102);
      uint64_t v96 = v163;
      unint64_t v61 = v164;
      uint64_t v99 = v165;
      uint64_t v101 = v166;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v105 = v161;
  v106 = (uint64_t *)(v37 + *(int *)(v156 + 96));
  uint64_t *v106 = v96;
  v106[1] = v61;
  v106[2] = v99;
  v106[3] = v101;
  *(unsigned char *)uint64_t v37 = 0;
  uint64_t v57 = v155;
  uint64_t v107 = v147;
  if (v105)
  {
    if (!v147) {
      goto LABEL_41;
    }
    uint64_t v108 = *(void *)(v105 + 16);
    if (v108 != *(void *)(v147 + 16)) {
      goto LABEL_38;
    }
    unint64_t v61 = v147 + 32;
    swift_unknownObjectRelease();
    *(void *)(v37 + 8) = v107;
    *(void *)(v37 + 16) = v107 + 32;
    *(void *)(v37 + 24) = 0;
    *(void *)(v37 + 32) = (2 * v108) | 1;
    if (v108)
    {
      v109 = (uint64_t *)(v107 + 40);
      while (1)
      {
        uint64_t v110 = *(v109 - 1);
        uint64_t v111 = *v109;
        unint64_t v112 = (unint64_t)*v109 >> 62;
        v109 += 2;
        switch(v112)
        {
          case 1uLL:
            BOOL v113 = __OFSUB__(HIDWORD(v110), v110);
            LODWORD(v110) = HIDWORD(v110) - v110;
            if (v113)
            {
              __break(1u);
LABEL_37:
              __break(1u);
LABEL_38:
              __break(1u);
LABEL_39:
              __break(1u);
LABEL_40:
              __break(1u);
LABEL_41:
              __break(1u);
LABEL_42:
              (*(void (**)(uint64_t, unint64_t))(v58 + 8))(v52, v61);
              uint64_t v163 = 0;
              unint64_t v164 = 0xE000000000000000;
              sub_2192D95C0();
              sub_2192D9450();
              char v162 = v57;
              sub_2192D95F0();
              sub_2192D9450();
LABEL_46:
              sub_2192D9600();
              __break(1u);
              JUMPOUT(0x2192C6B74);
            }
            uint64_t v110 = (int)v110;
LABEL_30:
            if (v110 != 32) {
              goto LABEL_40;
            }
            if (!--v108) {
              goto LABEL_35;
            }
            break;
          case 2uLL:
            uint64_t v116 = v110 + 16;
            uint64_t v114 = *(void *)(v110 + 16);
            uint64_t v115 = *(void *)(v116 + 8);
            BOOL v113 = __OFSUB__(v115, v114);
            uint64_t v110 = v115 - v114;
            if (!v113) {
              goto LABEL_30;
            }
            goto LABEL_37;
          case 3uLL:
            goto LABEL_40;
          default:
            uint64_t v110 = BYTE6(v111);
            goto LABEL_30;
        }
      }
    }
  }
  else if (v147)
  {
    uint64_t v117 = *(void *)(v147 + 16);
    swift_bridgeObjectRelease();
    if (v117) {
      goto LABEL_39;
    }
  }
LABEL_35:
  LOBYTE(v163) = v58;
  sub_2192D1878();
  char v119 = v118;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v37 + 2) = v119 & 1;
  LOBYTE(v163) = v58;
  sub_2192C6FFC((char *)&v163, v156);
  sub_2192C1220(v158, v159);
  v120 = *(void (**)(uint64_t, uint64_t))(v157 + 8);
  uint64_t v121 = v152;
  v120(v148, v152);
  v122 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
  uint64_t v123 = v153;
  v122(v149, v153);
  v120(v150, v121);
  return ((uint64_t (*)(uint64_t, uint64_t))v122)(v151, v123);
}

uint64_t type metadata accessor for HandshakeState()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2192C6B9C(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v40 = a4;
  uint64_t v41 = a7;
  uint64_t v38 = a3;
  uint64_t v39 = a6;
  uint64_t v36 = a2;
  uint64_t v37 = a5;
  uint64_t v8 = sub_2192D93D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unsigned int v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v12 = *a1;
  uint64_t v13 = *((void *)a1 + 1);
  if (v13)
  {
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      HIDWORD(v34) = *a1;
      uint64_t v35 = v8;
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
      uint64_t v16 = (char *)MEMORY[0x263F8EE78];
      do
      {
        unint64_t v17 = 0xE400000000000000;
        uint64_t v18 = 812348272;
        switch(*(unsigned char *)(v13 + v15 + 32))
        {
          case 1:
            uint64_t v18 = 829125488;
            break;
          case 2:
            uint64_t v18 = 845902704;
            break;
          case 3:
            uint64_t v18 = 862679920;
            break;
          case 4:
            unint64_t v17 = 0xE800000000000000;
            uint64_t v18 = 0x6B6361626C6C6166;
            break;
          default:
            break;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v16 = sub_2192D7778(0, *((void *)v16 + 2) + 1, 1, v16);
        }
        unint64_t v20 = *((void *)v16 + 2);
        unint64_t v19 = *((void *)v16 + 3);
        if (v20 >= v19 >> 1) {
          uint64_t v16 = sub_2192D7778((char *)(v19 > 1), v20 + 1, 1, v16);
        }
        ++v15;
        *((void *)v16 + 2) = v20 + 1;
        uint64_t v21 = &v16[16 * v20];
        *((void *)v21 + 4) = v18;
        *((void *)v21 + 5) = v17;
      }
      while (v14 != v15);
      swift_bridgeObjectRelease();
      uint64_t v8 = v35;
      unsigned __int8 v12 = BYTE4(v34);
    }
    else
    {
      uint64_t v16 = (char *)MEMORY[0x263F8EE78];
    }
    uint64_t v42 = (uint64_t)v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16658);
    sub_2192CE3B4();
    sub_2192D9380();
    swift_bridgeObjectRelease();
  }
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  sub_2192D95C0();
  swift_bridgeObjectRelease();
  uint64_t v42 = 0x5F6573696F4ELL;
  unint64_t v43 = 0xE600000000000000;
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v23 = sub_2192D37AC(v12);
  if ((v24 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v25 = (uint64_t *)(*(void *)(v22 + 56) + 32 * v23);
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v29 = v25[2];
  uint64_t v28 = v25[3];
  swift_bridgeObjectRetain();
  MEMORY[0x21D486B80](v26, v27, v29, v28);
  swift_bridgeObjectRelease();
  sub_2192D9450();
  swift_bridgeObjectRelease();
  sub_2192D9450();
  swift_bridgeObjectRelease();
  sub_2192D9450();
  (*(void (**)(void))(v37 + 24))();
  sub_2192D9450();
  swift_bridgeObjectRelease();
  sub_2192D9450();
  (*(void (**)(void))(v39 + 48))();
  sub_2192D9450();
  swift_bridgeObjectRelease();
  sub_2192D9450();
  (*(void (**)(void))(v41 + 16))();
  sub_2192D9450();
  swift_bridgeObjectRelease();
  sub_2192D93C0();
  uint64_t v30 = sub_2192D93B0();
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v32 >> 60 == 15)
  {
LABEL_26:
    __break(1u);
    JUMPOUT(0x2192C6FE8);
  }
  return v30;
}

void sub_2192C6FFC(char *a1, uint64_t a2)
{
  uint64_t v49 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_2192D9530();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v43 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v42 - v8;
  uint64_t v44 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8) + 8);
  uint64_t v47 = swift_getAssociatedTypeWitness();
  uint64_t v48 = sub_2192D9530();
  uint64_t v50 = *(void *)(v48 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v48);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v42 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v42 - v24;
  char v26 = *a1;
  if (*(unsigned char *)(v2 + 1) != 1)
  {
    uint64_t v42 = v23;
    char v54 = v26;
    sub_2192D16AC();
    uint64_t v30 = v48;
    if (v34)
    {
      uint64_t v35 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v13, v2 + *(int *)(v49 + 88), v48);
      uint64_t v36 = v47;
      uint64_t v37 = *(void *)(v47 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v13, 1, v47) == 1)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v16, v13, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v16, 0, 1, v36);
      sub_2192C76B4((uint64_t)v16, v35);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v30);
    }
    char v53 = v26;
    sub_2192D1184();
    uint64_t v38 = v2;
    uint64_t v27 = v49;
    if ((v39 & 1) == 0) {
      return;
    }
    uint64_t v40 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, v38 + *(int *)(v49 + 80), v46);
    uint64_t v41 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v40, 1, AssociatedTypeWitness) != 1)
    {
      uint64_t v22 = v42;
      sub_2192D9230();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t))(*(void *)(v47 - 8) + 56))(v22, 0, 1);
      goto LABEL_14;
    }
LABEL_19:
    __break(1u);
    return;
  }
  char v52 = *a1;
  sub_2192D16AC();
  uint64_t v27 = v49;
  if (v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v9, v2 + *(int *)(v49 + 80), v46);
    uint64_t v29 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v9, 1, AssociatedTypeWitness) == 1)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    sub_2192D9230();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v9, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t))(*(void *)(v47 - 8) + 56))(v25, 0, 1);
    sub_2192C76B4((uint64_t)v25, v27);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v48);
  }
  char v51 = v26;
  sub_2192D1184();
  uint64_t v30 = v48;
  if ((v31 & 1) == 0) {
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v19, v2 + *(int *)(v27 + 88), v48);
  uint64_t v32 = v47;
  uint64_t v33 = *(void *)(v47 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v19, 1, v47) == 1) {
    goto LABEL_17;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v22, v19, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v22, 0, 1, v32);
LABEL_14:
  sub_2192C76B4((uint64_t)v22, v27);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v22, v30);
}

uint64_t sub_2192C76B4(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_2192D9530();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v18 - v7, a1, v5);
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, AssociatedTypeWitness) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(AssociatedTypeWitness, AssociatedConformanceWitness);
  unint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v8, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(a2 + 48);
  uint64_t v16 = *(void *)(*(void *)(a2 + 56) + 8);
  long long v18 = *(_OWORD *)(a2 + 24);
  uint64_t v19 = v15;
  uint64_t v20 = v16;
  uint64_t v17 = type metadata accessor for SymmetricState();
  sub_2192D4B64(v12, v14, v17);
  return sub_2192C1220(v12, v14);
}

uint64_t sub_2192C792C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a3;
  uint64_t v46 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_2192D9530();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (char *)&v28 - v6;
  uint64_t v7 = sub_2192D91E0();
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v35 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8) + 8);
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_2192D9530();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v38 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  uint64_t v41 = a1;
  LODWORD(a1) = v16(a1, 1, AssociatedTypeWitness);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v37(v15, v46, v10);
  if (a1 == 1
    || (uint64_t v28 = *(void *)(v9 - 8),
        uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48),
        v29(v15, 1, v9) == 1))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    sub_2192C108C();
    swift_allocError();
    *uint64_t v17 = 2;
    return swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  uint64_t v19 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v42, v41, v40);
  uint64_t result = v16((uint64_t)v19, 1, AssociatedTypeWitness);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v20 = v38;
  v37(v38, v46, v10);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v29)(v20, 1, v9);
  if (result == 1)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v22 = (uint64_t)v35;
  uint64_t v21 = v36;
  sub_2192D9220();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v9);
  if (v21) {
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v19, AssociatedTypeWitness);
  }
  (*(void (**)(char *, uint64_t))(v33 + 8))(v19, AssociatedTypeWitness);
  uint64_t v23 = *(void *)(v32 + 48);
  uint64_t v24 = *(void *)(*(void *)(v32 + 56) + 8);
  long long v43 = *(_OWORD *)(v32 + 24);
  uint64_t v44 = v23;
  uint64_t v45 = v24;
  uint64_t v25 = type metadata accessor for SymmetricState();
  sub_2192CE35C();
  char v26 = (void *)v25;
  uint64_t v27 = v31;
  sub_2192D4CE4(v22, v26, v31);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v22, v27);
}

uint64_t HandshakeState.readPayload(_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7 = a3;
  uint64_t v8 = a2;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_25;
      }
      uint64_t v9 = (int)v9;
LABEL_5:
      if (v9 < 0x10000)
      {
LABEL_7:
        uint64_t v42 = a2;
        unint64_t v43 = a3;
        uint64_t v6 = v4 + *(int *)(a4 + 96);
        uint64_t v15 = *(void *)(v6 + 16);
        unint64_t v14 = *(void *)(v6 + 24);
        if (v15 == v14 >> 1)
        {
          sub_2192C108C();
          swift_allocError();
          *uint64_t v16 = 3;
          sub_2192C11C8(v8, v7);
          swift_willThrow();
          goto LABEL_22;
        }
        if (v15 < (uint64_t)(v14 >> 1))
        {
          uint64_t v44 = v4;
          uint64_t v17 = *(void *)v6;
          uint64_t v18 = *(void *)(v6 + 8);
          sub_2192CAE68(v18 + 40 * v15, (uint64_t)v39);
          if (!__OFSUB__(v14 >> 1, v15))
          {
            *(void *)uint64_t v6 = v17;
            *(void *)(v6 + 8) = v18;
            *(void *)(v6 + 16) = v15 + 1;
            *(void *)(v6 + 24) = v14;
            uint64_t v19 = v40;
            uint64_t v20 = v41;
            __swift_project_boxed_opaque_existential_1(v39, v40);
            uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 16);
            sub_2192C11C8(v8, v7);
            uint64_t v22 = v21(v19, v20);
            uint64_t v23 = *(void *)(v22 + 16);
            if (v23)
            {
              uint64_t v24 = 0;
              uint64_t v25 = *(void *)(a4 + 24);
              uint64_t v35 = *(void *)(a4 + 16);
              uint64_t v6 = *(void *)(a4 + 32);
              uint64_t v26 = *(void *)(a4 + 40);
              uint64_t v27 = *(unsigned char **)(a4 + 48);
              uint64_t v28 = *(void *)(a4 + 56);
              while (1)
              {
                LOBYTE(v36) = *(unsigned char *)(v22 + v24 + 32);
                sub_2192C814C(&v36, v44, &v42, v35, v25, (unsigned char *)v6, v26, v27, v28);
                if (v5) {
                  break;
                }
                if (v23 == ++v24)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v8 = v42;
                  unint64_t v7 = v43;
                  goto LABEL_18;
                }
              }
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
LABEL_18:
              sub_2192C11C8(v8, v7);
              uint64_t v29 = *(void *)(a4 + 48);
              uint64_t v30 = *(void *)(*(void *)(a4 + 56) + 8);
              long long v36 = *(_OWORD *)(a4 + 24);
              uint64_t v37 = v29;
              uint64_t v38 = v30;
              uint64_t v31 = type metadata accessor for SymmetricState();
              uint64_t v6 = sub_2192D4E6C(v8, v7, v31);
              sub_2192C1220(v8, v7);
              if (!v5)
              {
                sub_2192C96A8(a4, a1);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
                sub_2192C1220(v42, v43);
                return v6;
              }
            }
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
LABEL_22:
            sub_2192C1220(v42, v43);
            return v6;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        JUMPOUT(0x2192C813CLL);
      }
      sub_2192C108C();
      swift_allocError();
      *uint64_t v13 = 5;
      swift_willThrow();
      return v6;
    case 2uLL:
      uint64_t v11 = *(void *)(a2 + 16);
      uint64_t v10 = *(void *)(a2 + 24);
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_5;
      }
      goto LABEL_26;
    default:
      goto LABEL_7;
  }
}

uint64_t sub_2192C814C(unsigned char *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned char *a6, uint64_t a7, unsigned char *a8, uint64_t a9)
{
  v213 = a3;
  uint64_t v232 = a2;
  v221 = a1;
  v223 = a6;
  uint64_t v224 = a9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = sub_2192D9530();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v215 = v14;
  uint64_t v216 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v210 = (char *)&v201 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v205 = (char *)&v201 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v204 = (char *)&v201 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v203 = (char *)&v201 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v202 = (char *)&v201 - v25;
  MEMORY[0x270FA5388](v24);
  v209 = (char *)&v201 - v26;
  uint64_t v222 = a5;
  v225 = a8;
  uint64_t v207 = type metadata accessor for CipherState();
  uint64_t v208 = sub_2192D9530();
  uint64_t v206 = *(void *)(v208 - 8);
  MEMORY[0x270FA5388](v208);
  uint64_t v28 = (char *)&v201 - v27;
  uint64_t v220 = a7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v212 = AssociatedTypeWitness;
  uint64_t v214 = swift_getAssociatedTypeWitness();
  uint64_t v29 = sub_2192D9530();
  unint64_t v30 = *(void *)(v29 - 8);
  uint64_t v218 = v29;
  unint64_t v219 = v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v201 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  long long v36 = (char *)&v201 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)&v201 - v38;
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v42 = (char *)&v201 - v41;
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  uint64_t v45 = (char *)&v201 - v44;
  uint64_t v46 = MEMORY[0x270FA5388](v43);
  uint64_t v48 = (char *)&v201 - v47;
  uint64_t v49 = MEMORY[0x270FA5388](v46);
  uint64_t v50 = MEMORY[0x270FA5388](v49);
  uint64_t v51 = MEMORY[0x270FA5388](v50);
  MEMORY[0x270FA5388](v51);
  char v56 = (char *)&v201 - v55;
  switch(*v221)
  {
    case 1:
      uint64_t v74 = v53;
      uint64_t v216 = v52;
      uint64_t v226 = a4;
      v227 = (unsigned char *)v222;
      v228 = v223;
      uint64_t v229 = v220;
      v230 = v225;
      uint64_t v231 = v224;
      uint64_t v75 = type metadata accessor for HandshakeState();
      uint64_t v76 = v232;
      uint64_t v77 = v232 + *(int *)(v75 + 100);
      uint64_t v78 = v206;
      uint64_t v79 = v208;
      (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v28, v77, v208);
      int v80 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v207 - 8) + 48))(v28, 1);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v28, v79);
      uint64_t v81 = v214;
      uint64_t v82 = swift_getAssociatedConformanceWitness();
      uint64_t v83 = (*(uint64_t (**)(uint64_t, uint64_t))(v82 + 24))(v81, v82);
      uint64_t v84 = v83;
      uint64_t v220 = v77;
      if (v80 == 1)
      {
        v85 = v213;
        uint64_t v86 = *v213;
        unint64_t v87 = v213[1];
        sub_2192C11C8(*v213, v87);
        sub_2192D4344(v84, v86, v87, &v226);
        uint64_t v89 = v226;
        char v88 = v227;
        uint64_t v90 = *v85;
        unint64_t v91 = v85[1];
        sub_2192C11C8(v90, v91);
        uint64_t v92 = sub_2192C93F4(v90, v91);
        unint64_t v94 = v93;
        unint64_t v95 = v93 >> 62;
        uint64_t v96 = v92;
        uint64_t v97 = 0;
        v221 = v88;
        switch(v95)
        {
          case 1uLL:
            uint64_t v97 = v92 >> 32;
            break;
          case 2uLL:
            uint64_t v97 = *(void *)(v92 + 24);
            break;
          case 3uLL:
            break;
          default:
            uint64_t v97 = BYTE6(v94);
            break;
        }
        if (v97 >= v84) {
          goto LABEL_44;
        }
        __break(1u);
LABEL_41:
        uint64_t v152 = v96 >> 32;
LABEL_43:
        if (v152 >= v84)
        {
LABEL_44:
          uint64_t v178 = sub_2192D9100();
          uint64_t v180 = v179;
          sub_2192C1220(v96, v94);
          v181 = v213;
          uint64_t v182 = *v213;
          unint64_t v183 = v213[1];
          uint64_t *v213 = v178;
          v181[1] = v180;
          sub_2192C1220(v182, v183);
          uint64_t v184 = v76 + *(int *)(v75 + 88);
          uint64_t v186 = v218;
          unint64_t v185 = v219;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v219 + 16))(v74, v184, v218);
          uint64_t v187 = v214;
          uint64_t v188 = *(void *)(v214 - 8);
          int v189 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v188 + 48))(v74, 1, v214);
          (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v74, v186);
          if (v189 == 1)
          {
            uint64_t v190 = *(void *)(v224 + 8);
            uint64_t v226 = v222;
            v227 = v223;
            v228 = v225;
            uint64_t v229 = v190;
            uint64_t v191 = type metadata accessor for SymmetricState();
            unint64_t v192 = (unint64_t)v221;
            uint64_t v193 = v217;
            uint64_t v194 = sub_2192D4E6C(v89, (unint64_t)v221, v191);
            if (v193) {
              return sub_2192C1220(v89, v192);
            }
            uint64_t v197 = v194;
            uint64_t v198 = v195;
            uint64_t v199 = swift_getAssociatedConformanceWitness();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v199 + 16))(v197, v198, v187, v199);
            sub_2192C1220(v89, v192);
            uint64_t v200 = v216;
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v188 + 56))(v216, 0, 1, v187);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v219 + 40))(v184, v200, v186);
          }
          sub_2192C108C();
          swift_allocError();
          unsigned char *v196 = 2;
          swift_willThrow();
          uint64_t v173 = v89;
          unint64_t v174 = (unint64_t)v221;
          return sub_2192C1220(v173, v174);
        }
LABEL_55:
        __break(1u);
        JUMPOUT(0x2192C93A8);
      }
      uint64_t v84 = v83 + 16;
      if (!__OFADD__(v83, 16))
      {
        uint64_t v143 = v213;
        uint64_t v144 = *v213;
        unint64_t v145 = v213[1];
        sub_2192C11C8(*v213, v145);
        sub_2192D4344(v84, v144, v145, &v226);
        uint64_t v89 = v226;
        int v146 = v227;
        uint64_t v147 = *v143;
        unint64_t v148 = v143[1];
        sub_2192C11C8(v147, v148);
        uint64_t v149 = sub_2192C93F4(v147, v148);
        unint64_t v94 = v150;
        unint64_t v151 = v150 >> 62;
        uint64_t v96 = v149;
        uint64_t v152 = 0;
        v221 = v146;
        switch(v151)
        {
          case 1uLL:
            goto LABEL_41;
          case 2uLL:
            uint64_t v152 = *(void *)(v149 + 24);
            break;
          case 3uLL:
            goto LABEL_43;
          default:
            uint64_t v152 = BYTE6(v94);
            break;
        }
        goto LABEL_43;
      }
      goto LABEL_53;
    case 2:
      uint64_t v226 = a4;
      v227 = (unsigned char *)v222;
      v228 = v223;
      uint64_t v229 = v220;
      v230 = v225;
      uint64_t v231 = v224;
      uint64_t v98 = type metadata accessor for HandshakeState();
      uint64_t v99 = v232;
      uint64_t v101 = v215;
      uint64_t v100 = v216;
      uint64_t v102 = (uint64_t)v209;
      (*(void (**)(char *, uint64_t, uint64_t))(v216 + 16))(v209, v232 + *(int *)(v98 + 84), v215);
      uint64_t v104 = v218;
      unint64_t v103 = v219;
      (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v48, v99 + *(int *)(v98 + 92), v218);
      sub_2192C792C(v102, (uint64_t)v48, v98);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v48, v104);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v100 + 8))(v102, v101);
    case 3:
      uint64_t v105 = v232;
      uint64_t v106 = v216;
      uint64_t v107 = (void (**)(char *, uint64_t, uint64_t))(v216 + 16);
      if (*(unsigned char *)(v232 + 1) == 1)
      {
        uint64_t v226 = a4;
        v227 = (unsigned char *)v222;
        v228 = v223;
        uint64_t v229 = v220;
        v230 = v225;
        uint64_t v231 = v224;
        uint64_t v108 = type metadata accessor for HandshakeState();
        uint64_t v109 = (uint64_t)v202;
        uint64_t v110 = v215;
        (*v107)(v202, v105 + *(int *)(v108 + 84), v215);
        uint64_t v112 = v218;
        unint64_t v111 = v219;
        (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v45, v105 + *(int *)(v108 + 88), v218);
        sub_2192C792C(v109, (uint64_t)v45, v108);
        (*(void (**)(char *, uint64_t))(v111 + 8))(v45, v112);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v106 + 8))(v109, v110);
      }
      else
      {
        uint64_t v226 = a4;
        v227 = (unsigned char *)v222;
        v228 = v223;
        uint64_t v229 = v220;
        v230 = v225;
        uint64_t v231 = v224;
        uint64_t v153 = type metadata accessor for HandshakeState();
        uint64_t v154 = (uint64_t)v203;
        uint64_t v155 = v215;
        (*v107)(v203, v105 + *(int *)(v153 + 80), v215);
        uint64_t v157 = v218;
        unint64_t v156 = v219;
        (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v42, v105 + *(int *)(v153 + 92), v218);
        sub_2192C792C(v154, (uint64_t)v42, v153);
        (*(void (**)(char *, uint64_t))(v156 + 8))(v42, v157);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v106 + 8))(v154, v155);
      }
    case 4:
      uint64_t v114 = v232;
      uint64_t v115 = (void (**)(char *, uint64_t, uint64_t))(v216 + 16);
      if (*(unsigned char *)(v232 + 1) == 1)
      {
        uint64_t v226 = a4;
        v227 = (unsigned char *)v222;
        v228 = v223;
        uint64_t v229 = v220;
        v230 = v225;
        uint64_t v231 = v224;
        uint64_t v116 = type metadata accessor for HandshakeState();
        uint64_t v117 = (uint64_t)v204;
        uint64_t v118 = v215;
        (*v115)(v204, v114 + *(int *)(v116 + 80), v215);
        uint64_t v120 = v218;
        unint64_t v119 = v219;
        (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v39, v114 + *(int *)(v116 + 92), v218);
        sub_2192C792C(v117, (uint64_t)v39, v116);
        (*(void (**)(char *, uint64_t))(v119 + 8))(v39, v120);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v216 + 8))(v117, v118);
      }
      else
      {
        uint64_t v226 = a4;
        v227 = (unsigned char *)v222;
        v228 = v223;
        uint64_t v229 = v220;
        v230 = v225;
        uint64_t v231 = v224;
        uint64_t v158 = type metadata accessor for HandshakeState();
        uint64_t v159 = (uint64_t)v205;
        uint64_t v160 = v215;
        (*v115)(v205, v114 + *(int *)(v158 + 84), v215);
        uint64_t v162 = v218;
        unint64_t v161 = v219;
        (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v36, v114 + *(int *)(v158 + 88), v218);
        sub_2192C792C(v159, (uint64_t)v36, v158);
        (*(void (**)(char *, uint64_t))(v161 + 8))(v36, v162);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v216 + 8))(v159, v160);
      }
    case 5:
      uint64_t v226 = a4;
      v227 = (unsigned char *)v222;
      v228 = v223;
      uint64_t v229 = v220;
      v230 = v225;
      uint64_t v231 = v224;
      uint64_t v121 = type metadata accessor for HandshakeState();
      uint64_t v122 = v232;
      uint64_t v101 = v215;
      uint64_t v100 = v216;
      uint64_t v102 = (uint64_t)v210;
      (*(void (**)(char *, uint64_t, uint64_t))(v216 + 16))(v210, v232 + *(int *)(v121 + 80), v215);
      uint64_t v124 = v218;
      unint64_t v123 = v219;
      (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v33, v122 + *(int *)(v121 + 88), v218);
      sub_2192C792C(v102, (uint64_t)v33, v121);
      (*(void (**)(char *, uint64_t))(v123 + 8))(v33, v124);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v100 + 8))(v102, v101);
    case 6:
      v125 = *(unsigned char **)(v232 + 8);
      if (v125)
      {
        uint64_t v127 = *(void *)(v232 + 24);
        unint64_t v126 = *(void *)(v232 + 32);
        if (v127 == v126 >> 1)
        {
          __break(1u);
        }
        else
        {
          uint64_t v218 = *(void *)(v232 + 32);
          unint64_t v219 = v126 >> 1;
          v221 = v125;
          if (v127 < (uint64_t)(v126 >> 1))
          {
            v128 = (void *)v232;
            uint64_t v216 = *(void *)(v232 + 16);
            v129 = (uint64_t *)(v216 + 16 * v127);
            uint64_t v130 = *v129;
            unint64_t v131 = v129[1];
            uint64_t v132 = v222;
            uint64_t v133 = v223;
            uint64_t v226 = a4;
            v227 = (unsigned char *)v222;
            v228 = v223;
            uint64_t v229 = v220;
            uint64_t v135 = v224;
            v134 = v225;
            v230 = v225;
            uint64_t v231 = v224;
            type metadata accessor for HandshakeState();
            sub_2192C11C8(v130, v131);
            uint64_t v136 = *(void *)(v135 + 8);
            v137 = v221;
            swift_unknownObjectRetain();
            uint64_t v226 = v132;
            v227 = v133;
            v228 = v134;
            uint64_t v229 = v136;
            uint64_t v138 = type metadata accessor for SymmetricState();
            sub_2192D5070(v130, v131, v138);
            sub_2192C1220(v130, v131);
            if (!__OFSUB__(v219, v127))
            {
              uint64_t v139 = v216;
              v128[1] = v137;
              v128[2] = v139;
              uint64_t v140 = v218;
              v128[3] = v127 + 1;
              v128[4] = v140;
              return swift_unknownObjectRelease();
            }
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
        }
        __break(1u);
        goto LABEL_52;
      }
      sub_2192C108C();
      swift_allocError();
      char v142 = 1;
      goto LABEL_27;
    default:
      v221 = v54;
      uint64_t v226 = a4;
      v227 = (unsigned char *)v222;
      v228 = v223;
      uint64_t v229 = v220;
      v230 = v225;
      uint64_t v231 = v224;
      uint64_t v57 = type metadata accessor for HandshakeState();
      uint64_t v58 = v232 + *(int *)(v57 + 92);
      uint64_t v60 = v218;
      unint64_t v59 = v219;
      (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v56, v58, v218);
      uint64_t v61 = v214;
      uint64_t v62 = *(void *)(v214 - 8);
      int v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v62 + 48))(v56, 1, v214);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v56, v60);
      if (v63 != 1)
      {
        sub_2192C108C();
        swift_allocError();
        char v142 = 2;
LABEL_27:
        *uint64_t v141 = v142;
        return swift_willThrow();
      }
      uint64_t v216 = v58;
      uint64_t v64 = swift_getAssociatedConformanceWitness();
      uint64_t v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 24))(v61, v64);
      uint64_t v66 = v213;
      uint64_t v67 = *v213;
      unint64_t v68 = v213[1];
      sub_2192C11C8(*v213, v68);
      sub_2192D4344(v65, v67, v68, &v226);
      uint64_t v70 = v226;
      unint64_t v69 = (unint64_t)v227;
      uint64_t v71 = *v66;
      unint64_t v72 = v66[1];
      uint64_t v73 = 0;
      switch(v72 >> 62)
      {
        case 1uLL:
          uint64_t v73 = v71 >> 32;
          goto LABEL_30;
        case 2uLL:
          uint64_t v73 = *(void *)(v71 + 24);
LABEL_30:
          sub_2192C11C8(v71, v72);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v73 = BYTE6(v72);
          break;
      }
      uint64_t v220 = v57;
      if (v73 < v65) {
        goto LABEL_54;
      }
      uint64_t v163 = sub_2192D9100();
      uint64_t v165 = v164;
      sub_2192C1220(v71, v72);
      uint64_t v166 = v213;
      uint64_t v167 = *v213;
      unint64_t v168 = v213[1];
      uint64_t *v213 = v163;
      v166[1] = v165;
      sub_2192C1220(v167, v168);
      v169 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v64 + 16);
      sub_2192C11C8(v70, v69);
      v170 = v221;
      uint64_t v171 = v214;
      uint64_t v172 = v217;
      v169(v70, v69, v214, v64);
      if (v172)
      {
        uint64_t v173 = v70;
        unint64_t v174 = v69;
        return sub_2192C1220(v173, v174);
      }
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v62 + 56))(v170, 0, 1, v171);
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v219 + 40))(v216, v170, v218);
      uint64_t v175 = v232;
      uint64_t v176 = *(void *)(v224 + 8);
      uint64_t v226 = v222;
      v227 = v223;
      v228 = v225;
      uint64_t v229 = v176;
      v177 = (void *)type metadata accessor for SymmetricState();
      sub_2192D4B64(v70, v69, (uint64_t)v177);
      if (*(void *)(v175 + 8))
      {
        uint64_t v226 = v70;
        v227 = (unsigned char *)v69;
        sub_2192D4CE4((uint64_t)&v226, v177, MEMORY[0x263F06F78]);
      }
      return sub_2192C1220(v70, v69);
  }
}

uint64_t sub_2192C93F4(uint64_t a1, unint64_t a2)
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
      sub_2192C11C8(a1, a2);
      sub_2192C11C8(v5, v6);
      uint64_t v8 = (unsigned char *)sub_2192D9060();
      if (v8)
      {
        uint64_t v9 = sub_2192D9090();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_2192D9080();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      BOOL v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_2192D7F68(v8, v13, &v27);
      sub_2192C1220(v5, v6);
LABEL_27:
      sub_2192C1220(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_2192C11C8(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_2192D9060();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_2192D9090();
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
      uint64_t v20 = sub_2192D9080();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_2192D7F68(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_2192C11C8(a1, a2);
      unint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_2192C11C8(a1, a2);
      unint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_2192D7F68(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_2192C96A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(v2 + *(int *)(a1 + 96) + 16) == *(void *)(v2 + *(int *)(a1 + 96) + 24) >> 1)
  {
    int v4 = *(unsigned __int8 *)(v2 + 1);
    int v5 = *(unsigned __int8 *)(v2 + 2);
    unint64_t v6 = (void *)type metadata accessor for SymmetricState();
    sub_2192D52E8(v4, v5, v6, a2);
    uint64_t v7 = type metadata accessor for TransportState();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 0, 1, v7);
  }
  else
  {
    uint64_t v9 = type metadata accessor for TransportState();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    return v10(a2, 1, 1, v9);
  }
}

unint64_t HandshakeState.writePayload(_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  long long v58 = xmmword_2192DA130;
  uint64_t v7 = (uint64_t *)(v4 + *(int *)(a4 + 96));
  uint64_t v9 = v7[2];
  unint64_t v8 = v7[3];
  unint64_t v10 = v8 >> 1;
  if (v9 == v8 >> 1)
  {
    sub_2192C108C();
    swift_allocError();
    *uint64_t v11 = 3;
    swift_willThrow();
LABEL_24:
    sub_2192C1220(v58, *((unint64_t *)&v58 + 1));
    return v10;
  }
  if (v9 >= (uint64_t)(v8 >> 1))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  BOOL v12 = (void *)a4;
  uint64_t v53 = v5;
  uint64_t v15 = *v7;
  uint64_t v14 = v7[1];
  sub_2192CAE68(v14 + 40 * v9, (uint64_t)v55);
  if (__OFSUB__(v10, v9))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    JUMPOUT(0x2192C9B98);
  }
  *uint64_t v7 = v15;
  v7[1] = v14;
  v7[2] = v9 + 1;
  v7[3] = v8;
  uint64_t v16 = v56;
  uint64_t v17 = v57;
  __swift_project_boxed_opaque_existential_1(v55, v56);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17);
  uint64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v49 = a1;
    uint64_t v59 = v6;
    uint64_t v20 = 0;
    uint64_t v21 = v12;
    uint64_t v22 = v12[2];
    unint64_t v24 = v21[3];
    unint64_t v23 = v21[4];
    uint64_t v25 = v21[5];
    unint64_t v10 = v21[6];
    uint64_t v50 = v21;
    uint64_t v26 = v21[7];
    while (1)
    {
      LOBYTE(v54[0]) = *(unsigned char *)(v18 + v20 + 32);
      sub_2192C9BB8(v54, v59, (uint64_t)&v58, v22, v24, v23, v25, v10, v26);
      if (v5) {
        break;
      }
      if (v19 == ++v20)
      {
        uint64_t v53 = 0;
        swift_bridgeObjectRelease();
        uint64_t v28 = a2;
        unint64_t v27 = a3;
        uint64_t v29 = 0;
        a1 = v49;
        BOOL v12 = v50;
        switch(*((void *)&v58 + 1) >> 62)
        {
          case 1:
            LODWORD(v29) = DWORD1(v58) - v58;
            if (__OFSUB__(DWORD1(v58), v58)) {
              goto LABEL_38;
            }
            uint64_t v29 = (int)v29;
            goto LABEL_12;
          case 2:
            uint64_t v48 = *(void *)(v58 + 16);
            uint64_t v47 = *(void *)(v58 + 24);
            BOOL v33 = __OFSUB__(v47, v48);
            uint64_t v29 = v47 - v48;
            if (!v33) {
              goto LABEL_12;
            }
            __break(1u);
            goto LABEL_32;
          case 3:
            goto LABEL_12;
          default:
            uint64_t v29 = BYTE14(v58);
            goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_23:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  uint64_t v29 = 0;
  uint64_t v28 = a2;
  unint64_t v27 = a3;
LABEL_12:
  uint64_t v30 = 0;
  switch(v27 >> 62)
  {
    case 1uLL:
      LODWORD(v30) = HIDWORD(v28) - v28;
      if (__OFSUB__(HIDWORD(v28), v28)) {
        goto LABEL_36;
      }
      uint64_t v30 = (int)v30;
LABEL_18:
      uint64_t v34 = v29 + v30;
      if (__OFADD__(v29, v30)) {
        goto LABEL_34;
      }
      unint64_t v10 = v12[3];
      uint64_t v35 = v12[6];
      uint64_t v36 = (*(uint64_t (**)(unint64_t, uint64_t))(v35 + 64))(v10, v35);
      if (__OFADD__(v34, v36)) {
        goto LABEL_35;
      }
      if (v34 + v36 >= 0x10000)
      {
        sub_2192C108C();
        swift_allocError();
        *uint64_t v37 = 5;
        swift_willThrow();
        goto LABEL_23;
      }
      uint64_t v38 = v12[4];
      uint64_t v39 = *(void *)(v12[7] + 8);
      v54[0] = v10;
      v54[1] = v38;
      v54[2] = v35;
      v54[3] = v39;
      uint64_t v40 = type metadata accessor for SymmetricState();
      uint64_t v41 = sub_2192D5564(v28, v27, v40);
      if (v53) {
        goto LABEL_23;
      }
      uint64_t v44 = v41;
      unint64_t v45 = v42;
      sub_2192D9110();
      sub_2192C1220(v44, v45);
      unint64_t v46 = *((void *)&v58 + 1);
      unint64_t v10 = v58;
      sub_2192C11C8(v58, *((unint64_t *)&v58 + 1));
      sub_2192C96A8((uint64_t)v12, a1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      sub_2192C1220(v10, v46);
      break;
    case 2uLL:
      uint64_t v32 = *(void *)(v28 + 16);
      uint64_t v31 = *(void *)(v28 + 24);
      BOOL v33 = __OFSUB__(v31, v32);
      uint64_t v30 = v31 - v32;
      if (!v33) {
        goto LABEL_18;
      }
      goto LABEL_37;
    case 3uLL:
      goto LABEL_18;
    default:
      uint64_t v30 = BYTE6(v27);
      goto LABEL_18;
  }
  return v10;
}

uint64_t sub_2192C9BB8(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  unint64_t v192 = a5;
  unint64_t v193 = a8;
  unint64_t v200 = a6;
  uint64_t v172 = a3;
  uint64_t v190 = a2;
  uint64_t v191 = a1;
  uint64_t v189 = a9;
  swift_getAssociatedTypeWitness();
  uint64_t v187 = a4;
  uint64_t v188 = a7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v165 = *(void *)(AssociatedConformanceWitness + 8);
  uint64_t v177 = *(void *)(*(void *)(v165 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_2192D9530();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v182 = v12;
  uint64_t v183 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v174 = (char *)&v165 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v170 = (char *)&v165 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v169 = (char *)&v165 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unint64_t v168 = (char *)&v165 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v167 = (char *)&v165 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v173 = (char *)&v165 - v24;
  uint64_t v25 = swift_checkMetadataState();
  uint64_t v181 = *(void *)(v25 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v175 = (char *)&v165 - v27;
  uint64_t v179 = AssociatedTypeWitness;
  uint64_t v176 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v166 = (char *)&v165 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v171 = (char *)&v165 - v30;
  uint64_t v180 = v31;
  uint64_t v32 = sub_2192D9530();
  unint64_t v33 = *(void *)(v32 - 8);
  uint64_t v185 = v32;
  unint64_t v186 = v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v165 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)&v165 - v39;
  uint64_t v41 = MEMORY[0x270FA5388](v38);
  uint64_t v43 = (char *)&v165 - v42;
  uint64_t v44 = MEMORY[0x270FA5388](v41);
  unint64_t v46 = (char *)&v165 - v45;
  uint64_t v47 = MEMORY[0x270FA5388](v44);
  uint64_t v49 = (char *)&v165 - v48;
  uint64_t v50 = MEMORY[0x270FA5388](v47);
  uint64_t v52 = (char *)&v165 - v51;
  uint64_t v53 = MEMORY[0x270FA5388](v50);
  uint64_t v55 = (char *)&v165 - v54;
  uint64_t v56 = MEMORY[0x270FA5388](v53);
  long long v58 = (char *)&v165 - v57;
  MEMORY[0x270FA5388](v56);
  uint64_t v61 = (char *)&v165 - v60;
  switch(*v191)
  {
    case 1:
      unint64_t v83 = v193;
      uint64_t v194 = v187;
      unint64_t v195 = v192;
      uint64_t v84 = v189;
      unint64_t v196 = v200;
      uint64_t v197 = v188;
      unint64_t v198 = v193;
      uint64_t v199 = v189;
      uint64_t v85 = type metadata accessor for HandshakeState();
      uint64_t v87 = v185;
      unint64_t v86 = v186;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 16))(v52, v190 + *(int *)(v85 + 80), v185);
      uint64_t v88 = v180;
      uint64_t v89 = v181;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v181 + 48))(v52, 1, v180) == 1)
      {
        (*(void (**)(char *, uint64_t))(v86 + 8))(v52, v87);
LABEL_10:
        sub_2192C108C();
        swift_allocError();
        char v91 = 2;
        goto LABEL_28;
      }
      (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v175, v52, v88);
      uint64_t v139 = v166;
      sub_2192D9230();
      uint64_t v140 = v179;
      uint64_t v141 = swift_getAssociatedConformanceWitness();
      uint64_t v142 = (*(uint64_t (**)(uint64_t, uint64_t))(v141 + 8))(v140, v141);
      unint64_t v144 = v143;
      unint64_t v145 = v139;
      uint64_t v78 = v142;
      uint64_t v146 = v140;
      unint64_t v80 = v144;
      (*(void (**)(char *, uint64_t))(v176 + 8))(v145, v146);
      uint64_t v147 = *(void *)(v84 + 8);
      uint64_t v194 = v192;
      unint64_t v195 = v200;
      unint64_t v196 = v83;
      uint64_t v197 = v147;
      uint64_t v148 = type metadata accessor for SymmetricState();
      uint64_t v149 = v184;
      uint64_t v150 = sub_2192D5564(v78, v80, v148);
      if (v149)
      {
        (*(void (**)(char *, uint64_t))(v89 + 8))(v175, v88);
        return sub_2192C1220(v78, v80);
      }
      else
      {
        uint64_t v163 = v150;
        unint64_t v164 = v151;
        sub_2192C1220(v78, v80);
        sub_2192CAC44(v163, v164);
        sub_2192C1220(v163, v164);
        return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v175, v88);
      }
    case 2:
      uint64_t v194 = v187;
      unint64_t v195 = v192;
      unint64_t v196 = v200;
      uint64_t v197 = v188;
      unint64_t v198 = v193;
      uint64_t v199 = v189;
      uint64_t v92 = type metadata accessor for HandshakeState();
      uint64_t v93 = v190;
      uint64_t v95 = v185;
      unint64_t v94 = v186;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 16))(v49, v190 + *(int *)(v92 + 84), v185);
      uint64_t v97 = v182;
      uint64_t v96 = v183;
      uint64_t v98 = (uint64_t)v173;
      (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v173, v93 + *(int *)(v92 + 92), v182);
      sub_2192C792C((uint64_t)v49, v98, v92);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v98, v97);
      return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v49, v95);
    case 3:
      uint64_t v100 = v190;
      unint64_t v101 = v186;
      uint64_t v102 = (void (**)(char *, uint64_t, uint64_t))(v186 + 16);
      if (*(unsigned char *)(v190 + 1) == 1)
      {
        uint64_t v194 = v187;
        unint64_t v195 = v192;
        unint64_t v196 = v200;
        uint64_t v197 = v188;
        unint64_t v198 = v193;
        uint64_t v199 = v189;
        uint64_t v103 = type metadata accessor for HandshakeState();
        uint64_t v104 = v185;
        (*v102)(v46, v100 + *(int *)(v103 + 84), v185);
        uint64_t v106 = v182;
        uint64_t v105 = v183;
        uint64_t v107 = (uint64_t)v167;
        (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v167, v100 + *(int *)(v103 + 88), v182);
        sub_2192C792C((uint64_t)v46, v107, v103);
        (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v107, v106);
        return (*(uint64_t (**)(char *, uint64_t))(v101 + 8))(v46, v104);
      }
      else
      {
        uint64_t v194 = v187;
        unint64_t v195 = v192;
        unint64_t v196 = v200;
        uint64_t v197 = v188;
        unint64_t v198 = v193;
        uint64_t v199 = v189;
        uint64_t v152 = type metadata accessor for HandshakeState();
        uint64_t v153 = v185;
        (*v102)(v43, v100 + *(int *)(v152 + 80), v185);
        uint64_t v155 = v182;
        uint64_t v154 = v183;
        uint64_t v156 = (uint64_t)v168;
        (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v168, v100 + *(int *)(v152 + 92), v182);
        sub_2192C792C((uint64_t)v43, v156, v152);
        (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v156, v155);
        return (*(uint64_t (**)(char *, uint64_t))(v101 + 8))(v43, v153);
      }
    case 4:
      uint64_t v108 = v190;
      unint64_t v109 = v186;
      uint64_t v110 = (void (**)(char *, uint64_t, uint64_t))(v186 + 16);
      if (*(unsigned char *)(v190 + 1) == 1)
      {
        uint64_t v194 = v187;
        unint64_t v195 = v192;
        unint64_t v196 = v200;
        uint64_t v197 = v188;
        unint64_t v198 = v193;
        uint64_t v199 = v189;
        uint64_t v111 = type metadata accessor for HandshakeState();
        uint64_t v112 = v185;
        (*v110)(v40, v108 + *(int *)(v111 + 80), v185);
        uint64_t v114 = v182;
        uint64_t v113 = v183;
        uint64_t v115 = (uint64_t)v169;
        (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v169, v108 + *(int *)(v111 + 92), v182);
        sub_2192C792C((uint64_t)v40, v115, v111);
        (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v115, v114);
        return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v40, v112);
      }
      else
      {
        uint64_t v194 = v187;
        unint64_t v195 = v192;
        unint64_t v196 = v200;
        uint64_t v197 = v188;
        unint64_t v198 = v193;
        uint64_t v199 = v189;
        uint64_t v157 = v59;
        uint64_t v158 = type metadata accessor for HandshakeState();
        uint64_t v159 = v185;
        (*v110)((char *)v157, v108 + *(int *)(v158 + 84), v185);
        uint64_t v161 = v182;
        uint64_t v160 = v183;
        uint64_t v162 = (uint64_t)v170;
        (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v170, v108 + *(int *)(v158 + 88), v182);
        sub_2192C792C(v157, v162, v158);
        (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v162, v161);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v157, v159);
      }
    case 5:
      uint64_t v194 = v187;
      unint64_t v195 = v192;
      unint64_t v196 = v200;
      uint64_t v197 = v188;
      unint64_t v198 = v193;
      uint64_t v199 = v189;
      uint64_t v116 = type metadata accessor for HandshakeState();
      uint64_t v117 = v190;
      uint64_t v119 = v185;
      unint64_t v118 = v186;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 16))(v36, v190 + *(int *)(v116 + 80), v185);
      uint64_t v121 = v182;
      uint64_t v120 = v183;
      uint64_t v122 = (uint64_t)v174;
      (*(void (**)(char *, uint64_t, uint64_t))(v183 + 16))(v174, v117 + *(int *)(v116 + 88), v182);
      sub_2192C792C((uint64_t)v36, v122, v116);
      (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v122, v121);
      return (*(uint64_t (**)(char *, uint64_t))(v118 + 8))(v36, v119);
    case 6:
      unint64_t v123 = (void *)v190;
      uint64_t v124 = *(unsigned char **)(v190 + 8);
      if (v124)
      {
        uint64_t v126 = *(void *)(v190 + 24);
        unint64_t v125 = *(void *)(v190 + 32);
        if (v126 == v125 >> 1)
        {
          __break(1u);
        }
        else
        {
          uint64_t v185 = *(void *)(v190 + 32);
          unint64_t v186 = v125 >> 1;
          uint64_t v191 = v124;
          if (v126 < (uint64_t)(v125 >> 1))
          {
            uint64_t v183 = *(void *)(v190 + 16);
            uint64_t v127 = (uint64_t *)(v183 + 16 * v126);
            uint64_t v128 = *v127;
            unint64_t v129 = v127[1];
            uint64_t v130 = v192;
            unint64_t v131 = v193;
            uint64_t v194 = v187;
            unint64_t v195 = v192;
            unint64_t v132 = v200;
            uint64_t v133 = v189;
            unint64_t v196 = v200;
            uint64_t v197 = v188;
            unint64_t v198 = v193;
            uint64_t v199 = v189;
            type metadata accessor for HandshakeState();
            sub_2192C11C8(v128, v129);
            uint64_t v134 = *(void *)(v133 + 8);
            uint64_t v135 = v191;
            swift_unknownObjectRetain();
            uint64_t v194 = v130;
            unint64_t v195 = v132;
            unint64_t v196 = v131;
            uint64_t v197 = v134;
            uint64_t v136 = type metadata accessor for SymmetricState();
            sub_2192D5070(v128, v129, v136);
            sub_2192C1220(v128, v129);
            if (!__OFSUB__(v186, v126))
            {
              uint64_t v137 = v183;
              v123[1] = v135;
              v123[2] = v137;
              uint64_t v138 = v185;
              v123[3] = v126 + 1;
              v123[4] = v138;
              return swift_unknownObjectRelease();
            }
LABEL_33:
            __break(1u);
LABEL_34:
            __break(1u);
            JUMPOUT(0x2192CAC28);
          }
        }
        __break(1u);
        goto LABEL_33;
      }
      sub_2192C108C();
      swift_allocError();
      char v91 = 1;
LABEL_28:
      *uint64_t v90 = v91;
      return swift_willThrow();
    default:
      uint64_t v62 = v190;
      unint64_t v63 = v193;
      uint64_t v64 = v180;
      if (*(unsigned char *)v190) {
        goto LABEL_5;
      }
      uint64_t v194 = v187;
      unint64_t v195 = v192;
      unint64_t v196 = v200;
      uint64_t v197 = v188;
      unint64_t v198 = v193;
      uint64_t v199 = v189;
      uint64_t v65 = type metadata accessor for HandshakeState();
      uint64_t v67 = v185;
      unint64_t v66 = v186;
      unint64_t v68 = *(void (**)(char *))(v186 + 16);
      uint64_t v191 = (unsigned char *)(v62 + *(int *)(v65 + 84));
      v68(v61);
      uint64_t v69 = v181;
      int v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v181 + 48))(v61, 1, v64);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v61, v67);
      if (v70 != 1) {
        goto LABEL_10;
      }
      sub_2192D9240();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v58, 0, 1, v64);
      (*(void (**)(unsigned char *, char *, uint64_t))(v66 + 40))(v191, v58, v67);
      unint64_t v63 = v193;
LABEL_5:
      uint64_t v71 = v192;
      uint64_t v194 = v187;
      unint64_t v195 = v192;
      uint64_t v72 = v189;
      unint64_t v196 = v200;
      uint64_t v197 = v188;
      unint64_t v198 = v63;
      uint64_t v199 = v189;
      uint64_t v73 = type metadata accessor for HandshakeState();
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 16))(v55, v62 + *(int *)(v73 + 84), v185);
      uint64_t v74 = v181;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v181 + 48))(v55, 1, v64) == 1) {
        goto LABEL_34;
      }
      uint64_t v75 = v171;
      sub_2192D9230();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v55, v64);
      uint64_t v76 = v179;
      uint64_t v77 = swift_getAssociatedConformanceWitness();
      uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v77);
      unint64_t v80 = v79;
      (*(void (**)(char *, uint64_t))(v176 + 8))(v75, v76);
      sub_2192CAC44(v78, v80);
      uint64_t v81 = *(void *)(v72 + 8);
      uint64_t v194 = v71;
      unint64_t v195 = v200;
      unint64_t v196 = v193;
      uint64_t v197 = v81;
      uint64_t v82 = (void *)type metadata accessor for SymmetricState();
      sub_2192D4B64(v78, v80, (uint64_t)v82);
      if (*(void *)(v62 + 8))
      {
        uint64_t v194 = v78;
        unint64_t v195 = v80;
        sub_2192D4CE4((uint64_t)&v194, v82, MEMORY[0x263F06F78]);
      }
      return sub_2192C1220(v78, v80);
  }
}

uint64_t sub_2192CAC44(uint64_t a1, unint64_t a2)
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
      sub_2192C11C8(a1, a2);
      sub_2192C11C8(v5, v6);
      sub_2192CE2C8((int)v5, v5 >> 32);
      sub_2192C1220(v5, v6);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v8 = *(void *)(v5 + 24);
      sub_2192C11C8(a1, a2);
      swift_retain();
      swift_retain();
      sub_2192CE2C8(v7, v8);
      swift_release();
      swift_release();
      break;
    default:
      sub_2192C11C8(a1, a2);
      sub_2192D90F0();
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_2192CAE68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2192CAF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 88);
}

uint64_t sub_2192CAF68()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_2192D9530();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    uint64_t result = sub_2192D9530();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for SymmetricState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

unsigned char *sub_2192CB12C(unsigned char *a1, unsigned char *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = v5;
  if (*(_DWORD *)(v4 + 84)) {
    uint64_t v7 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v7 = *(void *)(v4 + 64) + 1;
  }
  uint64_t v62 = v7 + v5;
  swift_getAssociatedConformanceWitness();
  uint64_t v66 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v66 - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v72 = v8;
  uint64_t v10 = v9;
  size_t __n = v7;
  if (*(_DWORD *)(v8 + 84)) {
    uint64_t v11 = *(void *)(*(void *)(v66 - 8) + 64);
  }
  else {
    uint64_t v11 = *(void *)(*(void *)(v66 - 8) + 64) + 1;
  }
  uint64_t v64 = v11 + v9;
  size_t v71 = v11;
  uint64_t v65 = v11 + 7;
  unint64_t v12 = (v11
       + 7
       + ((v64
         + ((v7
           + ((v7 + v5 + ((v5 + 40) & ~(unint64_t)v5)) & ~(unint64_t)v5)
           + v9) & ~(unint64_t)v9)) & ~(unint64_t)v9)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v70 = sub_2192D9210();
  uint64_t v13 = *(void *)(v70 - 8);
  uint64_t v68 = v13;
  unint64_t v14 = *(_DWORD *)(v13 + 80);
  uint64_t v15 = *(void *)(v13 + 64) + 7;
  unint64_t v16 = (v15 & 0xFFFFFFFFFFFFFFF8) + 9;
  unsigned int v67 = *(_DWORD *)(v13 + 84);
  if (v67) {
    unint64_t v16 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  size_t v69 = v16;
  unint64_t v17 = ((*(_DWORD *)(v13 + 80) + v12 + 32) & ~(*(_DWORD *)(v13 + 80) | 7))
      + ((v15 + ((v16 + v14) & ~v14)) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  unint64_t v18 = v9 | v5 | v14;
  if (v18 <= 7 && ((v9 | v5 | *(_DWORD *)(v13 + 80)) & 0x100000) == 0 && v17 <= 0x18)
  {
    uint64_t v60 = *(void *)(*(void *)(v70 - 8) + 64) + 7;
    uint64_t v61 = *(_DWORD *)(v13 + 80) | 7;
    unint64_t v59 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    unint64_t v23 = ~(unint64_t)v5;
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    uint64_t v24 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v24 = *v25;
    v24[1] = v25[1];
    v24[2] = v25[2];
    v24[3] = v25[3];
    uint64_t v26 = (void *)(((unint64_t)v24 + v6 + 32) & ~v6);
    uint64_t v27 = (const void *)(((unint64_t)v25 + v6 + 32) & ~v6);
    uint64_t v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v4 + 48);
    swift_unknownObjectRetain();
    uint64_t v29 = v28;
    unsigned int v30 = v28(v27, 1, AssociatedTypeWitness);
    uint64_t v58 = v4;
    if (v30)
    {
      size_t v31 = __n;
      memcpy(v26, v27, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v4 + 16))(v26, v27, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v4 + 56))(v26, 0, 1, AssociatedTypeWitness);
      size_t v31 = __n;
    }
    uint64_t v32 = v29;
    uint64_t v33 = ~v10;
    uint64_t v34 = (void *)(((unint64_t)v26 + v62) & v23);
    uint64_t v35 = (const void *)(((unint64_t)v27 + v62) & v23);
    if (v32(v35, 1, AssociatedTypeWitness))
    {
      memcpy(v34, v35, v31);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v58 + 16))(v34, v35, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v58 + 56))(v34, 0, 1, AssociatedTypeWitness);
    }
    uint64_t v36 = (void *)(((unint64_t)v34 + v31 + v10) & v33);
    uint64_t v37 = (const void *)(((unint64_t)v35 + v31 + v10) & v33);
    uint64_t v38 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v72 + 48);
    if (v38(v37, 1, v66))
    {
      memcpy(v36, v37, v71);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v72 + 16))(v36, v37, v66);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v72 + 56))(v36, 0, 1, v66);
    }
    uint64_t v39 = ~v61;
    uint64_t v40 = (void *)(((unint64_t)v36 + v64) & v33);
    uint64_t v41 = (const void *)(((unint64_t)v37 + v64) & v33);
    if (v38(v41, 1, v66))
    {
      memcpy(v40, v41, v71);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v72 + 16))(v40, v41, v66);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v72 + 56))(v40, 0, 1, v66);
    }
    uint64_t v42 = ~v14;
    uint64_t v43 = (void *)(((unint64_t)v40 + v65) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v44 = (void *)(((unint64_t)v41 + v65) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v43 = *v44;
    v43[1] = v44[1];
    v43[2] = v44[2];
    v43[3] = v44[3];
    uint64_t v45 = (unsigned char *)(((unint64_t)v43 + v61 + 32) & v39);
    unint64_t v46 = (_DWORD *)(((unint64_t)v44 + v61 + 32) & v39);
    swift_unknownObjectRetain();
    if (v67)
    {
      uint64_t v47 = v70;
      if (!(*(unsigned int (**)(_DWORD *, void, uint64_t))(v68 + 48))(v46, v67, v70))
      {
LABEL_38:
        uint64_t v50 = *(void (**)(unsigned char *, _DWORD *, uint64_t))(v68 + 16);
        v50(v45, v46, v47);
        *(void *)((unint64_t)&v45[v60] & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v46 + v60) & 0xFFFFFFFFFFFFFFF8);
        if (!v67) {
          v45[v59] = 0;
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v47 = v70;
      if (!*((unsigned char *)v46 + v59)) {
        goto LABEL_38;
      }
      int v48 = *((unsigned __int8 *)v46 + v59) - 1;
      int v49 = v59 & 0xFFFFFFF8;
      if ((v59 & 0xFFFFFFF8) != 0)
      {
        int v48 = 0;
        int v49 = *v46;
      }
      if ((v49 | v48) == 0xFFFFFFFF) {
        goto LABEL_38;
      }
    }
    memcpy(v45, v46, v69);
    uint64_t v50 = *(void (**)(unsigned char *, _DWORD *, uint64_t))(v68 + 16);
LABEL_40:
    unint64_t v51 = (unint64_t)&v45[v14 + v69] & v42;
    unint64_t v52 = ((unint64_t)v46 + v14 + v69) & v42;
    v50((unsigned char *)v51, (_DWORD *)v52, v47);
    uint64_t v53 = (void *)((v60 + v51) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v54 = (uint64_t *)((v60 + v52) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v55 = *v54;
    unint64_t v56 = v54[1];
    sub_2192C11C8(*v54, v56);
    *uint64_t v53 = v55;
    v53[1] = v56;
    return a1;
  }
  uint64_t v21 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v22 = v21 + ((v18 & 0xF8 ^ 0x1F8) & (v18 + 16));
  swift_retain();
  return (unsigned char *)v22;
}

uint64_t sub_2192CB818(uint64_t a1)
{
  unint64_t v1 = (a1 + 10) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4 + 32;
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v6(v5 & ~v4, 1, AssociatedTypeWitness)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5 & ~v4, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v3 + 84)) {
    uint64_t v7 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v7 = *(void *)(v3 + 64) + 1;
  }
  uint64_t v8 = ((v5 | v4) + v7) & ~v4;
  if (!v6(v8, 1, AssociatedTypeWitness)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  }
  uint64_t v9 = v8 + v7;
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  uint64_t v14 = (v9 + v12) & ~v12;
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v15(v14, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  }
  if (*(_DWORD *)(v11 + 84)) {
    uint64_t v16 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v11 + 64) + 1;
  }
  uint64_t v17 = ((v13 | v12) + v16) & ~v12;
  if (!v15(v17, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v17, v10);
  }
  swift_unknownObjectRelease();
  uint64_t v18 = sub_2192D9210();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = ((v16 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + (v20 | 7) + 32;
  uint64_t v22 = (_DWORD *)(v21 & ~(v20 | 7));
  int v23 = *(_DWORD *)(v19 + 84);
  uint64_t v24 = *(void *)(v19 + 64) + 7;
  unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
  if (!v23)
  {
    if (!*((unsigned char *)v22 + v26)) {
      goto LABEL_23;
    }
    int v27 = *((unsigned __int8 *)v22 + v26) - 1;
    int v28 = v26 & 0xFFFFFFF8;
    if ((v26 & 0xFFFFFFF8) != 0)
    {
      int v27 = 0;
      int v28 = *v22;
    }
    if ((v28 | v27) == 0xFFFFFFFF) {
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v29 = *(void (**)(_DWORD *, uint64_t))(v19 + 8);
    goto LABEL_24;
  }
  if ((*(unsigned int (**)(unint64_t, void, uint64_t))(v19 + 48))(v21 & ~(v20 | 7), *(unsigned int *)(v19 + 84), v18))
  {
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v29 = *(void (**)(_DWORD *, uint64_t))(v19 + 8);
  v29(v22, v18);
LABEL_24:
  unint64_t v30 = v25 + 9;
  if (v23) {
    unint64_t v30 = v25 + 8;
  }
  unint64_t v31 = ((unint64_t)v22 + v20 + v30) & ~v20;
  v29((_DWORD *)v31, v18);
  uint64_t v32 = (uint64_t *)((v24 + v31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v33 = *v32;
  unint64_t v34 = v32[1];
  return sub_2192C1220(v33, v34);
}

unsigned char *sub_2192CBBD4(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v3 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v4 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  void *v3 = *v4;
  v3[1] = v4[1];
  v3[2] = v4[2];
  v3[3] = v4[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (unint64_t)v3 + v7 + 32;
  unint64_t v57 = (unint64_t)v4 + v7 + 32;
  uint64_t v58 = ~v7;
  uint64_t v9 = (const void *)(v57 & ~v7);
  uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  swift_unknownObjectRetain();
  uint64_t v60 = a1;
  if (v10(v9, 1, AssociatedTypeWitness))
  {
    int v11 = *(_DWORD *)(v6 + 84);
    size_t v12 = *(void *)(v6 + 64);
    if (v11) {
      size_t v13 = *(void *)(v6 + 64);
    }
    else {
      size_t v13 = v12 + 1;
    }
    memcpy((void *)(v8 & ~v7), v9, v13);
  }
  else
  {
    (*(void (**)(unint64_t, const void *, uint64_t))(v6 + 16))(v8 & ~v7, v9, AssociatedTypeWitness);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8 & ~v7, 0, 1, AssociatedTypeWitness);
    int v11 = *(_DWORD *)(v6 + 84);
    size_t v12 = *(void *)(v6 + 64);
  }
  if (v11) {
    size_t v14 = v12;
  }
  else {
    size_t v14 = v12 + 1;
  }
  uint64_t v15 = (char *)(((v8 | v7) + v14) & v58);
  uint64_t v16 = (char *)(((v57 | v7) + v14) & v58);
  if (v10(v16, 1, AssociatedTypeWitness))
  {
    memcpy(v15, v16, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v15, v16, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, AssociatedTypeWitness);
  }
  uint64_t v17 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = &v17[v20];
  uint64_t v59 = ~v20;
  uint64_t v22 = (void *)((unint64_t)&v17[v20] & ~v20);
  unint64_t v23 = (unint64_t)&v16[v14 + v20];
  uint64_t v24 = (const void *)(v23 & ~v20);
  uint64_t v61 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v61(v24, 1, v18))
  {
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
    if (v25) {
      size_t v27 = *(void *)(v19 + 64);
    }
    else {
      size_t v27 = v26 + 1;
    }
    memcpy(v22, v24, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v22, v24, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0, 1, v18);
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  if (v25) {
    size_t v28 = v26;
  }
  else {
    size_t v28 = v26 + 1;
  }
  uint64_t v29 = (void *)((((unint64_t)v21 | v20) + v28) & v59);
  unint64_t v30 = (const void *)(((v23 | v20) + v28) & v59);
  if (v61(v30, 1, v18))
  {
    memcpy(v29, v30, v28);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v29, v30, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v29, 0, 1, v18);
  }
  unint64_t v31 = (void *)(((unint64_t)v29 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v32 = (void *)(((unint64_t)v30 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v31 = *v32;
  v31[1] = v32[1];
  v31[2] = v32[2];
  v31[3] = v32[3];
  uint64_t v33 = sub_2192D9210();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(unsigned int *)(v34 + 84);
  uint64_t v36 = *(_DWORD *)(v34 + 80);
  unint64_t v37 = *(_DWORD *)(v34 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = (void *)(((unint64_t)v31 + v36 + 32) & v37);
  uint64_t v39 = (_DWORD *)(((unint64_t)v32 + v36 + 32) & v37);
  uint64_t v40 = *(void *)(v34 + 64) + 7;
  unint64_t v41 = v40 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRetain();
  uint64_t v62 = v33;
  if (!v35)
  {
    size_t v44 = v41 + 8;
    if (!*((unsigned char *)v39 + v42)) {
      goto LABEL_36;
    }
    int v45 = *((unsigned __int8 *)v39 + v42) - 1;
    int v46 = v42 & 0xFFFFFFF8;
    if ((v42 & 0xFFFFFFF8) != 0)
    {
      int v45 = 0;
      int v46 = *v39;
    }
    if ((v46 | v45) == 0xFFFFFFFF) {
      goto LABEL_36;
    }
LABEL_32:
    if (v35) {
      size_t v47 = v44;
    }
    else {
      size_t v47 = v41 + 9;
    }
    memcpy(v38, v39, v47);
    int v48 = *(void (**)(void *, _DWORD *, uint64_t))(v34 + 16);
    goto LABEL_38;
  }
  int v43 = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v34 + 48))(v39, v35, v33);
  size_t v44 = v41 + 8;
  if (v43) {
    goto LABEL_32;
  }
LABEL_36:
  int v48 = *(void (**)(void *, _DWORD *, uint64_t))(v34 + 16);
  v48(v38, v39, v62);
  *(void *)(((unint64_t)v38 + v40) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v39 + v40) & 0xFFFFFFFFFFFFFFF8);
  if (!v35) {
    *((unsigned char *)v38 + v44) = 0;
  }
LABEL_38:
  unint64_t v49 = v41 + 9;
  if (v35) {
    unint64_t v49 = v44;
  }
  unint64_t v50 = ((unint64_t)v38 + v36 + v49) & ~v36;
  unint64_t v51 = ((unint64_t)v39 + v36 + v49) & ~v36;
  v48((void *)v50, (_DWORD *)v51, v62);
  unint64_t v52 = (void *)((v40 + v50) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v53 = (uint64_t *)((v40 + v51) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v54 = *v53;
  unint64_t v55 = v53[1];
  sub_2192C11C8(*v53, v55);
  *unint64_t v52 = v54;
  v52[1] = v55;
  return v60;
}

unsigned char *sub_2192CC1C0(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v3 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v2 = *v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (unint64_t)v2 + v6 + 32;
  uint64_t v80 = ~v6;
  unint64_t v8 = (unint64_t)v3 + v6 + 32;
  uint64_t v9 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7 & ~v6, 1, AssociatedTypeWitness);
  int v11 = v9(v8 & ~v6, 1, AssociatedTypeWitness);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v7 & ~v6, v8 & ~v6, AssociatedTypeWitness);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56))(v7 & ~v6, 0, 1, AssociatedTypeWitness);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 24))(v7 & ~v6, v8 & ~v6, AssociatedTypeWitness);
      goto LABEL_12;
    }
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy((void *)(v7 & ~v6), (const void *)(v8 & ~v6), v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    size_t v15 = *(void *)(v5 + 64);
  }
  else {
    size_t v15 = *(void *)(v5 + 64) + 1;
  }
  uint64_t v16 = (char *)(((v7 | v6) + v15) & v80);
  uint64_t v17 = (char *)(((v8 | v6) + v15) & v80);
  int v18 = v9((unint64_t)v16, 1, AssociatedTypeWitness);
  int v19 = v9((unint64_t)v17, 1, AssociatedTypeWitness);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v16, v17, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v16, 0, 1, AssociatedTypeWitness);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, AssociatedTypeWitness);
LABEL_20:
    memcpy(v16, v17, v15);
    goto LABEL_21;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v16, v17, AssociatedTypeWitness);
LABEL_21:
  uint64_t v20 = &v16[v15];
  swift_getAssociatedConformanceWitness();
  uint64_t v21 = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = &v20[v23];
  uint64_t v82 = ~v23;
  int v25 = (void *)((unint64_t)&v20[v23] & ~v23);
  unint64_t v26 = (unint64_t)&v17[v15 + v23];
  size_t v27 = (void *)(v26 & ~v23);
  size_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v29 = v28(v25, 1, v21);
  int v30 = v28(v27, 1, v21);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v25, v27, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v21);
      goto LABEL_33;
    }
    int v31 = *(_DWORD *)(v22 + 84);
    size_t v32 = *(void *)(v22 + 64);
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v25, v27, v21);
      goto LABEL_33;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v25, v21);
    int v31 = *(_DWORD *)(v22 + 84);
    size_t v32 = *(void *)(v22 + 64);
  }
  if (v31) {
    size_t v33 = v32;
  }
  else {
    size_t v33 = v32 + 1;
  }
  memcpy(v25, v27, v33);
LABEL_33:
  if (*(_DWORD *)(v22 + 84)) {
    size_t v34 = *(void *)(v22 + 64);
  }
  else {
    size_t v34 = *(void *)(v22 + 64) + 1;
  }
  uint64_t v35 = (void *)((((unint64_t)v24 | v23) + v34) & v82);
  uint64_t v36 = (void *)(((v26 | v23) + v34) & v82);
  int v37 = v28(v35, 1, v21);
  int v38 = v28(v36, 1, v21);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v35, v36, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v35, 0, 1, v21);
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v35, v21);
LABEL_41:
    memcpy(v35, v36, v34);
    goto LABEL_42;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v35, v36, v21);
LABEL_42:
  uint64_t v39 = (void *)(((unint64_t)v35 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v40 = (void *)(((unint64_t)v36 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v39 = *v40;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v39[1] = v40[1];
  v39[2] = v40[2];
  void v39[3] = v40[3];
  uint64_t v41 = sub_2192D9210();
  uint64_t v42 = v41;
  uint64_t v43 = *(void *)(v41 - 8);
  uint64_t v44 = *(unsigned int *)(v43 + 84);
  uint64_t v45 = *(_DWORD *)(v43 + 80);
  unint64_t v46 = *(_DWORD *)(v43 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  size_t v47 = (_DWORD *)(((unint64_t)v39 + v45 + 32) & v46);
  int v48 = (_DWORD *)(((unint64_t)v40 + v45 + 32) & v46);
  uint64_t v49 = *(void *)(v43 + 64);
  uint64_t v50 = v49 + 7;
  unint64_t v51 = (v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  size_t v52 = v51 + 8;
  if (v44)
  {
    uint64_t v81 = v49 + 7;
    unint64_t v53 = (v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v54 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v43 + 48);
    int v55 = v54(v47, v44, v41);
    uint64_t v56 = v42;
    int v57 = v55;
    unint64_t v83 = v48;
    uint64_t v58 = v48;
    uint64_t v59 = v56;
    int v60 = ((uint64_t (*)(_DWORD *, uint64_t))v54)(v58, v44);
    size_t v52 = v51 + 8;
    unint64_t v51 = v53;
    uint64_t v61 = a1;
    if (v57) {
      goto LABEL_44;
    }
    goto LABEL_66;
  }
  uint64_t v61 = a1;
  if (!*((unsigned char *)v47 + v52)
    || ((int v62 = *((unsigned __int8 *)v47 + v52) - 1, v51 == -8) ? (v63 = 0) : (int v62 = 0, v63 = *v47),
        (v63 | v62) == 0xFFFFFFFF))
  {
    if (!*((unsigned char *)v48 + v52)) {
      goto LABEL_72;
    }
    int v66 = *((unsigned __int8 *)v48 + v52) - 1;
    if (v51 != -8) {
      int v66 = 0;
    }
    uint64_t v81 = v50;
    unint64_t v83 = v48;
    if (v51 == -8)
    {
      uint64_t v59 = v41;
      int v68 = 0;
    }
    else
    {
      unsigned int v67 = v48;
      uint64_t v59 = v41;
      int v68 = *v67;
    }
    int v60 = (v68 | v66) + 1;
LABEL_66:
    uint64_t v42 = v59;
    uint64_t v50 = v81;
    int v48 = v83;
    if (v60)
    {
      (*(void (**)(_DWORD *, uint64_t))(v43 + 8))(v47, v42);
      goto LABEL_68;
    }
LABEL_72:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v43 + 24))(v47, v48, v42);
    *(void *)(((unint64_t)v47 + v50) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v48 + v50) & 0xFFFFFFFFFFFFFFF8);
    goto LABEL_73;
  }
  if (!*((unsigned char *)v48 + v52)) {
    goto LABEL_57;
  }
  uint64_t v81 = v50;
  unint64_t v83 = v48;
  int v64 = *((unsigned __int8 *)v48 + v52) - 1;
  if (v51 != -8) {
    int v64 = 0;
  }
  uint64_t v59 = v41;
  if (v51 == -8) {
    int v65 = 0;
  }
  else {
    int v65 = *v83;
  }
  int v60 = (v65 | v64) + 1;
LABEL_44:
  uint64_t v42 = v59;
  uint64_t v50 = v81;
  int v48 = v83;
  if (v60)
  {
LABEL_68:
    if (v44) {
      size_t v69 = v52;
    }
    else {
      size_t v69 = v51 + 9;
    }
    memcpy(v47, v48, v69);
    goto LABEL_73;
  }
LABEL_57:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v43 + 16))(v47, v48, v42);
  *(void *)(((unint64_t)v47 + v50) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v48 + v50) & 0xFFFFFFFFFFFFFFF8);
  if (!v44) {
    *((unsigned char *)v47 + v52) = 0;
  }
LABEL_73:
  unint64_t v70 = v51 + 9;
  if (v44) {
    unint64_t v70 = v52;
  }
  unint64_t v71 = ((unint64_t)v47 + v45 + v70) & ~v45;
  unint64_t v72 = ((unint64_t)v48 + v45 + v70) & ~v45;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v43 + 24))(v71, v72, v42);
  uint64_t v73 = (uint64_t *)((v50 + v71) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v74 = (uint64_t *)((v50 + v72) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v75 = *v74;
  unint64_t v76 = v74[1];
  sub_2192C11C8(*v74, v76);
  uint64_t v77 = *v73;
  unint64_t v78 = v73[1];
  *uint64_t v73 = v75;
  v73[1] = v76;
  sub_2192C1220(v77, v78);
  return v61;
}

unsigned char *sub_2192CCA64(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v3 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v4 = (_OWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  long long v5 = v4[1];
  _OWORD *v3 = *v4;
  v3[1] = v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (unint64_t)v3 + v8 + 32;
  unint64_t v10 = (unint64_t)v4 + v8 + 32;
  uint64_t v53 = ~v8;
  uint64_t v54 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v7 + 48);
  size_t v52 = a1;
  if (v54(v10 & ~v8, 1, AssociatedTypeWitness))
  {
    int v11 = *(_DWORD *)(v7 + 84);
    size_t v12 = *(void *)(v7 + 64);
    if (v11) {
      size_t v13 = *(void *)(v7 + 64);
    }
    else {
      size_t v13 = v12 + 1;
    }
    memcpy((void *)(v9 & ~v8), (const void *)(v10 & ~v8), v13);
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 32))(v9 & ~v8, v10 & ~v8, AssociatedTypeWitness);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9 & ~v8, 0, 1, AssociatedTypeWitness);
    int v11 = *(_DWORD *)(v7 + 84);
    size_t v12 = *(void *)(v7 + 64);
  }
  if (v11) {
    size_t v14 = v12;
  }
  else {
    size_t v14 = v12 + 1;
  }
  size_t v15 = (char *)(((v9 | v8) + v14) & v53);
  uint64_t v16 = (char *)(((v10 | v8) + v14) & v53);
  if (v54((unint64_t)v16, 1, AssociatedTypeWitness))
  {
    memcpy(v15, v16, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, AssociatedTypeWitness);
  }
  uint64_t v17 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = &v17[v20];
  uint64_t v55 = ~v20;
  uint64_t v22 = (void *)((unint64_t)&v17[v20] & ~v20);
  unint64_t v23 = (unint64_t)&v16[v14 + v20];
  uint64_t v24 = (const void *)(v23 & ~v20);
  uint64_t v56 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v56(v24, 1, v18))
  {
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
    if (v25) {
      size_t v27 = *(void *)(v19 + 64);
    }
    else {
      size_t v27 = v26 + 1;
    }
    memcpy(v22, v24, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v22, v24, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0, 1, v18);
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  if (v25) {
    size_t v28 = v26;
  }
  else {
    size_t v28 = v26 + 1;
  }
  int v29 = (void *)((((unint64_t)v21 | v20) + v28) & v55);
  int v30 = (const void *)(((v23 | v20) + v28) & v55);
  if (v56(v30, 1, v18))
  {
    memcpy(v29, v30, v28);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v29, v30, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v29, 0, 1, v18);
  }
  int v31 = (_OWORD *)(((unint64_t)v30 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v32 = v31[1];
  size_t v33 = (_OWORD *)(((unint64_t)v29 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  *size_t v33 = *v31;
  v33[1] = v32;
  uint64_t v34 = sub_2192D9210();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(unsigned int *)(v35 + 84);
  uint64_t v37 = *(_DWORD *)(v35 + 80);
  unint64_t v38 = *(_DWORD *)(v35 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v39 = (void *)(((unint64_t)v33 + v37 + 32) & v38);
  uint64_t v40 = (_DWORD *)(((unint64_t)v31 + v37 + 32) & v38);
  uint64_t v41 = *(void *)(v35 + 64) + 7;
  unint64_t v42 = v41 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v57 = v34;
  if (!v36)
  {
    if (!*((unsigned char *)v40 + v43)) {
      goto LABEL_36;
    }
    int v44 = *((unsigned __int8 *)v40 + v43) - 1;
    int v45 = v43 & 0xFFFFFFF8;
    if ((v43 & 0xFFFFFFF8) != 0)
    {
      int v44 = 0;
      int v45 = *v40;
    }
    if ((v45 | v44) == 0xFFFFFFFF) {
      goto LABEL_36;
    }
LABEL_32:
    if (v36) {
      size_t v46 = v42 + 8;
    }
    else {
      size_t v46 = v42 + 9;
    }
    memcpy(v39, v40, v46);
    size_t v47 = *(void (**)(void *, _DWORD *, uint64_t))(v35 + 32);
    goto LABEL_38;
  }
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v35 + 48))(v40, v36, v34)) {
    goto LABEL_32;
  }
LABEL_36:
  size_t v47 = *(void (**)(void *, _DWORD *, uint64_t))(v35 + 32);
  v47(v39, v40, v57);
  *(void *)(((unint64_t)v39 + v41) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v40 + v41) & 0xFFFFFFFFFFFFFFF8);
  if (!v36) {
    *((unsigned char *)v39 + v43) = 0;
  }
LABEL_38:
  unint64_t v48 = v42 + 9;
  if (v36) {
    unint64_t v48 = v42 + 8;
  }
  unint64_t v49 = ((unint64_t)v39 + v37 + v48) & ~v37;
  unint64_t v50 = ((unint64_t)v40 + v37 + v48) & ~v37;
  v47((void *)v49, (_DWORD *)v50, v57);
  *(_OWORD *)((v41 + v49) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v41 + v50) & 0xFFFFFFFFFFFFFFF8);
  return v52;
}

unsigned char *sub_2192CCFEC(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  unint64_t v2 = (void *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v3 = (void *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v2 = *v3;
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (unint64_t)v2 + v6 + 32;
  uint64_t v77 = ~v6;
  unint64_t v8 = (unint64_t)v3 + v6 + 32;
  unint64_t v9 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7 & ~v6, 1, AssociatedTypeWitness);
  int v11 = v9(v8 & ~v6, 1, AssociatedTypeWitness);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(v7 & ~v6, v8 & ~v6, AssociatedTypeWitness);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56))(v7 & ~v6, 0, 1, AssociatedTypeWitness);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))(v7 & ~v6, v8 & ~v6, AssociatedTypeWitness);
      goto LABEL_12;
    }
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy((void *)(v7 & ~v6), (const void *)(v8 & ~v6), v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    size_t v15 = *(void *)(v5 + 64);
  }
  else {
    size_t v15 = *(void *)(v5 + 64) + 1;
  }
  uint64_t v16 = (char *)(((v7 | v6) + v15) & v77);
  uint64_t v17 = (char *)(((v8 | v6) + v15) & v77);
  int v18 = v9((unint64_t)v16, 1, AssociatedTypeWitness);
  int v19 = v9((unint64_t)v17, 1, AssociatedTypeWitness);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v16, v17, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v16, 0, 1, AssociatedTypeWitness);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, AssociatedTypeWitness);
LABEL_20:
    memcpy(v16, v17, v15);
    goto LABEL_21;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v16, v17, AssociatedTypeWitness);
LABEL_21:
  uint64_t v20 = &v16[v15];
  swift_getAssociatedConformanceWitness();
  uint64_t v21 = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = &v20[v23];
  uint64_t v79 = ~v23;
  int v25 = (void *)((unint64_t)&v20[v23] & ~v23);
  unint64_t v26 = (unint64_t)&v17[v15 + v23];
  size_t v27 = (void *)(v26 & ~v23);
  size_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v29 = v28(v25, 1, v21);
  int v30 = v28(v27, 1, v21);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v25, v27, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v21);
      goto LABEL_33;
    }
    int v31 = *(_DWORD *)(v22 + 84);
    size_t v32 = *(void *)(v22 + 64);
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v25, v27, v21);
      goto LABEL_33;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v25, v21);
    int v31 = *(_DWORD *)(v22 + 84);
    size_t v32 = *(void *)(v22 + 64);
  }
  if (v31) {
    size_t v33 = v32;
  }
  else {
    size_t v33 = v32 + 1;
  }
  memcpy(v25, v27, v33);
LABEL_33:
  if (*(_DWORD *)(v22 + 84)) {
    size_t v34 = *(void *)(v22 + 64);
  }
  else {
    size_t v34 = *(void *)(v22 + 64) + 1;
  }
  uint64_t v35 = (void *)((((unint64_t)v24 | v23) + v34) & v79);
  uint64_t v36 = (void *)(((v26 | v23) + v34) & v79);
  int v37 = v28(v35, 1, v21);
  int v38 = v28(v36, 1, v21);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v35, v36, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v35, 0, 1, v21);
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v35, v21);
LABEL_41:
    memcpy(v35, v36, v34);
    goto LABEL_42;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v35, v36, v21);
LABEL_42:
  uint64_t v39 = (void *)(((unint64_t)v35 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v40 = (void *)(((unint64_t)v36 + v34 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v39 = *v40;
  swift_unknownObjectRelease();
  v39[1] = v40[1];
  v39[2] = v40[2];
  void v39[3] = v40[3];
  uint64_t v41 = sub_2192D9210();
  uint64_t v42 = v41;
  uint64_t v43 = *(void *)(v41 - 8);
  uint64_t v44 = *(unsigned int *)(v43 + 84);
  uint64_t v45 = *(_DWORD *)(v43 + 80);
  unint64_t v46 = *(_DWORD *)(v43 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  size_t v47 = (_DWORD *)(((unint64_t)v39 + v45 + 32) & v46);
  unint64_t v48 = (_DWORD *)(((unint64_t)v40 + v45 + 32) & v46);
  uint64_t v49 = *(void *)(v43 + 64);
  uint64_t v50 = v49 + 7;
  unint64_t v51 = (v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  size_t v52 = v51 + 8;
  if (v44)
  {
    uint64_t v78 = v49 + 7;
    unint64_t v53 = (v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v54 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v43 + 48);
    int v55 = v54(v47, v44, v41);
    uint64_t v56 = v42;
    int v57 = v55;
    uint64_t v80 = v48;
    uint64_t v58 = v48;
    uint64_t v59 = v56;
    int v60 = ((uint64_t (*)(_DWORD *, uint64_t))v54)(v58, v44);
    size_t v52 = v51 + 8;
    unint64_t v51 = v53;
    uint64_t v61 = a1;
    if (v57) {
      goto LABEL_44;
    }
    goto LABEL_66;
  }
  uint64_t v61 = a1;
  if (!*((unsigned char *)v47 + v52)
    || ((int v62 = *((unsigned __int8 *)v47 + v52) - 1, v51 == -8) ? (v63 = 0) : (int v62 = 0, v63 = *v47),
        (v63 | v62) == 0xFFFFFFFF))
  {
    if (!*((unsigned char *)v48 + v52)) {
      goto LABEL_72;
    }
    int v66 = *((unsigned __int8 *)v48 + v52) - 1;
    if (v51 != -8) {
      int v66 = 0;
    }
    uint64_t v78 = v50;
    uint64_t v80 = v48;
    if (v51 == -8)
    {
      uint64_t v59 = v41;
      int v68 = 0;
    }
    else
    {
      unsigned int v67 = v48;
      uint64_t v59 = v41;
      int v68 = *v67;
    }
    int v60 = (v68 | v66) + 1;
LABEL_66:
    uint64_t v42 = v59;
    uint64_t v50 = v78;
    unint64_t v48 = v80;
    if (v60)
    {
      (*(void (**)(_DWORD *, uint64_t))(v43 + 8))(v47, v42);
      goto LABEL_68;
    }
LABEL_72:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v43 + 40))(v47, v48, v42);
    *(void *)(((unint64_t)v47 + v50) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v48 + v50) & 0xFFFFFFFFFFFFFFF8);
    goto LABEL_73;
  }
  if (!*((unsigned char *)v48 + v52)) {
    goto LABEL_57;
  }
  uint64_t v78 = v50;
  uint64_t v80 = v48;
  int v64 = *((unsigned __int8 *)v48 + v52) - 1;
  if (v51 != -8) {
    int v64 = 0;
  }
  uint64_t v59 = v41;
  if (v51 == -8) {
    int v65 = 0;
  }
  else {
    int v65 = *v80;
  }
  int v60 = (v65 | v64) + 1;
LABEL_44:
  uint64_t v42 = v59;
  uint64_t v50 = v78;
  unint64_t v48 = v80;
  if (v60)
  {
LABEL_68:
    if (v44) {
      size_t v69 = v52;
    }
    else {
      size_t v69 = v51 + 9;
    }
    memcpy(v47, v48, v69);
    goto LABEL_73;
  }
LABEL_57:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v43 + 32))(v47, v48, v42);
  *(void *)(((unint64_t)v47 + v50) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v48 + v50) & 0xFFFFFFFFFFFFFFF8);
  if (!v44) {
    *((unsigned char *)v47 + v52) = 0;
  }
LABEL_73:
  unint64_t v70 = v51 + 9;
  if (v44) {
    unint64_t v70 = v52;
  }
  unint64_t v71 = ((unint64_t)v47 + v45 + v70) & ~v45;
  unint64_t v72 = ((unint64_t)v48 + v45 + v70) & ~v45;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v43 + 40))(v71, v72, v42);
  uint64_t v73 = (uint64_t *)((v50 + v71) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v74 = *v73;
  unint64_t v75 = v73[1];
  *(_OWORD *)uint64_t v73 = *(_OWORD *)((v50 + v72) & 0xFFFFFFFFFFFFFFF8);
  sub_2192C1220(v74, v75);
  return v61;
}

uint64_t sub_2192CD874(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned int *)(v3 + 84);
  if (v4) {
    unsigned int v5 = v4 - 1;
  }
  else {
    unsigned int v5 = 0;
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v55 = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(v55 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned int *)(v6 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  unsigned int v56 = v5;
  if (v5 <= v9) {
    unsigned int v5 = v9;
  }
  uint64_t v10 = *(void *)(sub_2192D9210() - 8);
  uint64_t v11 = v10;
  int v13 = *(_DWORD *)(v10 + 80);
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12) {
    unsigned int v14 = v12 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  uint64_t v15 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = *(void *)(v10 + 64);
  if (v12 <= 0xC) {
    unsigned int v18 = 12;
  }
  else {
    unsigned int v18 = *(_DWORD *)(v10 + 84);
  }
  if (v5 <= v18) {
    unsigned int v19 = v18;
  }
  else {
    unsigned int v19 = v5;
  }
  if (v19 <= 0x7FFFFFFF) {
    unsigned int v20 = 0x7FFFFFFF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (v4) {
    uint64_t v21 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v21 = *(void *)(v3 + 64) + 1;
  }
  if (v8) {
    uint64_t v22 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v22 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v23 = 8;
  if (!v12) {
    uint64_t v23 = 9;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v24 = v3;
  uint64_t v25 = v4;
  unsigned int v26 = v14;
  uint64_t v27 = v21 + v15;
  uint64_t v28 = v21 + v16;
  uint64_t v29 = v22 + v16;
  uint64_t v30 = v22 + 7;
  uint64_t v31 = v13;
  unint64_t v32 = v13 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = v13 + 32;
  uint64_t v34 = v17 + 7;
  unint64_t v35 = (v34 & 0xFFFFFFFFFFFFFFF8) + v13 + v23;
  if (v20 < a2)
  {
    unint64_t v36 = ((v34 + (v35 & ~v31)) & 0xFFFFFFFFFFFFFFF8)
        + ((v33 + ((v30 + ((v29 + ((v28 + ((v27 + ((v15 + 40) & ~v15)) & ~v15)) & ~v16)) & ~v16)) & 0xFFFFFFFFFFFFFFF8)) & v32)
        + 16;
    if ((v36 & 0xFFFFFFF8) != 0) {
      unsigned int v37 = 2;
    }
    else {
      unsigned int v37 = a2 - v20 + 1;
    }
    if (v37 >= 0x10000) {
      unsigned int v38 = 4;
    }
    else {
      unsigned int v38 = 2;
    }
    if (v37 < 0x100) {
      unsigned int v38 = 1;
    }
    if (v37 >= 2) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = 0;
    }
    switch(v39)
    {
      case 1:
        int v40 = *((unsigned __int8 *)a1 + v36);
        if (!*((unsigned char *)a1 + v36)) {
          break;
        }
        goto LABEL_46;
      case 2:
        int v40 = *(unsigned __int16 *)((char *)a1 + v36);
        if (*(_WORD *)((char *)a1 + v36)) {
          goto LABEL_46;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2192CDD24);
      case 4:
        int v40 = *(_DWORD *)((char *)a1 + v36);
        if (!v40) {
          break;
        }
LABEL_46:
        int v41 = v40 - 1;
        if ((v36 & 0xFFFFFFF8) != 0)
        {
          int v41 = 0;
          int v42 = *a1;
        }
        else
        {
          int v42 = 0;
        }
        return v20 + (v42 | v41) + 1;
      default:
        break;
    }
  }
  uint64_t v43 = ~v15;
  unint64_t v44 = ((((unint64_t)a1 + 10) & 0xFFFFFFFFFFFFFFF8) + v15 + 32) & ~v15;
  if (v56 == v20)
  {
    if (v25 >= 2)
    {
      unsigned int v45 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v24 + 48))(v44, v25, AssociatedTypeWitness);
      goto LABEL_60;
    }
    return 0;
  }
  uint64_t v46 = ~v16;
  unint64_t v47 = (v28 + ((v27 + v44) & v43)) & v46;
  if (v9 == v20)
  {
    if (v8 < 2) {
      return 0;
    }
    unsigned int v45 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v47, v8, v55);
LABEL_60:
    if (v45 >= 2) {
      return v45 - 1;
    }
    else {
      return 0;
    }
  }
  uint64_t v49 = (uint64_t *)((v30 + ((v29 + v47) & v46)) & 0xFFFFFFFFFFFFFFF8);
  if ((v19 & 0x80000000) != 0)
  {
    unint64_t v51 = ((unint64_t)v49 + v33) & v32;
    if (v26 == v18)
    {
      if (v12 < 2) {
        return 0;
      }
      unsigned int v45 = (*(uint64_t (**)(unint64_t))(v11 + 48))(v51);
      goto LABEL_60;
    }
    unint64_t v52 = (v35 + v51) & ~v31;
    if (v12 < 0xC)
    {
      uint64_t v54 = *(void *)(((v34 + v52) & 0xFFFFFFFFFFFFFFF8) + 8) >> 60;
      if (((4 * v54) & 0xC) != 0) {
        return 16 - ((4 * v54) & 0xC | (v54 >> 2));
      }
      else {
        return 0;
      }
    }
    else
    {
      unint64_t v53 = *(uint64_t (**)(unint64_t))(v11 + 48);
      return v53(v52);
    }
  }
  else
  {
    uint64_t v50 = *v49;
    if ((unint64_t)*v49 >= 0xFFFFFFFF) {
      LODWORD(v50) = -1;
    }
    return (v50 + 1);
  }
}

void sub_2192CDD38(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v65 = v4;
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v60 - 8);
  uint64_t v64 = v7;
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  unsigned int v61 = v6;
  if (v6 <= v9) {
    unsigned int v6 = v9;
  }
  int v10 = 0;
  uint64_t v11 = *(void *)(sub_2192D9210() - 8);
  uint64_t v12 = v11;
  int v14 = *(_DWORD *)(v11 + 80);
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  unsigned int v15 = v13 - 1;
  if (!v13) {
    unsigned int v15 = 0;
  }
  unsigned int v59 = v15;
  uint64_t v16 = *(void *)(v4 + 64);
  uint64_t v17 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = *(void *)(v7 + 64);
  uint64_t v20 = *(void *)(v11 + 64);
  if (v13 <= 0xC) {
    unsigned int v21 = 12;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v11 + 84);
  }
  if (v6 <= v21) {
    unsigned int v22 = v21;
  }
  else {
    unsigned int v22 = v6;
  }
  if (v22 <= 0x7FFFFFFF) {
    unsigned int v23 = 0x7FFFFFFF;
  }
  else {
    unsigned int v23 = v22;
  }
  if (!v5) {
    ++v16;
  }
  uint64_t v24 = v16 + v17;
  uint64_t v25 = v16 + v18;
  uint64_t v26 = (v16 + v18 + ((v16 + v17 + ((v17 + 40) & ~v17)) & ~v17)) & ~v18;
  if (!v8) {
    ++v19;
  }
  uint64_t v27 = v19 + v18;
  uint64_t v28 = v19 + 7;
  unint64_t v29 = (v19 + 7 + ((v19 + v18 + v26) & ~v18)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = v14;
  unint64_t v31 = v14 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = v14 + 32;
  unint64_t v33 = (v32 + v29) & v31;
  uint64_t v34 = v20 + 7;
  unint64_t v35 = (v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  size_t v36 = v35 + 8;
  size_t v37 = v35 + 9;
  if (v13) {
    size_t v37 = v36;
  }
  size_t v38 = v37 + v14;
  size_t v39 = ((v34 + ((v37 + v30) & ~v30)) & 0xFFFFFFFFFFFFFFF8) + v33 + 16;
  if (v23 < a3)
  {
    if (((v34 + ((v37 + v30) & ~v30)) & 0xFFFFFFF8) + v33 == -16) {
      unsigned int v40 = a3 - v23 + 1;
    }
    else {
      unsigned int v40 = 2;
    }
    if (v40 >= 0x10000) {
      int v41 = 4;
    }
    else {
      int v41 = 2;
    }
    if (v40 < 0x100) {
      int v41 = 1;
    }
    if (v40 >= 2) {
      int v10 = v41;
    }
    else {
      int v10 = 0;
    }
  }
  if (a2 > v23)
  {
    if (v39) {
      int v42 = 1;
    }
    else {
      int v42 = a2 - v23;
    }
    if (v39)
    {
      unsigned int v43 = ~v23 + a2;
      bzero(a1, v39);
      *a1 = v43;
    }
    switch(v10)
    {
      case 1:
        *((unsigned char *)a1 + v39) = v42;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v39) = v42;
        return;
      case 3:
        goto LABEL_85;
      case 4:
        *(unsigned int *)((char *)a1 + v39) = v42;
        return;
      default:
        return;
    }
  }
  uint64_t v44 = ~v17;
  uint64_t v45 = ~v18;
  switch(v10)
  {
    case 1:
      *((unsigned char *)a1 + v39) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_53;
    case 2:
      *(_WORD *)((char *)a1 + v39) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_53;
    case 3:
LABEL_85:
      __break(1u);
      JUMPOUT(0x2192CE2A0);
    case 4:
      *(unsigned int *)((char *)a1 + v39) = 0;
      goto LABEL_52;
    default:
LABEL_52:
      if (!a2) {
        return;
      }
LABEL_53:
      unint64_t v46 = ((((unint64_t)a1 + 10) & 0xFFFFFFFFFFFFFFF8) + v17 + 32) & v44;
      if (v61 == v23)
      {
        if (v5 < 2) {
          return;
        }
        uint64_t v47 = a2 + 1;
        unint64_t v48 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56);
        uint64_t v49 = v5;
        uint64_t v50 = AssociatedTypeWitness;
LABEL_59:
        v48(v46, v47, v49, v50);
        return;
      }
      unint64_t v46 = (v25 + ((v24 + v46) & v44)) & v45;
      if (v9 == v23)
      {
        if (v8 < 2) {
          return;
        }
        uint64_t v47 = a2 + 1;
        unint64_t v48 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v64 + 56);
        uint64_t v49 = v8;
        uint64_t v50 = v60;
        goto LABEL_59;
      }
      unint64_t v51 = (void *)((v28 + ((v27 + v46) & v45)) & 0xFFFFFFFFFFFFFFF8);
      if ((v22 & 0x80000000) == 0)
      {
        if ((a2 & 0x80000000) != 0)
        {
          uint64_t v52 = a2 ^ 0x80000000;
          v51[2] = 0;
          v51[3] = 0;
          v51[1] = 0;
        }
        else
        {
          uint64_t v52 = a2 - 1;
        }
        *unint64_t v51 = v52;
        return;
      }
      unint64_t v53 = (_DWORD *)(((unint64_t)v51 + v32) & v31);
      if (v59 == v21)
      {
        if (v13 < 2) {
          return;
        }
        if (a2 + 1 > v13)
        {
          if (v36)
          {
            unsigned int v54 = a2 - v13;
            bzero(v53, v36);
            *unint64_t v53 = v54;
          }
          return;
        }
        if (a2 == -1) {
          return;
        }
        unsigned int v56 = *(void (**)(_DWORD *, uint64_t))(v12 + 56);
        uint64_t v55 = v53;
        uint64_t v57 = a2 + 1;
      }
      else
      {
        uint64_t v55 = (_DWORD *)(((unint64_t)v53 + v38) & ~v30);
        if (v13 < 0xC)
        {
          uint64_t v58 = (void *)(((unint64_t)v55 + v34) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0xC)
          {
            void *v58 = a2 - 13;
            v58[1] = 0;
          }
          else
          {
            void *v58 = 0;
            v58[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
          }
          return;
        }
        unsigned int v56 = *(void (**)(_DWORD *, uint64_t))(v12 + 56);
        uint64_t v57 = a2;
      }
      v56(v55, v57);
      return;
  }
}

uint64_t sub_2192CE2C8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2192D9060();
  if (!result || (uint64_t result = sub_2192D9090(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2192D9080();
      return sub_2192D90F0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_2192CE35C()
{
  unint64_t result = qword_267C16650;
  if (!qword_267C16650)
  {
    sub_2192D91E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16650);
  }
  return result;
}

unint64_t sub_2192CE3B4()
{
  unint64_t result = qword_267C16660;
  if (!qword_267C16660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C16658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16660);
  }
  return result;
}

uint64_t sub_2192CE410(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
    uint64_t v3 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *(v2 - 1);
      uint64_t v4 = *v2;
      unint64_t v7 = *(v2 - 3);
      uint64_t v6 = *(v2 - 2);
      swift_bridgeObjectRetain_n();
      uint64_t v8 = sub_2192D0724((uint64_t)&unk_26CAAAA78, v7, v6, v5, v4);
      swift_bridgeObjectRelease();
      if (!*(void *)(v8 + 16)) {
        break;
      }
      char v9 = *(unsigned char *)(v8 + 32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_2192D787C(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v11 = *((void *)v3 + 2);
      unint64_t v10 = *((void *)v3 + 3);
      if (v11 >= v10 >> 1) {
        uint64_t v3 = sub_2192D787C((char *)(v10 > 1), v11 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v11 + 1;
      v3[v11 + 32] = v9;
      v2 += 4;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v3;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

Chirp::Modifiers_optional __swiftcall Modifiers.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_2192D9640();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

void *static Modifiers.allCases.getter()
{
  return &unk_26CAAA990;
}

uint64_t Modifiers.rawValue.getter()
{
  uint64_t result = 812348272;
  switch(*v0)
  {
    case 1:
      uint64_t result = 829125488;
      break;
    case 2:
      uint64_t result = 845902704;
      break;
    case 3:
      uint64_t result = 862679920;
      break;
    case 4:
      uint64_t result = 0x6B6361626C6C6166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2192CE658(unsigned __int8 *a1, char *a2)
{
  return sub_2192CE664(*a1, *a2);
}

uint64_t sub_2192CE664(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 812348272;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 812348272;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 829125488;
      break;
    case 2:
      uint64_t v5 = 845902704;
      break;
    case 3:
      uint64_t v5 = 862679920;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6B6361626C6C6166;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 829125488) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 845902704) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 862679920;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x6B6361626C6C6166) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_2192D9660();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2192CE7D8()
{
  return sub_2192D9700();
}

uint64_t sub_2192CE8A4()
{
  sub_2192D9400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2192CE958()
{
  return sub_2192D9700();
}

Chirp::Modifiers_optional sub_2192CEA20(Swift::String *a1)
{
  return Modifiers.init(rawValue:)(*a1);
}

void sub_2192CEA2C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 812348272;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 829125488;
      goto LABEL_3;
    case 2:
      *a1 = 845902704;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 862679920;
      a1[1] = 0xE400000000000000;
      break;
    case 4:
      *a1 = 0x6B6361626C6C6166;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE400000000000000;
      break;
  }
}

void sub_2192CEABC(void *a1@<X8>)
{
  *a1 = &unk_26CAAAA50;
}

unsigned char *HandshakeAndModifiers.init(_:modifiers:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = *result;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t HandshakeAndModifiers.init(_:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  unsigned int v61 = a5;
  unint64_t v63 = sub_2192D9730();
  MEMORY[0x270FA5388](v63);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = a2 >> 14;
  unint64_t v14 = a1 >> 14;
  uint64_t v64 = a3;
  if (a1 >> 14 == a2 >> 14)
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = a1;
  }
  else
  {
    int v62 = (void (**)(char *, unint64_t))(v10 + 8);
    swift_bridgeObjectRetain();
    unint64_t v15 = a1;
    unint64_t v60 = a1 >> 14;
    do
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_2192D9560();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      if ((sub_2192D9350() & 1) == 0) {
        goto LABEL_4;
      }
      if (sub_2192D9340())
      {
        uint64_t result = sub_2192CFE38(v17, v19);
        if ((result & 0x100000000) != 0) {
          goto LABEL_39;
        }
        sub_2192D9740();
        unint64_t v5 = sub_2192D9710();
        (*v62)(v12, v63);
        if (v5) {
          goto LABEL_16;
        }
      }
      if ((sub_2192D9330() & 1) == 0) {
        goto LABEL_4;
      }
      if (sub_2192D9340())
      {
        uint64_t result = sub_2192CFE38(v17, v19);
        if ((result & 0x100000000) != 0) {
          goto LABEL_41;
        }
        sub_2192D9740();
        unint64_t v5 = sub_2192D9720();
        (*v62)(v12, v63);
        if (v5) {
          goto LABEL_16;
        }
      }
      if ((sub_2192D9330() & 1) == 0 || (sub_2192D9320() & 1) == 0)
      {
LABEL_16:
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_4:
        char v16 = sub_2192D9360();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }
      unint64_t v15 = sub_2192D9540();
      unint64_t v14 = v15 >> 14;
    }
    while (v15 >> 14 != v13);
    unint64_t v14 = a2 >> 14;
LABEL_18:
    if (v14 < v60)
    {
      __break(1u);
      goto LABEL_35;
    }
  }
  uint64_t v21 = sub_2192D9570();
  unint64_t v5 = v22;
  int v62 = v23;
  unint64_t v25 = v24;
  swift_bridgeObjectRelease();
  if (v13 >= v5 >> 14)
  {
    unint64_t v60 = v25;
    unint64_t v63 = v21;
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_2192D9570();
    unint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v31 = swift_bridgeObjectRelease();
    uint64_t v65 = 43;
    unint64_t v66 = 0xE100000000000000;
    MEMORY[0x270FA5388](v31);
    v54[-2] = &v65;
    swift_bridgeObjectRetain();
    unint64_t v57 = v28;
    unint64_t v58 = v26;
    uint64_t v56 = v30;
    unint64_t v15 = 0;
    unint64_t v59 = sub_2192CF48C(0x7FFFFFFFFFFFFFFFLL, 1, sub_2192D02E8, (uint64_t)&v54[-4], v26, v28, v30);
    if (qword_267C16528 == -1) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_21:
  uint64_t v32 = v60;
  swift_bridgeObjectRetain();
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = v62;
  unint64_t v35 = sub_2192CF8AC(v33, v63, v5, (uint64_t)v62, v32);
  swift_bridgeObjectRelease();
  uint64_t result = sub_2192D01C8(v35);
  if ((v37 & 1) == 0)
  {
    if (*(_DWORD *)(v35 + 36) == v36)
    {
      if (result == 1 << *(unsigned char *)(v35 + 32))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267C16668);
        uint64_t v38 = swift_allocObject();
        *(_OWORD *)(v38 + 16) = xmmword_2192DA1C0;
        uint64_t v65 = 0;
        unint64_t v66 = 0xE000000000000000;
        sub_2192D95C0();
        uint64_t v39 = MEMORY[0x21D486B80](v63, v5, v34, v32);
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v65 = v39;
        unint64_t v66 = v41;
LABEL_25:
        sub_2192D9450();
        uint64_t v43 = v65;
        unint64_t v42 = v66;
        *(void *)(v38 + 56) = MEMORY[0x263F8D310];
        *(void *)(v38 + 32) = v43;
        *(void *)(v38 + 40) = v42;
        sub_2192D96D0();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v44 = 0;
        uint64_t v45 = 1;
        unint64_t v46 = v61;
LABEL_32:
        *unint64_t v46 = v44;
        v46[1] = v45;
        return result;
      }
      v54[1] = v15;
      sub_2192D0250(&v65, result, v36, 0, v35);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v55 = v65;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_2192D9550();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_2192D9550();
      swift_bridgeObjectRelease();
      if (v47 == v48)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v45 = 0;
        goto LABEL_31;
      }
      uint64_t v49 = sub_2192D9550();
      swift_bridgeObjectRelease();
      uint64_t v50 = sub_2192D9550();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v51 = v49 + v50;
      if (!__OFADD__(v49, v50))
      {
        swift_bridgeObjectRetain();
        uint64_t v52 = v64;
        uint64_t v53 = sub_2192D9550();
        swift_bridgeObjectRelease();
        if (v51 != v53)
        {
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267C16668);
          uint64_t v38 = swift_allocObject();
          *(_OWORD *)(v38 + 16) = xmmword_2192DA1C0;
          uint64_t v65 = 0;
          unint64_t v66 = 0xE000000000000000;
          sub_2192D95C0();
          sub_2192D9450();
          MEMORY[0x21D486B80](a1, a2, v52, a4);
          sub_2192D9450();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
        uint64_t v45 = sub_2192CE410(v59);
        uint64_t result = swift_bridgeObjectRelease();
LABEL_31:
        unint64_t v46 = v61;
        uint64_t v44 = v55;
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_39:
    __break(1u);
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

char *sub_2192CF25C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2192CF29C(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_2192CF27C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2192CF3A0(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_2192CF29C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16698);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2192CF3A0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16688);
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
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

unint64_t sub_2192CF48C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  v44[3] = a4;
  if (a1 < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v11 = a7;
  unint64_t v12 = a6;
  unint64_t v9 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v9;
  if (!a1 || (unint64_t v42 = v12 >> 14, v12 >> 14 == v9 >> 14))
  {
    sub_2192CFD20(v12, v41, a2 & 1, v14);
    swift_bridgeObjectRelease();
    unint64_t v12 = *(void *)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  uint64_t v32 = a1;
  uint64_t v33 = v14;
  unint64_t v40 = (char *)MEMORY[0x263F8EE78];
  unint64_t v16 = v9;
  unint64_t v10 = v9;
  unint64_t v37 = v9;
  while (1)
  {
    v44[0] = sub_2192D9560();
    v44[1] = v17;
    uint64_t v18 = a3(v44);
    if (v8)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12;
    }
    unint64_t v7 = v18;
    swift_bridgeObjectRelease();
    if (v7) {
      break;
    }
    unint64_t v16 = sub_2192D9540();
LABEL_9:
    if (v42 == v16 >> 14) {
      goto LABEL_24;
    }
  }
  if (v10 >> 14 == v16 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v16 = sub_2192D9540();
    *(void *)(v41 + 16) = v16;
    unint64_t v10 = v16;
    unint64_t v37 = v16;
    goto LABEL_9;
  }
  if (v16 >> 14 < v10 >> 14)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v19 = sub_2192D9570();
  uint64_t v36 = v20;
  uint64_t v38 = v19;
  uint64_t v34 = v22;
  uint64_t v35 = v21;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v40 = sub_2192D7888(0, *((void *)v40 + 2) + 1, 1, v40);
  }
  unint64_t v7 = *((void *)v40 + 2);
  unint64_t v23 = *((void *)v40 + 3);
  if (v7 >= v23 >> 1) {
    unint64_t v40 = sub_2192D7888((char *)(v23 > 1), v7 + 1, 1, v40);
  }
  *((void *)v40 + 2) = v7 + 1;
  unint64_t v24 = &v40[32 * v7];
  *((void *)v24 + 4) = v38;
  *((void *)v24 + 5) = v36;
  *((void *)v24 + 6) = v35;
  *((void *)v24 + 7) = v34;
  *(void *)(v33 + 16) = v40;
  uint64_t v25 = sub_2192D9540();
  unint64_t v16 = v25;
  *(void *)(v41 + 16) = v25;
  if (*((void *)v40 + 2) != v32)
  {
    unint64_t v10 = v25;
    unint64_t v37 = v25;
    goto LABEL_9;
  }
  unint64_t v37 = v25;
  unint64_t v10 = v25;
LABEL_24:
  if (v42 == v10 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    unint64_t v12 = (unint64_t)v40;
    goto LABEL_32;
  }
  if (v42 >= v37 >> 14)
  {
    unint64_t v7 = sub_2192D9570();
    unint64_t v9 = v26;
    unint64_t v10 = v27;
    uint64_t v11 = v28;
    swift_bridgeObjectRelease();
    unint64_t v12 = (unint64_t)v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  unint64_t v12 = (unint64_t)sub_2192D7888(0, *(void *)(v12 + 16) + 1, 1, (char *)v12);
LABEL_29:
  unint64_t v30 = *(void *)(v12 + 16);
  unint64_t v29 = *(void *)(v12 + 24);
  if (v30 >= v29 >> 1) {
    unint64_t v12 = (unint64_t)sub_2192D7888((char *)(v29 > 1), v30 + 1, 1, (char *)v12);
  }
  *(void *)(v12 + 16) = v30 + 1;
  uint64_t v31 = (void *)(v12 + 32 * v30);
  v31[4] = v7;
  v31[5] = v9;
  v31[6] = v10;
  v31[7] = v11;
  *(void *)(v33 + 16) = v12;
LABEL_32:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_5:
  swift_release();
  return v12;
}

unint64_t sub_2192CF8AC(uint64_t isStackAllocationSafe, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[0] = a5;
  uint64_t v9 = isStackAllocationSafe;
  v16[1] = *MEMORY[0x263EF8340];
  char v10 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v11 = (unint64_t)((1 << v10) + 63) >> 6;
  size_t v12 = 8 * v11;
  if ((v10 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    uint64_t v13 = sub_2192D092C((uint64_t)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v11, v9, a2, a3, a4, v16[0]);
    if (v5) {
      swift_willThrow();
    }
    else {
      a2 = v13;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, v12);
    a2 = sub_2192D092C((uint64_t)v14, v11, v9, a2, a3, a4, v16[0]);
    MEMORY[0x21D487140](v14, -1, -1);
    swift_bridgeObjectRelease();
  }
  return a2;
}

uint64_t sub_2192CFA64(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C16690);
  uint64_t result = sub_2192D9630();
  uint64_t v8 = result;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  uint64_t v36 = v4;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      uint64_t v37 = v10;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v34) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      uint64_t v16 = v10 + 1;
      if (!v15)
      {
        uint64_t v16 = v10 + 2;
        if (v10 + 2 >= v34) {
          return v8;
        }
        unint64_t v15 = a1[v16];
        if (!v15)
        {
          uint64_t v16 = v10 + 3;
          if (v10 + 3 >= v34) {
            return v8;
          }
          unint64_t v15 = a1[v16];
          if (!v15)
          {
            uint64_t v17 = v10 + 4;
            if (v10 + 4 >= v34) {
              return v8;
            }
            unint64_t v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                uint64_t v16 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v16 >= v34) {
                  return v8;
                }
                unint64_t v15 = a1[v16];
                ++v17;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      uint64_t v37 = v16;
      unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v13);
    uint64_t v19 = (uint64_t *)(*(void *)(v4 + 56) + 32 * v13);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    sub_2192D96E0();
    sub_2192D96F0();
    uint64_t result = sub_2192D9700();
    uint64_t v24 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
      }
      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    *(unsigned char *)(*(void *)(v8 + 48) + v27) = v18;
    uint64_t v32 = (void *)(*(void *)(v8 + 56) + 32 * v27);
    *uint64_t v32 = v21;
    v32[1] = v20;
    v32[2] = v22;
    v32[3] = v23;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = v36;
    uint64_t v10 = v37;
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2192CFD20(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_2192D9570();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_2192D7888(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_2192D7888((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  char v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

unint64_t sub_2192CFE38(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_2192CFF18(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_2192D95B0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_2192D95D0();
      }
      unsigned int v5 = sub_2192D95E0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_2192CFF18(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_2192CFFB8(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_2192D0028(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_2192CFFB8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_2192D014C(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_2192D0028(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_2192D95D0();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

uint64_t sub_2192D014C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2192D9480();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x21D486C00](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2192D01C8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

unsigned char *sub_2192D0250(unsigned char *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(a5 + 56);
    *uint64_t result = *(unsigned char *)(*(void *)(a5 + 48) + a2);
    uint64_t v6 = *(void *)(v5 + 32 * a2);
    swift_bridgeObjectRetain();
    return (unsigned char *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2192D02E8(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_2192D9660() & 1;
  }
}

unint64_t sub_2192D0344()
{
  unint64_t result = qword_267C16670;
  if (!qword_267C16670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16670);
  }
  return result;
}

unint64_t sub_2192D039C()
{
  unint64_t result = qword_267C16678;
  if (!qword_267C16678)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C16680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16678);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Modifiers(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Modifiers(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x2192D0560);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_2192D0588(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2192D0590(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Modifiers()
{
  return &type metadata for Modifiers;
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HandshakeAndModifiers()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeAndModifiers(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeAndModifiers(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeAndModifiers()
{
  return &type metadata for HandshakeAndModifiers;
}

uint64_t sub_2192D0724(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = 0;
  unint64_t v8 = *(void *)(a1 + 16);
  uint64_t v22 = a1 + 32;
  unint64_t v9 = a2 >> 16;
  uint64_t v21 = MEMORY[0x263F8EE78];
LABEL_2:
  if (v7 <= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v7;
  }
  while (v8 != v7)
  {
    unint64_t v12 = v7;
    if (v10 == v7)
    {
      __break(1u);
      JUMPOUT(0x2192D0918);
    }
    char v13 = *(unsigned char *)(v22 + v7);
    unint64_t v14 = 0xE400000000000000;
    uint64_t v15 = 812348272;
    switch(v13)
    {
      case 1:
        uint64_t v15 = 829125488;
        break;
      case 2:
        uint64_t v15 = 845902704;
        break;
      case 3:
        uint64_t v15 = 862679920;
        break;
      case 4:
        unint64_t v14 = 0xE800000000000000;
        uint64_t v15 = 0x6B6361626C6C6166;
        break;
      default:
        break;
    }
    unint64_t v16 = v8;
    if (v15 == a4 && v14 == a5 && !v9 && (HIBYTE(v14) & 0xC) == v23)
    {
      swift_bridgeObjectRelease();
LABEL_18:
      uint64_t v17 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2192CF27C(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v17 = v21;
      }
      unint64_t v19 = *(void *)(v17 + 16);
      unint64_t v18 = *(void *)(v17 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2192CF27C((char *)(v18 > 1), v19 + 1, 1);
        uint64_t v17 = v21;
      }
      unint64_t v7 = v12 + 1;
      *(void *)(v17 + 16) = v19 + 1;
      uint64_t v21 = v17;
      *(unsigned char *)(v17 + v19 + 32) = v13;
      unint64_t v8 = v16;
      goto LABEL_2;
    }
    char v11 = sub_2192D9650();
    swift_bridgeObjectRelease();
    unint64_t v7 = v12 + 1;
    unint64_t v8 = v16;
    if (v11) {
      goto LABEL_18;
    }
  }
  return v21;
}

uint64_t sub_2192D092C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  char v28 = (unint64_t *)result;
  uint64_t v10 = 0;
  int64_t v11 = 0;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(a3 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  unint64_t v16 = a4 >> 16;
  unint64_t v17 = a5 >> 16;
LABEL_4:
  uint64_t v29 = v10;
  while (v14)
  {
    unint64_t v18 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    unint64_t v19 = v18 | (v11 << 6);
LABEL_21:
    uint64_t v23 = (void *)(*(void *)(a3 + 56) + 32 * v19);
    unint64_t result = v23[2];
    if (result != a6 || v23[3] != a7 || *v23 >> 16 != v16 || v23[1] >> 16 != v17)
    {
      unint64_t result = sub_2192D9650();
      if ((result & 1) == 0) {
        continue;
      }
    }
    *(unint64_t *)((char *)v28 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v10 = v29 + 1;
    if (!__OFADD__(v29, 1)) {
      goto LABEL_4;
    }
    __break(1u);
    return sub_2192CFA64(v28, a2, v29, a3);
  }
  int64_t v20 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v20 >= v15) {
    return sub_2192CFA64(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v20);
  ++v11;
  if (v21) {
    goto LABEL_20;
  }
  int64_t v11 = v20 + 1;
  if (v20 + 1 >= v15) {
    return sub_2192CFA64(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v11);
  if (v21) {
    goto LABEL_20;
  }
  int64_t v11 = v20 + 2;
  if (v20 + 2 >= v15) {
    return sub_2192CFA64(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v11);
  if (v21)
  {
LABEL_20:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
    goto LABEL_21;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v15) {
    return sub_2192CFA64(v28, a2, v29, a3);
  }
  unint64_t v21 = *(void *)(v30 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v15) {
      return sub_2192CFA64(v28, a2, v29, a3);
    }
    unint64_t v21 = *(void *)(v30 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2192D0B18()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2192D0B50()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL static ChirpErrors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChirpErrors.hash(into:)()
{
  return sub_2192D96F0();
}

uint64_t ChirpErrors.hashValue.getter()
{
  return sub_2192D9700();
}

BOOL sub_2192D0BEC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2192D0C00()
{
  return sub_2192D9700();
}

uint64_t sub_2192D0C48()
{
  return sub_2192D96F0();
}

uint64_t sub_2192D0C74()
{
  return sub_2192D9700();
}

unint64_t sub_2192D0CBC()
{
  unint64_t result = qword_267C166A0;
  if (!qword_267C166A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ChirpErrors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ChirpErrors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x2192D0E7CLL);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChirpErrors()
{
  return &type metadata for ChirpErrors;
}

char *sub_2192D0EB4(char *result, char *a2)
{
  if (result) {
    uint64_t v3 = a2 - result;
  }
  else {
    uint64_t v3 = 0;
  }
  unsigned int v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v7 = (unint64_t)a2;
  uint64_t v8 = (uint64_t)result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v10 = *((void *)v4 + 3) >> 1, v10 < v6))
  {
    if (v5 <= v6) {
      int64_t v11 = v5 + v3;
    }
    else {
      int64_t v11 = v5;
    }
    unsigned int v4 = sub_2192D694C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    int64_t v10 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v12 = *((void *)v4 + 2);
  uint64_t v13 = v10 - v12;
  unint64_t result = sub_2192D8128(&v4[v12 + 32], v10 - v12, (char *)v8, v7);
  if (v14 < v3) {
    goto LABEL_18;
  }
  if (v14 >= 1)
  {
    uint64_t v15 = *((void *)v4 + 2);
    BOOL v16 = __OFADD__(v15, v14);
    uint64_t v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      goto LABEL_26;
    }
    *((void *)v4 + 2) = v17;
  }
  if (v14 != v13) {
    goto LABEL_16;
  }
LABEL_19:
  uint64_t v8 = *((void *)v4 + 2);
  if (!result)
  {
LABEL_26:
    if (!a2) {
      goto LABEL_16;
    }
    unint64_t result = 0;
    goto LABEL_28;
  }
  if (a2) {
    BOOL v18 = result == a2;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
LABEL_28:
    char v20 = *result++;
    char v19 = v20;
    while (1)
    {
      while (1)
      {
        unint64_t v21 = *((void *)v4 + 3);
        int64_t v22 = (char *)(v21 >> 1);
        uint64_t v23 = v8 + 1;
        if ((uint64_t)(v21 >> 1) >= v8 + 1) {
          break;
        }
        unint64_t v26 = result;
        unint64_t v27 = a2;
        char v28 = sub_2192D694C((char *)(v21 > 1), v8 + 1, 1, v4);
        a2 = v27;
        unsigned int v4 = v28;
        unint64_t result = v26;
        int64_t v22 = (char *)(*((void *)v4 + 3) >> 1);
        if (v8 < (uint64_t)v22) {
          goto LABEL_32;
        }
LABEL_29:
        *((void *)v4 + 2) = v8;
      }
      if (v8 >= (uint64_t)v22) {
        goto LABEL_29;
      }
LABEL_32:
      v4[v8 + 32] = v19;
      if (a2 && a2 == result)
      {
LABEL_42:
        *((void *)v4 + 2) = v23;
        break;
      }
      uint64_t v24 = 0;
      while (1)
      {
        uint64_t v25 = (uint64_t)&v24[(void)result + 1];
        char v19 = v24[(void)result];
        if (&v22[~v8] == v24) {
          break;
        }
        v4[v8 + 33 + (void)v24++] = v19;
        if (a2 && (char *)v25 == a2)
        {
          uint64_t v23 = (uint64_t)&v24[v8 + 1];
          goto LABEL_42;
        }
      }
      unint64_t result = &v24[(void)result + 1];
      uint64_t v8 = (uint64_t)v22;
      *((void *)v4 + 2) = v22;
    }
  }
LABEL_16:
  *int v2 = v4;
  return result;
}

uint64_t sub_2192D10A0(uint64_t result)
{
  int64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  unint64_t result = (uint64_t)sub_2192D798C((char *)result, v11, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_2192D1184()
{
  unsigned __int8 v1 = *v0;
  sub_2192D1878();
  if (v2) {
    return;
  }
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v4 = sub_2192D37AC(v1);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v6 = (uint64_t *)(*(void *)(v3 + 56) + 32 * v4);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x21D486B80](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2192D9460();
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    do
    {
      if (sub_2192D9350()) {
        MEMORY[0x21D486BD0](v13, v14);
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_2192D9460();
      uint64_t v14 = v15;
    }
    while (v15);
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_2192D1F20(0, 0xE000000000000000);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_18;
  }
  if (v16 != 75 || v18 != 0xE100000000000000) {
    sub_2192D9660();
  }
  swift_bridgeObjectRelease();
}

void sub_2192D1350()
{
  unsigned __int8 v1 = *v0;
  sub_2192D1878();
  if (v2) {
    return;
  }
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v4 = sub_2192D37AC(v1);
  if ((v5 & 1) == 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  uint64_t v6 = (uint64_t *)(*(void *)(v3 + 56) + 32 * v4);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x21D486B80](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2192D9460();
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if (sub_2192D9350())
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2192CF25C(0, v15[2] + 1, 1);
        }
        unint64_t v18 = v15[2];
        unint64_t v17 = v15[3];
        if (v18 >= v17 >> 1) {
          sub_2192CF25C((char *)(v17 > 1), v18 + 1, 1);
        }
        v15[2] = v18 + 1;
        char v19 = &v15[2 * v18];
        v19[4] = v13;
        v19[5] = v14;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v13 = sub_2192D9460();
      uint64_t v14 = v16;
    }
    while (v16);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  if (v15[2] < 2uLL) {
    goto LABEL_25;
  }
  uint64_t v21 = v15[6];
  uint64_t v20 = v15[7];
  swift_bridgeObjectRetain();
  swift_release();
  if (v21 == 78 && v20 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2192D9660();
    swift_bridgeObjectRelease();
  }
}

void sub_2192D1584()
{
  unsigned __int8 v1 = *v0;
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v3 = sub_2192D37AC(v1);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  uint64_t v10 = MEMORY[0x21D486B80](v6, v7, v8, v9);
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_2192D19E4(v10, v12);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_15:
    __break(1u);
    return;
  }
  if (v13 != 78 || v15 != 0xE100000000000000) {
    sub_2192D9660();
  }
  swift_bridgeObjectRelease();
}

void sub_2192D16AC()
{
  unsigned __int8 v1 = *v0;
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v3 = sub_2192D37AC(v1);
  if ((v4 & 1) == 0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x21D486B80](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_2192D9460();
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = v10;
    do
    {
      if (sub_2192D9350()) {
        MEMORY[0x21D486BD0](v13, v12);
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_2192D9460();
      uint64_t v12 = v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_2192D94A0();
  uint64_t v17 = sub_2192D19E4(v15, v16);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_17;
  }
  if (v17 != 75 || v19 != 0xE100000000000000) {
    sub_2192D9660();
  }
  swift_bridgeObjectRelease();
}

void sub_2192D1878()
{
  unsigned __int8 v1 = *v0;
  if (qword_267C16528 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_267C16770;
  if (!*(void *)(qword_267C16770 + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v3 = sub_2192D37AC(v1);
  if ((v4 & 1) == 0)
  {
LABEL_12:
    __break(1u);
    return;
  }
  char v5 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x21D486B80](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_2192D9460();
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    do
    {
      if (sub_2192D9350()) {
        MEMORY[0x21D486BD0](v12, v13);
      }
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_2192D9460();
      uint64_t v13 = v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  sub_2192D9410();
  swift_bridgeObjectRelease();
}

uint64_t sub_2192D19E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_2192D9490();
  }
  else {
    return 0;
  }
}

BOOL static HandshakePattern.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HandshakePattern.hash(into:)()
{
  return sub_2192D96F0();
}

void *static HandshakePattern.allCases.getter()
{
  return &unk_26CAAA920;
}

uint64_t HandshakePattern.hashValue.getter()
{
  return sub_2192D9700();
}

unint64_t sub_2192D1AC4()
{
  unint64_t result = qword_267C166A8;
  if (!qword_267C166A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166A8);
  }
  return result;
}

unint64_t sub_2192D1B1C()
{
  unint64_t result = qword_267C166B0;
  if (!qword_267C166B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C166B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166B0);
  }
  return result;
}

void sub_2192D1B78(void *a1@<X8>)
{
  *a1 = &unk_26CAAA920;
}

uint64_t getEnumTagSinglePayload for HandshakePattern(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDB) {
    goto LABEL_17;
  }
  if (a2 + 37 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 37) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 37;
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
      return (*a1 | (v4 << 8)) - 37;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 37;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x26;
  int v8 = v6 - 38;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HandshakePattern(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 37 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 37) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDA)
  {
    unsigned int v6 = ((a2 - 219) >> 8) + 1;
    *unint64_t result = a2 + 37;
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
        JUMPOUT(0x2192D1CE4);
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
          *unint64_t result = a2 + 37;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakePattern()
{
  return &type metadata for HandshakePattern;
}

void sub_2192D1D1C()
{
  uint64_t v0 = qword_26CAAA930;
  if (!qword_26CAAA930)
  {
    unsigned __int8 v1 = (void *)MEMORY[0x263F8EE80];
LABEL_17:
    qword_267C16770 = (uint64_t)v1;
    return;
  }
  unsigned __int8 v1 = (void *)MEMORY[0x263F8EE80];
  int v2 = (unsigned __int8 *)&byte_26CAAA940;
  while (1)
  {
    uint64_t v30 = v0;
    unsigned __int8 v5 = *v2++;
    unsigned __int8 v4 = v5;
    uint64_t v6 = sub_2192D93E0();
    unint64_t v8 = v7;
    uint64_t v9 = sub_2192D9410();
    uint64_t v10 = sub_2192D3D34(v9, v6, v8);
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v19 = sub_2192D37AC(v5);
    uint64_t v20 = v1[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21)) {
      break;
    }
    char v23 = v18;
    if (v1[3] >= v22)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v18) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_2192D3B98();
        if (v23) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_2192D38B8(v22, isUniquelyReferenced_nonNull_native);
      unint64_t v24 = sub_2192D37AC(v4);
      if ((v23 & 1) != (v25 & 1)) {
        goto LABEL_20;
      }
      unint64_t v19 = v24;
      if (v23)
      {
LABEL_3:
        int v3 = (uint64_t *)(v1[7] + 32 * v19);
        uint64_t *v3 = v10;
        v3[1] = v12;
        v3[2] = v14;
        v3[3] = v16;
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
    }
    v1[(v19 >> 6) + 8] |= 1 << v19;
    *(unsigned char *)(v1[6] + v19) = v4;
    unint64_t v26 = (uint64_t *)(v1[7] + 32 * v19);
    *unint64_t v26 = v10;
    v26[1] = v12;
    v26[2] = v14;
    void v26[3] = v16;
    uint64_t v27 = v1[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_19;
    }
    v1[2] = v29;
LABEL_4:
    swift_bridgeObjectRelease();
    uint64_t v0 = v30 - 1;
    if (v30 == 1) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  sub_2192D9670();
  __break(1u);
}

uint64_t sub_2192D1F20(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  sub_2192D9420();
  return sub_2192D9490();
}

uint64_t sub_2192D1FA0()
{
  switch(*v0)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA1C0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      uint64_t v2 = &unk_26CAA9958;
      goto LABEL_5;
    case 2:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA1C0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      uint64_t v2 = &unk_26CAA9B10;
      goto LABEL_5;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9CC8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA9E80;
      goto LABEL_38;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA3A8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAAA560;
      goto LABEL_38;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA718;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAAA8D0;
      goto LABEL_38;
    case 6:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA038;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAAA1F0;
      goto LABEL_38;
    case 7:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9980;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA99A8;
      goto LABEL_38;
    case 8:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9A20;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9A48;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAA9A70;
      goto LABEL_43;
    case 9:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA99D0;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA99F8;
      goto LABEL_38;
    case 0xA:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9AE8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9B38;
      *(void *)(result + 136) = &type metadata for 🔙;
      *(void *)(result + 144) = &off_26CAAAAB0;
      *(unsigned char *)(result + 112) = 0;
      unsigned __int8 v4 = &unk_26CAA9B60;
      goto LABEL_43;
    case 0xB:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9A98;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA9AC0;
      goto LABEL_38;
    case 0xC:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9B88;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA9BB0;
      goto LABEL_38;
    case 0xD:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9BD8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9C00;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAA9C28;
      goto LABEL_43;
    case 0xE:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9C50;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA9C78;
      goto LABEL_38;
    case 0xF:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9CA0;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAA9CF0;
      goto LABEL_38;
    case 0x10:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9D18;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9D40;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAA9D68;
      goto LABEL_43;
    case 0x11:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3F0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9D90;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9DB8;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      *(void *)(result + 120) = &unk_26CAA9DE0;
      *(void *)(result + 176) = &type metadata for 🔙;
      *(void *)(result + 184) = &off_26CAAAAB0;
      *(unsigned char *)(result + 152) = 0;
      unsigned __int8 v5 = &unk_26CAA9E08;
      goto LABEL_27;
    case 0x12:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3F0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9E30;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9E58;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      *(void *)(result + 120) = &unk_26CAA9EA8;
      *(void *)(result + 176) = &type metadata for 🔙;
      *(void *)(result + 184) = &off_26CAAAAB0;
      *(unsigned char *)(result + 152) = 0;
      unsigned __int8 v5 = &unk_26CAA9ED0;
      goto LABEL_27;
    case 0x13:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9EF8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9F20;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAA9F48;
      goto LABEL_43;
    case 0x14:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3F0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAA9F70;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAA9F98;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      *(void *)(result + 120) = &unk_26CAA9FC0;
      *(void *)(result + 176) = &type metadata for 🔙;
      *(void *)(result + 184) = &off_26CAAAAB0;
      *(unsigned char *)(result + 152) = 0;
      unsigned __int8 v5 = &unk_26CAA9FE8;
      goto LABEL_27;
    case 0x15:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3F0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA010;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA060;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      *(void *)(result + 120) = &unk_26CAAA088;
      *(void *)(result + 176) = &type metadata for 🔙;
      *(void *)(result + 184) = &off_26CAAAAB0;
      *(unsigned char *)(result + 152) = 0;
      unsigned __int8 v5 = &unk_26CAAA0B0;
      goto LABEL_27;
    case 0x16:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA0D8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA100;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA128;
      goto LABEL_43;
    case 0x17:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3F0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA150;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA178;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      *(void *)(result + 120) = &unk_26CAAA1A0;
      *(void *)(result + 176) = &type metadata for 🔙;
      *(void *)(result + 184) = &off_26CAAAAB0;
      *(unsigned char *)(result + 152) = 0;
      unsigned __int8 v5 = &unk_26CAAA1C8;
LABEL_27:
      *(void *)(result + 160) = v5;
      return result;
    case 0x18:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA218;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA240;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA268;
      goto LABEL_43;
    case 0x19:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA290;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA2B8;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA2E0;
      goto LABEL_43;
    case 0x1A:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA308;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAAA330;
      goto LABEL_38;
    case 0x1B:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA358;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA380;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA3D0;
      goto LABEL_43;
    case 0x1C:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA3F8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA420;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA448;
      goto LABEL_43;
    case 0x1D:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA470;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA498;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA4C0;
      goto LABEL_43;
    case 0x1E:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA4E8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA510;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA538;
      goto LABEL_43;
    case 0x1F:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA588;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA5B0;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA5D8;
      goto LABEL_43;
    case 0x20:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA600;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA628;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA650;
      goto LABEL_43;
    case 0x21:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA3E0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA678;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      int v3 = &unk_26CAAA6A0;
LABEL_38:
      *(void *)(result + 80) = v3;
      *(unsigned char *)(result + 72) = 0;
      return result;
    case 0x22:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA6C8;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA6F0;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA740;
      goto LABEL_43;
    case 0x23:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA768;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA790;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA7B8;
      goto LABEL_43;
    case 0x24:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA7E0;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA808;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA830;
      goto LABEL_43;
    case 0x25:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(unsigned char *)(result + 32) = 1;
      *(_OWORD *)(result + 16) = xmmword_2192DA3D0;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      *(void *)(result + 40) = &unk_26CAAA858;
      *(void *)(result + 96) = &type metadata for 🔙;
      *(void *)(result + 104) = &off_26CAAAAB0;
      *(unsigned char *)(result + 72) = 0;
      *(void *)(result + 80) = &unk_26CAAA880;
      *(void *)(result + 136) = &type metadata for 🔜;
      *(void *)(result + 144) = &off_26CAAAB58;
      *(unsigned char *)(result + 112) = 1;
      unsigned __int8 v4 = &unk_26CAAA8A8;
LABEL_43:
      *(void *)(result + 120) = v4;
      break;
    default:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2192DA1C0;
      *(unsigned char *)(result + 32) = 1;
      *(void *)(result + 56) = &type metadata for 🔜;
      *(void *)(result + 64) = &off_26CAAAB58;
      uint64_t v2 = &unk_26CAAA8F8;
LABEL_5:
      *(void *)(result + 40) = v2;
      break;
  }
  return result;
}

unsigned char *sub_2192D33B0(unsigned char *result, uint64_t *a2)
{
  switch(*result)
  {
    case 1:
      unint64_t v11 = a2[3];
      uint64_t v12 = *a2;
      if ((v11 & 1) != 0
        && (int isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull(), *a2 = v12, isUniquelyReferenced_nonNull))
      {
        uint64_t v14 = a2[2];
      }
      else
      {
        sub_2192D3DE4(a2[1], a2[2], v11);
        uint64_t v27 = v26;
        uint64_t v29 = v28;
        uint64_t v14 = v30;
        unint64_t v11 = v31;
        swift_unknownObjectRelease();
        *a2 = v27;
        a2[1] = v29;
        a2[2] = v14;
        a2[3] = v11;
      }
      if (v11 < 2 || v14 > 0) {
        goto LABEL_57;
      }
      uint64_t v33 = a2[1];
      uint64_t v34 = *(void *)(v33 + 24);
      uint64_t v35 = *(void *)(v33 + 32);
      goto LABEL_47;
    case 2:
      unint64_t v15 = a2[3];
      uint64_t v16 = *a2;
      if ((v15 & 1) != 0 && (int v17 = swift_isUniquelyReferenced_nonNull(), *a2 = v16, v17))
      {
        uint64_t v18 = a2[2];
      }
      else
      {
        sub_2192D3DE4(a2[1], a2[2], v15);
        uint64_t v37 = v36;
        uint64_t v39 = v38;
        uint64_t v18 = v40;
        unint64_t v15 = v41;
        swift_unknownObjectRelease();
        *a2 = v37;
        a2[1] = v39;
        a2[2] = v18;
        a2[3] = v15;
      }
      if (v15 < 4 || v18 > 1) {
        goto LABEL_58;
      }
      uint64_t v43 = a2[1];
      uint64_t v33 = v43 + 40;
      uint64_t v34 = *(void *)(v43 + 64);
      uint64_t v35 = *(void *)(v43 + 72);
      goto LABEL_47;
    case 3:
      unint64_t v19 = a2[3];
      uint64_t v20 = *a2;
      if ((v19 & 1) != 0 && (int v21 = swift_isUniquelyReferenced_nonNull(), *a2 = v20, v21))
      {
        uint64_t v22 = a2[2];
      }
      else
      {
        sub_2192D3DE4(a2[1], a2[2], v19);
        uint64_t v45 = v44;
        uint64_t v47 = v46;
        uint64_t v22 = v48;
        unint64_t v19 = v49;
        swift_unknownObjectRelease();
        *a2 = v45;
        a2[1] = v47;
        a2[2] = v22;
        a2[3] = v19;
      }
      if (v19 < 6 || v22 > 2) {
        goto LABEL_59;
      }
      uint64_t v51 = a2[1];
      uint64_t v33 = v51 + 80;
      uint64_t v34 = *(void *)(v51 + 104);
      uint64_t v35 = *(void *)(v51 + 112);
LABEL_47:
      __swift_mutable_project_boxed_opaque_existential_1(v33, v34);
      uint64_t v52 = (uint64_t (*)(void *, void))(*(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 32))(v68, v34, v35);
      unsigned int v54 = v53;
      uint64_t v55 = *v53;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unsigned int v54 = v55;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v55 = sub_2192D798C(0, *((void *)v55 + 2) + 1, 1, v55);
        *unsigned int v54 = v55;
      }
      unint64_t v58 = *((void *)v55 + 2);
      unint64_t v57 = *((void *)v55 + 3);
      if (v58 >= v57 >> 1)
      {
        uint64_t v55 = sub_2192D798C((char *)(v57 > 1), v58 + 1, 1, v55);
        *unsigned int v54 = v55;
      }
      *((void *)v55 + 2) = v58 + 1;
      v55[v58 + 32] = 6;
      return (unsigned char *)v52(v68, 0);
    case 4:
      uint64_t v23 = a2[2];
      uint64_t v24 = (unint64_t)a2[3] >> 1;
      if (__OFSUB__(v24, v23)) {
        goto LABEL_56;
      }
      uint64_t v25 = a2[2];
      if (v24 == v23) {
        goto LABEL_24;
      }
      uint64_t v25 = v23 + 1;
      if (__OFADD__(v23, 1)) {
        goto LABEL_64;
      }
      if (v24 < v25) {
        goto LABEL_60;
      }
      if (v25 < v23) {
        goto LABEL_61;
      }
LABEL_24:
      if (v24 < v23) {
        goto LABEL_62;
      }
      a2[2] = v25;
      return result;
    default:
      if (a2[2] > 0 || (unint64_t)a2[3] < 2)
      {
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
        JUMPOUT(0x2192D3798);
      }
      sub_2192CAE68(a2[1], (uint64_t)v68);
      uint64_t v4 = v69;
      uint64_t v5 = v70;
      __swift_project_boxed_opaque_existential_1(v68, v69);
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
      sub_2192D10A0(v6);
      unint64_t v7 = a2[3];
      uint64_t v8 = *a2;
      if ((v7 & 1) != 0 && (int v9 = swift_isUniquelyReferenced_nonNull(), *a2 = v8, v9))
      {
        uint64_t v10 = a2[2];
      }
      else
      {
        sub_2192D3DE4(a2[1], a2[2], v7);
        uint64_t v60 = v59;
        uint64_t v62 = v61;
        uint64_t v10 = v63;
        unint64_t v7 = v64;
        swift_unknownObjectRelease();
        *a2 = v60;
        a2[1] = v62;
        a2[2] = v10;
        a2[3] = v7;
      }
      if (v7 < 2 || v10 > 0) {
        goto LABEL_63;
      }
      uint64_t v65 = a2[1];
      uint64_t v66 = *(void *)(v65 + 24);
      uint64_t v67 = *(void *)(v65 + 32);
      __swift_mutable_project_boxed_opaque_existential_1(v65, v66);
      return (unsigned char *)(*(uint64_t (**)(void *, uint64_t, uint64_t))(v67 + 24))(&unk_26CAA9930, v66, v67);
  }
}

unint64_t sub_2192D37AC(unsigned __int8 a1)
{
  sub_2192D96E0();
  sub_2192D96F0();
  uint64_t v2 = sub_2192D9700();
  return sub_2192D3818(a1, v2);
}

unint64_t sub_2192D3818(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2192D38B8(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C16690);
  char v34 = a2;
  uint64_t result = sub_2192D9620();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1)) {
          goto LABEL_40;
        }
        uint64_t result = v5 + 64;
        if (v8 >= v12)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            uint64_t result = swift_release();
            int v3 = v2;
            goto LABEL_38;
          }
          uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
          if (v32 >= 64) {
            bzero(v33, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            *uint64_t v33 = -1 << v32;
          }
          int v3 = v2;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v22 = v33[v8];
        if (!v22)
        {
          int64_t v23 = v8 + 1;
          if (v8 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v22 = v33[v23];
          if (!v22)
          {
            while (1)
            {
              int64_t v8 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v8 >= v12) {
                goto LABEL_31;
              }
              unint64_t v22 = v33[v8];
              ++v23;
              if (v22) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_20:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      char v24 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
      uint64_t v25 = *(void *)(v5 + 56) + 32 * v20;
      long long v35 = *(_OWORD *)v25;
      uint64_t v26 = *(void *)(v25 + 16);
      uint64_t v27 = *(void *)(v25 + 24);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_2192D96E0();
      sub_2192D96F0();
      uint64_t result = sub_2192D9700();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v16 == v29;
          if (v16 == v29) {
            unint64_t v16 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v13 + 8 * v16);
        }
        while (v31 == -1);
        unint64_t v17 = __clz(__rbit64(~v31)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v7 + 48) + v17) = v24;
      uint64_t v18 = *(void *)(v7 + 56) + 32 * v17;
      *(_OWORD *)uint64_t v18 = v35;
      *(void *)(v18 + 16) = v26;
      *(void *)(v18 + 24) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v3 = v7;
  return result;
}

void *sub_2192D3B98()
{
  unsigned __int8 v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C16690);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2192D9610();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *unsigned __int8 v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    if (!v22) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 32 * v15;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v17 = *(void *)(v16 + 24);
    long long v19 = *(_OWORD *)v16;
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v20 = *(void *)(v4 + 56) + 32 * v15;
    *(_OWORD *)uint64_t v20 = v19;
    *(void *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2192D3D34(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0]();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = sub_2192D9430();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }
  return MEMORY[0x270F9D8F0]();
}

void sub_2192D3DE4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_11;
  }
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C0);
    unint64_t v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v4;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 40);
    if (v3 >= a2) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  unint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (v3 < a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C166C8);
  swift_arrayInitWithCopy();
  if (__OFSUB__(0, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = v6[2];
  BOOL v9 = __OFADD__(a2, v8);
  uint64_t v10 = a2 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0) {
LABEL_15:
  }
    __break(1u);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t assignWithTake for 🔙(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for 🔙()
{
  return &type metadata for 🔙;
}

uint64_t _s5Chirp4____Vwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5Chirp4____Vwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2192D4038(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for 🔜()
{
  return &type metadata for 🔜;
}

uint64_t getEnumTagSinglePayload for MessagePatternTokens(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MessagePatternTokens(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2192D41E0);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagePatternTokens()
{
  return &type metadata for MessagePatternTokens;
}

unint64_t sub_2192D421C()
{
  unint64_t result = qword_267C166D0;
  if (!qword_267C166D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C166D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166D0);
  }
  return result;
}

void sub_2192D4278(void *a1@<X8>)
{
  *a1 = &unk_26CAAA968;
}

unint64_t sub_2192D428C()
{
  unint64_t result = qword_267C166E0;
  if (!qword_267C166E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166E0);
  }
  return result;
}

uint64_t (*sub_2192D42E0())()
{
  return nullsub_1;
}

uint64_t sub_2192D4300()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2192D4308(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t sub_2192D4344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
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
  uint64_t v11 = sub_2192D82A0(v10, v9, a2, a3);
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
  uint64_t v12 = sub_2192D838C(v10, a1, a2, a3);
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
    JUMPOUT(0x2192D44B0);
  }
LABEL_16:
  uint64_t v14 = sub_2192D9100();
  uint64_t v16 = v15;
  uint64_t result = sub_2192C1220(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

uint64_t sub_2192D44E0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (a2) {
      uint64_t v3 = a3 - a2;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t result = sub_2192D8408(0, result, v3, a2, a3);
    if (v4) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = result;
    }
    if ((v5 & 0x8000000000000000) == 0) {
      return 0;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2192D4554(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  if (a2) {
    uint64_t v3 = a3 - a2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t result = sub_2192D8408(v3, -result, 0, a2, a3);
  if (v4) {
    uint64_t result = 0;
  }
  if (v3 < result) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_2192D45CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = a2 >> 32;
      uint64_t v8 = (int)a2;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v10 = -a1;
  uint64_t v11 = sub_2192D82A0(v9, v8, a2, a3);
  if (v11 <= 0 && v11 > v10)
  {
    uint64_t v12 = v5;
    switch((int)v5)
    {
      case 1:
        uint64_t v12 = (int)a2;
        goto LABEL_12;
      case 2:
        uint64_t v12 = *(void *)(a2 + 16);
        goto LABEL_14;
      case 3:
        goto LABEL_16;
      default:
        goto LABEL_11;
    }
  }
  uint64_t v12 = sub_2192D838C(v9, v10, a2, a3);
  uint64_t v13 = 0;
  switch((int)v5)
  {
    case 1:
LABEL_12:
      uint64_t v13 = a2 >> 32;
      break;
    case 2:
LABEL_14:
      uint64_t v13 = *(void *)(a2 + 24);
      break;
    case 3:
      break;
    default:
LABEL_11:
      uint64_t v13 = BYTE6(a3);
      break;
  }
  if (v13 < v12)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x2192D4740);
  }
LABEL_16:
  uint64_t v14 = sub_2192D9100();
  uint64_t v16 = v15;
  uint64_t result = sub_2192C1220(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

uint64_t sub_2192D4770@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v41 = a5;
  uint64_t v42 = a3;
  uint64_t v13 = type metadata accessor for CipherState();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(a7, 1, 1, v13);
  uint64_t v15 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_17;
      }
      uint64_t v15 = HIDWORD(a1) - (int)a1;
LABEL_6:
      uint64_t v39 = v14;
      uint64_t v40 = v13;
      uint64_t v18 = a6;
      swift_getAssociatedConformanceWitness();
      if (sub_2192D9310() >= v15)
      {
        uint64_t v25 = sub_2192D9310();
        uint64_t v26 = 0;
        unint64_t v20 = a2;
        uint64_t v18 = a6;
        uint64_t v19 = a1;
        uint64_t v24 = v42;
        switch(a2 >> 62)
        {
          case 1uLL:
            LODWORD(v26) = HIDWORD(a1) - a1;
            if (__OFSUB__(HIDWORD(a1), a1)) {
              goto LABEL_19;
            }
            uint64_t v26 = (int)v26;
LABEL_13:
            BOOL v29 = __OFSUB__(v25, v26);
            uint64_t v30 = v25 - v26;
            if (v29)
            {
              __break(1u);
LABEL_17:
              __break(1u);
LABEL_18:
              __break(1u);
LABEL_19:
              __break(1u);
LABEL_20:
              __break(1u);
              JUMPOUT(0x2192D4B44);
            }
            uint64_t v45 = sub_2192D8720(v30);
            unint64_t v46 = v31;
            sub_2192D7A80(&v45, 0);
            uint64_t v32 = v45;
            unint64_t v33 = v46;
            uint64_t v49 = a1;
            unint64_t v50 = v20;
            sub_2192C11C8(a1, v20);
            sub_2192C11C8(v32, v33);
            sub_2192CAC44(v32, v33);
            sub_2192C1220(v32, v33);
            sub_2192C1220(v32, v33);
            uint64_t v21 = v49;
            unint64_t v23 = v50;
            break;
          case 2uLL:
            uint64_t v28 = *(void *)(a1 + 16);
            uint64_t v27 = *(void *)(a1 + 24);
            BOOL v29 = __OFSUB__(v27, v28);
            uint64_t v26 = v27 - v28;
            if (!v29) {
              goto LABEL_13;
            }
            goto LABEL_20;
          case 3uLL:
            goto LABEL_13;
          default:
            uint64_t v26 = BYTE6(a2);
            goto LABEL_13;
        }
      }
      else
      {
        uint64_t v19 = a1;
        uint64_t v45 = a1;
        unint64_t v46 = a2;
        unint64_t v20 = a2;
        sub_2192C17D8();
        sub_2192D91D0();
        uint64_t v21 = sub_2192D9120();
        unint64_t v23 = v22;
        uint64_t v24 = v42;
      }
      uint64_t v45 = v24;
      unint64_t v46 = a4;
      uint64_t v47 = v41;
      uint64_t v48 = v18;
      char v34 = (uint64_t *)(a7 + *(int *)(type metadata accessor for SymmetricState() + 56));
      *char v34 = v21;
      v34[1] = v23;
      uint64_t v35 = sub_2192D9530();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(a7, v35);
      v39(a7, 1, 1, v40);
      uint64_t v45 = v24;
      unint64_t v46 = a4;
      uint64_t v47 = v41;
      uint64_t v48 = v18;
      uint64_t v36 = (uint64_t *)(a7 + *(int *)(type metadata accessor for SymmetricState() + 56));
      unint64_t v37 = v36[1];
      uint64_t v45 = *v36;
      unint64_t v46 = v37;
      sub_2192C11C8(v45, v37);
      sub_2192D9200();
      return sub_2192C1220(v19, v20);
    case 2uLL:
      uint64_t v17 = *(void *)(a1 + 16);
      uint64_t v16 = *(void *)(a1 + 24);
      uint64_t v15 = v16 - v17;
      if (!__OFSUB__(v16, v17)) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v15 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2192D4B64(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (uint64_t *)(v3 + *(int *)(a3 + 56));
  uint64_t v9 = *v8;
  uint64_t v14 = *v8;
  unint64_t v15 = v8[1];
  sub_2192C11C8(*v8, v15);
  sub_2192C11C8(a1, a2);
  sub_2192CAC44(a1, a2);
  sub_2192C1220(a1, a2);
  sub_2192C17D8();
  sub_2192D91D0();
  sub_2192C1220(v14, v15);
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = sub_2192D9120();
  uint64_t v12 = v11;
  uint64_t result = sub_2192C1220(v9, v15);
  *uint64_t v8 = v10;
  v8[1] = v12;
  return result;
}

uint64_t sub_2192D4CE4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2192D9210();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  sub_2192D9200();
  sub_2192D5768((uint64_t)v12, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2192D4E6C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v20 = a2;
  uint64_t v21 = a1;
  uint64_t v5 = type metadata accessor for CipherState();
  uint64_t v6 = sub_2192D9530();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v19 - v8;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v19 - v8, v3, v6);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  int v11 = v10(v9, 1, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v11 == 1)
  {
    unint64_t v12 = v20;
    uint64_t v13 = v21;
    sub_2192C11C8(v21, v20);
    uint64_t v5 = v13;
    goto LABEL_6;
  }
  unint64_t v14 = v20;
  uint64_t v13 = v21;
  v23[0] = v21;
  v23[1] = v20;
  long long v22 = *(_OWORD *)&v3[*(int *)(a3 + 56)];
  uint64_t result = v10(v3, 1, v5);
  if (result != 1)
  {
    unint64_t v12 = v14;
    unint64_t v16 = sub_2192C17D8();
    uint64_t v17 = v19[1];
    uint64_t v18 = sub_2192C0B10((uint64_t)v23, (uint64_t)&v22, v5, MEMORY[0x263F06F78], MEMORY[0x263F06F78], v16, v16);
    if (v17) {
      return v5;
    }
    uint64_t v5 = v18;
LABEL_6:
    sub_2192D4B64(v13, v12, a3);
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2192D5070(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v25 = sub_2192D9210();
  uint64_t v23 = *(void *)(v25 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v25);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = *(void *)(a3 + 40);
  uint64_t v12 = a3;
  uint64_t v13 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_2192D9310();
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    *(void *)&long long v26 = a1;
    *((void *)&v26 + 1) = a2;
    uint64_t v22 = result;
    sub_2192C11C8(a1, a2);
    sub_2192D9200();
    unint64_t v15 = v10;
    uint64_t v17 = v23;
    uint64_t v16 = v24;
    long long v26 = xmmword_2192DA130;
    sub_2192C17D8();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v17 + 8);
    uint64_t v19 = v25;
    uint64_t v20 = v18(v8, v25);
    MEMORY[0x270FA5388](v20);
    *(&v21 - 6) = *(void *)(v12 + 16);
    *(&v21 - 5) = v13;
    *(&v21 - 4) = *(void *)(v12 + 32);
    *(&v21 - 3) = v11;
    *(&v21 - 2) = v22;
    *(&v21 - 1) = v16;
    sub_2192D91F0();
    return v18(v15, v19);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2192D52E8@<X0>(int a1@<W0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v18 = a1;
  int v19 = a2;
  uint64_t v20 = a4;
  uint64_t v5 = sub_2192D9210();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v14 = sub_2192D9310();
  long long v21 = xmmword_2192DA130;
  long long v22 = xmmword_2192DA130;
  uint64_t result = sub_2192D9200();
  long long v22 = v21;
  if (v14 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2192C17D8();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
    uint64_t v17 = v16(v9, v5);
    MEMORY[0x270FA5388](v17);
    *((void *)&v18 - 6) = a3[2];
    *((void *)&v18 - 5) = v13;
    *((void *)&v18 - 4) = a3[4];
    *((void *)&v18 - 3) = v12;
    *((void *)&v18 - 2) = v14;
    *((unsigned char *)&v18 - 8) = v18 & 1;
    *((unsigned char *)&v18 - 7) = v19 & 1;
    type metadata accessor for TransportState();
    sub_2192D91F0();
    return v16(v11, v5);
  }
  return result;
}

uint64_t sub_2192D5564(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  unint64_t v22 = a2;
  uint64_t v5 = type metadata accessor for CipherState();
  uint64_t v6 = sub_2192D9530();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v20 - v8;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v20 - v8, v3, v6);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  int v11 = v10(v9, 1, v5);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v12 = v7 + 8;
  v13(v9, v6);
  if (v11 == 1)
  {
    uint64_t v12 = v21;
    unint64_t v14 = v22;
    sub_2192D4B64(v21, v22, a3);
    sub_2192C11C8(v12, v14);
    return v12;
  }
  v24[0] = v21;
  v24[1] = v22;
  long long v23 = *(_OWORD *)&v3[*(int *)(a3 + 56)];
  uint64_t result = v10(v3, 1, v5);
  if (result != 1)
  {
    unint64_t v16 = sub_2192C17D8();
    uint64_t v17 = v20[1];
    uint64_t v18 = sub_2192C057C((uint64_t)v24, (uint64_t)&v23, v5, MEMORY[0x263F06F78], MEMORY[0x263F06F78], v16, v16);
    if (!v17)
    {
      uint64_t v12 = v18;
      sub_2192D4B64(v18, v19, a3);
    }
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2192D5768(uint64_t a1, void *a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_2192D9210();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v19 - v11;
  uint64_t v13 = a2[5];
  uint64_t v14 = a2[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_2192D9310();
  if (result + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v19 = 2 * result;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v20, v3);
    sub_2192D819C();
    sub_2192D9200();
    uint64_t v16 = v21;
    long long v22 = xmmword_2192DA130;
    sub_2192C17D8();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v18 = v17(v10, v3);
    MEMORY[0x270FA5388](v18);
    *(&v19 - 6) = a2[2];
    *(&v19 - 5) = v14;
    *(&v19 - 4) = a2[4];
    *(&v19 - 3) = v13;
    *(&v19 - 2) = v16;
    sub_2192D91F0();
    return v17(v12, v3);
  }
  return result;
}

uint64_t static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C16538);
  sub_2192D91F0();
  uint64_t v0 = (char *)v3;
  sub_2192C1124();
  sub_2192D92C0();
  rsize_t v1 = *(void *)(v3 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v0 = sub_2192D7998(0, v1, 0, (char *)v3, &qword_267C16648);
  }
  memset_s(v0 + 32, v1, 0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2192D5B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v36 = a4;
  uint64_t v37 = a6;
  uint64_t v48 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v41 = type metadata accessor for CipherState();
  uint64_t v11 = sub_2192D9530();
  uint64_t v42 = *(void *)(v11 - 8);
  uint64_t v43 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v40 = (uint64_t)&v33 - v12;
  uint64_t v13 = sub_2192D9210();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v38 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v39 = (char *)&v33 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v33 - v19;
  uint64_t v33 = a7;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v21 = sub_2192D9310();
  uint64_t v44 = sub_2192D44E0(v21, a1, a2);
  uint64_t v45 = v22;
  uint64_t v46 = v23;
  uint64_t v47 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C166F8);
  sub_2192D8218();
  sub_2192D9200();
  uint64_t v44 = v36;
  uint64_t v45 = a5;
  uint64_t v46 = v37;
  uint64_t v47 = v33;
  uint64_t v25 = type metadata accessor for SymmetricState();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 40))(v48 + *(int *)(v25 + 52), v20, v13);
  uint64_t v26 = sub_2192D9310();
  uint64_t v44 = sub_2192D4554(v26, v34, v35);
  uint64_t v45 = v27;
  uint64_t v46 = v28;
  uint64_t v47 = v29;
  sub_2192D9200();
  sub_2192D5E9C();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v38, v20, v13);
  sub_2192D819C();
  uint64_t v30 = (uint64_t)v39;
  sub_2192D9200();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
  uint64_t v31 = v40;
  sub_2192C04F4(v30, v40);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v41 - 8) + 56))(v31, 0, 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 40))(v48, v31, v43);
}

uint64_t sub_2192D5E9C()
{
  uint64_t v1 = sub_2192D9210();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  uint64_t v7 = v0;
  sub_2192D91F0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2192D5FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v68 = a8;
  uint64_t v61 = a6;
  uint64_t v59 = type metadata accessor for CipherState();
  uint64_t v60 = sub_2192D9530();
  uint64_t v57 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v56 = (uint64_t)&v51 - v14;
  uint64_t v15 = sub_2192D9210();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v55 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unsigned int v54 = (char *)&v51 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v51 - v21;
  uint64_t v51 = a1;
  uint64_t v53 = a2;
  *(void *)&long long v64 = sub_2192D44E0(a3, a1, a2);
  *((void *)&v64 + 1) = v23;
  uint64_t v65 = v24;
  uint64_t v66 = v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C166F8);
  unint64_t v27 = sub_2192D8218();
  sub_2192D9200();
  uint64_t v58 = a5;
  *(void *)&long long v64 = a5;
  *((void *)&v64 + 1) = v61;
  uint64_t v61 = a7;
  uint64_t v65 = a7;
  uint64_t v66 = v68;
  uint64_t v28 = type metadata accessor for SymmetricState();
  uint64_t v29 = a4;
  uint64_t v30 = a4 + *(int *)(v28 + 52);
  uint64_t v52 = v16;
  uint64_t v31 = *(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 40);
  uint64_t v68 = v15;
  uint64_t result = v31(v30, v22, v15);
  if (a3 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v33 = sub_2192D4554(2 * a3, v51, v53);
    uint64_t v34 = v28;
    uint64_t v36 = v35;
    uint64_t v53 = v29;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v66 = v26;
    unint64_t v67 = v27;
    uint64_t v41 = (void *)swift_allocObject();
    *(void *)&long long v64 = v41;
    v41[2] = v33;
    v41[3] = v36;
    v41[4] = v38;
    v41[5] = v40;
    uint64_t v42 = __swift_project_boxed_opaque_existential_1(&v64, v26);
    long long v43 = v42[1];
    v62[0] = *v42;
    v62[1] = v43;
    sub_2192D96C0();
    long long v44 = v63;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
    long long v64 = v44;
    sub_2192C11C8(v44, *((unint64_t *)&v44 + 1));
    sub_2192C11C8(v44, *((unint64_t *)&v44 + 1));
    sub_2192D4344(a3, v44, *((unint64_t *)&v44 + 1), (uint64_t *)v62);
    long long v45 = v62[0];
    sub_2192D45CC(a3, v44, *((unint64_t *)&v44 + 1), (uint64_t *)v62);
    long long v63 = v62[0];
    sub_2192D9200();
    uint64_t v46 = v53;
    sub_2192D4B64(v45, *((unint64_t *)&v45 + 1), v34);
    sub_2192D5E9C();
    uint64_t v47 = v52;
    uint64_t v48 = v68;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v55, v22, v68);
    sub_2192D819C();
    uint64_t v49 = (uint64_t)v54;
    sub_2192D9200();
    uint64_t v50 = v56;
    sub_2192C04F4(v49, v56);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v59 - 8) + 56))(v50, 0, 1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 40))(v46, v50, v60);
    sub_2192D7C74((uint64_t *)&v64);
    sub_2192C1220(v45, *((unint64_t *)&v45 + 1));
    (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v48);
    return sub_2192C1220(v64, *((unint64_t *)&v64 + 1));
  }
  return result;
}

uint64_t sub_2192D645C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v21 = a7;
  int v22 = a4;
  int v23 = a5;
  uint64_t v24 = a9;
  uint64_t v15 = sub_2192D9210();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  sub_2192D9200();
  uint64_t v25 = a6;
  uint64_t v26 = v21;
  uint64_t v27 = a8;
  uint64_t v28 = a10;
  uint64_t v29 = a3;
  char v30 = v22;
  char v31 = v23;
  type metadata accessor for TransportState();
  sub_2192D91F0();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_2192D65D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X7>, unsigned char *a8@<X8>)
{
  v30[1] = a6;
  v30[2] = a7;
  int v33 = a4;
  int v34 = a5;
  uint64_t v32 = a8;
  uint64_t v11 = type metadata accessor for CipherState();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v31 = (uint64_t)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v30 - v14;
  uint64_t v16 = sub_2192D9210();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v30 - v20;
  uint64_t v35 = sub_2192D44E0(a3, a1, a2);
  uint64_t v36 = v22;
  uint64_t v37 = v23;
  uint64_t v38 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C166F8);
  sub_2192D8218();
  sub_2192D9200();
  sub_2192D5E9C();
  uint64_t v35 = sub_2192D4554(a3, a1, a2);
  uint64_t v36 = v25;
  uint64_t v37 = v26;
  uint64_t v38 = v27;
  sub_2192D9200();
  sub_2192D5E9C();
  sub_2192C04F4((uint64_t)v21, (uint64_t)v15);
  uint64_t v28 = v31;
  sub_2192C04F4((uint64_t)v19, v31);
  return sub_2192C2140(v33, v34, (uint64_t)v15, v28, v32);
}

uint64_t sub_2192D67DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2192D9210();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_6;
  }
  if (a2 - a1 == 32) {
    return result;
  }
  if (a2 - a1 != 64)
  {
LABEL_6:
    __break(1u);
    return result;
  }
  v14[0] = sub_2192D44E0(32, a1, a2);
  v14[1] = v11;
  v14[2] = v12;
  v14[3] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C166F8);
  sub_2192D8218();
  sub_2192D9200();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 40))(a3, v10, v6);
}

size_t sub_2192D691C@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, size_t *a3@<X8>)
{
  size_t result = sub_2192D8074(a1, a2);
  *a3 = result;
  return result;
}

char *sub_2192D694C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2192D7998(a1, a2, a3, a4, &qword_267C16648);
}

uint64_t sub_2192D6958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_2192D6960()
{
  type metadata accessor for CipherState();
  uint64_t result = sub_2192D9530();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2192D9210();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2192D6A44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for CipherState();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_2192D9530();
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_2192D9210();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 36));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 52);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_2192D9210();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = *(int *)(a3 + 56);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    sub_2192C11C8(*v18, v20);
    *uint64_t v17 = v19;
    v17[1] = v20;
  }
  return a1;
}

uint64_t sub_2192D6C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CipherState();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    uint64_t v5 = sub_2192D9210();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 52);
  uint64_t v7 = sub_2192D9210();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(a2 + 56));
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  return sub_2192C1220(v9, v10);
}

char *sub_2192D6D3C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CipherState();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_2192D9530();
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2192D9210();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 52);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 56);
  uint64_t v15 = (uint64_t *)&a1[v14];
  uint64_t v16 = (uint64_t *)&a2[v14];
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_2192C11C8(*v16, v18);
  *uint64_t v15 = v17;
  v15[1] = v18;
  return a1;
}

char *sub_2192D6EDC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CipherState();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v25 = sub_2192D9210();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(a1, a2, v25);
      *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v12 = sub_2192D9530();
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 52);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 56);
  unint64_t v18 = (uint64_t *)&a1[v17];
  uint64_t v19 = (uint64_t *)&a2[v17];
  uint64_t v20 = *v19;
  unint64_t v21 = v19[1];
  sub_2192C11C8(*v19, v21);
  uint64_t v22 = *v18;
  unint64_t v23 = v18[1];
  *unint64_t v18 = v20;
  v18[1] = v21;
  sub_2192C1220(v22, v23);
  return a1;
}

char *sub_2192D7114(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CipherState();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_2192D9530();
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2192D9210();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 52);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&a1[*(int *)(a3 + 56)] = *(_OWORD *)&a2[*(int *)(a3 + 56)];
  return a1;
}

char *sub_2192D72A0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CipherState();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v21 = sub_2192D9210();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(a1, a2, v21);
      *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v12 = sub_2192D9530();
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  *(void *)&a1[*(int *)(v6 + 36)] = *(void *)&a2[*(int *)(v6 + 36)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 52);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_2192D9210();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 56);
  uint64_t v18 = *(void *)&a1[v17];
  unint64_t v19 = *(void *)&a1[v17 + 8];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  sub_2192C1220(v18, v19);
  return a1;
}

uint64_t sub_2192D74C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2192D74DC);
}

uint64_t sub_2192D74DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CipherState();
  uint64_t v6 = sub_2192D9530();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_2192D9210();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      uint64_t v14 = *(void *)(a1 + *(int *)(a3 + 56) + 8) >> 60;
      if (((4 * v14) & 0xC) != 0) {
        return 16 - ((4 * v14) & 0xC | (v14 >> 2));
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 52);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_2192D7618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2192D762C);
}

uint64_t sub_2192D762C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for CipherState();
  uint64_t v8 = sub_2192D9530();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_2192D9210();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      uint64_t v15 = (void *)(a1 + *(int *)(a4 + 56));
      *uint64_t v15 = 0;
      v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 52);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for SymmetricState()
{
  return swift_getGenericMetadata();
}

char *sub_2192D7778(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16710);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2192D787C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2192D7998(a1, a2, a3, a4, &qword_267C16688);
}

char *sub_2192D7888(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C166E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2192D798C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2192D7998(a1, a2, a3, a4, &qword_267C16708);
}

char *sub_2192D7998(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_2192D7A80(void *result, int __c)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = result[1];
  uint64_t v4 = result;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_2192D7FE0((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2192D90C0();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_2192D9060();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x2192D7C64);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_2192D9090();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_2192D9080();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = memset((void *)(v11 + v13), __c, v17);
      *uint64_t v4 = __b;
      v4[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      return result;
    default:
      uint64_t __b = *result;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      uint64_t result = memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *uint64_t v4 = v5;
      v4[1] = v6;
      return result;
  }
}

uint64_t sub_2192D7C74(uint64_t *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v6 = v1 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_2192DA130;
      uint64_t v7 = v2 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_17;
      }
      if (v7 < (int)v2) {
        goto LABEL_30;
      }
      if (sub_2192D9060() && __OFSUB__((int)v2, sub_2192D9090())) {
        goto LABEL_31;
      }
      sub_2192D90A0();
      swift_allocObject();
      uint64_t v19 = sub_2192D9040();
      swift_release();
      uint64_t v6 = v19;
LABEL_17:
      if (v7 < (int)v2) {
        goto LABEL_27;
      }
      uint64_t v20 = sub_2192D9060();
      if (!v20) {
        goto LABEL_33;
      }
      uint64_t v21 = v20;
      uint64_t v22 = sub_2192D9090();
      uint64_t v23 = (int)v2 - v22;
      if (__OFSUB__((int)v2, v22)) {
        goto LABEL_29;
      }
      uint64_t v24 = sub_2192D9080();
      if (v24 >= v7 - (int)v2) {
        rsize_t v25 = v7 - (int)v2;
      }
      else {
        rsize_t v25 = v24;
      }
      uint64_t result = memset_s((void *)(v21 + v23), v25, 0, v25);
      unint64_t v18 = v6 | 0x4000000000000000;
      *a1 = v2;
      goto LABEL_24;
    case 2uLL:
      *(void *)&long long __s = *a1;
      *((void *)&__s + 1) = v1 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2192D90C0();
      uint64_t v8 = *(void *)(__s + 16);
      uint64_t v9 = *(void *)(__s + 24);
      uint64_t v10 = sub_2192D9060();
      if (!v10)
      {
        __break(1u);
LABEL_33:
        __break(1u);
        JUMPOUT(0x2192D7F58);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_2192D9090();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
      }
      uint64_t v16 = sub_2192D9080();
      if (v16 >= v15) {
        rsize_t v17 = v15;
      }
      else {
        rsize_t v17 = v16;
      }
      uint64_t result = memset_s((void *)(v11 + v13), v17, 0, v17);
      unint64_t v18 = *((void *)&__s + 1) | 0x8000000000000000;
      *a1 = __s;
LABEL_24:
      a1[1] = v18;
      return result;
    case 3uLL:
      *(void *)((char *)&__s + 7) = 0;
      *(void *)&long long __s = 0;
      return memset_s(&__s, 0, 0, 0);
    default:
      *(void *)&long long __s = *a1;
      WORD4(__s) = v1;
      BYTE10(__s) = BYTE2(v1);
      BYTE11(__s) = BYTE3(v1);
      BYTE12(__s) = BYTE4(v1);
      BYTE13(__s) = BYTE5(v1);
      BYTE14(__s) = BYTE6(v1);
      uint64_t result = memset_s(&__s, BYTE6(v1), 0, BYTE6(v1));
      unint64_t v5 = DWORD2(__s) | ((unint64_t)BYTE12(__s) << 32) | ((unint64_t)BYTE13(__s) << 40) | ((unint64_t)BYTE14(__s) << 48);
      *a1 = __s;
      a1[1] = v5;
      return result;
  }
}

unsigned char *sub_2192D7F68@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_2192D84C4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_2192D8588((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_2192D8604((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_2192D7FE0(int *a1, int a2)
{
  uint64_t result = (char *)sub_2192D90D0();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_2192D9060();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = (char *)sub_2192D9090();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_2192D9080();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

size_t sub_2192D8074(size_t result, unint64_t a2)
{
  if (!result) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = (const void *)result;
  int64_t v4 = a2 - result;
  if (a2 == result) {
    return MEMORY[0x263F8EE78];
  }
  if (v4 < 1)
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    if (!a2) {
      goto LABEL_13;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C16648);
    uint64_t v5 = (void *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2) {
      goto LABEL_13;
    }
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

char *sub_2192D8128(char *result, int64_t a2, char *__src, unint64_t a4)
{
  int64_t v4 = __src;
  if (!__src || !a4 || (unint64_t)__src >= a4 || !a2) {
    return v4;
  }
  if ((uint64_t)(a4 - (void)__src) >= a2) {
    size_t v5 = a2;
  }
  else {
    size_t v5 = a4 - (void)__src;
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    memmove(result, __src, v5);
    v4 += v5;
    return v4;
  }
  __break(1u);
  return result;
}

unint64_t sub_2192D819C()
{
  unint64_t result = qword_267C166F0;
  if (!qword_267C166F0)
  {
    sub_2192D9210();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C166F0);
  }
  return result;
}

uint64_t sub_2192D81F4(uint64_t a1, uint64_t a2)
{
  return sub_2192D5B0C(a1, a2, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_2192D8218()
{
  unint64_t result = qword_267C16700;
  if (!qword_267C16700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C166F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16700);
  }
  return result;
}

uint64_t sub_2192D8284(uint64_t a1, uint64_t a2)
{
  return sub_2192D67DC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2192D82A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
    JUMPOUT(0x2192D836CLL);
  }
  return result;
}

uint64_t sub_2192D838C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
    JUMPOUT(0x2192D83F8);
  }
  return result;
}

uint64_t sub_2192D8408(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5 - a4;
  if (!a4) {
    uint64_t v5 = 0;
  }
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3) {
    goto LABEL_19;
  }
  uint64_t v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_14;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_14:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result) {
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_2192D8490(uint64_t a1, uint64_t a2)
{
  return sub_2192D5FB4(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_2192D84B4()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2192D84C4(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_2192D8588(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2192D90A0();
  swift_allocObject();
  uint64_t result = sub_2192D9050();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2192D90E0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2192D8604(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2192D90A0();
  swift_allocObject();
  uint64_t result = sub_2192D9050();
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

uint64_t sub_2192D8688(uint64_t a1, uint64_t a2)
{
  return sub_2192D86E0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_2192D645C);
}

uint64_t sub_2192D86B4(uint64_t a1, uint64_t a2)
{
  return sub_2192D86E0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_2192D65D8);
}

uint64_t sub_2192D86E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void, void, void))
{
  return a3(a1, a2, *(void *)(v3 + 48), *(unsigned __int8 *)(v3 + 56), *(unsigned __int8 *)(v3 + 57), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40));
}

uint64_t sub_2192D8720(uint64_t result)
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
      sub_2192D90A0();
      swift_allocObject();
      sub_2192D9070();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2192D90E0();
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

uint64_t sub_2192D87C0()
{
  return sub_2192D9150();
}

uint64_t sub_2192D87D8()
{
  return MEMORY[0x270EEA9D0](*v0, v0[1]);
}

uint64_t sub_2192D87E0()
{
  return MEMORY[0x270EEA9C8](*v0, v0[1]);
}

uint64_t sub_2192D87E8()
{
  return MEMORY[0x270EEA9E0](*v0, v0[1]);
}

uint64_t sub_2192D87F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2192D9180();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t static ChaChaPoly.tagByteCount.getter()
{
  return 16;
}

uint64_t static ChaChaPoly.name.getter()
{
  return 0x6F50616843616843;
}

uint64_t static ChaChaPoly.bigEndianNonce.getter()
{
  return 0;
}

uint64_t sub_2192D8848()
{
  return 0x6F50616843616843;
}

uint64_t sub_2192D8864()
{
  return 16;
}

uint64_t sub_2192D886C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2192D9140();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t sub_2192D8898()
{
  return sub_2192D9130();
}

uint64_t sub_2192D88C8()
{
  return sub_2192D9270();
}

uint64_t sub_2192D88EC()
{
  return sub_2192D92A0();
}

uint64_t static AES.GCM.tagByteCount.getter()
{
  return 16;
}

uint64_t static AES.GCM.name.getter()
{
  return 0x4D4347534541;
}

uint64_t static AES.GCM.bigEndianNonce.getter()
{
  return 1;
}

uint64_t sub_2192D8928(uint64_t a1)
{
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F04510];
  *(void *)(a1 + 8) = sub_2192D8BF0(&qword_267C16718, MEMORY[0x263F04510]);
  uint64_t result = sub_2192D8BF0(&qword_267C16720, v2);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2192D89AC()
{
  return sub_2192D8BF0(&qword_267C16720, MEMORY[0x263F04510]);
}

uint64_t sub_2192D89F4()
{
  return sub_2192D8BF0(&qword_267C16728, MEMORY[0x263F04510]);
}

unint64_t sub_2192D8A40()
{
  unint64_t result = qword_267C16730;
  if (!qword_267C16730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C16730);
  }
  return result;
}

uint64_t sub_2192D8A94(uint64_t a1)
{
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F046D8];
  *(void *)(a1 + 8) = sub_2192D8BF0(&qword_267C16738, MEMORY[0x263F046D8]);
  uint64_t result = sub_2192D8BF0(&qword_267C16740, v2);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2192D8B18()
{
  return sub_2192D8BF0(&qword_267C16740, MEMORY[0x263F046D8]);
}

uint64_t sub_2192D8B60()
{
  return sub_2192D8BF0(&qword_267C16748, MEMORY[0x263F046D8]);
}

uint64_t sub_2192D8BA8()
{
  return sub_2192D8BF0(&qword_267C16750, MEMORY[0x263F046E8]);
}

uint64_t sub_2192D8BF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2192D8C38()
{
  return 0x4D4347534541;
}

uint64_t sub_2192D8C4C()
{
  return 1;
}

uint64_t sub_2192D8C54()
{
  return sub_2192D9260();
}

uint64_t sub_2192D8C6C()
{
  return sub_2192D9250();
}

uint64_t static Curve25519.noiseName.getter()
{
  return 0x3931353532;
}

uint64_t sub_2192D8C98()
{
  return 0x3931353532;
}

uint64_t sub_2192D8CAC()
{
  return sub_2192D91C0();
}

uint64_t Curve25519.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_2192D91B0();
}

uint64_t static Curve25519.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 32;
}

uint64_t sub_2192D8D2C()
{
  return sub_2192D91B0();
}

uint64_t sub_2192D8D64()
{
  return 32;
}

uint64_t static P256.noiseName.getter()
{
  return 909455952;
}

uint64_t sub_2192D8D7C()
{
  return 909455952;
}

uint64_t P256.KeyAgreement.PrivateKey.init()()
{
  return MEMORY[0x270EEAF40](0);
}

uint64_t sub_2192D8D94()
{
  return sub_2192D92F0();
}

uint64_t P256.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_2192D92E0();
}

uint64_t static P256.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 65;
}

_UNKNOWN **sub_2192D8E10()
{
  return &protocol witness table for Curve25519.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_2192D8E1C()
{
  return &protocol witness table for Curve25519.KeyAgreement.PublicKey;
}

_UNKNOWN **sub_2192D8E28()
{
  return &protocol witness table for P256.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_2192D8E34()
{
  return &protocol witness table for P256.KeyAgreement.PublicKey;
}

uint64_t sub_2192D8E44()
{
  return sub_2192D92E0();
}

uint64_t sub_2192D8E7C()
{
  return 65;
}

uint64_t static SHA256.noiseName.getter()
{
  return 0x363532414853;
}

uint64_t sub_2192D8E98()
{
  return 0x363532414853;
}

uint64_t static SHA512.noiseName.getter()
{
  return 0x323135414853;
}

uint64_t sub_2192D8EC0(uint64_t a1)
{
  uint64_t result = sub_2192D8F84(qword_26AD06C20, MEMORY[0x263F047F8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2192D8F18()
{
  return 0x323135414853;
}

uint64_t sub_2192D8F2C(uint64_t a1)
{
  uint64_t result = sub_2192D8F84(&qword_267C16758, MEMORY[0x263F04818]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2192D8F84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of static NoiseHashFunction.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2192D9020()
{
  return MEMORY[0x270EEE290]();
}

uint64_t sub_2192D9040()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2192D9050()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2192D9060()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2192D9070()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2192D9080()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2192D9090()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2192D90A0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2192D90C0()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2192D90D0()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_2192D90E0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2192D90F0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2192D9100()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_2192D9110()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_2192D9120()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_2192D9130()
{
  return MEMORY[0x270EEA9A0]();
}

uint64_t sub_2192D9140()
{
  return MEMORY[0x270EEA9A8]();
}

uint64_t sub_2192D9150()
{
  return MEMORY[0x270EEA9B8]();
}

uint64_t sub_2192D9180()
{
  return MEMORY[0x270EEA9D8]();
}

uint64_t _s9CryptoKit10Curve25519O12KeyAgreementO06PublicD0V5ChirpE19noiseRepresentation10Foundation4DataVvg_0()
{
  return MEMORY[0x270EEA9F8]();
}

uint64_t sub_2192D91B0()
{
  return MEMORY[0x270EEAA00]();
}

uint64_t sub_2192D91C0()
{
  return MEMORY[0x270EEAA18]();
}

uint64_t sub_2192D91D0()
{
  return MEMORY[0x270EEAA88]();
}

uint64_t sub_2192D91E0()
{
  return MEMORY[0x270EEAAE8]();
}

uint64_t sub_2192D91F0()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_2192D9200()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_2192D9210()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_2192D9220()
{
  return MEMORY[0x270EEAC28]();
}

uint64_t sub_2192D9230()
{
  return MEMORY[0x270EEAC30]();
}

uint64_t sub_2192D9240()
{
  return MEMORY[0x270EEAC38]();
}

uint64_t sub_2192D9250()
{
  return MEMORY[0x270EEAC50]();
}

uint64_t sub_2192D9260()
{
  return MEMORY[0x270EEAC58]();
}

uint64_t sub_2192D9270()
{
  return MEMORY[0x270EEAC70]();
}

uint64_t sub_2192D9280()
{
  return MEMORY[0x270EEAC98]();
}

uint64_t sub_2192D9290()
{
  return MEMORY[0x270EEACA0]();
}

uint64_t sub_2192D92A0()
{
  return MEMORY[0x270EEACA8]();
}

uint64_t sub_2192D92B0()
{
  return MEMORY[0x270EEACB0]();
}

uint64_t sub_2192D92C0()
{
  return MEMORY[0x270EEAD40]();
}

uint64_t sub_2192D92D0()
{
  return MEMORY[0x270EEAEA0]();
}

uint64_t sub_2192D92E0()
{
  return MEMORY[0x270EEAEB0]();
}

uint64_t sub_2192D92F0()
{
  return MEMORY[0x270EEAF18]();
}

uint64_t sub_2192D9310()
{
  return MEMORY[0x270EEB058]();
}

uint64_t sub_2192D9320()
{
  return MEMORY[0x270F9D388]();
}

uint64_t sub_2192D9330()
{
  return MEMORY[0x270F9D390]();
}

uint64_t sub_2192D9340()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_2192D9350()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_2192D9360()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_2192D9370()
{
  return MEMORY[0x270F9D440]();
}

uint64_t sub_2192D9380()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2192D9390()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t sub_2192D93A0()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t sub_2192D93B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2192D93C0()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_2192D93D0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2192D93E0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_2192D93F0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2192D9400()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2192D9410()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2192D9420()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2192D9430()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2192D9440()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_2192D9450()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2192D9460()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2192D9470()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2192D9480()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2192D9490()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2192D94A0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2192D94C0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2192D94D0()
{
  return MEMORY[0x270F9D920]();
}

uint64_t sub_2192D94E0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2192D94F0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2192D9500()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_2192D9530()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2192D9540()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_2192D9550()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2192D9560()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_2192D9570()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_2192D9580()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2192D9590()
{
  return MEMORY[0x270F9E558]();
}

uint64_t sub_2192D95B0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2192D95C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2192D95D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2192D95E0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2192D95F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2192D9600()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2192D9610()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2192D9620()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2192D9630()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2192D9640()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2192D9650()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_2192D9660()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2192D9670()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2192D9680()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2192D9690()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2192D96A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2192D96B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2192D96C0()
{
  return MEMORY[0x270EF2710]();
}

uint64_t sub_2192D96D0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2192D96E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2192D96F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2192D9700()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2192D9710()
{
  return MEMORY[0x270F9FE70]();
}

uint64_t sub_2192D9720()
{
  return MEMORY[0x270F9FF18]();
}

uint64_t sub_2192D9730()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_2192D9740()
{
  return MEMORY[0x270F9FF38]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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