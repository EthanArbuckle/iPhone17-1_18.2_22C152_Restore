void type metadata accessor for Ray2f(uint64_t a1)
{
  sub_236EDFAC8(a1, &qword_2688DEFA0);
}

void sub_236EDFAC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

double geom_oriented_bbox_2f.init(points:)(uint64_t a1)
{
  double v1 = geom_robust_oriented_bounding_box_2f(*(void *)(a1 + 16), (void *)(a1 + 32));
  swift_bridgeObjectRelease();
  return v1;
}

__n128 geom_oriented_bbox_2d.init(points:)(uint64_t a1)
{
  *(double *)&long long v1 = geom_robust_oriented_bounding_box_2d(*(void *)(a1 + 16), (_OWORD *)(a1 + 32));
  long long v3 = v1;
  swift_bridgeObjectRelease();
  return (__n128)v3;
}

__n128 geom_oriented_bbox_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  geom_oriented_bounding_box_3f(a1[1].u64[0], a1 + 2, v9);
  float32x4_t v7 = v9[1];
  float32x4_t v8 = v9[0];
  float32x4_t v5 = v9[3];
  float32x4_t v6 = v9[2];
  float32x4_t v4 = v9[4];
  swift_bridgeObjectRelease();
  *a2 = v8;
  a2[1] = v7;
  a2[2] = v6;
  a2[3] = v5;
  __n128 result = (__n128)v4;
  a2[4] = v4;
  return result;
}

__n128 geom_oriented_bbox_3d.init(_:)@<Q0>(uint64_t a1@<X0>, float64x2_t *a2@<X8>)
{
  geom_oriented_bounding_box_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), v14);
  float64x2_t v12 = v14[2];
  float64x2_t v13 = v14[0];
  float64x2_t v7 = v14[3];
  float64x2_t v8 = v14[1];
  float64x2_t v10 = v14[6];
  float64x2_t v11 = v14[4];
  float64x2_t v5 = v14[7];
  float64x2_t v6 = v14[5];
  float64x2_t v9 = v14[8];
  float64x2_t v4 = v14[9];
  swift_bridgeObjectRelease();
  *a2 = v13;
  a2[1] = v8;
  a2[2] = v12;
  a2[3] = v7;
  a2[4] = v11;
  a2[5] = v6;
  a2[6] = v10;
  a2[7] = v5;
  __n128 result = (__n128)v9;
  a2[8] = v9;
  a2[9] = v4;
  return result;
}

__n128 geom_bbox_3f.init(points:)(float32x4_t *a1)
{
  *(double *)&long long v1 = geom_dop6_for_points_3f(a1[1].i64[0], a1 + 2);
  long long v3 = v1;
  swift_bridgeObjectRelease();
  return (__n128)v3;
}

__n128 geom_dop8_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, _OWORD *a2@<X8>)
{
  geom_dop8_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v6);
  __n128 v4 = (__n128)v6[1];
  long long v5 = v6[0];
  swift_bridgeObjectRelease();
  __n128 result = v4;
  *a2 = v5;
  a2[1] = v4;
  return result;
}

__n128 geom_dop12_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop12_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)&v8);
  uint64_t v3 = v9;
  __n128 v6 = v10;
  long long v7 = v8;
  uint64_t v4 = v11;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v7;
  *(void *)(a2 + 16) = v3;
  __n128 result = v6;
  *(__n128 *)(a2 + 32) = v6;
  *(void *)(a2 + 48) = v4;
  return result;
}

__n128 geom_dop14_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop14_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)&v10);
  int v3 = v12;
  int v4 = v15;
  uint64_t v5 = v11;
  long long v8 = v10;
  __n128 v9 = v13;
  uint64_t v6 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v8;
  *(void *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 24) = v3;
  __n128 result = v9;
  *(__n128 *)(a2 + 32) = v9;
  *(void *)(a2 + 48) = v6;
  *(_DWORD *)(a2 + 56) = v4;
  return result;
}

__n128 geom_dop18_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop18_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v10);
  int v3 = v11;
  int v4 = v14;
  long long v6 = v10[1];
  long long v7 = v10[0];
  __n128 v8 = v13;
  long long v9 = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v6;
  *(_DWORD *)(a2 + 32) = v3;
  __n128 result = v8;
  *(_OWORD *)(a2 + 48) = v9;
  *(__n128 *)(a2 + 64) = v8;
  *(_DWORD *)(a2 + 80) = v4;
  return result;
}

__n128 geom_dop20_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop20_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v10);
  long long v8 = v10[1];
  long long v9 = v10[0];
  uint64_t v3 = v11;
  __n128 v6 = v13;
  long long v7 = v12;
  uint64_t v4 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v9;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v3;
  __n128 result = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(__n128 *)(a2 + 64) = v6;
  *(void *)(a2 + 80) = v4;
  return result;
}

__n128 geom_dop26_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop26_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v12);
  int v3 = v13;
  int v4 = v17;
  long long v7 = v12[1];
  long long v8 = v12[0];
  long long v6 = v12[2];
  long long v10 = v15;
  long long v11 = v14;
  __n128 v9 = v16;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v8;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v6;
  *(_DWORD *)(a2 + 48) = v3;
  *(_OWORD *)(a2 + 64) = v11;
  *(_OWORD *)(a2 + 80) = v10;
  __n128 result = v9;
  *(__n128 *)(a2 + 96) = v9;
  *(_DWORD *)(a2 + 112) = v4;
  return result;
}

__n128 geom_bbox_3d.init(points:)(uint64_t a1)
{
  geom_dop6_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)&v3);
  long long v2 = v3;
  swift_bridgeObjectRelease();
  return (__n128)v2;
}

__n128 geom_dop8_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  geom_dop8_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v12, a3, a4, a5);
  long long v10 = v12[1];
  long long v11 = v12[0];
  __n128 v9 = (__n128)v12[2];
  uint64_t v6 = v13;
  uint64_t v7 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v11;
  *(_OWORD *)(a2 + 16) = v10;
  __n128 result = v9;
  *(__n128 *)(a2 + 32) = v9;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v7;
  return result;
}

__n128 geom_dop12_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop12_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v11);
  long long v9 = v11[1];
  long long v10 = v11[0];
  long long v7 = v11[3];
  long long v8 = v11[2];
  __n128 v6 = (__n128)v11[4];
  uint64_t v3 = v12;
  uint64_t v4 = v13;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v10;
  *(_OWORD *)(a2 + 16) = v9;
  *(_OWORD *)(a2 + 32) = v8;
  *(_OWORD *)(a2 + 48) = v7;
  __n128 result = v6;
  *(__n128 *)(a2 + 64) = v6;
  *(void *)(a2 + 80) = v3;
  *(void *)(a2 + 88) = v4;
  return result;
}

__n128 geom_dop14_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  geom_dop14_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v15, a3, a4, a5);
  long long v13 = v15[1];
  long long v14 = v15[0];
  uint64_t v6 = v16;
  long long v11 = v17;
  long long v12 = v15[2];
  __n128 v9 = v19;
  long long v10 = v18;
  uint64_t v7 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v14;
  *(_OWORD *)(a2 + 16) = v13;
  *(_OWORD *)(a2 + 32) = v12;
  *(void *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v11;
  *(_OWORD *)(a2 + 80) = v10;
  __n128 result = v9;
  *(__n128 *)(a2 + 96) = v9;
  *(void *)(a2 + 112) = v7;
  return result;
}

__n128 geom_dop18_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  geom_dop18_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v14);
  long long v12 = v14[1];
  long long v13 = v14[0];
  long long v10 = v14[3];
  long long v11 = v14[2];
  uint64_t v3 = v15;
  long long v8 = v17;
  long long v9 = v16;
  __n128 v6 = v19;
  long long v7 = v18;
  uint64_t v4 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v13;
  *(_OWORD *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v10;
  *(void *)(a2 + 64) = v3;
  *(_OWORD *)(a2 + 80) = v9;
  *(_OWORD *)(a2 + 96) = v8;
  __n128 result = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 128) = v6;
  *(void *)(a2 + 144) = v4;
  return result;
}

__n128 geom_dop20_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  geom_dop20_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v18, a3, a4, a5);
  long long v16 = v18[1];
  long long v17 = v18[0];
  long long v14 = v18[3];
  long long v15 = v18[2];
  long long v12 = v18[5];
  long long v13 = v18[4];
  long long v10 = v18[7];
  long long v11 = v18[6];
  __n128 v9 = (__n128)v18[8];
  uint64_t v6 = v19;
  uint64_t v7 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v17;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v13;
  *(_OWORD *)(a2 + 80) = v12;
  *(_OWORD *)(a2 + 96) = v11;
  *(_OWORD *)(a2 + 112) = v10;
  __n128 result = v9;
  *(__n128 *)(a2 + 128) = v9;
  *(void *)(a2 + 144) = v6;
  *(void *)(a2 + 152) = v7;
  return result;
}

__n128 geom_dop26_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  geom_dop26_for_points_3d(*(void *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v21, a3, a4, a5);
  long long v19 = v21[1];
  long long v20 = v21[0];
  long long v17 = v21[3];
  long long v18 = v21[2];
  long long v15 = v21[5];
  long long v16 = v21[4];
  uint64_t v6 = v22;
  long long v13 = v24;
  long long v14 = v23;
  long long v11 = v26;
  long long v12 = v25;
  __n128 v9 = v28;
  long long v10 = v27;
  uint64_t v7 = v29;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v20;
  *(_OWORD *)(a2 + 16) = v19;
  *(_OWORD *)(a2 + 32) = v18;
  *(_OWORD *)(a2 + 48) = v17;
  *(_OWORD *)(a2 + 64) = v16;
  *(_OWORD *)(a2 + 80) = v15;
  *(void *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v14;
  *(_OWORD *)(a2 + 128) = v13;
  *(_OWORD *)(a2 + 144) = v12;
  *(_OWORD *)(a2 + 160) = v11;
  __n128 result = v9;
  *(_OWORD *)(a2 + 176) = v10;
  *(__n128 *)(a2 + 192) = v9;
  *(void *)(a2 + 208) = v7;
  return result;
}

Swift::Void __swiftcall convexHull(points:hull:)(Swift::OpaquePointer points, OS_geom_collection_u *hull)
{
}

{
  geom_convex_hull_2d(*((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)hull->super.isa);
}

Swift::Void __swiftcall convexHull(points:hullVertexIndices:hullFaceAccumulatedValence:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence)
{
}

{
  geom_convex_hull_3d(*((void *)points._rawValue + 2), (float64x2_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa);
}

Swift::Float __swiftcall convexHullApproximate(points:hullVertexIndices:hullFaceAccumulatedValence:maxIterations:coplanarityTolerance:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence, Swift::Int maxIterations, Swift::Float coplanarityTolerance)
{
  if (maxIterations < 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(maxIterations))
  {
    return geom_convex_hull_approx_with_tolerance_3f(*((void *)points._rawValue + 2), (float32x4_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa, maxIterations, coplanarityTolerance);
  }
  __break(1u);
  return coplanarityTolerance;
}

Swift::Double __swiftcall convexHullApproximate(points:hullVertexIndices:hullFaceAccumulatedValence:maxIterations:coplanarityTolerance:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence, Swift::Int maxIterations, Swift::Double coplanarityTolerance)
{
  if (maxIterations < 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(maxIterations))
  {
    return geom_convex_hull_approx_with_tolerance_3d(*((void *)points._rawValue + 2), (float64x2_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa, maxIterations, coplanarityTolerance);
  }
  __break(1u);
  return coplanarityTolerance;
}

OS_geom_exact_winding_number_3f __swiftcall OS_geom_exact_winding_number_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_exact_winding_number_3f)sub_236EE07C0((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3f);
}

uint64_t sub_236EE0690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE0848(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3f, a3);
}

void sub_236EE06A8()
{
}

OS_geom_exact_winding_number_3d __swiftcall OS_geom_exact_winding_number_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_exact_winding_number_3d)sub_236EE07C0((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3d);
}

uint64_t sub_236EE06F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE0848(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3d, a3);
}

void sub_236EE0708()
{
}

OS_geom_approximate_winding_number_3f __swiftcall OS_geom_approximate_winding_number_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_approximate_winding_number_3f)sub_236EE07C0((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3f);
}

uint64_t sub_236EE0760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE0848(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3f, a3);
}

void sub_236EE0778()
{
}

OS_geom_approximate_winding_number_3d __swiftcall OS_geom_approximate_winding_number_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_approximate_winding_number_3d)sub_236EE07C0((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3d);
}

uint64_t sub_236EE07C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_236EE0830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE0848(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3d, a3);
}

uint64_t sub_236EE0848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_236EE08B8()
{
}

void sub_236EE08F8(void *a1@<X8>)
{
  geom_create_approximate_convex_decomposition_opt_3f();
  *a1 = v2;
}

uint64_t sub_236EE0920()
{
  return geom_approximate_convex_decomposition_opt_get_max_cluster_count_3f(*v0);
}

uint64_t sub_236EE0928(int a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3f(*v1, a1);
}

uint64_t (*sub_236EE0934(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_max_cluster_count_3f(v3);
  return sub_236EE0980;
}

uint64_t sub_236EE0980(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3f(*(void *)a1, *(_DWORD *)(a1 + 8));
}

void sub_236EE0990(float *a1@<X8>)
{
  *a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3f(*v1);
}

uint64_t sub_236EE09BC(float *a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3f(*v1, *a1);
}

uint64_t (*sub_236EE09C8(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(float *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3f(v3);
  return sub_236EE0A14;
}

uint64_t sub_236EE0A14(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3f(*(void *)a1, *(float *)(a1 + 8));
}

void sub_236EE0A24(float *a1@<X8>)
{
  *a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3f(*v1);
}

uint64_t sub_236EE0A50(float *a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3f(*v1, *a1);
}

uint64_t (*sub_236EE0A5C(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(float *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3f(v3);
  return sub_236EE0AA8;
}

uint64_t sub_236EE0AA8(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3f(*(void *)a1, *(float *)(a1 + 8));
}

uint64_t sub_236EE0AB8()
{
  return geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3f(*v0);
}

uint64_t sub_236EE0AD4(char a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3f(*v1, a1 & 1);
}

uint64_t (*sub_236EE0AE4(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3f(v3);
  return sub_236EE0B30;
}

uint64_t sub_236EE0B30(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

void sub_236EE0B40(void *a1@<X8>)
{
  geom_create_approximate_convex_decomposition_opt_3d();
  *a1 = v2;
}

uint64_t sub_236EE0B68()
{
  return geom_approximate_convex_decomposition_opt_get_max_cluster_count_3d(*v0);
}

uint64_t sub_236EE0B70(int a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3d(*v1, a1);
}

uint64_t (*sub_236EE0B7C(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_max_cluster_count_3d(v3);
  return sub_236EE0BC8;
}

uint64_t sub_236EE0BC8(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3d(*(void *)a1, *(_DWORD *)(a1 + 8));
}

void sub_236EE0BD8(double *a1@<X8>)
{
  *a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3d(*v1);
}

uint64_t sub_236EE0C04(double *a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3d(*v1, *a1);
}

uint64_t (*sub_236EE0C10(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(a1 + 8) = *v1;
  *(double *)a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3d(v3);
  return sub_236EE0C5C;
}

uint64_t sub_236EE0C5C(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3d(*(void *)(a1 + 8), *(double *)a1);
}

void sub_236EE0C6C(double *a1@<X8>)
{
  *a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3d(*v1);
}

uint64_t sub_236EE0C98(double *a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3d(*v1, *a1);
}

uint64_t (*sub_236EE0CA4(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(a1 + 8) = *v1;
  *(double *)a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3d(v3);
  return sub_236EE0CF0;
}

uint64_t sub_236EE0CF0(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3d(*(void *)(a1 + 8), *(double *)a1);
}

uint64_t sub_236EE0D00()
{
  return geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3d(*v0);
}

uint64_t sub_236EE0D1C(char a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3d(*v1, a1 & 1);
}

uint64_t (*sub_236EE0D2C(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3d(v3);
  return sub_236EE0D78;
}

uint64_t sub_236EE0D78(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

OS_geom_approximate_convex_decomposition_3f __swiftcall OS_geom_approximate_convex_decomposition_3f.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2)
{
  return (OS_geom_approximate_convex_decomposition_3f)sub_236EE1028((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, *(uint64_t *)&voxelCountLog2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3f);
}

OS_geom_approximate_convex_decomposition_3f __swiftcall OS_geom_approximate_convex_decomposition_3f.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2, Swift::UInt32 clusterHullMaxVertices, Swift::Float clusterHullCoplanarityTolerance)
{
}

void OS_geom_approximate_convex_decomposition_3f.splitClusterWithPlane(clusterIndex:plane:)(unsigned int a1, float32x4_t a2, float32_t a3, float a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  a2.f32[2] = a3;
  float32x4_t v5 = a2;
  float v6 = a4;
  geom_approximate_convex_decomposition_split_cluster_with_plane_3f(v4, a1, &v5);
}

uint64_t sub_236EE0E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_236EE11A8(a1, a2, a3, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3f, a4);
}

void sub_236EE0EB0()
{
}

void sub_236EE0F2C(uint64_t *a1)
{
  geom_approximate_convex_decomposition_split_clusters_automatically_3f(*v1, *a1);
}

uint64_t sub_236EE0F38(uint64_t *a1)
{
  return geom_approximate_convex_decomposition_merge_clusters_automatically_3f(*v1, *a1);
}

void sub_236EE0F44(unsigned int a1, float32x4_t *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  __int32 v4 = a2[1].i32[0];
  uint64_t v5 = *v2;
  float32x4_t v6 = *a2;
  __int32 v7 = v4;
  geom_approximate_convex_decomposition_split_cluster_with_plane_3f(v5, a1, &v6);
}

uint64_t *sub_236EE0FD4(unsigned int a1, unsigned int a2)
{
  return geom_approximate_convex_decomposition_merge_clusters_3f(*v2, a1, a2);
}

void sub_236EE0FE4(uint64_t a1)
{
  geom_approximate_convex_decomposition_cluster_indices_3f(*v1, a1);
}

void sub_236EE0FF0(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  geom_approximate_convex_decomposition_hull_for_cluster_3f(*v3, a1, *a2, a3);
}

uint64_t sub_236EE1008()
{
  return geom_approximate_convex_decomposition_cluster_count_3f(*v0);
}

OS_geom_approximate_convex_decomposition_3d __swiftcall OS_geom_approximate_convex_decomposition_3d.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2)
{
  return (OS_geom_approximate_convex_decomposition_3d)sub_236EE1028((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, *(uint64_t *)&voxelCountLog2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3d);
}

uint64_t sub_236EE1028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a4(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

OS_geom_approximate_convex_decomposition_3d __swiftcall OS_geom_approximate_convex_decomposition_3d.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2, Swift::UInt32 clusterHullMaxVertices, Swift::Double clusterHullCoplanarityTolerance)
{
}

void OS_geom_approximate_convex_decomposition_3d.splitClusterWithPlane(clusterIndex:plane:)(unsigned int a1, float64x2_t a2, float64x2_t a3, double a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5[0] = a2;
  v5[1] = a3;
  double v6 = a4;
  geom_approximate_convex_decomposition_split_cluster_with_plane_3d(v4, a1, v5);
}

uint64_t sub_236EE1190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_236EE11A8(a1, a2, a3, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3d, a4);
}

uint64_t sub_236EE11A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void, uint64_t, unint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v6 = a4(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a5 = v6;
  return result;
}

void sub_236EE121C()
{
}

void sub_236EE1298(uint64_t *a1)
{
  geom_approximate_convex_decomposition_split_clusters_automatically_3d(*v1, *a1);
}

uint64_t sub_236EE12A4(uint64_t *a1)
{
  return geom_approximate_convex_decomposition_merge_clusters_automatically_3d(*v1, *a1);
}

void sub_236EE12B0(unsigned int a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  float64x2_t v4 = *(float64x2_t *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *v2;
  v7[0] = *(float64x2_t *)a2;
  v7[1] = v4;
  uint64_t v8 = v5;
  geom_approximate_convex_decomposition_split_cluster_with_plane_3d(v6, a1, v7);
}

uint64_t *sub_236EE1340(unsigned int a1, unsigned int a2)
{
  return geom_approximate_convex_decomposition_merge_clusters_3d(*v2, a1, a2);
}

void sub_236EE1350(uint64_t a1)
{
  geom_approximate_convex_decomposition_cluster_indices_3d(*v1, a1);
}

void sub_236EE135C(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  geom_approximate_convex_decomposition_hull_for_cluster_3d(*v3, a1, *a2, a3);
}

uint64_t sub_236EE1374()
{
  return geom_approximate_convex_decomposition_cluster_count_3d(*v0);
}

uint64_t _sSo12geom_bbox_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop6_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 3;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  long long v5 = v0[1];
  long long v4 = v0[2];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v5;
  *(_OWORD *)(v1 + 64) = v4;
  return v1;
}

uint64_t _sSo12geom_dop8_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop8_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 4;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  long long v4 = v0[3];
  long long v6 = *v0;
  long long v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  return v1;
}

uint64_t _sSo13geom_dop12_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop12_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 6;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  long long v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  long long v5 = v0[5];
  long long v7 = v0[2];
  long long v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  return v1;
}

uint64_t _sSo13geom_dop14_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop14_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 7;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  long long v5 = v0[1];
  long long v4 = v0[2];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v5;
  *(_OWORD *)(v1 + 64) = v4;
  long long v6 = v0[6];
  long long v8 = v0[3];
  long long v7 = v0[4];
  *(_OWORD *)(v1 + 112) = v0[5];
  *(_OWORD *)(v1 + 128) = v6;
  *(_OWORD *)(v1 + 80) = v8;
  *(_OWORD *)(v1 + 96) = v7;
  return v1;
}

uint64_t _sSo13geom_dop18_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop18_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 9;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  *(_OWORD *)(v1 + 32) = *v0;
  long long v4 = v0[4];
  long long v6 = v0[1];
  long long v5 = v0[2];
  *(_OWORD *)(v1 + 80) = v0[3];
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 48) = v6;
  *(_OWORD *)(v1 + 64) = v5;
  long long v7 = v0[8];
  long long v9 = v0[5];
  long long v8 = v0[6];
  *(_OWORD *)(v1 + 144) = v0[7];
  *(_OWORD *)(v1 + 160) = v7;
  *(_OWORD *)(v1 + 112) = v9;
  *(_OWORD *)(v1 + 128) = v8;
  return v1;
}

uint64_t _sSo13geom_dop20_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop20_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 10;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  long long v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  long long v5 = v0[5];
  long long v7 = v0[2];
  long long v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  long long v8 = v0[9];
  long long v10 = v0[6];
  long long v9 = v0[7];
  *(_OWORD *)(v1 + 160) = v0[8];
  *(_OWORD *)(v1 + 176) = v8;
  *(_OWORD *)(v1 + 128) = v10;
  *(_OWORD *)(v1 + 144) = v9;
  return v1;
}

uint64_t _sSo13geom_dop26_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  v0 = geom_dop26_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2688DEFD0);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 17;
  }
  *(void *)(v1 + 16) = 13;
  *(void *)(v1 + 24) = 2 * (v3 >> 4);
  *(_OWORD *)(v1 + 32) = *v0;
  long long v4 = v0[4];
  long long v6 = v0[1];
  long long v5 = v0[2];
  *(_OWORD *)(v1 + 80) = v0[3];
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 48) = v6;
  *(_OWORD *)(v1 + 64) = v5;
  long long v7 = v0[8];
  long long v9 = v0[5];
  long long v8 = v0[6];
  *(_OWORD *)(v1 + 144) = v0[7];
  *(_OWORD *)(v1 + 160) = v7;
  *(_OWORD *)(v1 + 112) = v9;
  *(_OWORD *)(v1 + 128) = v8;
  long long v10 = v0[12];
  long long v12 = v0[9];
  long long v11 = v0[10];
  *(_OWORD *)(v1 + 208) = v0[11];
  *(_OWORD *)(v1 + 224) = v10;
  *(_OWORD *)(v1 + 176) = v12;
  *(_OWORD *)(v1 + 192) = v11;
  return v1;
}

uint64_t _sSo12geom_bbox_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop6_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  *(void *)(v1 + 16) = 3;
  *(void *)(v1 + 24) = 2 * (v3 >> 5);
  long long v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  long long v5 = v0[5];
  long long v7 = v0[2];
  long long v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  return v1;
}

uint64_t _sSo12geom_dop8_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop8_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  *(void *)(v1 + 16) = 4;
  *(void *)(v1 + 24) = 2 * (v3 >> 5);
  long long v4 = v0[3];
  long long v6 = *v0;
  long long v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  long long v7 = v0[7];
  long long v9 = v0[4];
  long long v8 = v0[5];
  *(_OWORD *)(v1 + 128) = v0[6];
  *(_OWORD *)(v1 + 144) = v7;
  *(_OWORD *)(v1 + 96) = v9;
  *(_OWORD *)(v1 + 112) = v8;
  return v1;
}

uint64_t _sSo13geom_dop12_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop12_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  *(void *)(v1 + 16) = 6;
  *(void *)(v1 + 24) = 2 * (v3 >> 5);
  long long v4 = v0[3];
  long long v6 = *v0;
  long long v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  long long v7 = v0[7];
  long long v9 = v0[4];
  long long v8 = v0[5];
  *(_OWORD *)(v1 + 128) = v0[6];
  *(_OWORD *)(v1 + 144) = v7;
  *(_OWORD *)(v1 + 96) = v9;
  *(_OWORD *)(v1 + 112) = v8;
  long long v10 = v0[11];
  long long v12 = v0[8];
  long long v11 = v0[9];
  *(_OWORD *)(v1 + 192) = v0[10];
  *(_OWORD *)(v1 + 208) = v10;
  *(_OWORD *)(v1 + 160) = v12;
  *(_OWORD *)(v1 + 176) = v11;
  return v1;
}

uint64_t _sSo13geom_dop14_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop14_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size((const void *)v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  *(void *)(v1 + 16) = 7;
  *(void *)(v1 + 24) = 2 * (v3 >> 5);
  long long v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  long long v5 = v0[5];
  long long v7 = v0[2];
  long long v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  long long v8 = v0[9];
  long long v10 = v0[6];
  long long v9 = v0[7];
  *(_OWORD *)(v1 + 160) = v0[8];
  *(_OWORD *)(v1 + 176) = v8;
  *(_OWORD *)(v1 + 128) = v10;
  *(_OWORD *)(v1 + 144) = v9;
  long long v11 = v0[13];
  long long v13 = v0[10];
  long long v12 = v0[11];
  *(_OWORD *)(v1 + 224) = v0[12];
  *(_OWORD *)(v1 + 240) = v11;
  *(_OWORD *)(v1 + 192) = v13;
  *(_OWORD *)(v1 + 208) = v12;
  return v1;
}

void *_sSo13geom_dop18_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop18_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = (void *)swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size(v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  v1[2] = 9;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x120uLL);
  return v1;
}

void *_sSo13geom_dop20_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop20_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = (void *)swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size(v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  v1[2] = 10;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x140uLL);
  return v1;
}

void *_sSo13geom_dop26_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  v0 = geom_dop26_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
  uint64_t v1 = (void *)swift_allocObject();
  int64_t v2 = _swift_stdlib_malloc_size(v1);
  uint64_t v3 = v2 - 32;
  if (v2 < 32) {
    uint64_t v3 = v2 - 1;
  }
  v1[2] = 13;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x1A0uLL);
  return v1;
}

unint64_t sub_236EE1BE4()
{
  unint64_t result = qword_2688DEFA8;
  if (!qword_2688DEFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DEFA8);
  }
  return result;
}

unint64_t sub_236EE1C3C()
{
  unint64_t result = qword_2688DEFB0;
  if (!qword_2688DEFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DEFB0);
  }
  return result;
}

_UNKNOWN **sub_236EE1C90()
{
  return &protocol witness table for OS_geom_approximate_convex_decomposition_opt_3f;
}

uint64_t sub_236EE1C9C()
{
  return sub_236EE1D38(&qword_2688DEFB8, type metadata accessor for Plane3f);
}

_UNKNOWN **sub_236EE1CE4()
{
  return &protocol witness table for OS_geom_approximate_convex_decomposition_opt_3d;
}

uint64_t sub_236EE1CF0()
{
  return sub_236EE1D38(&qword_2688DEFC0, type metadata accessor for Plane3d);
}

uint64_t sub_236EE1D38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of WindingNumber3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WindingNumber3.query(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 64))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.splitClustersAutomatically(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.mergeClustersAutomatically(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.splitClusterWithPlane(clusterIndex:plane:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = (*(uint64_t (**)(void))(a4 + 88))();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.mergeClusters(destination:source:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.clusterIndices(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.convexHullOfCluster(clusterIndex:hullVertexPositions:hullFaceVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.clusterCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
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

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  uint64_t result = geom_intersect_ray_bbox_2f((float *)v9 + 1, (float *)v9, a2, a3, a4, a5);
  float v8 = *((float *)v9 + 1);
  int v7 = v9[0];
  if (result != 2) {
    float v8 = *(float *)v9;
  }
  *(float *)a1 = v8;
  *(_DWORD *)(a1 + 4) = v7;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, __n128 a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  v10[1] = *(double *)MEMORY[0x263EF8340];
  double v9 = 0.0;
  v10[0] = 0.0;
  uint64_t result = geom_intersect_ray_bbox_2d(v10, &v9, a2, a3, a4, a5);
  double v7 = v9;
  double v8 = v10[0];
  if (result != 2) {
    double v8 = v9;
  }
  *(double *)a1 = v8;
  *(double *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float32x4_t a8@<Q6>, float32_t a9@<S7>)
{
  v13[1] = *MEMORY[0x263EF8340];
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  a8.f32[2] = a9;
  v13[0] = 0;
  uint64_t result = geom_intersect_ray_bbox_3f((float *)v13 + 1, (__int32 *)v13, a2, a4, a6, a8);
  float v12 = *((float *)v13 + 1);
  int v11 = v13[0];
  if (result != 2) {
    float v12 = *(float *)v13;
  }
  *(float *)a1 = v12;
  *(_DWORD *)(a1 + 4) = v11;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(double *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>, __n128 a8@<Q6>, __n128 a9@<Q7>)
{
  v16[1] = *(double *)MEMORY[0x263EF8340];
  double v15 = 0.0;
  v16[0] = 0.0;
  v14[0] = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  v13[0] = a6;
  v13[1] = a7;
  void v13[2] = a8;
  v13[3] = a9;
  uint64_t result = geom_intersect_ray_bbox_3d(v14, (uint64_t)v13, v16, (uint64_t *)&v15);
  uint64_t v11 = *(void *)&v15;
  double v12 = v16[0];
  if (result != 2) {
    double v12 = v15;
  }
  *a1 = v12;
  *((void *)a1 + 1) = v11;
  *((void *)a1 + 2) = result;
  return result;
}

uint64_t intersect(ray:triangle:)@<X0>(int32x4_t *a1@<X0>, uint64_t a2@<X8>, float32x4_t a3@<Q0>, float32_t a4@<S1>, double a5@<D2>, float32_t a6@<S3>, float32x4_t a7@<Q5>)
{
  *(double *)a7.i64 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  a3.f32[2] = a4;
  a7.f32[2] = a6;
  int32x4_t v8 = a1[1];
  int32x4_t v9 = a1[2];
  int32x4_t v10 = *a1;
  unsigned int v17 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t result = geom_intersect_ray_triangle_3f((float *)&v17, (uint64_t)&v15, a3, a7, v10, v8, v9);
  uint64_t v12 = v17;
  uint64_t v14 = v15;
  uint64_t v13 = v16;
  if (!result)
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
  }
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = result ^ 1;
  return result;
}

uint64_t intersect(ray:triangle:)@<X0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, float64x2_t a4@<Q1>, float64x2_t a5@<Q2>, float64x2_t a6@<Q3>)
{
  v23[1] = *(double *)MEMORY[0x263EF8340];
  float64x2_t v7 = *a1;
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  v23[0] = 0.0;
  long long v21 = 0u;
  long long v22 = 0u;
  v20[0] = a3;
  v20[1] = a4;
  v20[2] = a5;
  v20[3] = a6;
  v19[0] = v7;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v10;
  v19[4] = v11;
  v19[5] = v12;
  uint64_t result = geom_intersect_ray_triangle_3d(v20, v19, v23, (uint64_t)&v21);
  double v14 = 0.0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (result)
  {
    uint64_t v18 = *((void *)&v22 + 1);
    double v14 = v23[0];
    uint64_t v16 = *((void *)&v21 + 1);
    uint64_t v15 = v21;
    uint64_t v17 = v22;
  }
  *(double *)a2 = v14;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(unsigned char *)(a2 + 48) = result ^ 1;
  return result;
}

float intersect(ray:circle:)@<S0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, uint64_t a4@<D2>, int a5@<S3>)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unsigned int v6 = geom_intersect_ray_circle_2f(a4, a5, (float *)v9 + 1, (float *)v9, a2, a3);
  float result = *((float *)v9 + 1);
  int v8 = v9[0];
  *(_DWORD *)a1 = HIDWORD(v9[0]);
  *(_DWORD *)(a1 + 4) = v8;
  *(void *)(a1 + 8) = v6;
  return result;
}

double intersect(ray:circle:)@<D0>(double *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, double a5@<D3>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  double v10 = 0.0;
  float64x2_t v11 = a4;
  double v12 = a5;
  unsigned int v6 = geom_intersect_ray_circle_2d(&v11, &v10, (double *)&v9, a2, a3);
  uint64_t v8 = v9;
  double result = v10;
  *a1 = v10;
  *((void *)a1 + 1) = v8;
  *((void *)a1 + 2) = v6;
  return result;
}

float intersect(ray:sphere:)@<S0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float a8@<S6>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  uint64_t v12 = 0;
  float32x4_t v13 = a6;
  float v14 = a8;
  unsigned int v9 = geom_intersect_ray_sphere_3f(&v13, (float *)&v12 + 1, (float *)&v12, a2, a4);
  float result = *((float *)&v12 + 1);
  int v11 = v12;
  *(_DWORD *)a1 = HIDWORD(v12);
  *(_DWORD *)(a1 + 4) = v11;
  *(void *)(a1 + 8) = v9;
  return result;
}

double intersect(ray:sphere:)@<D0>(double *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, double a8@<D6>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  double v14 = 0.0;
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  _OWORD v12[3] = a5;
  v15[0] = a6;
  v15[1] = a7;
  double v16 = a8;
  unsigned int v9 = geom_intersect_ray_sphere_3d(v12, v15, &v14, (double *)&v13);
  uint64_t v11 = v13;
  double result = v14;
  *a1 = v14;
  *((void *)a1 + 1) = v11;
  *((void *)a1 + 2) = v9;
  return result;
}

uint64_t intersect(ray:quadraticBezier:)@<X0>(float *a1@<X8>)
{
  return sub_236EE26C4((uint64_t (*)(float32x2_t *, void *))geom_intersect_ray_quadratic_bezier_2f, a1);
}

double intersect(ray:quadraticBezier:)@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_236EE27B0((uint64_t (*)(__n128 *, long long *))geom_intersect_ray_quadratic_bezier_2d, a1).n128_u64[0];
  return result;
}

uint64_t intersect(lineSegment:quadraticBezier:)@<X0>(float *a1@<X8>)
{
  return sub_236EE26C4((uint64_t (*)(float32x2_t *, void *))geom_intersect_line_segment_quadratic_bezier_2f, a1);
}

uint64_t sub_236EE26C4@<X0>(uint64_t (*a1)(float32x2_t *, void *)@<X0>, float *a2@<X8>)
{
  v5[1] = *MEMORY[0x263EF8340];
  float32x2_t v4 = 0;
  v5[0] = 0;
  uint64_t result = a1(&v4, v5);
  v6.val[0] = v4;
  v6.val[1] = (float32x2_t)v5[0];
  vst2_f32(a2, v6);
  a2 += 4;
  *(void *)a2 = result;
  return result;
}

double intersect(lineSegment:quadraticBezier:)@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_236EE27B0((uint64_t (*)(__n128 *, long long *))geom_intersect_line_segment_quadratic_bezier_2d, a1).n128_u64[0];
  return result;
}

__n128 sub_236EE27B0@<Q0>(uint64_t (*a1)(__n128 *, long long *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  __n128 v6 = 0u;
  long long v7 = 0u;
  unsigned int v3 = a1(&v6, &v7);
  __n128 result = v6;
  *(void *)&long long v5 = v7;
  *(void *)(a2 + 24) = *((void *)&v7 + 1);
  *((void *)&v5 + 1) = result.n128_u64[1];
  *(void *)a2 = result.n128_u64[0];
  *(_OWORD *)(a2 + 8) = v5;
  *(void *)(a2 + 32) = v3;
  return result;
}

double intersect(line:quadraticBezier:)@<D0>(void *a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unsigned int v7 = geom_intersect_line_quadratic_bezier_2f(a2, a3, (float *)v9, a4, a5, a6);
  double result = *(double *)v9;
  *a1 = v9[0];
  a1[1] = v7;
  return result;
}

double intersect(line:quadraticBezier:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0uLL;
  __n128 v10 = a2;
  double v11 = a3;
  unsigned int v7 = geom_intersect_line_quadratic_bezier_2d((uint64_t)&v10, (double *)&v9, a4, a5, a6);
  double result = *(double *)&v9;
  *(_OWORD *)a1 = v9;
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t intersect(ray:cubicBezier:)@<X0>(uint64_t a1@<X8>)
{
  return sub_236EE2A90((uint64_t (*)(long long *, long long *))geom_intersect_ray_cubic_bezier_2f, a1);
}

double intersect(ray:cubicBezier:)@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_236EE2B90((uint64_t (*)(long long *, int8x16_t *))geom_intersect_ray_cubic_bezier_2d, a1).u64[0];
  return result;
}

uint64_t intersect(lineSegment:cubicBezier:)@<X0>(uint64_t a1@<X8>)
{
  return sub_236EE2A90((uint64_t (*)(long long *, long long *))geom_intersect_line_segment_cubic_bezier_2f, a1);
}

uint64_t sub_236EE2A90@<X0>(uint64_t (*a1)(long long *, long long *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t result = a1(&v7, &v8);
  v10.val[0] = (float32x2_t)v7;
  v10.val[1] = (float32x2_t)v8;
  int v4 = DWORD2(v7);
  int v5 = DWORD2(v8);
  __n128 v6 = (float *)a2;
  vst2_f32(v6, v10);
  v6 += 4;
  *(_DWORD *)__n128 v6 = v4;
  *(_DWORD *)(a2 + 20) = v5;
  *(void *)(a2 + 24) = result;
  return result;
}

double intersect(lineSegment:cubicBezier:)@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_236EE2B90((uint64_t (*)(long long *, int8x16_t *))geom_intersect_line_segment_cubic_bezier_2d, a1).u64[0];
  return result;
}

int8x16_t sub_236EE2B90@<Q0>(uint64_t (*a1)(long long *, int8x16_t *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int8x16_t v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  int8x16_t v10 = 0u;
  unsigned int v3 = a1(&v9, &v11);
  uint64_t v5 = *((void *)&v9 + 1);
  int8x16_t v4 = v10;
  int8x16_t v6 = v11;
  uint64_t v7 = v12;
  *(void *)a2 = v9;
  int8x16_t result = vextq_s8(v6, v4, 8uLL);
  v6.i64[1] = v5;
  *(int8x16_t *)(a2 + 8) = v6;
  *(int8x16_t *)(a2 + 24) = result;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v3;
  return result;
}

float intersect(line:cubicBezier:)@<S0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, float32x2_t a4@<D2>, double a5@<D3>, float32x2_t a6@<D4>, float32x2_t a7@<D5>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  *(void *)int8x16_t v11 = 0;
  unsigned int v8 = geom_intersect_line_cubic_bezier_2f(a2, a3, (float *)&v10, a4, a5, a6, a7);
  float result = v11[0];
  *(void *)a1 = v10;
  *(float *)(a1 + 8) = result;
  *(void *)(a1 + 16) = v8;
  return result;
}

double intersect(line:cubicBezier:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  __n128 v13 = a2;
  double v14 = a3;
  unsigned int v8 = geom_intersect_line_cubic_bezier_2d((uint64_t)&v13, (double *)&v11, a4, a5, a6, a7);
  double result = *(double *)&v11;
  uint64_t v10 = v12;
  *(_OWORD *)a1 = v11;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v8;
  return result;
}

__n128 intersect(triangle:bbox:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, float a4@<S1>, double a5@<D2>, float a6@<S3>, __n128 a7@<Q4>, __n128 a8@<Q5>)
{
  a7.n128_f64[0] = a5;
  a8.n128_f64[0] = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  a8.n128_f32[2] = a4;
  a7.n128_f32[2] = a6;
  float32x4_t v9 = a1[1];
  float32x4_t v10 = a1[2];
  float32x4_t v11 = *a1;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  __n128 v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int32x4_t v22 = 0u;
  long long v23 = 0u;
  unsigned int v12 = geom_intersect_triangle_bbox_3f(&v22, v11, v9, v10, a8, a7);
  long long v13 = v28;
  __n128 result = v29;
  long long v15 = v26;
  long long v14 = v27;
  long long v17 = v24;
  long long v16 = v25;
  int32x4_t v19 = v22;
  long long v18 = v23;
  v19.i32[3] = 0;
  HIDWORD(v18) = 0;
  HIDWORD(v17) = 0;
  HIDWORD(v16) = 0;
  HIDWORD(v15) = 0;
  HIDWORD(v14) = 0;
  HIDWORD(v13) = 0;
  long long v20 = v30;
  result.n128_u32[3] = 0;
  HIDWORD(v20) = 0;
  *(int32x4_t *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v16;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v14;
  *(_OWORD *)(a2 + 96) = v13;
  *(__n128 *)(a2 + 112) = result;
  *(_OWORD *)(a2 + 128) = v20;
  *(void *)(a2 + 144) = v12;
  return result;
}

__n128 intersect(triangle:bbox:)@<Q0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, float64x2_t a4@<Q1>, float64x2_t a5@<Q2>, float64x2_t a6@<Q3>)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  float64x2_t v7 = *a1;
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  __n128 v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int64x2_t v33 = 0u;
  long long v34 = 0u;
  v32[0] = v7;
  v32[1] = v8;
  v32[2] = v9;
  v32[3] = v10;
  v32[4] = v11;
  v32[5] = v12;
  v31[0] = a3;
  v31[1] = a4;
  v31[2] = a5;
  v31[3] = a6;
  unsigned int v13 = geom_intersect_triangle_bbox_3d(v32, v31, &v33);
  __n128 result = v49;
  unint64_t v15 = v50;
  long long v16 = v47;
  unint64_t v17 = v48;
  long long v18 = v45;
  unint64_t v19 = v46;
  long long v20 = v43;
  unint64_t v21 = v44;
  long long v22 = v41;
  unint64_t v23 = v42;
  long long v24 = v39;
  unint64_t v25 = v40;
  long long v26 = v37;
  unint64_t v27 = v38;
  long long v28 = v35;
  unint64_t v29 = v36;
  unint64_t v30 = v34;
  *(int64x2_t *)a2 = v33;
  *(_OWORD *)(a2 + 16) = v30;
  *(_OWORD *)(a2 + 32) = v28;
  *(_OWORD *)(a2 + 48) = v29;
  *(_OWORD *)(a2 + 64) = v26;
  *(_OWORD *)(a2 + 80) = v27;
  *(_OWORD *)(a2 + 96) = v24;
  *(_OWORD *)(a2 + 112) = v25;
  *(_OWORD *)(a2 + 128) = v22;
  *(_OWORD *)(a2 + 144) = v23;
  *(_OWORD *)(a2 + 160) = v20;
  *(_OWORD *)(a2 + 176) = v21;
  *(_OWORD *)(a2 + 192) = v18;
  *(_OWORD *)(a2 + 208) = v19;
  *(_OWORD *)(a2 + 224) = v16;
  *(_OWORD *)(a2 + 240) = v17;
  *(__n128 *)(a2 + 256) = result;
  *(_OWORD *)(a2 + 272) = v15;
  *(void *)(a2 + 288) = v13;
  return result;
}

uint64_t intersect(lineSegment:plane:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float a8@<S6>)
{
  a2.f32[2] = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  unsigned int v14 = 0;
  float32x4_t v13 = 0uLL;
  float32x4_t v15 = a6;
  float v16 = a8;
  uint64_t result = geom_intersect_line_segment_plane_3f(&v15, (float *)&v14, &v13, a2, a4);
  uint64_t v10 = v14;
  uint64_t v11 = v13.i64[1];
  uint64_t v12 = v13.i64[0];
  if (!result)
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v12;
  *(void *)(a1 + 24) = v11;
  *(unsigned char *)(a1 + 32) = result ^ 1;
  return result;
}

uint64_t intersect(lineSegment:plane:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, double a8@<D6>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  int8x16_t v16 = 0u;
  long long v17 = 0u;
  v15[0] = a2;
  v15[1] = a3;
  float64x2_t v15[2] = a4;
  _OWORD v15[3] = a5;
  v19[0] = a6;
  v19[1] = a7;
  double v20 = a8;
  uint64_t result = geom_intersect_line_segment_plane_3d(v15, v19, &v18, &v16);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (result)
  {
    uint64_t v10 = v18;
    uint64_t v12 = v16.i64[1];
    uint64_t v11 = v16.i64[0];
    uint64_t v14 = *((void *)&v17 + 1);
    uint64_t v13 = v17;
  }
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v14;
  *(unsigned char *)(a1 + 48) = result ^ 1;
  return result;
}

uint64_t intersect(ray:line:)@<X0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, double a3@<D1>, uint64_t a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v10 = 0;
  uint64_t result = geom_intersect_ray_line_2f(a4, SLODWORD(a5), (float *)&v10, a2, a3, *(double *)&a4, a5, a6, a7);
  if (!result) {
    goto LABEL_5;
  }
  if (result != 1)
  {
    uint64_t result = 1;
LABEL_5:
    char v9 = 1;
    goto LABEL_6;
  }
  char v9 = 0;
  uint64_t result = v10;
LABEL_6:
  *(_DWORD *)a1 = result;
  *(unsigned char *)(a1 + 4) = v9;
  return result;
}

uint64_t intersect(ray:line:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, double a5@<D3>, float64x2_t a6@<Q4>, double a7@<D5>, int64x2_t a8@<Q6>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  float64x2_t v13 = a4;
  double v14 = a5;
  uint64_t result = geom_intersect_ray_line_2d(&v13, (double *)&v12, a2, a3, a4.f64[0], a5, a6, a7, a8);
  if (!result)
  {
    uint64_t v11 = 0;
LABEL_6:
    char v10 = 1;
    goto LABEL_7;
  }
  if (result != 1)
  {
    uint64_t v11 = 1;
    goto LABEL_6;
  }
  char v10 = 0;
  uint64_t v11 = v12;
LABEL_7:
  *(void *)a1 = v11;
  *(unsigned char *)(a1 + 8) = v10;
  return result;
}

uint64_t intersect(ray:lineSegment:)@<X0>(uint64_t a1@<X8>)
{
  return sub_236EE36C0((uint64_t (*)(char *, void *))geom_intersect_ray_line_segment_2f, a1);
}

{
  uint64_t vars8;

  return sub_236EE37D4((uint64_t (*)(void *, uint64_t *))geom_intersect_ray_line_segment_2d, a1);
}

uint64_t intersect(ray:ray:)@<X0>(uint64_t a1@<X8>)
{
  return sub_236EE36C0((uint64_t (*)(char *, void *))geom_intersect_ray_ray_2f, a1);
}

{
  uint64_t vars8;

  return sub_236EE37D4((uint64_t (*)(void *, uint64_t *))geom_intersect_ray_ray_2d, a1);
}

uint64_t intersect(line:line:)@<X0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, uint64_t a4@<D2>, int a5@<S3>)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  uint64_t result = geom_intersect_line_line_2f(a2, a3, a4, a5, v9);
  if (!result)
  {
    uint64_t v8 = 0;
LABEL_6:
    char v7 = 1;
    goto LABEL_7;
  }
  if (result != 1)
  {
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  char v7 = 0;
  uint64_t v8 = v9[0];
LABEL_7:
  *(void *)a1 = v8;
  *(unsigned char *)(a1 + 8) = v7;
  return result;
}

uint64_t intersect(line:line:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, double a5@<D3>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0uLL;
  float64x2_t v11 = a2;
  double v12 = a3;
  float64x2_t v9 = a4;
  double v10 = a5;
  uint64_t result = geom_intersect_line_line_2d(&v11, &v9, &v8);
  if (result == 1)
  {
    uint64_t v7 = *((void *)&v8 + 1);
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = 0;
  }
  else
  {
    if (result)
    {
      *(_OWORD *)a1 = xmmword_236F23FB0;
    }
    else
    {
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    *(unsigned char *)(a1 + 16) = 1;
  }
  return result;
}

uint64_t intersect(line:lineSegment:)@<X0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v10 = 0;
  uint64_t result = geom_intersect_line_line_segment_2f(a2, a3, (float *)&v10, *(float32x2_t *)&a4, *(float32x2_t *)&a5, a4, a5, a6, a7);
  if (!result) {
    goto LABEL_5;
  }
  if (result != 1)
  {
    uint64_t result = 1;
LABEL_5:
    char v9 = 1;
    goto LABEL_6;
  }
  char v9 = 0;
  uint64_t result = v10;
LABEL_6:
  *(_DWORD *)a1 = result;
  *(unsigned char *)(a1 + 4) = v9;
  return result;
}

uint64_t intersect(line:lineSegment:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, double a6@<D4>, double a7@<D5>, int64x2_t a8@<Q6>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  float64x2_t v13 = a2;
  double v14 = a3;
  uint64_t result = geom_intersect_line_line_segment_2d(&v13, (double *)&v12, a4, a5, a4.f64[0], a5.f64[0], a6, a7, a8);
  if (!result)
  {
    uint64_t v11 = 0;
LABEL_6:
    char v10 = 1;
    goto LABEL_7;
  }
  if (result != 1)
  {
    uint64_t v11 = 1;
    goto LABEL_6;
  }
  char v10 = 0;
  uint64_t v11 = v12;
LABEL_7:
  *(void *)a1 = v11;
  *(unsigned char *)(a1 + 8) = v10;
  return result;
}

uint64_t intersect(lineSegment:lineSegment:)@<X0>(uint64_t a1@<X8>)
{
  return sub_236EE36C0((uint64_t (*)(char *, void *))geom_intersect_line_segment_line_segment_2f, a1);
}

{
  uint64_t vars8;

  return sub_236EE37D4((uint64_t (*)(void *, uint64_t *))geom_intersect_line_segment_line_segment_2d, a1);
}

uint64_t sub_236EE36C0@<X0>(uint64_t (*a1)(char *, void *)@<X0>, uint64_t a2@<X8>)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  uint64_t result = a1((char *)v6 + 4, v6);
  if (result)
  {
    if (result == 1)
    {
      char v4 = 0;
      unint64_t v5 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
    }
    else
    {
      unint64_t v5 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      char v4 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
    char v4 = 2;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_236EE37D4@<X0>(uint64_t (*a1)(void *, uint64_t *)@<X0>, uint64_t a2@<X8>)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  v8[0] = 0;
  uint64_t result = a1(v8, &v7);
  if (result == 1)
  {
    uint64_t v5 = v7;
    *(void *)a2 = v8[0];
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = 0;
  }
  else
  {
    if (result)
    {
      uint64_t v6 = v7;
      *(void *)a2 = v8[0];
      *(void *)(a2 + 8) = v6;
      char v4 = 1;
    }
    else
    {
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      char v4 = 2;
    }
    *(unsigned char *)(a2 + 16) = v4;
  }
  return result;
}

unint64_t intersect(ray:triangle:)(float32x2_t a1, float32x2_t a2, double a3, double a4, double a5)
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = 0;
  int v5 = geom_intersect_ray_triangle_2f((float *)v8 + 1, (float *)v8, a1, a2, a3, a4, a5);
  unint64_t v6 = HIDWORD(v8[0]) | ((unint64_t)LODWORD(v8[0]) << 32);
  if (!v5) {
    return 0;
  }
  return v6;
}

uint64_t intersect(ray:triangle:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  v9[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9[0] = 0.0;
  int v5 = geom_intersect_ray_triangle_2d(v9, (double *)&v8, a1, a2, a3, a4, a5);
  double v6 = v9[0];
  if (!v5) {
    double v6 = 0.0;
  }
  return *(void *)&v6;
}

uint64_t sub_236EE3958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for IntersectRayLineResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236EE39A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for IntersectRayLineSegmentResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for IntersectRayRayResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236EE3A08()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void *sub_236EE3A94(void *a1, unsigned __int16 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  size_t v7 = *(void *)(v5 + 64);
  unint64_t v8 = v7;
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v10 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v10 > 0xFFFE)
      {
        uint64_t v9 = 4;
      }
      else
      {
        BOOL v11 = v10 != 0;
        BOOL v12 = v10 >= 0xFF;
        uint64_t v9 = 2;
        if (!v12) {
          uint64_t v9 = v11;
        }
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    unint64_t v8 = v9 + v7;
  }
  uint64_t v13 = *(_DWORD *)(v5 + 80);
  if (v13 > 7 || v8 > 0x18 || (*(_DWORD *)(v5 + 80) & 0x100000) != 0)
  {
    uint64_t v16 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v16 + ((v13 + 16) & ~v13));
    swift_retain();
    return a1;
  }
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v18 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v18 > 0xFFFE)
      {
        int v17 = *(_DWORD *)((char *)a2 + v7);
        if (!v17) {
          goto LABEL_37;
        }
        goto LABEL_27;
      }
      if (v18 > 0xFE)
      {
        int v17 = *(unsigned __int16 *)((char *)a2 + v7);
        if (!*(unsigned __int16 *)((char *)a2 + v7)) {
          goto LABEL_37;
        }
        goto LABEL_27;
      }
      if (!v18)
      {
LABEL_37:
        if (!v6) {
          goto LABEL_53;
        }
        goto LABEL_38;
      }
    }
    int v17 = *((unsigned __int8 *)a2 + v7);
    if (!*((unsigned char *)a2 + v7)) {
      goto LABEL_37;
    }
LABEL_27:
    int v19 = (v17 - 1) << (8 * v7);
    if (v7 > 3) {
      int v19 = 0;
    }
    if (v7)
    {
      if (v7 <= 3) {
        int v20 = v7;
      }
      else {
        int v20 = 4;
      }
      switch(v20)
      {
        case 2:
          int v21 = *a2;
          break;
        case 3:
          int v21 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v21 = *(_DWORD *)a2;
          break;
        default:
          int v21 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v21 = 0;
    }
    if (v6 + (v21 | v19) != -1) {
      goto LABEL_39;
    }
    goto LABEL_53;
  }
LABEL_38:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness))
  {
LABEL_39:
    if (v6 <= 1)
    {
      if (v7 <= 3)
      {
        unsigned int v23 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
        if (v23 > 0xFFFE)
        {
          uint64_t v22 = 4;
        }
        else
        {
          BOOL v24 = v23 != 0;
          BOOL v12 = v23 >= 0xFF;
          uint64_t v22 = 2;
          if (!v12) {
            uint64_t v22 = v24;
          }
        }
      }
      else
      {
        uint64_t v22 = 1;
      }
      v7 += v22;
    }
    memcpy(a1, a2, v7);
    return a1;
  }
LABEL_53:
  (*(void (**)(void *, unsigned __int16 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v25 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v25 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (v25 > 0xFE)
      {
        *(_WORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (!v25) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v7) = 0;
  }
  return a1;
}

uint64_t sub_236EE3DDC(unsigned __int16 *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v4 = *(_DWORD *)(v3 + 84);
  uint64_t v5 = *(void *)(v3 + 64);
  if (v4 > 1)
  {
LABEL_19:
    uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(v3 + 48))(a1);
    uint64_t v3 = v13;
    if (result) {
      return result;
    }
    goto LABEL_25;
  }
  char v6 = 8 * v5;
  if (v5 <= 3)
  {
    unsigned int v8 = (~(-1 << v6) - v4 + 2) >> v6;
    if (v8 > 0xFFFE)
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (v8 > 0xFE)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (!v8)
    {
LABEL_18:
      if (v4) {
        goto LABEL_19;
      }
LABEL_25:
      BOOL v12 = *(uint64_t (**)(unsigned __int16 *, uint64_t))(v3 + 8);
      return v12(a1, AssociatedTypeWitness);
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_18;
  }
LABEL_10:
  int v9 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v9 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  int v11 = v4 + (v5 | v9);
  uint64_t result = (v11 + 1);
  if (v11 == -1) {
    goto LABEL_25;
  }
  return result;
}

char *sub_236EE3FBC(char *a1, unsigned __int16 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  size_t v7 = *(void *)(v5 + 64);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        int v8 = *(_DWORD *)((char *)a2 + v7);
        if (!v8) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (v9 > 0xFE)
      {
        int v8 = *(unsigned __int16 *)((char *)a2 + v7);
        if (!*(unsigned __int16 *)((char *)a2 + v7)) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (!v9)
      {
LABEL_20:
        if (!v6) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
    int v8 = *((unsigned __int8 *)a2 + v7);
    if (!*((unsigned char *)a2 + v7)) {
      goto LABEL_20;
    }
LABEL_10:
    int v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3) {
      int v10 = 0;
    }
    if (v7)
    {
      if (v7 <= 3) {
        int v11 = *(void *)(v5 + 64);
      }
      else {
        int v11 = 4;
      }
      switch(v11)
      {
        case 2:
          int v12 = *a2;
          break;
        case 3:
          int v12 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v12 = *(_DWORD *)a2;
          break;
        default:
          int v12 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v12 = 0;
    }
    if (v6 + (v12 | v10) != -1) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_21:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness))
  {
LABEL_22:
    if (v6 <= 1)
    {
      if (v7 <= 3)
      {
        unsigned int v14 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
        if (v14 > 0xFFFE)
        {
          uint64_t v13 = 4;
        }
        else
        {
          BOOL v15 = v14 != 0;
          BOOL v16 = v14 >= 0xFF;
          uint64_t v13 = 2;
          if (!v16) {
            uint64_t v13 = v15;
          }
        }
      }
      else
      {
        uint64_t v13 = 1;
      }
      v7 += v13;
    }
    memcpy(a1, a2, v7);
    return a1;
  }
LABEL_36:
  (*(void (**)(char *, unsigned __int16 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v17 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v17 > 0xFFFE)
      {
        *(_DWORD *)&a1[v7] = 0;
        return a1;
      }
      if (v17 > 0xFE)
      {
        *(_WORD *)&a1[v7] = 0;
        return a1;
      }
      if (!v17) {
        return a1;
      }
    }
    a1[v7] = 0;
  }
  return a1;
}

unsigned __int16 *sub_236EE4268(unsigned __int16 *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  size_t v7 = *(void *)(v5 + 64);
  if (v6 > 1) {
    goto LABEL_21;
  }
  if (v7 > 3) {
    goto LABEL_3;
  }
  unsigned int v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v9 > 0xFFFE)
  {
    int v8 = *(_DWORD *)((char *)a1 + v7);
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v9 > 0xFE)
  {
    int v8 = *(unsigned __int16 *)((char *)a1 + v7);
    if (!*(unsigned __int16 *)((char *)a1 + v7)) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_3:
    int v8 = *((unsigned __int8 *)a1 + v7);
    if (!*((unsigned char *)a1 + v7)) {
      goto LABEL_20;
    }
LABEL_10:
    int v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3) {
      int v10 = 0;
    }
    if (v7)
    {
      if (v7 <= 3) {
        int v11 = *(void *)(v5 + 64);
      }
      else {
        int v11 = 4;
      }
      switch(v11)
      {
        case 2:
          int v12 = *a1;
          break;
        case 3:
          int v12 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v12 = *(_DWORD *)a1;
          break;
        default:
          int v12 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v12 = 0;
    }
    if ((v12 | v10) + v6 != -1) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_20:
  if (!v6) {
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
  if (!v13((unsigned __int8 *)a1, v6, AssociatedTypeWitness))
  {
    if (v6 > 1)
    {
LABEL_74:
      if (v13(a2, v6, AssociatedTypeWitness)) {
        goto LABEL_75;
      }
      goto LABEL_100;
    }
LABEL_33:
    if (v7 > 3) {
      goto LABEL_34;
    }
    unsigned int v17 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
    if (v17 > 0xFFFE)
    {
      int v15 = *(_DWORD *)&a2[v7];
      if (v15) {
        goto LABEL_55;
      }
    }
    else
    {
      if (v17 <= 0xFE)
      {
        if (!v17) {
          goto LABEL_72;
        }
LABEL_34:
        int v15 = a2[v7];
        if (!a2[v7]) {
          goto LABEL_72;
        }
LABEL_55:
        int v21 = (v15 - 1) << (8 * v7);
        if (v7 > 3) {
          int v21 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v22 = v7;
          }
          else {
            int v22 = 4;
          }
          switch(v22)
          {
            case 2:
              int v23 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v23 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v23 = *(_DWORD *)a2;
              break;
            default:
              int v23 = *a2;
              break;
          }
        }
        else
        {
          int v23 = 0;
        }
        if (v6 + (v23 | v21) != -1)
        {
LABEL_75:
          (*(void (**)(unsigned __int16 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
          if (v6 <= 1)
          {
            if (v7 > 3) {
              goto LABEL_70;
            }
            goto LABEL_77;
          }
LABEL_83:
          memcpy(a1, a2, v7);
          return a1;
        }
LABEL_100:
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
        return a1;
      }
      int v15 = *(unsigned __int16 *)&a2[v7];
      if (*(_WORD *)&a2[v7]) {
        goto LABEL_55;
      }
    }
LABEL_72:
    if (!v6) {
      goto LABEL_100;
    }
    uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
    goto LABEL_74;
  }
  if (v6 > 1)
  {
LABEL_67:
    if (v13(a2, v6, AssociatedTypeWitness)) {
      goto LABEL_68;
    }
    goto LABEL_88;
  }
LABEL_30:
  if (v7 > 3) {
    goto LABEL_31;
  }
  unsigned int v16 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v16 > 0xFFFE)
  {
    int v14 = *(_DWORD *)&a2[v7];
    if (v14) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
  if (v16 > 0xFE)
  {
    int v14 = *(unsigned __int16 *)&a2[v7];
    if (*(_WORD *)&a2[v7]) {
      goto LABEL_45;
    }
LABEL_65:
    if (!v6) {
      goto LABEL_88;
    }
    uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
    goto LABEL_67;
  }
  if (!v16) {
    goto LABEL_65;
  }
LABEL_31:
  int v14 = a2[v7];
  if (!a2[v7]) {
    goto LABEL_65;
  }
LABEL_45:
  int v18 = (v14 - 1) << (8 * v7);
  if (v7 > 3) {
    int v18 = 0;
  }
  if (v7)
  {
    if (v7 <= 3) {
      int v19 = v7;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *(unsigned __int16 *)a2;
        break;
      case 3:
        int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a2;
        break;
      default:
        int v20 = *a2;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  if (v6 + (v20 | v18) != -1)
  {
LABEL_68:
    if (v6 <= 1)
    {
      if (v7 > 3)
      {
LABEL_70:
        uint64_t v24 = 1;
LABEL_82:
        v7 += v24;
        goto LABEL_83;
      }
LABEL_77:
      unsigned int v25 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v25 > 0xFFFE)
      {
        uint64_t v24 = 4;
      }
      else
      {
        BOOL v26 = v25 != 0;
        BOOL v27 = v25 >= 0xFF;
        uint64_t v24 = 2;
        if (!v27) {
          uint64_t v24 = v26;
        }
      }
      goto LABEL_82;
    }
    goto LABEL_83;
  }
LABEL_88:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v28 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v28 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (v28 > 0xFE)
      {
        *(unsigned __int16 *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (!v28) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v7) = 0;
  }
  return a1;
}

char *sub_236EE47A8(char *a1, unsigned __int16 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  size_t v7 = *(void *)(v5 + 64);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        int v8 = *(_DWORD *)((char *)a2 + v7);
        if (!v8) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (v9 > 0xFE)
      {
        int v8 = *(unsigned __int16 *)((char *)a2 + v7);
        if (!*(unsigned __int16 *)((char *)a2 + v7)) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (!v9)
      {
LABEL_20:
        if (!v6) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
    int v8 = *((unsigned __int8 *)a2 + v7);
    if (!*((unsigned char *)a2 + v7)) {
      goto LABEL_20;
    }
LABEL_10:
    int v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3) {
      int v10 = 0;
    }
    if (v7)
    {
      if (v7 <= 3) {
        int v11 = *(void *)(v5 + 64);
      }
      else {
        int v11 = 4;
      }
      switch(v11)
      {
        case 2:
          int v12 = *a2;
          break;
        case 3:
          int v12 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v12 = *(_DWORD *)a2;
          break;
        default:
          int v12 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v12 = 0;
    }
    if (v6 + (v12 | v10) != -1) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_21:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness))
  {
LABEL_22:
    if (v6 <= 1)
    {
      if (v7 <= 3)
      {
        unsigned int v14 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
        if (v14 > 0xFFFE)
        {
          uint64_t v13 = 4;
        }
        else
        {
          BOOL v15 = v14 != 0;
          BOOL v16 = v14 >= 0xFF;
          uint64_t v13 = 2;
          if (!v16) {
            uint64_t v13 = v15;
          }
        }
      }
      else
      {
        uint64_t v13 = 1;
      }
      v7 += v13;
    }
    memcpy(a1, a2, v7);
    return a1;
  }
LABEL_36:
  (*(void (**)(char *, unsigned __int16 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v17 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v17 > 0xFFFE)
      {
        *(_DWORD *)&a1[v7] = 0;
        return a1;
      }
      if (v17 > 0xFE)
      {
        *(_WORD *)&a1[v7] = 0;
        return a1;
      }
      if (!v17) {
        return a1;
      }
    }
    a1[v7] = 0;
  }
  return a1;
}

unsigned __int16 *sub_236EE4A54(unsigned __int16 *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  size_t v7 = *(void *)(v5 + 64);
  if (v6 > 1) {
    goto LABEL_21;
  }
  if (v7 > 3) {
    goto LABEL_3;
  }
  unsigned int v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v9 > 0xFFFE)
  {
    int v8 = *(_DWORD *)((char *)a1 + v7);
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v9 > 0xFE)
  {
    int v8 = *(unsigned __int16 *)((char *)a1 + v7);
    if (!*(unsigned __int16 *)((char *)a1 + v7)) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_3:
    int v8 = *((unsigned __int8 *)a1 + v7);
    if (!*((unsigned char *)a1 + v7)) {
      goto LABEL_20;
    }
LABEL_10:
    int v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3) {
      int v10 = 0;
    }
    if (v7)
    {
      if (v7 <= 3) {
        int v11 = *(void *)(v5 + 64);
      }
      else {
        int v11 = 4;
      }
      switch(v11)
      {
        case 2:
          int v12 = *a1;
          break;
        case 3:
          int v12 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v12 = *(_DWORD *)a1;
          break;
        default:
          int v12 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v12 = 0;
    }
    if ((v12 | v10) + v6 != -1) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_20:
  if (!v6) {
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
  if (!v13((unsigned __int8 *)a1, v6, AssociatedTypeWitness))
  {
    if (v6 > 1)
    {
LABEL_74:
      if (v13(a2, v6, AssociatedTypeWitness)) {
        goto LABEL_75;
      }
      goto LABEL_100;
    }
LABEL_33:
    if (v7 > 3) {
      goto LABEL_34;
    }
    unsigned int v17 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
    if (v17 > 0xFFFE)
    {
      int v15 = *(_DWORD *)&a2[v7];
      if (v15) {
        goto LABEL_55;
      }
    }
    else
    {
      if (v17 <= 0xFE)
      {
        if (!v17) {
          goto LABEL_72;
        }
LABEL_34:
        int v15 = a2[v7];
        if (!a2[v7]) {
          goto LABEL_72;
        }
LABEL_55:
        int v21 = (v15 - 1) << (8 * v7);
        if (v7 > 3) {
          int v21 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v22 = v7;
          }
          else {
            int v22 = 4;
          }
          switch(v22)
          {
            case 2:
              int v23 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v23 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v23 = *(_DWORD *)a2;
              break;
            default:
              int v23 = *a2;
              break;
          }
        }
        else
        {
          int v23 = 0;
        }
        if (v6 + (v23 | v21) != -1)
        {
LABEL_75:
          (*(void (**)(unsigned __int16 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
          if (v6 <= 1)
          {
            if (v7 > 3) {
              goto LABEL_70;
            }
            goto LABEL_77;
          }
LABEL_83:
          memcpy(a1, a2, v7);
          return a1;
        }
LABEL_100:
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
        return a1;
      }
      int v15 = *(unsigned __int16 *)&a2[v7];
      if (*(_WORD *)&a2[v7]) {
        goto LABEL_55;
      }
    }
LABEL_72:
    if (!v6) {
      goto LABEL_100;
    }
    uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
    goto LABEL_74;
  }
  if (v6 > 1)
  {
LABEL_67:
    if (v13(a2, v6, AssociatedTypeWitness)) {
      goto LABEL_68;
    }
    goto LABEL_88;
  }
LABEL_30:
  if (v7 > 3) {
    goto LABEL_31;
  }
  unsigned int v16 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v16 > 0xFFFE)
  {
    int v14 = *(_DWORD *)&a2[v7];
    if (v14) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
  if (v16 > 0xFE)
  {
    int v14 = *(unsigned __int16 *)&a2[v7];
    if (*(_WORD *)&a2[v7]) {
      goto LABEL_45;
    }
LABEL_65:
    if (!v6) {
      goto LABEL_88;
    }
    uint64_t v13 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48);
    goto LABEL_67;
  }
  if (!v16) {
    goto LABEL_65;
  }
LABEL_31:
  int v14 = a2[v7];
  if (!a2[v7]) {
    goto LABEL_65;
  }
LABEL_45:
  int v18 = (v14 - 1) << (8 * v7);
  if (v7 > 3) {
    int v18 = 0;
  }
  if (v7)
  {
    if (v7 <= 3) {
      int v19 = v7;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *(unsigned __int16 *)a2;
        break;
      case 3:
        int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a2;
        break;
      default:
        int v20 = *a2;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  if (v6 + (v20 | v18) != -1)
  {
LABEL_68:
    if (v6 <= 1)
    {
      if (v7 > 3)
      {
LABEL_70:
        uint64_t v24 = 1;
LABEL_82:
        v7 += v24;
        goto LABEL_83;
      }
LABEL_77:
      unsigned int v25 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v25 > 0xFFFE)
      {
        uint64_t v24 = 4;
      }
      else
      {
        BOOL v26 = v25 != 0;
        BOOL v27 = v25 >= 0xFF;
        uint64_t v24 = 2;
        if (!v27) {
          uint64_t v24 = v26;
        }
      }
      goto LABEL_82;
    }
    goto LABEL_83;
  }
LABEL_88:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      unsigned int v28 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v28 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (v28 > 0xFE)
      {
        *(unsigned __int16 *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (!v28) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v7) = 0;
  }
  return a1;
}

uint64_t sub_236EE4F94(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  unsigned int v7 = v6 - 2;
  uint64_t v8 = *(void *)(v5 + 64);
  if (v6 <= 1)
  {
    unsigned int v7 = 0;
    if (v8 <= 3)
    {
      unsigned int v10 = (~(-1 << (8 * v8)) - v6 + 2) >> (8 * v8);
      if (v10 > 0xFFFE)
      {
        uint64_t v9 = 4;
      }
      else
      {
        BOOL v11 = v10 != 0;
        BOOL v12 = v10 >= 0xFF;
        uint64_t v9 = 2;
        if (!v12) {
          uint64_t v9 = v11;
        }
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    v8 += v9;
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v7) {
    goto LABEL_28;
  }
  char v13 = 8 * v8;
  if (v8 > 3) {
    goto LABEL_13;
  }
  unsigned int v15 = ((a2 - v7 + ~(-1 << v13)) >> v13) + 1;
  if (HIWORD(v15))
  {
    int v14 = *(_DWORD *)((char *)a1 + v8);
    if (v14) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v15 <= 0xFF)
    {
      if (v15 < 2) {
        goto LABEL_28;
      }
LABEL_13:
      int v14 = *((unsigned __int8 *)a1 + v8);
      if (!*((unsigned char *)a1 + v8)) {
        goto LABEL_28;
      }
LABEL_20:
      int v16 = (v14 - 1) << v13;
      if (v8 > 3) {
        int v16 = 0;
      }
      if (v8)
      {
        if (v8 > 3) {
          LODWORD(v8) = 4;
        }
        switch((int)v8)
        {
          case 2:
            LODWORD(v8) = *a1;
            break;
          case 3:
            LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v8) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v8) = *(unsigned __int8 *)a1;
            break;
        }
      }
      return v7 + (v8 | v16) + 1;
    }
    int v14 = *(unsigned __int16 *)((char *)a1 + v8);
    if (*(unsigned __int16 *)((char *)a1 + v8)) {
      goto LABEL_20;
    }
  }
LABEL_28:
  if (!v7) {
    return 0;
  }
  if (!v6) {
    return 0;
  }
  unsigned int v17 = (*(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
  BOOL v12 = v17 >= 2;
  uint64_t result = v17 - 2;
  if (result == 0 || !v12) {
    return 0;
  }
  return result;
}

void sub_236EE51A0(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v8 = v7 - 2;
  size_t v9 = *(void *)(v6 + 64);
  size_t v10 = v9;
  if (v7 <= 1)
  {
    unsigned int v8 = 0;
    if (v9 <= 3)
    {
      unsigned int v12 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v12 > 0xFFFE)
      {
        uint64_t v11 = 4;
      }
      else
      {
        BOOL v13 = v12 != 0;
        BOOL v14 = v12 >= 0xFF;
        uint64_t v11 = 2;
        if (!v14) {
          uint64_t v11 = v13;
        }
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
    size_t v10 = v11 + v9;
  }
  if (a3 <= v8)
  {
    int v15 = 0;
  }
  else if (v10 <= 3)
  {
    unsigned int v18 = ((a3 - v8 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v18))
    {
      int v15 = 4;
    }
    else if (v18 >= 0x100)
    {
      int v15 = 2;
    }
    else
    {
      int v15 = v18 > 1;
    }
  }
  else
  {
    int v15 = 1;
  }
  if (v8 < a2)
  {
    unsigned int v16 = ~v8 + a2;
    if (v10 < 4)
    {
      int v17 = (v16 >> (8 * v10)) + 1;
      if (v10)
      {
        int v19 = v16 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v10] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v17;
        return;
      case 3:
        goto LABEL_57;
      case 4:
        *(_DWORD *)&a1[v10] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_57:
      __break(1u);
      JUMPOUT(0x236EE54DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        if (a2 + 2 <= v7)
        {
          if (a2 != -2)
          {
            int v23 = *(void (**)(unsigned char *, void))(v6 + 56);
            v23(a1, a2 + 2);
          }
        }
        else
        {
          if (v9 <= 3) {
            int v20 = ~(-1 << (8 * v9));
          }
          else {
            int v20 = -1;
          }
          if (v9)
          {
            int v21 = v20 & (a2 - v7 + 1);
            if (v9 <= 3) {
              int v22 = v9;
            }
            else {
              int v22 = 4;
            }
            bzero(a1, v9);
            switch(v22)
            {
              case 2:
                *(_WORD *)a1 = v21;
                break;
              case 3:
                *(_WORD *)a1 = v21;
                a1[2] = BYTE2(v21);
                break;
              case 4:
                *(_DWORD *)a1 = v21;
                break;
              default:
                *a1 = v21;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_236EE5514(unsigned __int16 *a1)
{
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v3 = *(_DWORD *)(v2 + 84);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v3 > 1)
  {
LABEL_19:
    size_t v9 = *(uint64_t (**)(unsigned __int16 *))(v2 + 48);
    return v9(a1);
  }
  char v5 = 8 * v4;
  if (v4 <= 3)
  {
    unsigned int v7 = (~(-1 << v5) - v3 + 2) >> v5;
    if (v7 > 0xFFFE)
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (v7 > 0xFE)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (!v7)
    {
LABEL_18:
      if (!v3) {
        return 0;
      }
      goto LABEL_19;
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_18;
  }
LABEL_10:
  int v8 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v8 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v3 + (v4 | v8) + 1;
}

void sub_236EE56C0(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  size_t v6 = *(void *)(v4 + 64);
  if (v5 > 1)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = (~(-1 << (8 * v6)) - v5 + 2) >> (8 * v6);
    if (v10 > 0xFFFE)
    {
      int v7 = 4;
    }
    else if (v10 >= 0xFF)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 != 0;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (v5 < a2)
  {
    unsigned int v8 = ~v5 + a2;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v6)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v6);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        return;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        return;
      default:
        return;
    }
  }
  switch(v7)
  {
    case 1:
      a1[v6] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v6] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EE58FCLL);
    case 4:
      *(_DWORD *)&a1[v6] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unsigned int v12 = *(void (**)(unsigned char *, uint64_t))(v4 + 56);
        v12(a1, a2);
      }
      return;
  }
}

uint64_t type metadata accessor for IntersectLineLine2Result()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236EE593C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void *sub_236EE59B8(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  unint64_t v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    unint64_t v9 = v10 + v8;
  }
  uint64_t v14 = *(_DWORD *)(v6 + 80);
  if (v14 > 7 || v9 > 0x18 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
    return a1;
  }
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v19 > 0xFFFE)
      {
        int v18 = *(_DWORD *)((char *)a2 + v8);
        if (!v18) {
          goto LABEL_37;
        }
        goto LABEL_27;
      }
      if (v19 > 0xFE)
      {
        int v18 = *(unsigned __int16 *)((char *)a2 + v8);
        if (!*(unsigned __int16 *)((char *)a2 + v8)) {
          goto LABEL_37;
        }
        goto LABEL_27;
      }
      if (!v19)
      {
LABEL_37:
        if (!v7) {
          goto LABEL_53;
        }
        goto LABEL_38;
      }
    }
    int v18 = *((unsigned __int8 *)a2 + v8);
    if (!*((unsigned char *)a2 + v8)) {
      goto LABEL_37;
    }
LABEL_27:
    int v20 = (v18 - 1) << (8 * v8);
    if (v8 > 3) {
      int v20 = 0;
    }
    if (v8)
    {
      if (v8 <= 3) {
        int v21 = v8;
      }
      else {
        int v21 = 4;
      }
      switch(v21)
      {
        case 2:
          int v22 = *a2;
          break;
        case 3:
          int v22 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v22 = *(_DWORD *)a2;
          break;
        default:
          int v22 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v22 = 0;
    }
    if (v7 + (v22 | v20) != -1) {
      goto LABEL_39;
    }
    goto LABEL_53;
  }
LABEL_38:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
  {
LABEL_39:
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v24 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v24 > 0xFFFE)
        {
          uint64_t v23 = 4;
        }
        else
        {
          BOOL v25 = v24 != 0;
          BOOL v13 = v24 >= 0xFF;
          uint64_t v23 = 2;
          if (!v13) {
            uint64_t v23 = v25;
          }
        }
      }
      else
      {
        uint64_t v23 = 1;
      }
      v8 += v23;
    }
    memcpy(a1, a2, v8);
    return a1;
  }
LABEL_53:
  (*(void (**)(void *, unsigned __int16 *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v26 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v26 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (v26 > 0xFE)
      {
        *(_WORD *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (!v26) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v8) = 0;
  }
  return a1;
}

uint64_t sub_236EE5CE4(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 > 1)
  {
LABEL_19:
    uint64_t v14 = *(void *)(v3 - 8);
    uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(v4 + 48))(a1);
    uint64_t v4 = v14;
    if (result) {
      return result;
    }
    goto LABEL_25;
  }
  char v7 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v9 = (~(-1 << v7) - v5 + 2) >> v7;
    if (v9 > 0xFFFE)
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (v9 > 0xFE)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (!v9)
    {
LABEL_18:
      if (v5) {
        goto LABEL_19;
      }
LABEL_25:
      BOOL v13 = *(uint64_t (**)(unsigned __int16 *, uint64_t))(v4 + 8);
      return v13(a1, v3);
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_18;
  }
LABEL_10:
  int v10 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v10 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  int v12 = v5 + (v6 | v10);
  uint64_t result = (v12 + 1);
  if (v12 == -1) {
    goto LABEL_25;
  }
  return result;
}

char *sub_236EE5EA4(char *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v10 > 0xFFFE)
      {
        int v9 = *(_DWORD *)((char *)a2 + v8);
        if (!v9) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (v10 > 0xFE)
      {
        int v9 = *(unsigned __int16 *)((char *)a2 + v8);
        if (!*(unsigned __int16 *)((char *)a2 + v8)) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (!v10)
      {
LABEL_20:
        if (!v7) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
    int v9 = *((unsigned __int8 *)a2 + v8);
    if (!*((unsigned char *)a2 + v8)) {
      goto LABEL_20;
    }
LABEL_10:
    int v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3) {
      int v11 = 0;
    }
    if (v8)
    {
      if (v8 <= 3) {
        int v12 = *(void *)(v6 + 64);
      }
      else {
        int v12 = 4;
      }
      switch(v12)
      {
        case 2:
          int v13 = *a2;
          break;
        case 3:
          int v13 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v13 = *(_DWORD *)a2;
          break;
        default:
          int v13 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v13 = 0;
    }
    if (v7 + (v13 | v11) != -1) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_21:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
  {
LABEL_22:
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v15 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v15 > 0xFFFE)
        {
          uint64_t v14 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v14 = 2;
          if (!v17) {
            uint64_t v14 = v16;
          }
        }
      }
      else
      {
        uint64_t v14 = 1;
      }
      v8 += v14;
    }
    memcpy(a1, a2, v8);
    return a1;
  }
LABEL_36:
  (*(void (**)(char *, unsigned __int16 *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v18 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v18 > 0xFFFE)
      {
        *(_DWORD *)&a1[v8] = 0;
        return a1;
      }
      if (v18 > 0xFE)
      {
        *(_WORD *)&a1[v8] = 0;
        return a1;
      }
      if (!v18) {
        return a1;
      }
    }
    a1[v8] = 0;
  }
  return a1;
}

unsigned __int16 *sub_236EE6134(unsigned __int16 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (v7 > 1) {
    goto LABEL_21;
  }
  if (v8 > 3) {
    goto LABEL_3;
  }
  unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v10 > 0xFFFE)
  {
    int v9 = *(_DWORD *)((char *)a1 + v8);
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v10 > 0xFE)
  {
    int v9 = *(unsigned __int16 *)((char *)a1 + v8);
    if (!*(unsigned __int16 *)((char *)a1 + v8)) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_3:
    int v9 = *((unsigned __int8 *)a1 + v8);
    if (!*((unsigned char *)a1 + v8)) {
      goto LABEL_20;
    }
LABEL_10:
    int v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3) {
      int v11 = 0;
    }
    if (v8)
    {
      if (v8 <= 3) {
        int v12 = *(void *)(v6 + 64);
      }
      else {
        int v12 = 4;
      }
      switch(v12)
      {
        case 2:
          int v13 = *a1;
          break;
        case 3:
          int v13 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v13 = *(_DWORD *)a1;
          break;
        default:
          int v13 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v13 = 0;
    }
    if ((v13 | v11) + v7 != -1) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_20:
  if (!v7) {
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
  if (!v14((unsigned __int8 *)a1, v7, v5))
  {
    if (v7 > 1)
    {
LABEL_74:
      if (v14(a2, v7, v5)) {
        goto LABEL_75;
      }
      goto LABEL_100;
    }
LABEL_33:
    if (v8 > 3) {
      goto LABEL_34;
    }
    unsigned int v18 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
    if (v18 > 0xFFFE)
    {
      int v16 = *(_DWORD *)&a2[v8];
      if (v16) {
        goto LABEL_55;
      }
    }
    else
    {
      if (v18 <= 0xFE)
      {
        if (!v18) {
          goto LABEL_72;
        }
LABEL_34:
        int v16 = a2[v8];
        if (!a2[v8]) {
          goto LABEL_72;
        }
LABEL_55:
        int v22 = (v16 - 1) << (8 * v8);
        if (v8 > 3) {
          int v22 = 0;
        }
        if (v8)
        {
          if (v8 <= 3) {
            int v23 = v8;
          }
          else {
            int v23 = 4;
          }
          switch(v23)
          {
            case 2:
              int v24 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v24 = *(_DWORD *)a2;
              break;
            default:
              int v24 = *a2;
              break;
          }
        }
        else
        {
          int v24 = 0;
        }
        if (v7 + (v24 | v22) != -1)
        {
LABEL_75:
          (*(void (**)(unsigned __int16 *, uint64_t))(v6 + 8))(a1, v5);
          if (v7 <= 1)
          {
            if (v8 > 3) {
              goto LABEL_70;
            }
            goto LABEL_77;
          }
LABEL_83:
          memcpy(a1, a2, v8);
          return a1;
        }
LABEL_100:
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v6 + 24))(a1, a2, v5);
        return a1;
      }
      int v16 = *(unsigned __int16 *)&a2[v8];
      if (*(_WORD *)&a2[v8]) {
        goto LABEL_55;
      }
    }
LABEL_72:
    if (!v7) {
      goto LABEL_100;
    }
    uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    goto LABEL_74;
  }
  if (v7 > 1)
  {
LABEL_67:
    if (v14(a2, v7, v5)) {
      goto LABEL_68;
    }
    goto LABEL_88;
  }
LABEL_30:
  if (v8 > 3) {
    goto LABEL_31;
  }
  unsigned int v17 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v17 > 0xFFFE)
  {
    int v15 = *(_DWORD *)&a2[v8];
    if (v15) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
  if (v17 > 0xFE)
  {
    int v15 = *(unsigned __int16 *)&a2[v8];
    if (*(_WORD *)&a2[v8]) {
      goto LABEL_45;
    }
LABEL_65:
    if (!v7) {
      goto LABEL_88;
    }
    uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    goto LABEL_67;
  }
  if (!v17) {
    goto LABEL_65;
  }
LABEL_31:
  int v15 = a2[v8];
  if (!a2[v8]) {
    goto LABEL_65;
  }
LABEL_45:
  int v19 = (v15 - 1) << (8 * v8);
  if (v8 > 3) {
    int v19 = 0;
  }
  if (v8)
  {
    if (v8 <= 3) {
      int v20 = v8;
    }
    else {
      int v20 = 4;
    }
    switch(v20)
    {
      case 2:
        int v21 = *(unsigned __int16 *)a2;
        break;
      case 3:
        int v21 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        break;
      case 4:
        int v21 = *(_DWORD *)a2;
        break;
      default:
        int v21 = *a2;
        break;
    }
  }
  else
  {
    int v21 = 0;
  }
  if (v7 + (v21 | v19) != -1)
  {
LABEL_68:
    if (v7 <= 1)
    {
      if (v8 > 3)
      {
LABEL_70:
        uint64_t v25 = 1;
LABEL_82:
        v8 += v25;
        goto LABEL_83;
      }
LABEL_77:
      unsigned int v26 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v26 > 0xFFFE)
      {
        uint64_t v25 = 4;
      }
      else
      {
        BOOL v27 = v26 != 0;
        BOOL v28 = v26 >= 0xFF;
        uint64_t v25 = 2;
        if (!v28) {
          uint64_t v25 = v27;
        }
      }
      goto LABEL_82;
    }
    goto LABEL_83;
  }
LABEL_88:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v29 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v29 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (v29 > 0xFE)
      {
        *(unsigned __int16 *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (!v29) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v8) = 0;
  }
  return a1;
}

char *sub_236EE6658(char *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v10 > 0xFFFE)
      {
        int v9 = *(_DWORD *)((char *)a2 + v8);
        if (!v9) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (v10 > 0xFE)
      {
        int v9 = *(unsigned __int16 *)((char *)a2 + v8);
        if (!*(unsigned __int16 *)((char *)a2 + v8)) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (!v10)
      {
LABEL_20:
        if (!v7) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
    int v9 = *((unsigned __int8 *)a2 + v8);
    if (!*((unsigned char *)a2 + v8)) {
      goto LABEL_20;
    }
LABEL_10:
    int v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3) {
      int v11 = 0;
    }
    if (v8)
    {
      if (v8 <= 3) {
        int v12 = *(void *)(v6 + 64);
      }
      else {
        int v12 = 4;
      }
      switch(v12)
      {
        case 2:
          int v13 = *a2;
          break;
        case 3:
          int v13 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
          break;
        case 4:
          int v13 = *(_DWORD *)a2;
          break;
        default:
          int v13 = *(unsigned __int8 *)a2;
          break;
      }
    }
    else
    {
      int v13 = 0;
    }
    if (v7 + (v13 | v11) != -1) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_21:
  if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
  {
LABEL_22:
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v15 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v15 > 0xFFFE)
        {
          uint64_t v14 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v14 = 2;
          if (!v17) {
            uint64_t v14 = v16;
          }
        }
      }
      else
      {
        uint64_t v14 = 1;
      }
      v8 += v14;
    }
    memcpy(a1, a2, v8);
    return a1;
  }
LABEL_36:
  (*(void (**)(char *, unsigned __int16 *, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v18 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v18 > 0xFFFE)
      {
        *(_DWORD *)&a1[v8] = 0;
        return a1;
      }
      if (v18 > 0xFE)
      {
        *(_WORD *)&a1[v8] = 0;
        return a1;
      }
      if (!v18) {
        return a1;
      }
    }
    a1[v8] = 0;
  }
  return a1;
}

unsigned __int16 *sub_236EE68E8(unsigned __int16 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (v7 > 1) {
    goto LABEL_21;
  }
  if (v8 > 3) {
    goto LABEL_3;
  }
  unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v10 > 0xFFFE)
  {
    int v9 = *(_DWORD *)((char *)a1 + v8);
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v10 > 0xFE)
  {
    int v9 = *(unsigned __int16 *)((char *)a1 + v8);
    if (!*(unsigned __int16 *)((char *)a1 + v8)) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_3:
    int v9 = *((unsigned __int8 *)a1 + v8);
    if (!*((unsigned char *)a1 + v8)) {
      goto LABEL_20;
    }
LABEL_10:
    int v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3) {
      int v11 = 0;
    }
    if (v8)
    {
      if (v8 <= 3) {
        int v12 = *(void *)(v6 + 64);
      }
      else {
        int v12 = 4;
      }
      switch(v12)
      {
        case 2:
          int v13 = *a1;
          break;
        case 3:
          int v13 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v13 = *(_DWORD *)a1;
          break;
        default:
          int v13 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v13 = 0;
    }
    if ((v13 | v11) + v7 != -1) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_20:
  if (!v7) {
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
  if (!v14((unsigned __int8 *)a1, v7, v5))
  {
    if (v7 > 1)
    {
LABEL_74:
      if (v14(a2, v7, v5)) {
        goto LABEL_75;
      }
      goto LABEL_100;
    }
LABEL_33:
    if (v8 > 3) {
      goto LABEL_34;
    }
    unsigned int v18 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
    if (v18 > 0xFFFE)
    {
      int v16 = *(_DWORD *)&a2[v8];
      if (v16) {
        goto LABEL_55;
      }
    }
    else
    {
      if (v18 <= 0xFE)
      {
        if (!v18) {
          goto LABEL_72;
        }
LABEL_34:
        int v16 = a2[v8];
        if (!a2[v8]) {
          goto LABEL_72;
        }
LABEL_55:
        int v22 = (v16 - 1) << (8 * v8);
        if (v8 > 3) {
          int v22 = 0;
        }
        if (v8)
        {
          if (v8 <= 3) {
            int v23 = v8;
          }
          else {
            int v23 = 4;
          }
          switch(v23)
          {
            case 2:
              int v24 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v24 = *(_DWORD *)a2;
              break;
            default:
              int v24 = *a2;
              break;
          }
        }
        else
        {
          int v24 = 0;
        }
        if (v7 + (v24 | v22) != -1)
        {
LABEL_75:
          (*(void (**)(unsigned __int16 *, uint64_t))(v6 + 8))(a1, v5);
          if (v7 <= 1)
          {
            if (v8 > 3) {
              goto LABEL_70;
            }
            goto LABEL_77;
          }
LABEL_83:
          memcpy(a1, a2, v8);
          return a1;
        }
LABEL_100:
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v6 + 40))(a1, a2, v5);
        return a1;
      }
      int v16 = *(unsigned __int16 *)&a2[v8];
      if (*(_WORD *)&a2[v8]) {
        goto LABEL_55;
      }
    }
LABEL_72:
    if (!v7) {
      goto LABEL_100;
    }
    uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    goto LABEL_74;
  }
  if (v7 > 1)
  {
LABEL_67:
    if (v14(a2, v7, v5)) {
      goto LABEL_68;
    }
    goto LABEL_88;
  }
LABEL_30:
  if (v8 > 3) {
    goto LABEL_31;
  }
  unsigned int v17 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v17 > 0xFFFE)
  {
    int v15 = *(_DWORD *)&a2[v8];
    if (v15) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
  if (v17 > 0xFE)
  {
    int v15 = *(unsigned __int16 *)&a2[v8];
    if (*(_WORD *)&a2[v8]) {
      goto LABEL_45;
    }
LABEL_65:
    if (!v7) {
      goto LABEL_88;
    }
    uint64_t v14 = *(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    goto LABEL_67;
  }
  if (!v17) {
    goto LABEL_65;
  }
LABEL_31:
  int v15 = a2[v8];
  if (!a2[v8]) {
    goto LABEL_65;
  }
LABEL_45:
  int v19 = (v15 - 1) << (8 * v8);
  if (v8 > 3) {
    int v19 = 0;
  }
  if (v8)
  {
    if (v8 <= 3) {
      int v20 = v8;
    }
    else {
      int v20 = 4;
    }
    switch(v20)
    {
      case 2:
        int v21 = *(unsigned __int16 *)a2;
        break;
      case 3:
        int v21 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        break;
      case 4:
        int v21 = *(_DWORD *)a2;
        break;
      default:
        int v21 = *a2;
        break;
    }
  }
  else
  {
    int v21 = 0;
  }
  if (v7 + (v21 | v19) != -1)
  {
LABEL_68:
    if (v7 <= 1)
    {
      if (v8 > 3)
      {
LABEL_70:
        uint64_t v25 = 1;
LABEL_82:
        v8 += v25;
        goto LABEL_83;
      }
LABEL_77:
      unsigned int v26 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v26 > 0xFFFE)
      {
        uint64_t v25 = 4;
      }
      else
      {
        BOOL v27 = v26 != 0;
        BOOL v28 = v26 >= 0xFF;
        uint64_t v25 = 2;
        if (!v28) {
          uint64_t v25 = v27;
        }
      }
      goto LABEL_82;
    }
    goto LABEL_83;
  }
LABEL_88:
  (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v29 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v29 > 0xFFFE)
      {
        *(_DWORD *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (v29 > 0xFE)
      {
        *(unsigned __int16 *)((char *)a1 + v8) = 0;
        return a1;
      }
      if (!v29) {
        return a1;
      }
    }
    *((unsigned char *)a1 + v8) = 0;
  }
  return a1;
}

uint64_t sub_236EE6E0C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 2;
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 1)
  {
    unsigned int v6 = 0;
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        uint64_t v8 = 4;
      }
      else
      {
        BOOL v10 = v9 != 0;
        BOOL v11 = v9 >= 0xFF;
        uint64_t v8 = 2;
        if (!v11) {
          uint64_t v8 = v10;
        }
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    v7 += v8;
  }
  if (!a2) {
    return 0;
  }
  int v12 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_30;
  }
  char v13 = 8 * v7;
  if (v7 > 3) {
    goto LABEL_13;
  }
  unsigned int v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
  if (HIWORD(v15))
  {
    int v14 = *(_DWORD *)((char *)a1 + v7);
    if (v14) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v15 <= 0xFF)
    {
      if (v15 < 2) {
        goto LABEL_30;
      }
LABEL_13:
      int v14 = *((unsigned __int8 *)a1 + v7);
      if (!*((unsigned char *)a1 + v7)) {
        goto LABEL_30;
      }
LABEL_20:
      int v16 = (v14 - 1) << v13;
      if (v7 > 3) {
        int v16 = 0;
      }
      if (v7)
      {
        if (v7 <= 3) {
          int v17 = v7;
        }
        else {
          int v17 = 4;
        }
        switch(v17)
        {
          case 2:
            int v18 = *a1;
            break;
          case 3:
            int v18 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v18 = *(_DWORD *)a1;
            break;
          default:
            int v18 = *(unsigned __int8 *)a1;
            break;
        }
      }
      else
      {
        int v18 = 0;
      }
      return v6 + (v18 | v16) + 1;
    }
    int v14 = *(unsigned __int16 *)((char *)a1 + v7);
    if (*(unsigned __int16 *)((char *)a1 + v7)) {
      goto LABEL_20;
    }
  }
LABEL_30:
  if (!v6) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  unsigned int v19 = (*(uint64_t (**)(void))(v4 + 48))();
  BOOL v11 = v19 >= 2;
  uint64_t result = v19 - 2;
  if (result == 0 || !v11) {
    return 0;
  }
  return result;
}

void sub_236EE6FF8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  size_t v9 = v8;
  if (v7 <= 1) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = v7 - 2;
  }
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v12 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v12 > 0xFFFE)
      {
        uint64_t v11 = 4;
      }
      else
      {
        BOOL v13 = v12 != 0;
        BOOL v14 = v12 >= 0xFF;
        uint64_t v11 = 2;
        if (!v14) {
          uint64_t v11 = v13;
        }
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
    size_t v9 = v11 + v8;
  }
  BOOL v14 = a3 >= v10;
  unsigned int v15 = a3 - v10;
  if (v15 != 0 && v14)
  {
    if (v9 <= 3)
    {
      unsigned int v19 = ((v15 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v19))
      {
        int v16 = 4;
      }
      else if (v19 >= 0x100)
      {
        int v16 = 2;
      }
      else
      {
        int v16 = v19 > 1;
      }
    }
    else
    {
      int v16 = 1;
    }
  }
  else
  {
    int v16 = 0;
  }
  if (v10 < a2)
  {
    unsigned int v17 = ~v10 + a2;
    if (v9 < 4)
    {
      int v18 = (v17 >> (8 * v9)) + 1;
      if (v9)
      {
        int v20 = v17 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v9] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v18;
        return;
      case 3:
        goto LABEL_60;
      case 4:
        *(_DWORD *)&a1[v9] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_60:
      __break(1u);
      JUMPOUT(0x236EE7318);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (a2 + 2 <= v7)
        {
          if (a2 != -2)
          {
            int v24 = *(void (**)(void))(v6 + 56);
            v24();
          }
        }
        else
        {
          if (v8 <= 3) {
            int v21 = ~(-1 << (8 * v8));
          }
          else {
            int v21 = -1;
          }
          if (v8)
          {
            int v22 = v21 & (a2 - v7 + 1);
            if (v8 <= 3) {
              int v23 = v8;
            }
            else {
              int v23 = 4;
            }
            bzero(a1, v8);
            switch(v23)
            {
              case 2:
                *(_WORD *)a1 = v22;
                break;
              case 3:
                *(_WORD *)a1 = v22;
                a1[2] = BYTE2(v22);
                break;
              case 4:
                *(_DWORD *)a1 = v22;
                break;
              default:
                *a1 = v22;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_236EE7350(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  unsigned int v3 = *(_DWORD *)(v2 + 84);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v3 > 1) {
    return (*(uint64_t (**)(void))(v2 + 48))();
  }
  char v5 = 8 * v4;
  if (v4 > 3) {
    goto LABEL_3;
  }
  unsigned int v7 = (~(-1 << v5) - v3 + 2) >> v5;
  if (v7 > 0xFFFE)
  {
    int v6 = *(_DWORD *)((char *)a1 + v4);
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    if (v7 <= 0xFE)
    {
      if (!v7) {
        goto LABEL_18;
      }
LABEL_3:
      int v6 = *((unsigned __int8 *)a1 + v4);
      if (!*((unsigned char *)a1 + v4)) {
        goto LABEL_18;
      }
LABEL_10:
      int v8 = (v6 - 1) << v5;
      if (v4 > 3) {
        int v8 = 0;
      }
      if (v4)
      {
        if (v4 > 3) {
          LODWORD(v4) = 4;
        }
        switch((int)v4)
        {
          case 2:
            LODWORD(v4) = *a1;
            break;
          case 3:
            LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v4) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v4) = *(unsigned __int8 *)a1;
            break;
        }
      }
      return v3 + (v4 | v8) + 1;
    }
    int v6 = *(unsigned __int16 *)((char *)a1 + v4);
    if (*(unsigned __int16 *)((char *)a1 + v4)) {
      goto LABEL_10;
    }
  }
LABEL_18:
  if (v3) {
    return (*(uint64_t (**)(void))(v2 + 48))();
  }
  return 0;
}

void sub_236EE74A4(char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  size_t v6 = *(void *)(v4 + 64);
  if (v5 > 1)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = (~(-1 << (8 * v6)) - v5 + 2) >> (8 * v6);
    if (v10 > 0xFFFE)
    {
      int v7 = 4;
    }
    else if (v10 >= 0xFF)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 != 0;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (v5 < a2)
  {
    unsigned int v8 = ~v5 + a2;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v6)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v6);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        return;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        return;
      default:
        return;
    }
  }
  switch(v7)
  {
    case 1:
      a1[v6] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v6] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EE76BCLL);
    case 4:
      *(_DWORD *)&a1[v6] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unsigned int v12 = *(void (**)(void))(v4 + 56);
        v12();
      }
      return;
  }
}

uint64_t type metadata accessor for IntersectLineLineSegmentResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236EE76FC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v4 = &v3;
    swift_getTupleTypeLayout2();
    unsigned int v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_236EE77BC(void *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v4 = __dst;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  uint64_t v11 = ((v7 + v8) & ~v8) + v7;
  size_t v12 = v11 + 1;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v15 = *(void *)__src;
    *uint64_t v4 = *(void *)__src;
    uint64_t v4 = (void *)(v15 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    unsigned int v16 = __src[v11];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v18 = v11;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *__src;
          goto LABEL_19;
        case 2:
          int v19 = *(unsigned __int16 *)__src;
          goto LABEL_19;
        case 3:
          int v19 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_19;
        case 4:
          int v19 = *(_DWORD *)__src;
LABEL_19:
          int v20 = (v19 | (v17 << (8 * v11))) + 2;
          unsigned int v16 = v19 + 2;
          if (v11 < 4) {
            unsigned int v16 = v20;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1)
    {
      int v22 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
      v22(__dst, __src, v5);
      v22((void *)(((unint64_t)v4 + v10) & v9), (unsigned __int8 *)((unint64_t)&__src[v10] & v9), v5);
      *((unsigned char *)v4 + v11) = 1;
    }
    else if (v16)
    {
      memcpy(__dst, __src, v12);
    }
    else
    {
      int v21 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
      v21(__dst, __src, v5);
      v21((void *)(((unint64_t)v4 + v10) & v9), (unsigned __int8 *)((unint64_t)&__src[v10] & v9), v5);
      *((unsigned char *)v4 + v11) = 0;
    }
  }
  return v4;
}

uint64_t sub_236EE79C0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(result + 64);
  uint64_t v6 = *(unsigned __int8 *)(result + 80);
  uint64_t v7 = v5 + v6;
  uint64_t v8 = ((v5 + v6) & ~v6) + v5;
  unsigned int v9 = a1[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a1;
        goto LABEL_10;
      case 2:
        int v12 = *(unsigned __int16 *)a1;
        goto LABEL_10;
      case 3:
        int v12 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_10;
      case 4:
        int v12 = *(_DWORD *)a1;
LABEL_10:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v14 = ~v6;
  if (v9 <= 1)
  {
    uint64_t v15 = *(void (**)(unsigned __int8 *, uint64_t))(result + 8);
    v15(a1, v3);
    return ((uint64_t (*)(unint64_t, uint64_t))v15)((unint64_t)&a1[v7] & v14, v3);
  }
  return result;
}

unsigned char *sub_236EE7B40(unsigned char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = ((v7 + v8) & ~v8) + v7;
  unsigned int v11 = __src[v10];
  unsigned int v12 = v11 - 2;
  if (v11 >= 2)
  {
    if (v10 <= 3) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *__src;
        goto LABEL_10;
      case 2:
        int v14 = *(unsigned __int16 *)__src;
        goto LABEL_10;
      case 3:
        int v14 = *(unsigned __int16 *)__src | (__src[2] << 16);
        goto LABEL_10;
      case 4:
        int v14 = *(_DWORD *)__src;
LABEL_10:
        int v15 = (v14 | (v12 << (8 * v10))) + 2;
        unsigned int v11 = v14 + 2;
        if (v10 < 4) {
          unsigned int v11 = v15;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v16 = ~v8;
  if (v11 == 1)
  {
    uint64_t v18 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16);
    v18(__dst, __src, v5);
    v18((unsigned char *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
    __dst[v10] = 1;
  }
  else if (v11)
  {
    memcpy(__dst, __src, v10 + 1);
  }
  else
  {
    unsigned int v17 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16);
    v17(__dst, __src, v5);
    v17((unsigned char *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
    __dst[v10] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_236EE7D10(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    uint64_t v10 = ((v7 + v8) & ~v8) + v7;
    unsigned int v11 = __dst[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *__dst;
          goto LABEL_11;
        case 2:
          int v14 = *(unsigned __int16 *)__dst;
          goto LABEL_11;
        case 3:
          int v14 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_11;
        case 4:
          int v14 = *(_DWORD *)__dst;
LABEL_11:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    if (v11 <= 1)
    {
      unsigned int v17 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v17(__dst, v5);
      v17((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), v5);
    }
    unsigned int v18 = __src[v10];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v20 = v10;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *__src;
          goto LABEL_24;
        case 2:
          int v21 = *(unsigned __int16 *)__src;
          goto LABEL_24;
        case 3:
          int v21 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_24;
        case 4:
          int v21 = *(_DWORD *)__src;
LABEL_24:
          int v22 = (v21 | (v19 << (8 * v10))) + 2;
          unsigned int v18 = v21 + 2;
          if (v10 < 4) {
            unsigned int v18 = v22;
          }
          break;
        default:
          break;
      }
    }
    if (v18 == 1)
    {
      int v24 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
      v24(__dst, __src, v5);
      v24((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
      __dst[v10] = 1;
    }
    else if (v18)
    {
      memcpy(__dst, __src, v10 + 1);
    }
    else
    {
      int v23 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
      v23(__dst, __src, v5);
      v23((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
      __dst[v10] = 0;
    }
  }
  return __dst;
}

unsigned char *sub_236EE7FBC(unsigned char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = ((v7 + v8) & ~v8) + v7;
  unsigned int v11 = __src[v10];
  unsigned int v12 = v11 - 2;
  if (v11 >= 2)
  {
    if (v10 <= 3) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *__src;
        goto LABEL_10;
      case 2:
        int v14 = *(unsigned __int16 *)__src;
        goto LABEL_10;
      case 3:
        int v14 = *(unsigned __int16 *)__src | (__src[2] << 16);
        goto LABEL_10;
      case 4:
        int v14 = *(_DWORD *)__src;
LABEL_10:
        int v15 = (v14 | (v12 << (8 * v10))) + 2;
        unsigned int v11 = v14 + 2;
        if (v10 < 4) {
          unsigned int v11 = v15;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v16 = ~v8;
  if (v11 == 1)
  {
    unsigned int v18 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32);
    v18(__dst, __src, v5);
    v18((unsigned char *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
    __dst[v10] = 1;
  }
  else if (v11)
  {
    memcpy(__dst, __src, v10 + 1);
  }
  else
  {
    unsigned int v17 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32);
    v17(__dst, __src, v5);
    v17((unsigned char *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
    __dst[v10] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_236EE818C(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v9 = v7 + v8;
    uint64_t v10 = ((v7 + v8) & ~v8) + v7;
    unsigned int v11 = __dst[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *__dst;
          goto LABEL_11;
        case 2:
          int v14 = *(unsigned __int16 *)__dst;
          goto LABEL_11;
        case 3:
          int v14 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_11;
        case 4:
          int v14 = *(_DWORD *)__dst;
LABEL_11:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    if (v11 <= 1)
    {
      unsigned int v17 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v17(__dst, v5);
      v17((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), v5);
    }
    unsigned int v18 = __src[v10];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v20 = v10;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *__src;
          goto LABEL_24;
        case 2:
          int v21 = *(unsigned __int16 *)__src;
          goto LABEL_24;
        case 3:
          int v21 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_24;
        case 4:
          int v21 = *(_DWORD *)__src;
LABEL_24:
          int v22 = (v21 | (v19 << (8 * v10))) + 2;
          unsigned int v18 = v21 + 2;
          if (v10 < 4) {
            unsigned int v18 = v22;
          }
          break;
        default:
          break;
      }
    }
    if (v18 == 1)
    {
      int v24 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
      v24(__dst, __src, v5);
      v24((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
      __dst[v10] = 1;
    }
    else if (v18)
    {
      memcpy(__dst, __src, v10 + 1);
    }
    else
    {
      int v23 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
      v23(__dst, __src, v5);
      v23((unsigned __int8 *)((unint64_t)&__dst[v9] & v16), (unsigned __int8 *)((unint64_t)&__src[v9] & v16), v5);
      __dst[v10] = 0;
    }
  }
  return __dst;
}

uint64_t sub_236EE8438(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (a2 < 0xFE) {
    goto LABEL_20;
  }
  unint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_20:
      unsigned int v10 = *((unsigned __int8 *)a1 + v3);
      if (v10 >= 3) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_20;
  }
LABEL_12:
  int v9 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v9 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v4 | v9) + 254;
}

void sub_236EE859C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_32:
        __break(1u);
        JUMPOUT(0x236EE8794);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_20;
      case 3:
        goto LABEL_32;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      default:
LABEL_20:
        if (a2) {
LABEL_21:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_236EE87BC(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = ((*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v3 = a1[v2];
  int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_10;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_10;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_10;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_10:
        unsigned int v7 = (v6 | (v4 << (8 * v2))) + 2;
        LODWORD(v3) = v6 + 2;
        if (v2 >= 4) {
          uint64_t v3 = v3;
        }
        else {
          uint64_t v3 = v7;
        }
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_236EE88A4(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  size_t v4 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for IntersectLineSegmentLineSegmentResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t (*OS_geom_ddg_evaluator_3f.Stencil.vertices.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*OS_geom_ddg_evaluator_3f.Stencil.weights.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

OS_geom_ddg_evaluator_3f __swiftcall OS_geom_ddg_evaluator_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_ddg_evaluator_3f)sub_236EE8DF8((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3f);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexArea(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_area_3f(v1, vertexIndex);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexAngleDefect(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_angle_defect_3f(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3f.computeVertexNormal(vertexIndex:)(unsigned int a1)
{
  return geom_ddg_evaluator_compute_vertex_normal_3f(v1, a1);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexMeanCurvature(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_mean_curvature_3f(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3f.computeVertexMeanCurvatureVector(vertexIndex:)(unsigned int a1)
{
  return geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3f(v1, a1);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexDivergence(vertexIndex:faceVectorFunction:)(Swift::UInt32 vertexIndex, Swift::OpaquePointer faceVectorFunction)
{
  return geom_ddg_evaluator_compute_vertex_divergence_3f(v2, vertexIndex, (uint64_t)faceVectorFunction._rawValue + 32);
}

double OS_geom_ddg_evaluator_3f.computeFaceGradient(faceIndex:vertexScalarFunction:)(unsigned int a1, uint64_t a2)
{
  return geom_ddg_evaluator_compute_face_gradient_3f(v2, a1, a2 + 32);
}

uint64_t OS_geom_ddg_evaluator_3f.computeLaplacianStencil(vertexIndex:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_236EE8F6C(a1, a2, (uint64_t (*)(void))geom_create_collection_f, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3f, a3);
}

Swift::Bool __swiftcall OS_geom_ddg_evaluator_3f.isBoundaryVertex(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_is_boundary_vertex_3f(v1, vertexIndex);
}

Swift::Void __swiftcall OS_geom_ddg_evaluator_3f.getVertexOneRing(vertexIndex:outVertices:)(Swift::UInt32 vertexIndex, OS_geom_collection_u *outVertices)
{
  geom_ddg_evaluator_get_vertex_one_ring_3f(v2, vertexIndex, (uint64_t)outVertices->super.isa);
}

uint64_t sub_236EE8B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE904C(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3f, a3);
}

void sub_236EE8B64(unsigned int a1@<W0>, float *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_area_3f(*v2, a1);
}

void sub_236EE8B94(unsigned int a1@<W0>, float *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_angle_defect_3f(*v2, a1);
}

void sub_236EE8BC4(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_ddg_evaluator_compute_vertex_normal_3f(*v2, a1);
  *a2 = v4;
}

void sub_236EE8BF4(unsigned int a1@<W0>, float *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_mean_curvature_3f(*v2, a1);
}

void sub_236EE8C24(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3f(*v2, a1);
  *a2 = v4;
}

void sub_236EE8C54(unsigned int a1@<W0>, uint64_t a2@<X1>, float *a3@<X8>)
{
  *a3 = geom_ddg_evaluator_compute_vertex_divergence_3f(*v3, a1, a2 + 32);
}

void sub_236EE8C8C(unsigned int a1@<W0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = geom_ddg_evaluator_compute_face_gradient_3f(*v3, a1, a2 + 32);
  *a3 = v5;
}

uint64_t sub_236EE8CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_236EE9278(a1, a2, (uint64_t (*)(void))geom_create_collection_f, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3f, a3);
}

BOOL sub_236EE8CF0(unsigned int a1)
{
  return geom_ddg_evaluator_is_boundary_vertex_3f(*v1, a1);
}

void sub_236EE8D10(unsigned int a1, uint64_t *a2)
{
  geom_ddg_evaluator_get_vertex_one_ring_3f(*v2, a1, *a2);
}

id OS_geom_ddg_evaluator_3d.Stencil.vertices.getter()
{
  return *v0;
}

void OS_geom_ddg_evaluator_3d.Stencil.vertices.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*OS_geom_ddg_evaluator_3d.Stencil.vertices.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

id OS_geom_ddg_evaluator_3d.Stencil.weights.getter()
{
  return *(id *)(v0 + 8);
}

void OS_geom_ddg_evaluator_3d.Stencil.weights.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*OS_geom_ddg_evaluator_3d.Stencil.weights.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

id sub_236EE8DCC()
{
  return *v0;
}

id sub_236EE8DD4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 8);
  *a1 = v2;
  return v2;
}

OS_geom_ddg_evaluator_3d __swiftcall OS_geom_ddg_evaluator_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_ddg_evaluator_3d)sub_236EE8DF8((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3d);
}

uint64_t sub_236EE8DF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexArea(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_area_3d(v1, vertexIndex);
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexAngleDefect(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_angle_defect_3d(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3d.computeVertexNormal(vertexIndex:)(uint64_t a1)
{
  return sub_236EE8EBC(a1, (void (*)(long long *__return_ptr, uint64_t, uint64_t))geom_ddg_evaluator_compute_vertex_normal_3d);
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexMeanCurvature(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_compute_vertex_mean_curvature_3d(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3d.computeVertexMeanCurvatureVector(vertexIndex:)(uint64_t a1)
{
  return sub_236EE8EBC(a1, (void (*)(long long *__return_ptr, uint64_t, uint64_t))geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3d);
}

double sub_236EE8EBC(uint64_t a1, void (*a2)(long long *__return_ptr, uint64_t, uint64_t))
{
  a2(&v4, v2, a1);
  return *(double *)&v4;
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexDivergence(vertexIndex:faceVectorFunction:)(Swift::UInt32 vertexIndex, Swift::OpaquePointer faceVectorFunction)
{
  return geom_ddg_evaluator_compute_vertex_divergence_3d(v2, vertexIndex, (uint64_t)faceVectorFunction._rawValue + 32);
}

double OS_geom_ddg_evaluator_3d.computeFaceGradient(faceIndex:vertexScalarFunction:)(unsigned int a1, uint64_t a2)
{
  geom_ddg_evaluator_compute_face_gradient_3d(v2, a1, a2 + 32, &v4);
  return *(double *)&v4;
}

uint64_t OS_geom_ddg_evaluator_3d.computeLaplacianStencil(vertexIndex:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_236EE8F6C(a1, a2, (uint64_t (*)(void))geom_create_collection_d, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3d, a3);
}

uint64_t sub_236EE8F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void *, uint64_t)@<X3>, void *a5@<X8>)
{
  collection_u = geom_create_collection_u();
  uint64_t v12 = a3();
  uint64_t result = a4(v5, a2, a1, collection_u, v12);
  *a5 = collection_u;
  a5[1] = v12;
  return result;
}

Swift::Bool __swiftcall OS_geom_ddg_evaluator_3d.isBoundaryVertex(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  return geom_ddg_evaluator_is_boundary_vertex_3d(v1, vertexIndex);
}

Swift::Void __swiftcall OS_geom_ddg_evaluator_3d.getVertexOneRing(vertexIndex:outVertices:)(Swift::UInt32 vertexIndex, OS_geom_collection_u *outVertices)
{
  geom_ddg_evaluator_get_vertex_one_ring_3d(v2, vertexIndex, (uint64_t)outVertices->super.isa);
}

_UNKNOWN **sub_236EE901C()
{
  return &protocol witness table for OS_geom_ddg_evaluator_3f.Stencil;
}

_UNKNOWN **sub_236EE9028()
{
  return &protocol witness table for OS_geom_ddg_evaluator_3d.Stencil;
}

uint64_t sub_236EE9034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EE904C(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3d, a3);
}

uint64_t sub_236EE904C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_236EE90BC(unsigned int a1@<W0>, double *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_area_3d(*v2, a1);
}

void sub_236EE90EC(unsigned int a1@<W0>, double *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_angle_defect_3d(*v2, a1);
}

float64_t sub_236EE911C@<D0>(unsigned int a1@<W0>, float64x2_t *a2@<X8>)
{
  geom_ddg_evaluator_compute_vertex_normal_3d(*v2, a1, v6);
  float64_t result = v6[0].f64[0];
  float64x2_t v5 = v6[1];
  *a2 = v6[0];
  a2[1] = v5;
  return result;
}

void sub_236EE915C(unsigned int a1@<W0>, double *a2@<X8>)
{
  *a2 = geom_ddg_evaluator_compute_vertex_mean_curvature_3d(*v2, a1);
}

double sub_236EE918C@<D0>(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3d(*v2, a1, v6);
  double result = *(double *)v6;
  long long v5 = v6[1];
  *a2 = v6[0];
  a2[1] = v5;
  return result;
}

void sub_236EE91CC(unsigned int a1@<W0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  *a3 = geom_ddg_evaluator_compute_vertex_divergence_3d(*v3, a1, a2 + 32);
}

double sub_236EE9204@<D0>(unsigned int a1@<W0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  geom_ddg_evaluator_compute_face_gradient_3d(*v3, a1, a2 + 32, v7);
  double result = *(double *)v7;
  long long v6 = v7[1];
  *a3 = v7[0];
  a3[1] = v6;
  return result;
}

uint64_t sub_236EE924C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_236EE9278(a1, a2, (uint64_t (*)(void))geom_create_collection_d, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3d, a3);
}

uint64_t sub_236EE9278@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X4>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void *, uint64_t)@<X5>, void *a5@<X8>)
{
  uint64_t v11 = *v5;
  collection_u = geom_create_collection_u();
  uint64_t v13 = a3();
  uint64_t result = a4(v11, a2, a1, collection_u, v13);
  *a5 = collection_u;
  a5[1] = v13;
  return result;
}

BOOL sub_236EE92F8(unsigned int a1)
{
  return geom_ddg_evaluator_is_boundary_vertex_3d(*v1, a1);
}

void sub_236EE9318(unsigned int a1, uint64_t *a2)
{
  geom_ddg_evaluator_get_vertex_one_ring_3d(*v2, a1, *a2);
}

uint64_t dispatch thunk of DDGStencil.vertices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DDGStencil.weights.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DDGEvaluator3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexArea(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexAngleDefect(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexNormal(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexMeanCurvature(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexMeanCurvatureVector(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexDivergence(vertexIndex:faceVectorFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeFaceGradient(faceIndex:vertexScalarFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeLaplacianStencil(vertexIndex:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of DDGEvaluator3.isBoundaryVertex(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of DDGEvaluator3.getVertexOneRing(vertexIndex:outVertices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

ValueMetadata *type metadata accessor for OS_geom_ddg_evaluator_3f.Stencil()
{
  return &type metadata for OS_geom_ddg_evaluator_3f.Stencil;
}

void *_s7StencilVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  long long v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void _s7StencilVwxx_0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t _s7StencilVwca_0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  int v7 = *(void **)(a2 + 8);
  unsigned int v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t _s7StencilVwta_0(uint64_t a1, _OWORD *a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s7StencilVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_236EE9598(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OS_geom_ddg_evaluator_3d.Stencil()
{
  return &type metadata for OS_geom_ddg_evaluator_3d.Stencil;
}

uint64_t BoundedArray2.init(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for BoundedArray2();
  *(void *)(a5 + *(int *)(v10 + 32)) = 0;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32);
  v11(a5, a1, a4);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a5 + *(int *)(v10 + 28), a2, a4);
  uint64_t v13 = *(int *)(v10 + 32);
  unint64_t v14 = *(void *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 2)
  {
    *(void *)(a5 + v13) = a3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray2()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t BoundedArray3.init(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for BoundedArray3();
  *(void *)(a6 + v12[9]) = 0;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32);
  v13(a6, a1, a5);
  v13(a6 + v12[7], a2, a5);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a6 + v12[8], a3, a5);
  uint64_t v15 = v12[9];
  unint64_t v16 = *(void *)(a6 + v15);
  if ((v16 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v16 <= 3)
  {
    *(void *)(a6 + v15) = a4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray9.init(_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unsigned int v18 = (int *)type metadata accessor for BoundedArray9();
  *(void *)(a9 + v18[15]) = 0;
  unsigned int v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a12 - 8) + 32);
  v19(a9, a1, a12);
  v19(a9 + v18[7], a2, a12);
  v19(a9 + v18[8], a3, a12);
  v19(a9 + v18[9], a4, a12);
  v19(a9 + v18[10], a5, a12);
  v19(a9 + v18[11], a6, a12);
  v19(a9 + v18[12], a7, a12);
  v19(a9 + v18[13], a8, a12);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v19)(a9 + v18[14], a10, a12);
  uint64_t v21 = v18[15];
  unint64_t v22 = *(void *)(a9 + v21);
  if ((v22 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v22 <= 9)
  {
    *(void *)(a9 + v21) = a11;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray2.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 32);
  unint64_t v4 = *(void *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 2)
  {
    *(void *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray3()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t BoundedArray2.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for BoundedArray2();
  *(void *)(a4 + *(int *)(v8 + 32)) = 0;
  uint64_t v9 = *(void *)(a3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a4, a1, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a4 + *(int *)(v8 + 28), a1, a3);
  uint64_t v11 = *(int *)(v8 + 32);
  unint64_t v12 = *(void *)(a4 + v11);
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 <= 2)
  {
    *(void *)(a4 + v11) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray2.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 32));
}

uint64_t *(*BoundedArray2.count.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(v2 + *(int *)(a2 + 32));
  return sub_236EE9B1C;
}

uint64_t *sub_236EE9B1C(uint64_t *result, char a2)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *result;
  uint64_t v4 = *(int *)(result[1] + 32);
  unint64_t v5 = *(void *)(v2 + v4);
  if (a2)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 2)
    {
LABEL_7:
      *(void *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 2) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray2.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray2.endIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 32));
}

uint64_t BoundedArray2.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)&v9[*(int *)(a2 + 32)];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (a1 == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3 + *(int *)(a2 + 28));
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3);
  }
}

uint64_t BoundedArray2.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(void *)(v3 + *(int *)(a3 + 32)) <= a2)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if (a2 == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + *(int *)(a3 + 28), result);
  }
  if (a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(result);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3, result);
}

void (*BoundedArray2.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  _OWORD v7[2] = v3;
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray2.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_236EE9E9C;
}

void sub_236EE9E9C(uint64_t **a1, char a2)
{
}

uint64_t sub_236EE9EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E068](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_236EE9EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E078](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_236EE9ED0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray2.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_236EE9ED8(void *a1, uint64_t *a2, uint64_t a3))()
{
  id v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray2.subscript.modify(v6, *a2, a3);
  return sub_236EE9F48;
}

uint64_t sub_236EE9F4C(uint64_t a1)
{
  return sub_236EEE858(a1);
}

uint64_t (*sub_236EE9F64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[4] = sub_236EE9FDC(v8, a2, a3, a4);
  return sub_236EE9F48;
}

void (*sub_236EE9FDC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, char a2)
{
  uint64_t v9 = malloc(0x50uLL);
  *a1 = v9;
  v9[1] = a4;
  double v9[2] = v4;
  *uint64_t v9 = a3;
  uint64_t v10 = sub_236F12AC0();
  v9[3] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v9[4] = v11;
  size_t v12 = *(void *)(v11 + 64);
  float32x4_t v9[5] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[6] = v13;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v14 = sub_236F12A50();
  v9[7] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = v15;
  v9[8] = v15;
  v9[9] = malloc(*(void *)(v15 + 64));
  (*(void (**)(void))(v16 + 16))();
  sub_236EEA7FC(a2, a3, a4, (uint64_t)v13);
  return sub_236EEA1A8;
}

void sub_236EEA1A8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 64);
  unint64_t v5 = *(void **)(*(void *)a1 + 72);
  uint64_t v7 = *(void **)(*(void *)a1 + 48);
  uint64_t v10 = *(void *)(*(void *)a1 + 56);
  uint64_t v8 = *(void *)(*(void *)a1 + 24);
  if (a2)
  {
    (*(void (**)(void *, void *, void))(v4 + 16))(v3, v7, v2[3]);
    swift_getWitnessTable();
    sub_236F12A90();
    uint64_t v9 = *(void (**)(void *, uint64_t))(v4 + 8);
    v9(v3, v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v10);
    v9(v7, v8);
  }
  else
  {
    swift_getWitnessTable();
    sub_236F12A90();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v10);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v7, v8);
  }
  free(v5);
  free(v7);
  free(v3);
  free(v2);
}

uint64_t sub_236EEA350()
{
  return sub_236F12950();
}

uint64_t sub_236EEA3D4()
{
  return sub_236F12930();
}

uint64_t sub_236EEA3F8()
{
  return sub_236F12920();
}

uint64_t sub_236EEA41C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_236EEA48C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>, MEMORY[0x263F8D7A8]);
}

uint64_t sub_236EEA4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEA53C()
{
  swift_getWitnessTable();
  return sub_236F12990();
}

uint64_t sub_236EEA5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

void sub_236EEA634(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_236EEA63C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = BoundedArray2.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_236EEA664(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_236EEA6D8(v6, *a2, a3);
  return sub_236EEA6D4;
}

uint64_t (*sub_236EEA6D8(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  a1[2] = v8;
  BoundedArray2.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_236EEA790;
}

uint64_t sub_236EEA794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_236EEA7FC(a1, a2, WitnessTable, a3);
}

uint64_t sub_236EEA7FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v58 = a4;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2, v8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v9, v12);
  long long v53 = (char *)&v50 - v14;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  unsigned int v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  unint64_t v22 = (char *)&v50 - v21;
  swift_getAssociatedConformanceWitness();
  uint64_t v23 = sub_236F12A50();
  uint64_t v54 = *(void *)(v23 - 8);
  uint64_t v55 = v23;
  uint64_t v25 = MEMORY[0x270FA5388](v23, v24);
  long long v52 = (char *)&v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25, v27);
  unsigned int v29 = (char *)&v50 - v28;
  sub_236F129F0();
  uint64_t v59 = v4;
  uint64_t v56 = v6;
  uint64_t v57 = a2;
  sub_236F12A20();
  uint64_t result = sub_236F12910();
  if (result)
  {
    uint64_t v31 = v15;
    long long v32 = v19;
    uint64_t v33 = TupleTypeMetadata2;
    long long v34 = v53;
    long long v35 = &v53[*(int *)(TupleTypeMetadata2 + 48)];
    long long v51 = v29;
    long long v36 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v36(v53, v22, AssociatedTypeWitness);
    long long v37 = v35;
    v36(v35, v32, AssociatedTypeWitness);
    long long v38 = &v11[*(int *)(v33 + 48)];
    long long v39 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v39(v11, v34, AssociatedTypeWitness);
    v39(v38, v37, AssociatedTypeWitness);
    long long v40 = v52;
    v36(v52, v11, AssociatedTypeWitness);
    long long v50 = *(void (**)(char *, uint64_t))(v31 + 8);
    v50(v38, AssociatedTypeWitness);
    long long v41 = &v11[*(int *)(TupleTypeMetadata2 + 48)];
    v36(v11, v34, AssociatedTypeWitness);
    v36(v41, v37, AssociatedTypeWitness);
    long long v42 = (void (*)(uint64_t, char *, uint64_t))v36;
    uint64_t v43 = v55;
    v36(&v40[*(int *)(v55 + 36)], v41, AssociatedTypeWitness);
    v50(v11, AssociatedTypeWitness);
    uint64_t v44 = v54;
    long long v45 = v51;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v51, v40, v43);
    uint64_t v46 = v59;
    uint64_t v47 = v57;
    sub_236F12A00();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
    uint64_t v48 = sub_236F12AC0();
    uint64_t v49 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 16))(v58 + *(int *)(v48 + 40), v46, v47);
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v45, v61, v43);
    v42(v49, v45, AssociatedTypeWitness);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v42)(v49 + *(int *)(v48 + 36), &v45[*(int *)(v43 + 36)], AssociatedTypeWitness);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236EEACE4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

void sub_236EEAD58(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_236EEAD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF32F8(a1, a2, a3, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

uint64_t sub_236EEADA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF32F8(a1, a2, a3, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

uint64_t sub_236EEADEC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_236EEAE5C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>, MEMORY[0x263F8D7A0]);
}

uint64_t sub_236EEAE88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EEF024(a1, a2);
}

uint64_t sub_236EEAEA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236EEAEF4()
{
  return 2;
}

uint64_t sub_236EEAEFC(uint64_t a1)
{
  return sub_236EEF118(a1);
}

uint64_t sub_236EEAF18()
{
  return sub_236F12970();
}

uint64_t BoundedArray3.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 36);
  unint64_t v4 = *(void *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 3)
  {
    *(void *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray9()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t BoundedArray3.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for BoundedArray3();
  *(void *)(a4 + v8[9]) = 0;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(a4, a1, a3);
  v10(a4 + v8[7], a1, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a4 + v8[8], a1, a3);
  uint64_t v12 = v8[9];
  unint64_t v13 = *(void *)(a4 + v12);
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 <= 3)
  {
    *(void *)(a4 + v12) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray3.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

uint64_t *(*BoundedArray3.count.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(v2 + *(int *)(a2 + 36));
  return sub_236EEB0D0;
}

uint64_t *sub_236EEB0D0(uint64_t *result, char a2)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *result;
  uint64_t v4 = *(int *)(result[1] + 36);
  unint64_t v5 = *(void *)(v2 + v4);
  if (a2)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 3)
    {
LABEL_7:
      *(void *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 3) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray3.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray3.endIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

uint64_t BoundedArray3.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)&v9[*(int *)(a2 + 36)];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (a1 == 2)
  {
    uint64_t v12 = *(int *)(a2 + 32);
  }
  else
  {
    if (a1 != 1) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3);
    }
    uint64_t v12 = *(int *)(a2 + 28);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
}

uint64_t BoundedArray3.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)(v3 + *(int *)(a3 + 36)) <= a2)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a2 == 2)
  {
    uint64_t v4 = *(int *)(a3 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + v4, result);
  }
  if (a2 == 1)
  {
    uint64_t v4 = *(int *)(a3 + 28);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + v4, result);
  }
  if (a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(result);
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3, result);
  }
}

void (*BoundedArray3.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  _OWORD v7[2] = v3;
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray3.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_236EEB470;
}

void sub_236EEB470(uint64_t **a1, char a2)
{
}

uint64_t sub_236EEB488(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray3.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_236EEB490(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray3.subscript.modify(v6, *a2, a3);
  return sub_236EE9F48;
}

uint64_t sub_236EEB500(uint64_t a1)
{
  return sub_236EEE858(a1);
}

uint64_t sub_236EEB518()
{
  return sub_236F12950();
}

uint64_t sub_236EEB598(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_236EEB608(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>, MEMORY[0x263F8D7A8]);
}

uint64_t sub_236EEB634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEB6B8()
{
  swift_getWitnessTable();
  return sub_236F12990();
}

uint64_t sub_236EEB73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEB7B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = BoundedArray3.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_236EEB7D8(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_236EEB848(v6, *a2, a3);
  return sub_236EEA6D4;
}

uint64_t (*sub_236EEB848(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  a1[2] = v8;
  BoundedArray3.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_236EEA790;
}

uint64_t sub_236EEB900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_236EEA7FC(a1, a2, WitnessTable, a3);
}

uint64_t sub_236EEB968(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t sub_236EEB9D8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_236EEBA48(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>, MEMORY[0x263F8D7A0]);
}

uint64_t sub_236EEBA74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EEF024(a1, a2);
}

uint64_t sub_236EEBA8C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236EEBAE0(uint64_t a1)
{
  return sub_236EEF118(a1);
}

uint64_t BoundedArray4.init(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for BoundedArray4();
  *(void *)(a7 + v14[10]) = 0;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32);
  v15(a7, a1, a6);
  v15(a7 + v14[7], a2, a6);
  v15(a7 + v14[8], a3, a6);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(a7 + v14[9], a4, a6);
  uint64_t v17 = v14[10];
  unint64_t v18 = *(void *)(a7 + v17);
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v18 <= 4)
  {
    *(void *)(a7 + v17) = a5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 40);
  unint64_t v4 = *(void *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 4)
  {
    *(void *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for BoundedArray4();
  *(void *)(a4 + v8[10]) = 0;
  uint64_t v9 = *(void *)(a3 - 8);
  size_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(a4, a1, a3);
  v10(a4 + v8[7], a1, a3);
  v10(a4 + v8[8], a1, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a4 + v8[9], a1, a3);
  uint64_t v12 = v8[10];
  unint64_t v13 = *(void *)(a4 + v12);
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 <= 4)
  {
    *(void *)(a4 + v12) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

uint64_t *(*BoundedArray4.count.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(v2 + *(int *)(a2 + 40));
  return sub_236EEBDA8;
}

uint64_t *sub_236EEBDA8(uint64_t *result, char a2)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *result;
  uint64_t v4 = *(int *)(result[1] + 40);
  unint64_t v5 = *(void *)(v2 + v4);
  if (a2)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 4)
    {
LABEL_7:
      *(void *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 4) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray4.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray4.endIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

uint64_t BoundedArray4.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)&v9[*(int *)(a2 + 40)];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x236EEBFB8);
  }
  switch(a1)
  {
    case 1:
      uint64_t v12 = *(int *)(a2 + 28);
      goto LABEL_8;
    case 2:
      uint64_t v12 = *(int *)(a2 + 32);
      goto LABEL_8;
    case 3:
      uint64_t v12 = *(int *)(a2 + 36);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3);
      break;
  }
  return result;
}

uint64_t BoundedArray4.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)(v3 + *(int *)(a3 + 40)) <= a2)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x236EEC0C0);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      uint64_t v5 = *(int *)(a3 + 28);
      goto LABEL_9;
    case 2:
      uint64_t v5 = *(int *)(a3 + 32);
      goto LABEL_9;
    case 3:
      uint64_t v5 = *(int *)(a3 + 36);
LABEL_9:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray4.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  _OWORD v7[2] = v3;
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray4.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_236EEC1AC;
}

void sub_236EEC1AC(uint64_t **a1, char a2)
{
}

uint64_t sub_236EEC1C4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray4.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_236EEC1CC(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray4.subscript.modify(v6, *a2, a3);
  return sub_236EE9F48;
}

uint64_t sub_236EEC23C(uint64_t a1)
{
  return sub_236EEE858(a1);
}

uint64_t sub_236EEC254()
{
  return sub_236F12950();
}

uint64_t sub_236EEC2D4(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_236EEC344(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>, MEMORY[0x263F8D7A8]);
}

uint64_t sub_236EEC370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEC3F4()
{
  swift_getWitnessTable();
  return sub_236F12990();
}

uint64_t sub_236EEC478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEC4EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = BoundedArray4.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_236EEC514(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_236EEC584(v6, *a2, a3);
  return sub_236EEA6D4;
}

uint64_t (*sub_236EEC584(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  a1[2] = v8;
  BoundedArray4.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_236EEA790;
}

uint64_t sub_236EEC63C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_236EEA7FC(a1, a2, WitnessTable, a3);
}

uint64_t sub_236EEC6A4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t sub_236EEC714(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_236EEC784(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>, MEMORY[0x263F8D7A0]);
}

uint64_t sub_236EEC7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EEF024(a1, a2);
}

uint64_t sub_236EEC7C8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236EEC81C(uint64_t a1)
{
  return sub_236EEF118(a1);
}

uint64_t BoundedArray6.init(_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v16 = (int *)type metadata accessor for BoundedArray6();
  *(void *)(a9 + v16[12]) = 0;
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32);
  v17(a9, a1, a8);
  v17(a9 + v16[7], a2, a8);
  v17(a9 + v16[8], a3, a8);
  v17(a9 + v16[9], a4, a8);
  v17(a9 + v16[10], a5, a8);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v17)(a9 + v16[11], a6, a8);
  uint64_t v19 = v16[12];
  unint64_t v20 = *(void *)(a9 + v19);
  if ((v20 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v20 <= 6)
  {
    *(void *)(a9 + v19) = a7;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 48);
  unint64_t v4 = *(void *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 6)
  {
    *(void *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for BoundedArray6();
  *(void *)(a4 + v8[12]) = 0;
  uint64_t v9 = *(void *)(a3 - 8);
  size_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(a4, a1, a3);
  v10(a4 + v8[7], a1, a3);
  v10(a4 + v8[8], a1, a3);
  v10(a4 + v8[9], a1, a3);
  v10(a4 + v8[10], a1, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a4 + v8[11], a1, a3);
  uint64_t v12 = v8[12];
  unint64_t v13 = *(void *)(a4 + v12);
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 <= 6)
  {
    *(void *)(a4 + v12) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 48));
}

uint64_t *(*BoundedArray6.count.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(v2 + *(int *)(a2 + 48));
  return sub_236EECB64;
}

uint64_t *sub_236EECB64(uint64_t *result, char a2)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *result;
  uint64_t v4 = *(int *)(result[1] + 48);
  unint64_t v5 = *(void *)(v2 + v4);
  if (a2)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 6)
    {
LABEL_7:
      *(void *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 6) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray6.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray6.endIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 48));
}

uint64_t BoundedArray6.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)&v9[*(int *)(a2 + 48)];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x236EECD84);
  }
  switch(a1)
  {
    case 1:
      uint64_t v12 = *(int *)(a2 + 28);
      goto LABEL_10;
    case 2:
      uint64_t v12 = *(int *)(a2 + 32);
      goto LABEL_10;
    case 3:
      uint64_t v12 = *(int *)(a2 + 36);
      goto LABEL_10;
    case 4:
      uint64_t v12 = *(int *)(a2 + 40);
      goto LABEL_10;
    case 5:
      uint64_t v12 = *(int *)(a2 + 44);
LABEL_10:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3);
      break;
  }
  return result;
}

uint64_t BoundedArray6.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(void *)(v3 + *(int *)(a3 + 48)) <= a2)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x236EECEA4);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      uint64_t v5 = *(int *)(a3 + 28);
      goto LABEL_11;
    case 2:
      uint64_t v5 = *(int *)(a3 + 32);
      goto LABEL_11;
    case 3:
      uint64_t v5 = *(int *)(a3 + 36);
      goto LABEL_11;
    case 4:
      uint64_t v5 = *(int *)(a3 + 40);
      goto LABEL_11;
    case 5:
      uint64_t v5 = *(int *)(a3 + 44);
LABEL_11:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray6.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  _OWORD v7[2] = v3;
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray6.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_236EECF98;
}

void sub_236EECF98(uint64_t **a1, char a2)
{
}

uint64_t sub_236EECFB0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray6.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_236EECFB8(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray6.subscript.modify(v6, *a2, a3);
  return sub_236EE9F48;
}

uint64_t sub_236EED028(uint64_t a1)
{
  return sub_236EEE858(a1);
}

uint64_t sub_236EED040()
{
  return sub_236F12950();
}

uint64_t sub_236EED0C0(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_236EED130(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>, MEMORY[0x263F8D7A8]);
}

uint64_t sub_236EED15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EED1E0()
{
  swift_getWitnessTable();
  return sub_236F12990();
}

uint64_t sub_236EED264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EED2D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = BoundedArray6.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_236EED300(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_236EED370(v6, *a2, a3);
  return sub_236EEA6D4;
}

uint64_t (*sub_236EED370(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  a1[2] = v8;
  BoundedArray6.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_236EEA790;
}

uint64_t sub_236EED428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_236EEA7FC(a1, a2, WitnessTable, a3);
}

uint64_t sub_236EED490(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t sub_236EED500(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_236EED570(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>, MEMORY[0x263F8D7A0]);
}

uint64_t sub_236EED59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EEF024(a1, a2);
}

uint64_t sub_236EED5B4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236EED608(uint64_t a1)
{
  return sub_236EEF118(a1);
}

uint64_t BoundedArray9.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 60);
  unint64_t v4 = *(void *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 9)
  {
    *(void *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray4()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for BoundedArray6()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t BoundedArray9.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for BoundedArray9();
  *(void *)(a4 + v8[15]) = 0;
  uint64_t v9 = *(void *)(a3 - 8);
  size_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(a4, a1, a3);
  v10(a4 + v8[7], a1, a3);
  v10(a4 + v8[8], a1, a3);
  v10(a4 + v8[9], a1, a3);
  v10(a4 + v8[10], a1, a3);
  v10(a4 + v8[11], a1, a3);
  v10(a4 + v8[12], a1, a3);
  v10(a4 + v8[13], a1, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a4 + v8[14], a1, a3);
  uint64_t v12 = v8[15];
  unint64_t v13 = *(void *)(a4 + v12);
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 <= 9)
  {
    *(void *)(a4 + v12) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray9.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 60));
}

uint64_t *(*BoundedArray9.count.modify(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(v2 + *(int *)(a2 + 60));
  return sub_236EED874;
}

uint64_t *sub_236EED874(uint64_t *result, char a2)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *result;
  uint64_t v4 = *(int *)(result[1] + 60);
  unint64_t v5 = *(void *)(v2 + v4);
  if (a2)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 9)
    {
LABEL_7:
      *(void *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 9) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray9.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray9.endIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 60));
}

uint64_t BoundedArray9.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)&v9[*(int *)(a2 + 60)];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x236EEDAACLL);
  }
  switch(a1)
  {
    case 1:
      uint64_t v12 = *(int *)(a2 + 28);
      goto LABEL_13;
    case 2:
      uint64_t v12 = *(int *)(a2 + 32);
      goto LABEL_13;
    case 3:
      uint64_t v12 = *(int *)(a2 + 36);
      goto LABEL_13;
    case 4:
      uint64_t v12 = *(int *)(a2 + 40);
      goto LABEL_13;
    case 5:
      uint64_t v12 = *(int *)(a2 + 44);
      goto LABEL_13;
    case 6:
      uint64_t v12 = *(int *)(a2 + 48);
      goto LABEL_13;
    case 7:
      uint64_t v12 = *(int *)(a2 + 52);
      goto LABEL_13;
    case 8:
      uint64_t v12 = *(int *)(a2 + 56);
LABEL_13:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 16))(a3, v3);
      break;
  }
  return result;
}

uint64_t sub_236EEDAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t), uint64_t (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(a4 + a3 - 8);
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v12 = *v11;
  (*(void (**)(char *))(v13 + 16))((char *)&v16 - v9);
  uint64_t v14 = a5(0, v8);
  return a6(v10, v12, v14);
}

uint64_t BoundedArray9.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (*(void *)(v3 + *(int *)(a3 + 60)) <= a2)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x236EEDCE4);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      uint64_t v5 = *(int *)(a3 + 28);
      goto LABEL_14;
    case 2:
      uint64_t v5 = *(int *)(a3 + 32);
      goto LABEL_14;
    case 3:
      uint64_t v5 = *(int *)(a3 + 36);
      goto LABEL_14;
    case 4:
      uint64_t v5 = *(int *)(a3 + 40);
      goto LABEL_14;
    case 5:
      uint64_t v5 = *(int *)(a3 + 44);
      goto LABEL_14;
    case 6:
      uint64_t v5 = *(int *)(a3 + 48);
      goto LABEL_14;
    case 7:
      uint64_t v5 = *(int *)(a3 + 52);
      goto LABEL_14;
    case 8:
      uint64_t v5 = *(int *)(a3 + 56);
LABEL_14:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray9.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  _OWORD v7[2] = v3;
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray9.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_236EEDDE4;
}

void sub_236EEDDE4(uint64_t **a1, char a2)
{
}

void sub_236EEDDFC(uint64_t **a1, char a2, void (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)(*a1)[5];
  uint64_t v6 = (void *)(*a1)[6];
  if (a2)
  {
    uint64_t v7 = v4[3];
    uint64_t v8 = v4[4];
    uint64_t v9 = v4[1];
    uint64_t v10 = *v4;
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))((*a1)[5], v6, v7);
    a3(v5, v10, v9);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3((void *)(*a1)[6], *v4, v4[1]);
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t sub_236EEDEDC()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEDEF8()
{
  return sub_236EEE1A0(&qword_2688DF2D8);
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

unint64_t sub_236EEDF74()
{
  unint64_t result = qword_2688DF2E8;
  if (!qword_2688DF2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF2E8);
  }
  return result;
}

uint64_t sub_236EEDFC8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE02C()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE048()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE0AC()
{
  return sub_236EEE1A0(&qword_2688DF2F0);
}

uint64_t sub_236EEE0E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE144()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE160()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_236EEE16C()
{
  return sub_236EEE1A0(qword_2688DF2F8);
}

uint64_t sub_236EEE1A0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF2E0);
    sub_236EEDF74();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236EEE210()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE22C()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE248()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE264()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE2C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE2E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE348()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE3AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE3C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE3E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE448()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE464()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE4C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE52C()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE548()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE564()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE5C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE5E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE648()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE6AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE6C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE6E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE748()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE764()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEE7C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray9.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_236EEE7D0(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray9.subscript.modify(v6, *a2, a3);
  return sub_236EE9F48;
}

uint64_t sub_236EEE840(uint64_t a1)
{
  return sub_236EEE858(a1);
}

uint64_t sub_236EEE858(uint64_t a1)
{
  sub_236EF3568();
  swift_getWitnessTable();
  uint64_t v2 = sub_236F12AC0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

void sub_236EEE8EC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_236EEE934()
{
  return sub_236F12950();
}

uint64_t sub_236EEE9B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEEA18(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_236EEEA88(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray9<A>, MEMORY[0x263F8D7A8]);
}

uint64_t sub_236EEEAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEEB38()
{
  swift_getWitnessTable();
  return sub_236F12990();
}

uint64_t sub_236EEEBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_236EEEC30()
{
  return swift_getWitnessTable();
}

uint64_t sub_236EEEC4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = BoundedArray9.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_236EEEC74(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_236EEED2C(v6, *a2, a3);
  return sub_236EEA6D4;
}

void sub_236EEECE4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_236EEED2C(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  a1[2] = v8;
  BoundedArray9.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_236EEA790;
}

void sub_236EEEDE4(void *a1)
{
  uint64_t v1 = (void *)a1[2];
  (*(void (**)(void *, void))(a1[1] + 8))(v1, *a1);
  free(v1);
}

uint64_t sub_236EEEE30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_236EEA7FC(a1, a2, WitnessTable, a3);
}

uint64_t sub_236EEEE98(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t sub_236EEEF08(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_236EEEF78(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EEEFA4(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray9<A>, MEMORY[0x263F8D7A0]);
}

void *sub_236EEEFA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *(*a5)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, void))
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = a5(&v10, a1, a2, WitnessTable, MEMORY[0x263F8D708]);
  *a1 = v10;
  return result;
}

uint64_t sub_236EEF00C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EEF024(a1, a2);
}

uint64_t sub_236EEF024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 32))(a2, v3, a1);
  swift_getWitnessTable();
  uint64_t result = sub_236F12A80();
  *(void *)(a2 + *(int *)(result + 36)) = 0;
  return result;
}

uint64_t sub_236EEF0AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236EEF100(uint64_t a1)
{
  return sub_236EEF118(a1);
}

uint64_t sub_236EEF118(uint64_t a1)
{
  swift_getWitnessTable();
  uint64_t v3 = sub_236EF3600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v1, a1);
  return v3;
}

uint64_t sub_236EEF194@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(void, void))type metadata accessor for BoundedArray2, BoundedArray2.count.getter, a3);
}

uint64_t sub_236EEF1C0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(void, void))type metadata accessor for BoundedArray2, BoundedArray2.count.setter);
}

uint64_t sub_236EEF1EC()
{
  return 8;
}

void *sub_236EEF1F8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_236EEF204(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(void, void))type metadata accessor for BoundedArray2, (uint64_t (*)(uint64_t, uint64_t))BoundedArray2.subscript.getter);
}

uint64_t sub_236EEF230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EEDAD0(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t))type metadata accessor for BoundedArray2, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray2.subscript.setter);
}

uint64_t sub_236EEF270()
{
  return 8;
}

uint64_t sub_236EEF27C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(void, void))type metadata accessor for BoundedArray3, BoundedArray3.count.getter, a3);
}

uint64_t sub_236EEF2A8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(void, void))type metadata accessor for BoundedArray3, BoundedArray3.count.setter);
}

uint64_t sub_236EEF2D4()
{
  return 8;
}

uint64_t sub_236EEF2E0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(void, void))type metadata accessor for BoundedArray3, (uint64_t (*)(uint64_t, uint64_t))BoundedArray3.subscript.getter);
}

uint64_t sub_236EEF30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EEDAD0(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t))type metadata accessor for BoundedArray3, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray3.subscript.setter);
}

uint64_t sub_236EEF34C()
{
  return 8;
}

uint64_t sub_236EEF358@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(void, void))type metadata accessor for BoundedArray4, BoundedArray4.count.getter, a3);
}

uint64_t sub_236EEF384(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(void, void))type metadata accessor for BoundedArray4, BoundedArray4.count.setter);
}

uint64_t sub_236EEF3B0()
{
  return 8;
}

uint64_t sub_236EEF3BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(void, void))type metadata accessor for BoundedArray4, (uint64_t (*)(uint64_t, uint64_t))BoundedArray4.subscript.getter);
}

uint64_t sub_236EEF3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EEDAD0(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t))type metadata accessor for BoundedArray4, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray4.subscript.setter);
}

uint64_t sub_236EEF428()
{
  return 8;
}

uint64_t sub_236EEF434@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(void, void))type metadata accessor for BoundedArray6, BoundedArray6.count.getter, a3);
}

uint64_t sub_236EEF460(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(void, void))type metadata accessor for BoundedArray6, BoundedArray6.count.setter);
}

uint64_t sub_236EEF48C()
{
  return 8;
}

uint64_t sub_236EEF498(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(void, void))type metadata accessor for BoundedArray6, (uint64_t (*)(uint64_t, uint64_t))BoundedArray6.subscript.getter);
}

uint64_t sub_236EEF4C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EEDAD0(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t))type metadata accessor for BoundedArray6, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray6.subscript.setter);
}

uint64_t sub_236EEF504()
{
  return 8;
}

uint64_t sub_236EEF510@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(void, void))type metadata accessor for BoundedArray9, BoundedArray9.count.getter, a3);
}

uint64_t keypath_getTm@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (*a3)(void, void)@<X3>, uint64_t (*a4)(uint64_t)@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v7 = a3(0, *(void *)(a2 + a1 - 8));
  uint64_t result = a4(v7);
  *a5 = result;
  return result;
}

uint64_t sub_236EEF58C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(void, void))type metadata accessor for BoundedArray9, BoundedArray9.count.setter);
}

uint64_t keypath_setTm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void), uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v8 = a5(0, *(void *)(a4 + a3 - 8));
  return a6(v7, v8);
}

uint64_t sub_236EEF60C()
{
  return 8;
}

uint64_t sub_236EEF618(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(void, void))type metadata accessor for BoundedArray9, (uint64_t (*)(uint64_t, uint64_t))BoundedArray9.subscript.getter);
}

uint64_t keypath_get_1Tm(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void, void), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a4(0, *(uint64_t *)((char *)a2 + a3 - 8));
  return a5(v6, v7);
}

uint64_t sub_236EEF6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EEDAD0(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t))type metadata accessor for BoundedArray9, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray9.subscript.setter);
}

uint64_t sub_236EEF6E4()
{
  return 8;
}

uint64_t sub_236EEF6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_236EEF6F8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236EEF798(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v15 = ~v8;
    uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    *(void *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v17) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_236EEF8E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8) + 8;
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))v6;
  (*(void (**)(uint64_t, uint64_t))v6)(a1, v3);
  unint64_t v4 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v6 + 72)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 72);
  return v7(v4, v3);
}

uint64_t sub_236EEF97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EEFA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EEFAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EEFBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EEFC7C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v7 = ((v6 + ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v8 = a2 - v5;
    uint64_t v9 = v7 & 0xFFFFFFF8;
    if ((v7 & 0xFFFFFFF8) != 0) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = v8 + 1;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = *((unsigned __int8 *)a1 + v7);
        if (!v13) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v13 = *(unsigned __int16 *)((char *)a1 + v7);
        if (v13) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x236EEFDA0);
      case 4:
        int v13 = *(_DWORD *)((char *)a1 + v7);
        if (!v13) {
          break;
        }
LABEL_18:
        int v14 = v13 - 1;
        if (v9)
        {
          int v14 = 0;
          LODWORD(v9) = *a1;
        }
        return v5 + (v9 | v14) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_236EEFDB4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64)
       + ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            uint64_t v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v10 = v9 + 1;
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
    int v14 = v13;
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EEFF70);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

uint64_t sub_236EEFF98()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236EF0038(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v15 = ~v8;
    uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    unint64_t v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    *(void *)((v10 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v18) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_236EF01B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v9(v7, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)((v6 + v7) & ~v5, v3);
}

uint64_t sub_236EF0274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(void *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(void *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(void *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(void *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0634(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v7 = ((v6
         + ((v6
           + *(unsigned __int8 *)(v4 + 80)
           + ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
         + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v8 = a2 - v5;
    uint64_t v9 = v7 & 0xFFFFFFF8;
    if ((v7 & 0xFFFFFFF8) != 0) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = v8 + 1;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = *((unsigned __int8 *)a1 + v7);
        if (!v13) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v13 = *(unsigned __int16 *)((char *)a1 + v7);
        if (v13) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x236EF0760);
      case 4:
        int v13 = *(_DWORD *)((char *)a1 + v7);
        if (!v13) {
          break;
        }
LABEL_18:
        int v14 = v13 - 1;
        if (v9)
        {
          int v14 = 0;
          LODWORD(v9) = *a1;
        }
        return v5 + (v9 | v14) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_236EF0774(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64)
       + ((*(void *)(v6 + 64)
         + *(unsigned __int8 *)(v6 + 80)
         + ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            uint64_t v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + *(unsigned __int8 *)(v6 + 80)
           + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v6 + 80))
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v10 = v9 + 1;
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64)
         + *(unsigned __int8 *)(v6 + 80)
         + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
    int v14 = v13;
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64)
         + *(unsigned __int8 *)(v6 + 80)
         + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EF0938);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

uint64_t sub_236EF0960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_236EF0968()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236EF0A0C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v15 = ~v8;
    uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    unint64_t v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    unint64_t v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    *(void *)((v10 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_236EF0BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v10(v7, v3);
  uint64_t v8 = (v6 + v7) & ~v5;
  v10(v8, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)((v6 + v8) & ~v5, v3);
}

uint64_t sub_236EF0C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF0FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF10F8(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v8 = ((v6 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7) & ~v7)) & ~v7)) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v5;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x236EF122CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v5 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_236EF1240(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v7 = v6;
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(v6 + 64)
        + ((*(void *)(v6 + 64) + v9 + ((*(void *)(v6 + 64) + v9 + ((*(void *)(v6 + 64) + v9) & ~v9)) & ~v9)) & ~v9)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_14:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            unint64_t v18 = *(void (**)(void))(v7 + 56);
            v18();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + v9
           + ((*(_DWORD *)(v6 + 64) + v9 + ((*(_DWORD *)(v6 + 64) + v9) & ~v9)) & ~v9)) & ~v9)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_14;
    }
  }
  if (v10) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v10)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EF140CLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_236EF1434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_236EF143C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236EF14E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v15 = ~v8;
    int v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    unint64_t v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    unint64_t v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    uint64_t v20 = (v9 + v19) & v15;
    v16((uint64_t *)((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15), (uint64_t *)v20, v5);
    uint64_t v21 = (v9 + v20) & v15;
    v16((uint64_t *)((v9 + ((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15)) & v15), (uint64_t *)v21, v5);
    *(void *)((v10 + ((v9 + ((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v21) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_236EF16EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  unsigned int v12 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v12(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v12(v7, v3);
  uint64_t v8 = (v6 + v7) & ~v5;
  v12(v8, v3);
  uint64_t v9 = (v6 + v8) & ~v5;
  v12(v9, v3);
  uint64_t v10 = (v6 + v9) & ~v5;
  v12(v10, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)((v6 + v10) & ~v5, v3);
}

uint64_t sub_236EF1810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF1978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF1AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF1C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(void *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF1DB0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v8 = ((v6 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v5;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x236EF1EF4);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v5 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_236EF1F08(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v8 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v7 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            unint64_t v18 = *(void (**)(void))(v6 + 56);
            v18();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v7;
    if (((v8
         + ((v8
           + v9
           + ((v8
             + v9
             + ((v8
               + v9
               + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (v10) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v10)
  {
    unsigned int v17 = ~v7 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EF20E4);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_236EF210C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_236EF2114()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236EF21C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  BOOL v9 = v8 <= 7 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0;
  if (v9
    && (uint64_t v10 = v7 + v8,
        uint64_t v11 = v7 + 7,
        ((v7
        + 7
        + ((v7
          + v8
          + ((v7
            + v8
            + ((v7
              + v8
              + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8)
      + 8 <= 0x18))
  {
    uint64_t v12 = ~v8;
    int v13 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v13(a1, a2, v5);
    unint64_t v14 = ((unint64_t)a2 + v10) & v12;
    v13((uint64_t *)(((unint64_t)v4 + v10) & v12), (uint64_t *)v14, v5);
    unint64_t v15 = (v10 + v14) & v12;
    v13((uint64_t *)((v10 + (((unint64_t)v4 + v10) & v12)) & v12), (uint64_t *)v15, v5);
    unint64_t v16 = (v10 + v15) & v12;
    v13((uint64_t *)((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12), (uint64_t *)v16, v5);
    uint64_t v17 = (v10 + v16) & v12;
    v13((uint64_t *)((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12), (uint64_t *)v17, v5);
    uint64_t v18 = (v10 + v17) & v12;
    v13((uint64_t *)((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v18, v5);
    uint64_t v19 = (v10 + v18) & v12;
    v13((uint64_t *)((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v19, v5);
    uint64_t v20 = (v10 + v19) & v12;
    v13((uint64_t *)((v10+ ((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v20, v5);
    uint64_t v21 = (v10 + v20) & v12;
    v13((uint64_t *)((v10+ ((v10+ ((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v21, v5);
    *(void *)((v11
               + ((v10
                 + ((v10
                   + ((v10
                     + ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v11 + v21) & 0xFFFFFFFFFFFFFFF8);
  }
  else
  {
    uint64_t v22 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v22 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  return v4;
}

uint64_t sub_236EF245C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v15(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v15(v7, v3);
  uint64_t v8 = (v6 + v7) & ~v5;
  v15(v8, v3);
  uint64_t v9 = (v6 + v8) & ~v5;
  v15(v9, v3);
  uint64_t v10 = (v6 + v9) & ~v5;
  v15(v10, v3);
  uint64_t v11 = (v6 + v10) & ~v5;
  v15(v11, v3);
  uint64_t v12 = (v6 + v11) & ~v5;
  v15(v12, v3);
  uint64_t v13 = (v6 + v12) & ~v5;
  v15(v13, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v15)((v6 + v13) & ~v5, v3);
}

uint64_t sub_236EF25E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  uint64_t v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  uint64_t v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  uint64_t v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(void *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF27C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  uint64_t v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  uint64_t v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  uint64_t v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(void *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF29A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  uint64_t v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  uint64_t v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  uint64_t v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(void *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF2B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v8 + v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  uint64_t v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  uint64_t v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  uint64_t v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  uint64_t v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  uint64_t v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  uint64_t v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(void *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_236EF2D60(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    unint64_t v8 = ((v6
         + ((v6
           + v7
           + ((v6
             + v7
             + ((v6
               + v7
               + ((v6 + v7 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7 + ((v6 + v7) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)
         + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v5;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x236EF2EBCLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_18:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v5 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_236EF2ED0(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v8
        + ((v8
          + v9
          + ((v8
            + v9
            + ((v8
              + v9
              + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v7 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            uint64_t v18 = *(void (**)(void))(v6 + 56);
            v18();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v7;
    if (((v8
         + ((v8
           + v9
           + ((v8
             + v9
             + ((v8
               + v9
               + ((v8
                 + v9
                 + ((v8
                   + v9
                   + ((v8
                     + v9
                     + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (v10) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v10)
  {
    unsigned int v17 = ~v7 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x236EF30C4);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_236EF30EC(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_236F12A50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  size_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  int v13 = (char *)v19 - v12;
  v19[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_236F12910();
  int v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v13, a1, v5);
  v14(v10, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    v18(v10, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v18)(v13, v5);
    goto LABEL_5;
  }
  char v15 = sub_236F12910();
  int v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v10, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v13, v5);
  if ((v15 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_236EF32F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v25 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  int v16 = (char *)&v24 - v15;
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v14, v18);
  uint64_t v20 = (char *)&v24 - v19;
  char v21 = sub_236F12910();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, a2, v11);
  if ((v21 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v22 = v25(v20, &v16[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, AssociatedTypeWitness);
  if ((v22 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_236EF3568()
{
  sub_236F12AC0();
  swift_getWitnessTable();
  return sub_236F12A90();
}

Swift::Void __swiftcall simplifyTriangleMesh(vertexPositions:triangleVertexIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::Int targetTriangleCount, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_simplify_triangle_mesh_opt_3f_optional options)
{
}

Swift::Void __swiftcall simplifyTriangleMesh(vertexPositions:triangleVertexIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::Int targetTriangleCount, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_simplify_triangle_mesh_opt_3d_optional options)
{
}

uint64_t sub_236EF36C0(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, void, void, uint64_t), uint64_t (*a8)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, void, void))
{
  uint64_t result = *(void *)(a1 + 16);
  unint64_t v11 = *(void *)(a2 + 16) / 3uLL;
  if (a6)
  {
    if ((a3 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(a3))
    {
      return a7(result, a1 + 32, v11, a2 + 32, a3, *a4, *a5, a6);
    }
    __break(1u);
    goto LABEL_10;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!HIDWORD(a3)) {
    return a8(result, a1 + 32, v11, a2 + 32, a3, *a4, *a5);
  }
LABEL_11:
  __break(1u);
  return result;
}

Swift::Void __swiftcall simplifyTriangleMeshWithUVs(vertexPositions:triangleVertexIndices:uvValues:trianglesWithUVs:triangleUVIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, Swift::Int targetTriangleCount, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_collection_2f *outUVValues, OS_geom_collection_u *outTrianglesWithUVs, OS_geom_collection_u *outTriangleUVIndices)
{
}

Swift::Void __swiftcall simplifyTriangleMeshWithUVs(vertexPositions:triangleVertexIndices:uvValues:trianglesWithUVs:triangleUVIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, Swift::Int targetTriangleCount, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_collection_2f *outUVValues, OS_geom_collection_u *outTrianglesWithUVs, OS_geom_collection_u *outTriangleUVIndices)
{
}

uint64_t sub_236EF37D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t (*a12)(void, uint64_t, unint64_t, uint64_t, void, uint64_t, void, uint64_t, uint64_t, _DWORD, void, void, void, void, void))
{
  if ((a6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a6))
  {
    return a12(*(void *)(result + 16), result + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, *(void *)(a3 + 16), a3 + 32, *(void *)(a4 + 16), a4 + 32, a5 + 32, a6, *a7, *a8, *a9, *a10, *a11);
  }
  __break(1u);
  return result;
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.getter()
{
  return sub_236EF441C(geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_236EF53EC);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_236EF4074(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

void (*OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  fixed_vertex_indices_data_3f = (const void *)geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f(v1);
  uint64_t fixed_vertex_indices_count_3f = geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f(v1);
  uint64_t v6 = sub_236EF53EC(fixed_vertex_indices_data_3f, fixed_vertex_indices_count_3f);
  uint64_t v7 = (2 * v6[2]) | 1;
  *uint64_t v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_236EF3980;
}

void sub_236EF3980(uint64_t a1, char a2)
{
}

id OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.getter()
{
  output_new_to_old_vertex_map_collection_3f = (void *)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v0);
  return output_new_to_old_vertex_map_collection_3f;
}

void OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.setter(void *a1)
{
  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(v1, (uint64_t)a1);
}

void (*OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v1);
  return sub_236EF3A5C;
}

void sub_236EF3A5C(uint64_t a1, uint64_t a2)
{
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.getter()
{
  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.setter(char a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(v1, a1 & 1);
}

uint64_t (*OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v1);
  return sub_236EF3AE8;
}

uint64_t sub_236EF3AE8(uint64_t a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.uvValues.getter()
{
  return sub_236EF441C(geom_simplify_triangle_mesh_opt_get_uv_value_data_3f, geom_simplify_triangle_mesh_opt_get_uv_value_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_236EF5490);
}

void *OS_geom_simplify_triangle_mesh_opt_3f.trianglesWithUVs.getter()
{
  return sub_236EF44B8(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.triangleUVIndices.getter()
{
  return sub_236EF4548(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3f.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3f.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
}

uint64_t sub_236EF3BC0(uint64_t a1, uint64_t a2)
{
  return sub_236EF490C(a1, a2, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_236EF53EC);
}

uint64_t sub_236EF3C00(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236EF46DC(a1, a2, a3, a4, a5, a6, (void (*)(void, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

uint64_t (*sub_236EF3C18(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.modify(v2);
  return sub_236EE9F48;
}

id sub_236EF3C74()
{
  output_new_to_old_vertex_map_collection_3f = (void *)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(*v0);
  return output_new_to_old_vertex_map_collection_3f;
}

void sub_236EF3CA4(void *a1)
{
  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(*v1, (uint64_t)a1);
}

void (*sub_236EF3CE4(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v3);
  return sub_236EF3A5C;
}

uint64_t sub_236EF3D38()
{
  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(*v0);
}

uint64_t sub_236EF3D54(char a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*v1, a1 & 1);
}

uint64_t (*sub_236EF3D64(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v3);
  return sub_236EF3AE8;
}

uint64_t sub_236EF3DB0(uint64_t a1, uint64_t a2)
{
  return sub_236EF490C(a1, a2, geom_simplify_triangle_mesh_opt_get_uv_value_data_3f, geom_simplify_triangle_mesh_opt_get_uv_value_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_236EF5490);
}

void *sub_236EF3DF0(uint64_t a1, uint64_t a2)
{
  return sub_236EF49A8(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t sub_236EF3E1C(uint64_t a1, uint64_t a2)
{
  return sub_236EF4A38(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

id sub_236EF3E48()
{
  output_uv_value_collection_3f = (void *)geom_simplify_triangle_mesh_opt_get_output_uv_value_collection_3f(*v0);
  return output_uv_value_collection_3f;
}

id sub_236EF3E78()
{
  output_triangles_with_uvs_collection_3f = (void *)geom_simplify_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3f(*v0);
  return output_triangles_with_uvs_collection_3f;
}

id sub_236EF3EA8()
{
  output_triangle_uv_indices_collection_3f = (void *)geom_simplify_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3f(*v0);
  return output_triangle_uv_indices_collection_3f;
}

uint64_t sub_236EF3ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236EF4B58(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3f);
}

uint64_t sub_236EF3EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_236EF4BD0(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

void *sub_236EF3F24()
{
  return geom_simplify_triangle_mesh_opt_clear_uvs_3f(*v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.getter()
{
  return sub_236EF441C(geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_236EF53EC);
}

void *sub_236EF3F6C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, void *a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = (const void *)a2(*a1);
  uint64_t v8 = a3(v6);
  uint64_t result = sub_236EF53EC(v7, v8);
  uint64_t v10 = (2 * result[2]) | 1;
  *a4 = result;
  a4[1] = result + 4;
  a4[2] = 0;
  a4[3] = v10;
  return result;
}

void *sub_236EF3FDC(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = result[2];
  uint64_t v6 = result[3] >> 1;
  uint64_t v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = result[1] + 4 * v5;
    uint64_t v10 = *a2;
    swift_unknownObjectRetain();
    a5(v10, v7, v9);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_236EF4074(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

uint64_t sub_236EF4074(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t, unint64_t, uint64_t))
{
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a5(v5, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  fixed_vertex_indices_data_3d = (const void *)geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d(v1);
  uint64_t fixed_vertex_indices_count_3d = geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d(v1);
  uint64_t v6 = sub_236EF53EC(fixed_vertex_indices_data_3d, fixed_vertex_indices_count_3d);
  uint64_t v7 = (2 * v6[2]) | 1;
  *uint64_t v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_236EF415C;
}

void sub_236EF415C(uint64_t a1, char a2)
{
}

void sub_236EF4174(uint64_t a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(*(void *)a1 + 16);
  uint64_t v6 = *(void *)(*(void *)a1 + 24) >> 1;
  uint64_t v7 = v6 - v5;
  BOOL v8 = __OFSUB__(v6, v5);
  if ((a2 & 1) == 0)
  {
    if (!v8)
    {
      a3(v4[4], v7, v4[1] + 4 * v5);
      goto LABEL_9;
    }
LABEL_13:
    __break(1u);
    return;
  }
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v9 = v4[4];
  uint64_t v10 = v4[1] + 4 * v5;
  swift_unknownObjectRetain();
  a3(v9, v7, v10);
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  free(v4);
}

id OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.getter()
{
  output_new_to_old_vertex_map_collection_3d = (void *)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v0);
  return output_new_to_old_vertex_map_collection_3d;
}

void OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.setter(void *a1)
{
  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(v1, (uint64_t)a1);
}

void (*OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v1);
  return sub_236EF42FC;
}

void sub_236EF42FC(uint64_t a1, uint64_t a2)
{
}

void sub_236EF4314(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  id v3 = *(id *)a1;
  a3(*(void *)(a1 + 8));
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.getter()
{
  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.setter(char a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(v1, a1 & 1);
}

uint64_t (*OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v1);
  return sub_236EF43CC;
}

uint64_t sub_236EF43CC(uint64_t a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.uvValues.getter()
{
  return sub_236EF441C(geom_simplify_triangle_mesh_opt_get_uv_value_data_3d, geom_simplify_triangle_mesh_opt_get_uv_value_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_236EF5490);
}

uint64_t sub_236EF441C(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = a1(v3);
  uint64_t v7 = a2(v3);
  return a3(v6, v7);
}

void *OS_geom_simplify_triangle_mesh_opt_3d.trianglesWithUVs.getter()
{
  return sub_236EF44B8(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

void *sub_236EF44B8(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a1(v2);
  uint64_t v5 = (const void *)a2(v2);
  return sub_236EF53EC(v5, v4);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.triangleUVIndices.getter()
{
  return sub_236EF4548(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_236EF4548(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t result = a1(v2);
  uint64_t v5 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    uint64_t v6 = (const void *)a2(v2);
    return (uint64_t)sub_236EF53EC(v6, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3d.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
}

uint64_t sub_236EF45D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  return a5(v5, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3d.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
}

uint64_t sub_236EF462C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a7(v7, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

uint64_t sub_236EF4684(uint64_t a1, uint64_t a2)
{
  return sub_236EF490C(a1, a2, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_236EF53EC);
}

uint64_t sub_236EF46C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236EF46DC(a1, a2, a3, a4, a5, a6, (void (*)(void, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

uint64_t sub_236EF46DC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void, unint64_t, uint64_t))
{
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a7(*v7, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_236EF4734(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.modify(v2);
  return sub_236EE9F48;
}

id sub_236EF4790()
{
  output_new_to_old_vertex_map_collection_3d = (void *)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(*v0);
  return output_new_to_old_vertex_map_collection_3d;
}

void sub_236EF47C0(void *a1)
{
  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(*v1, (uint64_t)a1);
}

void (*sub_236EF4800(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v3);
  return sub_236EF42FC;
}

uint64_t sub_236EF4854()
{
  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(*v0);
}

uint64_t sub_236EF4870(char a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*v1, a1 & 1);
}

uint64_t (*sub_236EF4880(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v3);
  return sub_236EF43CC;
}

uint64_t sub_236EF48CC(uint64_t a1, uint64_t a2)
{
  return sub_236EF490C(a1, a2, geom_simplify_triangle_mesh_opt_get_uv_value_data_3d, geom_simplify_triangle_mesh_opt_get_uv_value_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_236EF5490);
}

uint64_t sub_236EF490C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8 = *v5;
  uint64_t v9 = a3(v8);
  uint64_t v10 = a4(v8);
  return a5(v9, v10);
}

void *sub_236EF497C(uint64_t a1, uint64_t a2)
{
  return sub_236EF49A8(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

void *sub_236EF49A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = a3(v6);
  uint64_t v8 = (const void *)a4(v6);
  return sub_236EF53EC(v8, v7);
}

uint64_t sub_236EF4A0C(uint64_t a1, uint64_t a2)
{
  return sub_236EF4A38(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_236EF4A38(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t result = a3(v6);
  uint64_t v8 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    uint64_t v9 = (const void *)a4(v6);
    return (uint64_t)sub_236EF53EC(v9, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_236EF4AB0()
{
  output_uv_value_collection_3d = (void *)geom_simplify_triangle_mesh_opt_get_output_uv_value_collection_3d(*v0);
  return output_uv_value_collection_3d;
}

id sub_236EF4AE0()
{
  output_triangles_with_uvs_collection_3d = (void *)geom_simplify_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3d(*v0);
  return output_triangles_with_uvs_collection_3d;
}

id sub_236EF4B10()
{
  output_triangle_uv_indices_collection_3d = (void *)geom_simplify_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3d(*v0);
  return output_triangle_uv_indices_collection_3d;
}

uint64_t sub_236EF4B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236EF4B58(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3d);
}

uint64_t sub_236EF4B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  return a7(*v7, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

uint64_t sub_236EF4B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_236EF4BD0(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

uint64_t sub_236EF4BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a9(*v9, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

void *sub_236EF4C10()
{
  return geom_simplify_triangle_mesh_opt_clear_uvs_3d(*v0);
}

void sub_236EF4C18(void *a1)
{
}

void sub_236EF4C4C(void *a1)
{
}

void sub_236EF4C80(void *a1)
{
}

void sub_236EF4CB4(void *a1)
{
}

void sub_236EF4CE8(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, void *, uint64_t))
{
  uint64_t v7 = a2();
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 29;
      }
      double v9[2] = v8;
      v9[3] = 2 * (v11 >> 2);
    }
    id v12 = a1;
    uint64_t v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8) {
      __break(1u);
    }
  }
}

void sub_236EF4DCC(void *a1)
{
}

void sub_236EF4E00(void *a1)
{
}

void sub_236EF4E34(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, void *, uint64_t))
{
  uint64_t v7 = a2();
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      double v9[2] = v8;
      v9[3] = 2 * (v11 >> 3);
    }
    id v12 = a1;
    uint64_t v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8) {
      __break(1u);
    }
  }
}

void sub_236EF4F18(void *a1)
{
}

void sub_236EF4F4C(void *a1)
{
}

void sub_236EF4F80(void *a1)
{
}

void sub_236EF4FB4(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, void *, uint64_t))
{
  uint64_t v7 = a2();
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 1;
      }
      double v9[2] = v8;
      v9[3] = 2 * (v11 >> 5);
    }
    id v12 = a1;
    uint64_t v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8) {
      __break(1u);
    }
  }
}

void sub_236EF5098(void *a1)
{
}

void sub_236EF50CC(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, void *, uint64_t))
{
  uint64_t v7 = a2();
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      double v9[2] = v8;
      v9[3] = 2 * (v11 >> 4);
    }
    id v12 = a1;
    uint64_t v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8) {
      __break(1u);
    }
  }
}

void sub_236EF51B0(void *a1)
{
  uint64_t v2 = geom_collection_size_i8((uint64_t)a1);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v2 <= 0)
    {
      uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5A0);
      uint64_t v4 = (void *)swift_allocObject();
      size_t v5 = _swift_stdlib_malloc_size(v4);
      v4[2] = v3;
      v4[3] = 2 * v5 - 64;
    }
    id v6 = a1;
    uint64_t v7 = sub_236F00E8C(v8, v4 + 4, v3);

    if (v7 != v3) {
      __break(1u);
    }
  }
}

void sub_236EF5270(void *a1)
{
  uint64_t v2 = geom_collection_size_u16((uint64_t)a1);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v2 <= 0)
    {
      uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5B8);
      uint64_t v4 = (void *)swift_allocObject();
      int64_t v5 = _swift_stdlib_malloc_size(v4);
      int64_t v6 = v5 - 32;
      if (v5 < 32) {
        int64_t v6 = v5 - 31;
      }
      v4[2] = v3;
      v4[3] = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
    id v7 = a1;
    uint64_t v8 = sub_236F00E90(v9, v4 + 4, v3);

    if (v8 != v3) {
      __break(1u);
    }
  }
}

void *sub_236EF533C(const void *a1, uint64_t a2)
{
  return sub_236EF5AA8(a1, a2, qword_2688DEFD0);
}

void *sub_236EF5348(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 32 * a2;
    int64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DEFC8);
    size_t v4 = 32 * a2;
    int64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 1;
    }
    void v5[2] = a2;
    v5[3] = 2 * (v7 >> 5);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *sub_236EF53EC(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 4 * a2;
    int64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5B0);
    size_t v4 = 4 * a2;
    int64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 29;
    }
    void v5[2] = a2;
    v5[3] = 2 * (v7 >> 2);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *sub_236EF5490(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 8 * a2;
    int64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF598);
    size_t v4 = 8 * a2;
    int64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 25;
    }
    void v5[2] = a2;
    v5[3] = 2 * (v7 >> 3);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *sub_236EF5534@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_236EF3F6C(a1, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, a2);
}

void *sub_236EF5574(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF3FDC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

id sub_236EF55A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id result = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_236EF55D4(uint64_t *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(*a2, *a1);
}

uint64_t sub_236EF55E4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_236EF5610(char *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*a2, *a1);
}

void *sub_236EF5620@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_236EF3F6C(a1, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, a2);
}

void *sub_236EF5660(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF3FDC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

id sub_236EF568C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id result = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_236EF56C0(uint64_t *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(*a2, *a1);
}

uint64_t sub_236EF56D0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_236EF56FC(char *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*a2, *a1);
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.uvValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.trianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.triangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outUVValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outTrianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outTriangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 136))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 144))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.clearUVs()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

void *sub_236EF5874(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 40 * a2;
    int64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5E8);
    size_t v4 = 40 * a2;
    int64_t v5 = (void *)swift_allocObject();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    void v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 40);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *sub_236EF5928(const void *a1, uint64_t a2)
{
  return sub_236EF5940(a1, a2, &qword_2688DF5E0);
}

void *sub_236EF5934(const void *a1, uint64_t a2)
{
  return sub_236EF5940(a1, a2, &qword_2688DF5D8);
}

void *sub_236EF5940(const void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v5 = a2 << 6;
    size_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    size_t v5 = a2 << 6;
    size_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 + 31;
    }
    _OWORD v6[2] = a2;
    v6[3] = 2 * (v8 >> 6);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
}

void *sub_236EF59E4(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 96 * a2;
    size_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5D0);
    size_t v4 = 96 * a2;
    size_t v5 = (void *)swift_allocObject();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    void v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 96);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *sub_236EF5A9C(const void *a1, uint64_t a2)
{
  return sub_236EF5AA8(a1, a2, &qword_2688DF588);
}

void *sub_236EF5AA8(const void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v5 = 16 * a2;
    size_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    size_t v5 = 16 * a2;
    size_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 17;
    }
    _OWORD v6[2] = a2;
    v6[3] = 2 * (v8 >> 4);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
}

double geom_triangle_3f.closestPoint(to:)(float32x4_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  float32x4_t v2 = v1[1];
  float32x4_t v3 = v1[2];
  float32x4_t v4 = *v1;
  float32x4_t v6 = 0uLL;
  return geom_closest_point_to_triangle_3f(&v6, a1, v4, v2, v3);
}

float64_t geom_triangle_3d.closestPoint(to:)(float64x2_t a1, float64x2_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  float64x2_t v3 = *v2;
  float64x2_t v4 = v2[1];
  float64x2_t v5 = v2[2];
  float64x2_t v6 = v2[3];
  float64x2_t v7 = v2[4];
  float64x2_t v8 = v2[5];
  memset(v13, 0, sizeof(v13));
  v12[0] = a1;
  v12[1] = a2;
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  float v11[4] = v7;
  _OWORD v11[5] = v8;
  geom_closest_point_to_triangle_3d(v12, v11, (uint64_t)v13, &v10);
  return v10.f64[0];
}

float32x2_t geom_circle_2f.closestPoint(to:)(float32x2_t a1, double a2, float a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v4 = 0;
  return geom_closest_point_to_circle_2f(*(uint64_t *)&a2, SLODWORD(a3), (float *)&v4, a1);
}

float64_t geom_circle_2d.closestPoint(to:)(float64x2_t a1, __n128 a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0;
  __n128 v5 = a2;
  double v6 = a3;
  return geom_closest_point_to_circle_2d((uint64_t)&v5, (double *)&v4, a1);
}

double geom_sphere_3f.closestPoint(to:)(float32x4_t a1, __n128 a2, float a3, float a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  a2.n128_f32[2] = a3;
  int v5 = 0;
  __n128 v6 = a2;
  float v7 = a4;
  return geom_closest_point_to_sphere_3f((uint64_t)&v6, (float *)&v5, a1);
}

double geom_sphere_3d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5, float64x2_t a6)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  v8[0] = a1;
  v8[1] = a2;
  v10[0] = a3;
  v10[1] = a4;
  double v11 = a5;
  geom_closest_point_to_sphere_3d(v8, v10, (double *)&v9, (uint64_t)&v7, a6);
  return *(double *)&v7;
}

uint64_t geom_quadratic_bezier_2f.closestPoint(to:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  return geom_closest_point_to_quadratic_bezier_2f((float *)v5, (float *)v5 + 1, a1, a2, a3, a4);
}

uint64_t geom_quadratic_bezier_2d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  v6[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  v6[0] = 0.0;
  return geom_closest_point_to_quadratic_bezier_2d((double *)&v5, v6, a1, a2, a3, a4);
}

float *geom_cubic_bezier_2f.closestPoint(to:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double *a9)
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  return geom_closest_point_to_cubic_bezier_2f((float *)v10, (float *)v10 + 1, a1, a2, a3, a4, a5, a8, a9);
}

double geom_cubic_bezier_2f.approximateClosestPoint(to:withSampleCount:)(unint64_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16) {
    goto LABEL_5;
  }
  return geom_approximate_closest_point_to_cubic_bezier_2f((unsigned __int16)a1, (float *)v7, (float *)v7 + 1, a2, a3, a4, a5, a6);
}

double *geom_cubic_bezier_2d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double *a9)
{
  v11[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11[0] = 0.0;
  return geom_closest_point_to_cubic_bezier_2d((double *)&v10, v11, a1, a2, a3, a4, a5, a8, a9);
}

double geom_cubic_bezier_2d.approximateClosestPoint(to:withSampleCount:)(unint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  v8[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  v8[0] = 0.0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16) {
    goto LABEL_5;
  }
  return geom_approximate_closest_point_to_cubic_bezier_2d((unsigned __int16)a1, (double *)&v7, v8, a2, a3, a4, a5, a6);
}

double findBestRigidTransform(from:to:)(float32x4_t *a1, float32x4_t *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1[1].u64[0];
  if (v3 != a2[1].i64[0])
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  float32x4_t v7 = 0uLL;
  long long v6 = xmmword_236F1CB30;
  int v5 = 0;
  if (HIDWORD(v3)) {
    goto LABEL_5;
  }
  geom_find_best_rigid_transform_3f(v3, a1 + 2, a2 + 2, &v7, (float32x4_t *)&v6, &v5);
  return *(double *)v7.i64;
}

float64_t findBestRigidTransform(from:to:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 != *(void *)(a2 + 16))
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  float64x2_t v14 = 0u;
  long long v15 = 0u;
  float64x2_t v12 = 0u;
  long long v13 = xmmword_236F14160;
  uint64_t v11 = 0;
  if (HIDWORD(v5)) {
    goto LABEL_5;
  }
  geom_find_best_rigid_transform_3d(v5, (float64x2_t *)(a1 + 32), (float64x2_t *)(a2 + 32), &v14, &v12, &v11);
  float64_t result = v14.f64[0];
  long long v7 = v15;
  float64x2_t v8 = v12;
  long long v9 = v13;
  uint64_t v10 = v11;
  *(float64x2_t *)a3 = v14;
  *(_OWORD *)(a3 + 16) = v7;
  *(float64x2_t *)(a3 + 32) = v8;
  *(_OWORD *)(a3 + 48) = v9;
  *(void *)(a3 + 64) = v10;
  return result;
}

void __swiftcall findBestRigidTransformMatrix(from:to:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer from, Swift::OpaquePointer to)
{
  uint64_t v4 = *((void *)from._rawValue + 2);
  if (v4 == *((void *)to._rawValue + 2))
  {
    if (!HIDWORD(v4))
    {
      geom_find_best_rigid_transform_matrix_3f(v4, (float32x4_t *)from._rawValue + 2, (float32x4_t *)to._rawValue + 2);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void __swiftcall findBestRigidTransformMatrix(from:to:)(simd_double4x4 *__return_ptr retstr, Swift::OpaquePointer from, Swift::OpaquePointer to)
{
  uint64_t v5 = *((void *)from._rawValue + 2);
  if (v5 == *((void *)to._rawValue + 2))
  {
    if (!HIDWORD(v5))
    {
      geom_find_best_rigid_transform_matrix_3d(v5, (float64x2_t *)from._rawValue + 2, (float64x2_t *)to._rawValue + 2, (uint64_t)v13);
      long long v6 = v13[1];
      long long v7 = v13[2];
      long long v8 = v13[3];
      long long v9 = v13[4];
      long long v10 = v13[5];
      long long v11 = v13[6];
      long long v12 = v13[7];
      *(_OWORD *)retstr->columns[0].f64 = v13[0];
      *(_OWORD *)&retstr->columns[0].f64[2] = v6;
      *(_OWORD *)retstr->columns[1].f64 = v7;
      *(_OWORD *)&retstr->columns[1].f64[2] = v8;
      *(_OWORD *)retstr->columns[2].f64 = v9;
      *(_OWORD *)&retstr->columns[2].f64[2] = v10;
      *(_OWORD *)retstr->columns[3].f64 = v11;
      *(_OWORD *)&retstr->columns[3].f64[2] = v12;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_236EF6244(_OWORD *a1, _DWORD *a2, float32x4_t *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  float32x4_t v6 = *a3;
  long long v7 = *v3;
  int v8 = *((_DWORD *)v3 + 4);
  int v11 = 0;
  long long v12 = v7;
  int v13 = v8;
  *(double *)&long long v9 = geom_closest_point_to_sphere_3f((uint64_t)&v12, (float *)&v11, v6);
  int v10 = v11;
  *a1 = v9;
  *a2 = v10;
}

double sub_236EF62D4(_OWORD *a1, void *a2, float64x2_t *a3, double a4, double a5, double a6, double a7, double a8, float64x2_t a9)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  float64x2_t v12 = *a3;
  float64x2_t v13 = a3[1];
  float64x2_t v14 = *(float64x2_t *)v9;
  float64x2_t v15 = *(float64x2_t *)(v9 + 16);
  uint64_t v16 = *(void *)(v9 + 32);
  uint64_t v22 = 0;
  v21[0] = v12;
  v21[1] = v13;
  v23[0] = v14;
  v23[1] = v15;
  uint64_t v24 = v16;
  geom_closest_point_to_sphere_3d(v21, v23, (double *)&v22, (uint64_t)v20, a9);
  double result = *(double *)v20;
  long long v18 = v20[1];
  uint64_t v19 = v22;
  *a1 = v20[0];
  a1[1] = v18;
  *a2 = v19;
  return result;
}

void sub_236EF6374(_OWORD *a1, float32x4_t *a2, float32x4_t *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  float32x4_t v6 = *a3;
  float32x4_t v7 = v3[1];
  float32x4_t v8 = v3[2];
  float32x4_t v9 = *v3;
  float32x4_t v12 = 0uLL;
  *(double *)&long long v10 = geom_closest_point_to_triangle_3f(&v12, v6, v9, v7, v8);
  float32x4_t v11 = v12;
  *a1 = v10;
  *a2 = v11;
}

float64_t sub_236EF63F8(float64x2_t *a1, _OWORD *a2, float64x2_t *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  float64x2_t v6 = *a3;
  float64x2_t v7 = a3[1];
  float64x2_t v8 = *v3;
  float64x2_t v9 = v3[1];
  float64x2_t v10 = v3[2];
  float64x2_t v11 = v3[3];
  float64x2_t v12 = v3[4];
  float64x2_t v13 = v3[5];
  long long v21 = 0u;
  long long v22 = 0u;
  v20[0] = v6;
  v20[1] = v7;
  v19[0] = v8;
  v19[1] = v9;
  void v19[2] = v10;
  v19[3] = v11;
  v19[4] = v12;
  v19[5] = v13;
  geom_closest_point_to_triangle_3d(v20, v19, (uint64_t)&v21, v18);
  float64_t result = v18[0].f64[0];
  float64x2_t v15 = v18[1];
  long long v16 = v21;
  long long v17 = v22;
  *a1 = v18[0];
  a1[1] = v15;
  *a2 = v16;
  a2[1] = v17;
  return result;
}

uint64_t sub_236EF64A4(void *a1, _DWORD *a2, _DWORD *a3, float32x2_t *a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  float32x2_t v8 = *a4;
  float32x2_t v9 = *v4;
  float32x2_t v10 = v4[1];
  float32x2_t v11 = v4[2];
  v15[0] = 0;
  uint64_t result = geom_closest_point_to_quadratic_bezier_2f((float *)v15, (float *)v15 + 1, v8, v9, v10, v11);
  uint64_t v13 = v15[0];
  *a1 = v14;
  *a2 = v13;
  *a3 = HIDWORD(v13);
  return result;
}

uint64_t sub_236EF6534(_OWORD *a1, void *a2, double *a3, float64x2_t *a4)
{
  v17[1] = *(double *)MEMORY[0x263EF8340];
  float64x2_t v8 = *a4;
  float64x2_t v9 = *v4;
  float64x2_t v10 = v4[1];
  float64x2_t v11 = v4[2];
  uint64_t v16 = 0;
  v17[0] = 0.0;
  uint64_t result = geom_closest_point_to_quadratic_bezier_2d((double *)&v16, v17, v8, v9, v10, v11);
  uint64_t v13 = v16;
  double v14 = v17[0];
  *a1 = v15;
  *a2 = v13;
  *a3 = v14;
  return result;
}

float *sub_236EF65C4(void *a1, _DWORD *a2, _DWORD *a3, double *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  double v8 = *a4;
  float32x2_t v9 = *v4;
  float32x2_t v10 = v4[1];
  float32x2_t v11 = v4[2];
  float32x2_t v12 = v4[3];
  v16[0] = 0;
  uint64_t result = geom_closest_point_to_cubic_bezier_2f((float *)v16, (float *)v16 + 1, *(float32x2_t *)&v8, v9, v10, v11, v12, (uint64_t)a3, a4);
  uint64_t v14 = v16[0];
  *a1 = v15;
  *a2 = v14;
  *a3 = HIDWORD(v14);
  return result;
}

void sub_236EF6654(double *a1, _DWORD *a2, _DWORD *a3, float32x2_t *a4, unint64_t a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  float32x2_t v6 = *a4;
  float32x2_t v7 = *v5;
  float32x2_t v8 = v5[1];
  float32x2_t v9 = v5[2];
  float32x2_t v10 = v5[3];
  v16[0] = 0;
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a5 >> 16) {
    goto LABEL_5;
  }
  double v14 = geom_approximate_closest_point_to_cubic_bezier_2f((unsigned __int16)a5, (float *)v16, (float *)v16 + 1, v6, v7, v8, v9, v10);
  uint64_t v15 = v16[0];
  *a1 = v14;
  *a2 = v15;
  *a3 = HIDWORD(v15);
}

double *sub_236EF66FC(_OWORD *a1, void *a2, double *a3, double *a4)
{
  v18[1] = *(double *)MEMORY[0x263EF8340];
  float64x2_t v8 = *(float64x2_t *)a4;
  float64x2_t v9 = *v4;
  float64x2_t v10 = v4[1];
  float64x2_t v11 = v4[2];
  float64x2_t v12 = v4[3];
  uint64_t v17 = 0;
  v18[0] = 0.0;
  uint64_t result = geom_closest_point_to_cubic_bezier_2d((double *)&v17, v18, v8, v9, v10, v11, v12, (uint64_t)a3, a4);
  uint64_t v14 = v17;
  double v15 = v18[0];
  *a1 = v16;
  *a2 = v14;
  *a3 = v15;
  return result;
}

void sub_236EF678C(_OWORD *a1, void *a2, double *a3, float64x2_t *a4, unint64_t a5)
{
  v18[1] = *(double *)MEMORY[0x263EF8340];
  float64x2_t v6 = *a4;
  float64x2_t v7 = *v5;
  float64x2_t v8 = v5[1];
  float64x2_t v9 = v5[2];
  float64x2_t v10 = v5[3];
  uint64_t v17 = 0;
  v18[0] = 0.0;
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a5 >> 16) {
    goto LABEL_5;
  }
  *(double *)&long long v14 = geom_approximate_closest_point_to_cubic_bezier_2d((unsigned __int16)a5, (double *)&v17, v18, v6, v7, v8, v9, v10);
  uint64_t v15 = v17;
  double v16 = v18[0];
  *a1 = v14;
  *a2 = v15;
  *a3 = v16;
}

uint64_t sub_236EF6834(int a1, void (**a2)(uint64_t *__return_ptr, int *, void *), _DWORD *a3, double a4, double a5)
{
  void (*v6)(uint64_t *__return_ptr, int *, void *);
  uint64_t v8;
  void v9[2];
  int v10;

  if (!a2) {
    return 0;
  }
  float64x2_t v6 = *a2;
  float64x2_t v10 = a1;
  *(double *)float64x2_t v9 = a4;
  *(double *)&v9[1] = a5;
  swift_retain();
  v6(&v8, &v10, v9);
  swift_release();
  if ((v8 & 0x100000000) != 0) {
    return 0;
  }
  *a3 = v8;
  return 1;
}

uint64_t sub_236EF68C0(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _DWORD *a3, __n128 a4, float a5, __n128 a6, float a7)
{
  void (*v8)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v10;
  _OWORD v11[2];
  int v12;

  if (!a2) {
    return 0;
  }
  a6.n128_f32[2] = a7;
  a4.n128_f32[2] = a5;
  float64x2_t v8 = *a2;
  float64x2_t v12 = a1;
  v11[0] = a4;
  v11[1] = a6;
  swift_retain();
  v8(&v10, &v12, v11);
  swift_release();
  if ((v10 & 0x100000000) != 0) {
    return 0;
  }
  *a3 = v10;
  return 1;
}

int32x2_t sub_236EF6954(int a1, void (**a2)(void *__return_ptr, void, void), double a3)
{
  void (*v3)(void *__return_ptr, void, void);
  uint64_t v5;
  double v6;
  int v7;

  if (a2)
  {
    unint64_t v3 = *a2;
    float64x2_t v7 = a1;
    float64x2_t v6 = a3;
    swift_retain();
    v3(&v5, &v7, &v6);
    swift_release();
    return (int32x2_t)v5;
  }
  else
  {
    return vdup_n_s32(0x7FC00000u);
  }
}

double sub_236EF69C0(int a1, void (**a2)(long long *__return_ptr, int *, __n128 *), __n128 a3)
{
  void (*v3)(long long *__return_ptr, int *, __n128 *);
  long long v5;
  __n128 v6;
  int v7;

  if (!a2) {
    return 2.24711749e307;
  }
  unint64_t v3 = *a2;
  float64x2_t v7 = a1;
  float64x2_t v6 = a3;
  swift_retain();
  v3(&v5, &v7, &v6);
  swift_release();
  return *(double *)&v5;
}

uint64_t sub_236EF6A28(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), void *a3, __n128 a4, __n128 a5)
{
  void (*v6)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v8;
  char v9;
  _OWORD v10[2];
  int v11;

  if (!a2) {
    return 0;
  }
  float64x2_t v6 = *a2;
  float64x2_t v11 = a1;
  v10[0] = a4;
  v10[1] = a5;
  swift_retain();
  v6(&v8, &v11, v10);
  swift_release();
  if (v9) {
    return 0;
  }
  *a3 = v8;
  return 1;
}

uint64_t sub_236EF6AB4(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), void *a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  void (*v8)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v10;
  char v11;
  _OWORD v12[4];
  int v13;

  if (!a2) {
    return 0;
  }
  float64x2_t v8 = *a2;
  uint64_t v13 = a1;
  v12[0] = a4;
  v12[1] = a5;
  float64x2_t v12[2] = a6;
  _OWORD v12[3] = a7;
  swift_retain();
  v8(&v10, &v13, v12);
  swift_release();
  if (v11) {
    return 0;
  }
  *a3 = v10;
  return 1;
}

double sub_236EF6B44(int a1, void (**a2)(long long *__return_ptr, int *, __n128 *), __n128 a3)
{
  void (*v3)(long long *__return_ptr, int *, __n128 *);
  double result;
  long long v5;
  __n128 v6;
  int v7;

  if (a2)
  {
    unint64_t v3 = *a2;
    float64x2_t v7 = a1;
    float64x2_t v6 = a3;
    swift_retain();
    v3(&v5, &v7, &v6);
    swift_release();
    return *(double *)&v5;
  }
  else
  {
    *(void *)&uint64_t result = vdupq_n_s64(0x7FF8000000000000uLL).u64[0];
  }
  return result;
}

double sub_236EF6BB0(int a1, void (**a2)(long long *__return_ptr, int *, _OWORD *), __n128 a3, __n128 a4)
{
  void (*v4)(long long *__return_ptr, int *, _OWORD *);
  double result;
  long long v6;
  _OWORD v7[2];
  int v8;

  if (a2)
  {
    uint64_t v4 = *a2;
    float64x2_t v8 = a1;
    v7[0] = a3;
    v7[1] = a4;
    swift_retain();
    v4(&v6, &v8, v7);
    swift_release();
    return *(double *)&v6;
  }
  else
  {
    *(void *)&uint64_t result = vdupq_n_s64(0x7FF8000000000000uLL).u64[0];
  }
  return result;
}

uint64_t sub_236EF6C20()
{
  return *v0;
}

uint64_t sub_236EF6C28()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t sub_236EF6C30()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t sub_236EF6C38()
{
  return *(unsigned int *)(v0 + 12);
}

uint64_t sub_236EF6C40()
{
  return *(unsigned int *)(v0 + 16);
}

double sub_236EF6C48@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  *(double *)a1 = result;
  *(void *)(a1 + 8) = v3;
  return result;
}

__n128 sub_236EF6C54@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 32);
  long long v3 = *(_OWORD *)(v1 + 48);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_236EF6C60@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 32);
  long long v3 = *(_OWORD *)(v1 + 48);
  long long v4 = *(_OWORD *)(v1 + 64);
  long long v5 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = v5;
  return result;
}

uint64_t OS_geom_bvh_create_opt_2f.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236EF7788((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_2f, geom_bvh_create_opt_get_strategy_builtin_2f, geom_bvh_create_opt_get_strategy_custom_heuristic_2f, a1);
}

uint64_t OS_geom_bvh_create_opt_2f.buildStrategy.setter(uint64_t *a1)
{
  return sub_236EF78B8(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

void (*OS_geom_bvh_create_opt_2f.buildStrategy.modify(void *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v2 = v1;
  long long v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[3] = v2;
  if (geom_bvh_create_opt_uses_builtin_strategy_2f(v2))
  {
    *long long v4 = geom_bvh_create_opt_get_strategy_builtin_2f(v2);
    *((_DWORD *)v4 + 2) = 0;
    *((unsigned char *)v4 + 12) = 0;
    return sub_236EF6E28;
  }
  v4[2] = 0;
  *((_DWORD *)v4 + 8) = 0;
  __n128 result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_2f(v2, v4 + 2, (_DWORD *)v4 + 8);
  if (v4[2])
  {
    int v6 = *((_DWORD *)v4 + 8);
    *long long v4 = v4[2];
    *((_DWORD *)v4 + 2) = v6;
    *((unsigned char *)v4 + 12) = 1;
    return sub_236EF6E28;
  }
  __break(1u);
  return result;
}

void sub_236EF6E28(unsigned int **a1, uint64_t a2)
{
}

uint64_t sub_236EF6E54()
{
  return geom_bvh_create_opt_get_should_copy_input_data_2f(*v0);
}

uint64_t sub_236EF6E70(char a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2f(*v1, a1 & 1);
}

uint64_t (*sub_236EF6E80(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_2f(v3);
  return sub_236EF6ECC;
}

uint64_t sub_236EF6ECC(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EF6EDC()
{
  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2f(*v0);
}

uint64_t sub_236EF6EE4(uint64_t a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2f(*v1, a1);
}

uint64_t (*sub_236EF6EF0(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2f(v3);
  return sub_236EF6F3C;
}

uint64_t sub_236EF6F3C(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2f(a1[1], *a1);
}

uint64_t sub_236EF6F48@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_2f.buildStrategy.getter(a1);
}

uint64_t sub_236EF6F6C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF7BAC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

uint64_t (*sub_236EF6F98(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_2f.buildStrategy.modify(v2);
  return sub_236EE9F48;
}

uint64_t OS_geom_bvh_create_opt_3f.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236EF7788((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_3f, geom_bvh_create_opt_get_strategy_builtin_3f, geom_bvh_create_opt_get_strategy_custom_heuristic_3f, a1);
}

uint64_t OS_geom_bvh_create_opt_3f.buildStrategy.setter(uint64_t *a1)
{
  return sub_236EF78B8(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

void (*OS_geom_bvh_create_opt_3f.buildStrategy.modify(void *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v2 = v1;
  long long v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[3] = v2;
  if (geom_bvh_create_opt_uses_builtin_strategy_3f(v2))
  {
    *long long v4 = geom_bvh_create_opt_get_strategy_builtin_3f(v2);
    *((_DWORD *)v4 + 2) = 0;
    *((unsigned char *)v4 + 12) = 0;
    return sub_236EF71A8;
  }
  v4[2] = 0;
  *((_DWORD *)v4 + 8) = 0;
  __n128 result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_3f(v2, v4 + 2, (_DWORD *)v4 + 8);
  if (v4[2])
  {
    int v6 = *((_DWORD *)v4 + 8);
    *long long v4 = v4[2];
    *((_DWORD *)v4 + 2) = v6;
    *((unsigned char *)v4 + 12) = 1;
    return sub_236EF71A8;
  }
  __break(1u);
  return result;
}

void sub_236EF71A8(unsigned int **a1, uint64_t a2)
{
}

uint64_t sub_236EF71D4()
{
  return geom_bvh_create_opt_get_should_copy_input_data_3f(*v0);
}

uint64_t sub_236EF71F0(char a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3f(*v1, a1 & 1);
}

uint64_t (*sub_236EF7200(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_3f(v3);
  return sub_236EF724C;
}

uint64_t sub_236EF724C(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EF725C()
{
  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3f(*v0);
}

uint64_t sub_236EF7264(uint64_t a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3f(*v1, a1);
}

uint64_t (*sub_236EF7270(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3f(v3);
  return sub_236EF72BC;
}

uint64_t sub_236EF72BC(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3f(a1[1], *a1);
}

uint64_t sub_236EF72C8@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_3f.buildStrategy.getter(a1);
}

uint64_t sub_236EF72EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF7BAC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

uint64_t (*sub_236EF7318(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_3f.buildStrategy.modify(v2);
  return sub_236EE9F48;
}

uint64_t OS_geom_bvh_create_opt_2d.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236EF7788((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_2d, geom_bvh_create_opt_get_strategy_builtin_2d, geom_bvh_create_opt_get_strategy_custom_heuristic_2d, a1);
}

uint64_t OS_geom_bvh_create_opt_2d.buildStrategy.setter(uint64_t *a1)
{
  return sub_236EF78B8(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

void (*OS_geom_bvh_create_opt_2d.buildStrategy.modify(void *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v2 = v1;
  long long v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[3] = v2;
  if (geom_bvh_create_opt_uses_builtin_strategy_2d(v2))
  {
    *long long v4 = geom_bvh_create_opt_get_strategy_builtin_2d(v2);
    *((_DWORD *)v4 + 2) = 0;
    *((unsigned char *)v4 + 12) = 0;
    return sub_236EF7528;
  }
  v4[2] = 0;
  *((_DWORD *)v4 + 8) = 0;
  __n128 result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_2d(v2, v4 + 2, (_DWORD *)v4 + 8);
  if (v4[2])
  {
    int v6 = *((_DWORD *)v4 + 8);
    *long long v4 = v4[2];
    *((_DWORD *)v4 + 2) = v6;
    *((unsigned char *)v4 + 12) = 1;
    return sub_236EF7528;
  }
  __break(1u);
  return result;
}

void sub_236EF7528(unsigned int **a1, uint64_t a2)
{
}

uint64_t sub_236EF7554()
{
  return geom_bvh_create_opt_get_should_copy_input_data_2d(*v0);
}

uint64_t sub_236EF7570(char a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2d(*v1, a1 & 1);
}

uint64_t (*sub_236EF7580(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_2d(v3);
  return sub_236EF75CC;
}

uint64_t sub_236EF75CC(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EF75DC()
{
  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2d(*v0);
}

uint64_t sub_236EF75E4(uint64_t a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2d(*v1, a1);
}

uint64_t (*sub_236EF75F0(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2d(v3);
  return sub_236EF763C;
}

uint64_t sub_236EF763C(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2d(a1[1], *a1);
}

uint64_t sub_236EF7648@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_2d.buildStrategy.getter(a1);
}

uint64_t sub_236EF766C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF7BAC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

uint64_t (*sub_236EF7698(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_2d.buildStrategy.modify(v2);
  return sub_236EE9F48;
}

uint64_t OS_geom_bvh_create_opt_3d.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236EF7788((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_3d, geom_bvh_create_opt_get_strategy_builtin_3d, geom_bvh_create_opt_get_strategy_custom_heuristic_3d, a1);
}

uint64_t sub_236EF7788@<X0>(unsigned int (*a1)(uint64_t)@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t (*a3)(uint64_t, void *, int *)@<X2>, uint64_t a4@<X8>)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a1(v4))
  {
    uint64_t result = a2(v4);
    *(void *)a4 = result;
    *(_DWORD *)(a4 + 8) = 0;
    *(unsigned char *)(a4 + 12) = 0;
  }
  else
  {
    v11[0] = 0;
    int v10 = 0;
    uint64_t result = a3(v4, v11, &v10);
    if (v11[0])
    {
      int v9 = v10;
      *(void *)a4 = v11[0];
      *(_DWORD *)(a4 + 8) = v9;
      *(unsigned char *)(a4 + 12) = 1;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_236EF785C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t), uint64_t (*a6)(uint64_t, uint64_t, void))
{
  uint64_t v7 = *a1;
  uint64_t v8 = *a2;
  if (*((unsigned char *)a1 + 12)) {
    return a6(v8, v7, *((unsigned int *)a1 + 2));
  }
  else {
    return a5(v8, v7);
  }
}

uint64_t OS_geom_bvh_create_opt_3d.buildStrategy.setter(uint64_t *a1)
{
  return sub_236EF78B8(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t sub_236EF78B8(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, void))
{
  uint64_t v6 = *a1;
  if (*((unsigned char *)a1 + 12)) {
    return a3(v3, v6, *((unsigned int *)a1 + 2));
  }
  else {
    return a2(v3, v6);
  }
}

void (*OS_geom_bvh_create_opt_3d.buildStrategy.modify(void *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[3] = v2;
  if (geom_bvh_create_opt_uses_builtin_strategy_3d(v2))
  {
    *uint64_t v4 = geom_bvh_create_opt_get_strategy_builtin_3d(v2);
    *((_DWORD *)v4 + 2) = 0;
    *((unsigned char *)v4 + 12) = 0;
    return sub_236EF79DC;
  }
  v4[2] = 0;
  *((_DWORD *)v4 + 8) = 0;
  uint64_t result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_3d(v2, v4 + 2, (_DWORD *)v4 + 8);
  if (v4[2])
  {
    int v6 = *((_DWORD *)v4 + 8);
    *uint64_t v4 = v4[2];
    *((_DWORD *)v4 + 2) = v6;
    *((unsigned char *)v4 + 12) = 1;
    return sub_236EF79DC;
  }
  __break(1u);
  return result;
}

void sub_236EF79DC(unsigned int **a1, uint64_t a2)
{
}

void sub_236EF7A08(unsigned int **a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t, void))
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)*a1;
  char v6 = *((unsigned char *)*a1 + 12);
  uint64_t v7 = *((void *)*a1 + 3);
  if (v6) {
    a4(v7, v5, v4[2]);
  }
  else {
    a3(v7, v5);
  }
  free(v4);
}

uint64_t sub_236EF7A68()
{
  return geom_bvh_create_opt_get_should_copy_input_data_3d(*v0);
}

uint64_t sub_236EF7A84(char a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3d(*v1, a1 & 1);
}

uint64_t (*sub_236EF7A94(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_3d(v3);
  return sub_236EF7AE0;
}

uint64_t sub_236EF7AE0(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EF7AF0()
{
  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3d(*v0);
}

uint64_t sub_236EF7AF8(uint64_t a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3d(*v1, a1);
}

uint64_t (*sub_236EF7B04(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3d(v3);
  return sub_236EF7B50;
}

uint64_t sub_236EF7B50(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3d(a1[1], *a1);
}

uint64_t sub_236EF7B5C@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_3d.buildStrategy.getter(a1);
}

uint64_t sub_236EF7B80(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF7BAC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t sub_236EF7BAC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t, void))
{
  uint64_t v7 = *v5;
  uint64_t v8 = *a1;
  if (*((unsigned char *)a1 + 12)) {
    return a5(v7, v8, *((unsigned int *)a1 + 2));
  }
  else {
    return a4(v7, v8);
  }
}

uint64_t (*sub_236EF7BD4(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_3d.buildStrategy.modify(v2);
  return sub_236EE9F48;
}

uint64_t OS_geom_bvh_2f.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2f);
}

uint64_t OS_geom_bvh_2f.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EF9724(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2f);
}

OS_geom_bvh_2f __swiftcall OS_geom_bvh_2f.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_2f)sub_236EFB0B8((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, geom_create_bvh_with_default_options_2f);
}

OS_geom_bvh_2f __swiftcall OS_geom_bvh_2f.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2f options)
{
  return (OS_geom_bvh_2f)sub_236EFB12C((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bvh_with_options_2f);
}

Swift::Void __swiftcall OS_geom_bvh_2f.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2f options)
{
  geom_recreate_bvh_with_options_2f(v3, *((void *)centroids._rawValue + 2), (uint64_t)centroids._rawValue + 32, (uint64_t)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_2f.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_2f.statistics()()
{
  Swift::Int v0 = sub_236EF9884((void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_2f);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_2f.nodes.getter()
{
  return sub_236EFC48C(geom_bvh_get_nodes_2f, (uint64_t (*)(uint64_t, void))sub_236EF5874);
}

uint64_t OS_geom_bvh_2f.primitivePartition.getter()
{
  return sub_236EFC48C(geom_bvh_get_primitive_partition_2f, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *OS_geom_bvh_2f.primitives(forNode:)(uint64_t a1)
{
  return sub_236EF9A58(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2f);
}

void *OS_geom_bvh_2f.primitives(forNode:)(unsigned int *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  primitives_for_node_2f = (const void *)geom_bvh_get_primitives_for_node_2f(v1, *a1, v4);
  return sub_236EF53EC(primitives_for_node_2f, v4[0]);
}

unint64_t OS_geom_bvh_2f.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  v12[0] = 0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v11[0] = sub_236EFC8D0;
  v11[1] = v9;
  LODWORD(a2) = geom_bvh_raycast_2f(v4, (uint64_t)sub_236EF8018, (uint64_t)v11, (float *)v12 + 1, (unsigned int *)v12, a3, a4);
  swift_release();
  if (a2) {
    return HIDWORD(v12[0]) | ((unint64_t)LODWORD(v12[0]) << 32);
  }
  else {
    return 0;
  }
}

uint64_t sub_236EF8018(int a1, void (**a2)(uint64_t *__return_ptr, int *, void *), _DWORD *a3, double a4, double a5)
{
  return sub_236EF6834(a1, a2, a3, a4, a5) & 1;
}

double OS_geom_bvh_2f.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float32x2_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v10[0] = sub_236EFC920;
  v10[1] = v7;
  double v8 = geom_bvh_closest_point_2f(v3, (void (*)(void, uint64_t, double))sub_236EF8114, (uint64_t)v10, (float *)v11 + 1, (unsigned int *)v11, a3);
  swift_release();
  return v8;
}

uint64_t sub_236EF8118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2f, a5);
}

uint64_t sub_236EF8130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EF9DE8(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, void, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2f, a6);
}

uint64_t sub_236EF8148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bvh_with_default_options_2f, a3);
}

void sub_236EF8160(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EF8178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_236EF81A4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bvh_with_options_2f);
}

uint64_t sub_236EF81BC(uint64_t a1, uint64_t a2)
{
  return sub_236EF9F44(a1, a2, (void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_2f);
}

uint64_t sub_236EF8228(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_nodes_2f, (uint64_t (*)(uint64_t, void))sub_236EF5874);
}

uint64_t sub_236EF82A8(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_primitive_partition_2f, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *sub_236EF8328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236EFA118(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2f);
}

void *sub_236EF8394(unsigned int *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  unsigned int v2 = *a1;
  uint64_t v3 = *v1;
  v6[0] = 0;
  primitives_for_node_2f = (const void *)geom_bvh_get_primitives_for_node_2f(v3, v2, v6);
  return sub_236EF53EC(primitives_for_node_2f, v6[0]);
}

unint64_t sub_236EF840C@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v5 = *a1;
  double v6 = a1[1];
  id v9[2] = a2;
  v9[3] = a3;
  unint64_t result = OS_geom_bvh_2f.raycast(ray:intersectFunction:)((uint64_t)sub_236EFE6DC, (uint64_t)v9, v5, v6);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v8 & 1;
  return result;
}

void sub_236EF8468(double *a1, _DWORD *a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  float32x2_t v6 = *a3;
  double v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_2f.closestPoint(to:closestPointFunction:)((uint64_t)sub_236EFE69C, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_3f.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3f);
}

uint64_t OS_geom_bvh_3f.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EF9724(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3f);
}

OS_geom_bvh_3f __swiftcall OS_geom_bvh_3f.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_3f)sub_236EFB0B8((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, geom_create_bvh_with_default_options_3f);
}

OS_geom_bvh_3f __swiftcall OS_geom_bvh_3f.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3f options)
{
  return (OS_geom_bvh_3f)sub_236EFB12C((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bvh_with_options_3f);
}

Swift::Void __swiftcall OS_geom_bvh_3f.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3f options)
{
  geom_recreate_bvh_with_options_3f(v3, *((void *)centroids._rawValue + 2), (uint64_t)centroids._rawValue + 32, (uint64_t)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_3f.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_3f.statistics()()
{
  Swift::Int v0 = sub_236EF9884((void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_3f);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_3f.nodes.getter()
{
  return sub_236EFC48C(geom_bvh_get_nodes_3f, (uint64_t (*)(uint64_t, void))sub_236EF5928);
}

uint64_t OS_geom_bvh_3f.primitivePartition.getter()
{
  return sub_236EFC48C(geom_bvh_get_primitive_partition_3f, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *OS_geom_bvh_3f.primitives(forNode:)(uint64_t a1)
{
  return sub_236EF9A58(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

void *OS_geom_bvh_3f.primitives(forNode:)(unsigned int *a1)
{
  return sub_236EF905C(a1, (uint64_t (*)(uint64_t, void, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

unint64_t OS_geom_bvh_3f.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, float32x4_t a3, float32_t a4, __n128 a5, float a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  a3.f32[2] = a4;
  a5.n128_f32[2] = a6;
  __n128 v11 = a5;
  float32x4_t v12 = a3;
  unsigned int v15 = 0;
  unsigned int v14 = 0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v13[0] = sub_236EFC968;
  v13[1] = v9;
  LODWORD(a2) = geom_bvh_raycast_3f(v6, (uint64_t)sub_236EF88A8, (uint64_t)v13, (float *)&v15, &v14, v12, v11);
  swift_release();
  if (a2) {
    return v15 | ((unint64_t)v14 << 32);
  }
  else {
    return 0;
  }
}

uint64_t sub_236EF88A8(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _DWORD *a3, __n128 a4, __n128 a5)
{
  return sub_236EF68C0(a1, a2, a3, a4, a4.n128_f32[2], a5, a5.n128_f32[2]) & 1;
}

__n128 OS_geom_bvh_3f.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float32x4_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v10[0] = sub_236EFC9C0;
  v10[1] = v6;
  __n128 v9 = geom_bvh_closest_point_3f(v3, (void (*)(void, uint64_t, __n128))sub_236EF89A8, (uint64_t)v10, (float *)v11 + 1, (unsigned int *)v11, a3);
  swift_release();
  return v9;
}

double sub_236EF89A8(int a1, void (**a2)(long long *__return_ptr, int *, __n128 *), __n128 a3)
{
  return sub_236EF69C0(a1, a2, a3);
}

uint64_t sub_236EF89C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3f, a5);
}

uint64_t sub_236EF89D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EF9DE8(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, void, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3f, a6);
}

uint64_t sub_236EF89F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bvh_with_default_options_3f, a3);
}

void sub_236EF8A08(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EF8A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_236EF8A4C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bvh_with_options_3f);
}

uint64_t sub_236EF8A64(uint64_t a1, uint64_t a2)
{
  return sub_236EF9F44(a1, a2, (void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_3f);
}

uint64_t sub_236EF8AD0(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_nodes_3f, (uint64_t (*)(uint64_t, void))sub_236EF5928);
}

uint64_t sub_236EF8B50(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_primitive_partition_3f, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *sub_236EF8BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236EFA118(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

void *sub_236EF8C3C(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF95B4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

unint64_t sub_236EF8CA8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  float32x4_t v5 = *(float32x4_t *)a1;
  __n128 v6 = *((__n128 *)a1 + 1);
  id v9[2] = a2;
  v9[3] = a3;
  unint64_t result = OS_geom_bvh_3f.raycast(ray:intersectFunction:)((uint64_t)sub_236EFE644, (uint64_t)v9, v5, v5.f32[2], v6, v6.n128_f32[2]);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v8 & 1;
  return result;
}

void sub_236EF8D0C(__n128 *a1, _DWORD *a2, float32x4_t *a3, uint64_t a4, uint64_t a5)
{
  float32x4_t v6 = *a3;
  double v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_3f.closestPoint(to:closestPointFunction:)((uint64_t)sub_236EFE5C0, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_2d.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2d);
}

uint64_t OS_geom_bvh_2d.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EF9724(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2d);
}

OS_geom_bvh_2d __swiftcall OS_geom_bvh_2d.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_2d)sub_236EFB0B8((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, geom_create_bvh_with_default_options_2d);
}

OS_geom_bvh_2d __swiftcall OS_geom_bvh_2d.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2d options)
{
  return (OS_geom_bvh_2d)sub_236EFB12C((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bvh_with_options_2d);
}

Swift::Void __swiftcall OS_geom_bvh_2d.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2d options)
{
  geom_recreate_bvh_with_options_2d(v3, *((void *)centroids._rawValue + 2), (uint64_t)centroids._rawValue + 32, (uint64_t)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_2d.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_2d.statistics()()
{
  Swift::Int v0 = sub_236EF9884((void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_2d);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_2d.nodes.getter()
{
  return sub_236EFC48C(geom_bvh_get_nodes_2d, (uint64_t (*)(uint64_t, void))sub_236EF5934);
}

uint64_t OS_geom_bvh_2d.primitivePartition.getter()
{
  return sub_236EFC48C(geom_bvh_get_primitive_partition_2d, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *OS_geom_bvh_2d.primitives(forNode:)(uint64_t a1)
{
  return sub_236EF9A58(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

void *OS_geom_bvh_2d.primitives(forNode:)(unsigned int *a1)
{
  return sub_236EF905C(a1, (uint64_t (*)(uint64_t, void, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

void *sub_236EF905C(unsigned int *a1, uint64_t (*a2)(uint64_t, void, uint64_t *))
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = (const void *)a2(v2, *a1, v5);
  return sub_236EF53EC(v3, v5[0]);
}

uint64_t OS_geom_bvh_2d.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3, __n128 a4)
{
  v13[1] = *(double *)MEMORY[0x263EF8340];
  v13[0] = 0.0;
  unsigned int v12 = 0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v11[0] = sub_236EFCA08;
  v11[1] = v7;
  LODWORD(a2) = geom_bvh_raycast_2d(v4, (uint64_t)sub_236EF91D0, (uint64_t)v11, v13, &v12, a3, a4);
  swift_release();
  if (a2) {
    return *(void *)&v13[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_236EF91D0(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), void *a3, __n128 a4, __n128 a5)
{
  return sub_236EF6A28(a1, a2, a3, a4, a5) & 1;
}

__n128 OS_geom_bvh_2d.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3)
{
  v12[1] = *(double *)MEMORY[0x263EF8340];
  v12[0] = 0.0;
  unsigned int v11 = 0;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v10[0] = sub_236EFCA58;
  v10[1] = v6;
  __n128 v9 = geom_bvh_closest_point_2d(v3, (void (*)(void, uint64_t, __n128))sub_236EF92C8, (uint64_t)v10, v12, &v11, a3);
  swift_release();
  return v9;
}

uint64_t sub_236EF92CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2d, a5);
}

uint64_t sub_236EF92E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EF9DE8(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, void, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2d, a6);
}

uint64_t sub_236EF92FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bvh_with_default_options_2d, a3);
}

void sub_236EF9314(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EF932C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_236EF9358(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bvh_with_options_2d);
}

uint64_t sub_236EF9370(uint64_t a1, uint64_t a2)
{
  return sub_236EF9F44(a1, a2, (void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_2d);
}

uint64_t sub_236EF93DC(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_nodes_2d, (uint64_t (*)(uint64_t, void))sub_236EF5934);
}

uint64_t sub_236EF945C(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_primitive_partition_2d, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *sub_236EF94DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236EFA118(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

void *sub_236EF9548(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return sub_236EF95B4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

void *sub_236EF95B4(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t *))
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  uint64_t v6 = *v4;
  v9[0] = 0;
  uint64_t v7 = (const void *)a4(v6, v5, v9);
  return sub_236EF53EC(v7, v9[0]);
}

uint64_t sub_236EF9630@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  float64x2_t v5 = *(float64x2_t *)a1;
  __n128 v6 = *((__n128 *)a1 + 1);
  void v10[2] = a2;
  v10[3] = a3;
  uint64_t result = OS_geom_bvh_2d.raycast(ray:intersectFunction:)((uint64_t)sub_236EFE600, (uint64_t)v10, v5, v6);
  *(void *)a4 = result;
  *(_DWORD *)(a4 + 8) = v8;
  *(unsigned char *)(a4 + 12) = v9 & 1;
  return result;
}

void sub_236EF9690(__n128 *a1, void *a2, float64x2_t *a3, uint64_t a4, uint64_t a5)
{
  float64x2_t v6 = *a3;
  double v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_2d.closestPoint(to:closestPointFunction:)((uint64_t)sub_236EFE5C0, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_3d.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3d);
}

uint64_t OS_geom_bvh_3d.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EF9724(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3d);
}

uint64_t sub_236EF9724(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    uint64_t v6 = a6(*(void *)(result + 16), result + 32, a2 + 32, a3, a4, a5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

OS_geom_bvh_3d __swiftcall OS_geom_bvh_3d.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_3d)sub_236EFB0B8((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, geom_create_bvh_with_default_options_3d);
}

OS_geom_bvh_3d __swiftcall OS_geom_bvh_3d.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3d options)
{
  return (OS_geom_bvh_3d)sub_236EFB12C((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bvh_with_options_3d);
}

Swift::Void __swiftcall OS_geom_bvh_3d.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3d options)
{
  geom_recreate_bvh_with_options_3d(v3, *((void *)centroids._rawValue + 2), (uint64_t)centroids._rawValue + 32, (uint64_t)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_3d.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_3d.statistics()()
{
  Swift::Int v0 = sub_236EF9884((void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_3d);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t sub_236EF9884(void (*a1)(uint64_t, char *, void *))
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = 0;
  a1(v1, (char *)v3 + 4, v3);
  return HIDWORD(v3[0]);
}

uint64_t OS_geom_bvh_3d.nodes.getter()
{
  return sub_236EFC48C(geom_bvh_get_nodes_3d, (uint64_t (*)(uint64_t, void))sub_236EF59E4);
}

uint64_t OS_geom_bvh_3d.primitivePartition.getter()
{
  return sub_236EFC48C(geom_bvh_get_primitive_partition_3d, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *OS_geom_bvh_3d.primitives(forNode:)(uint64_t a1)
{
  return sub_236EF9A58(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3d);
}

void *sub_236EF9A58(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t *))
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = (const void *)a2(v2, a1, v5);
  return sub_236EF53EC(v3, v5[0]);
}

void *OS_geom_bvh_3d.primitives(forNode:)(unsigned int *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  primitives_for_node_3d = (const void *)geom_bvh_get_primitives_for_node_3d(v1, *a1, v4);
  return sub_236EF53EC(primitives_for_node_3d, v4[0]);
}

uint64_t OS_geom_bvh_3d.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  v18[1] = *(double *)MEMORY[0x263EF8340];
  v18[0] = 0.0;
  unsigned int v17 = 0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v16[0] = sub_236EFCAA0;
  v16[1] = v9;
  v15[0] = (__int128)a3;
  v15[1] = (__int128)a4;
  void v15[2] = (__int128)a5;
  _OWORD v15[3] = (__int128)a6;
  LODWORD(a2) = geom_bvh_raycast_3d(v6, (uint64_t)sub_236EF9C60, v15, (uint64_t)v16, v18, &v17);
  swift_release();
  if (a2) {
    return *(void *)&v18[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_236EF9C60(int a1, __n128 *a2, void (**a3)(uint64_t *__return_ptr, int *, _OWORD *), void *a4, double a5, __n128 a6, double a7, __n128 a8)
{
  a6.n128_u64[0] = a2[1].n128_u64[0];
  a8.n128_u64[0] = a2[3].n128_u64[0];
  return sub_236EF6AB4(a1, a3, a4, *a2, a6, a2[2], a8) & 1;
}

__n128 OS_geom_bvh_3d.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3, float64x2_t a4)
{
  v16[1] = *(double *)MEMORY[0x263EF8340];
  v16[0] = 0.0;
  unsigned int v15 = 0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v14[0] = sub_236EFCAFC;
  v14[1] = v7;
  v13[0] = a3;
  v13[1] = a4;
  geom_bvh_closest_point_3d(v4, (void (*)(float64x2_t *__return_ptr, uint64_t, _OWORD *, uint64_t))sub_236EF9D88, v13, (uint64_t)v14, v16, &v15, (uint64_t)&v12);
  long long v10 = v12;
  swift_release();
  return (__n128)v10;
}

void sub_236EF9D88(int a1@<W0>, __n128 *a2@<X1>, void (**a3)(long long *__return_ptr, int *, _OWORD *)@<X2>, _OWORD *a4@<X8>)
{
  *(double *)&long long v5 = sub_236EF6BB0(a1, a3, *a2, a2[1]);
  *a4 = v5;
  a4[1] = v6;
}

uint64_t sub_236EF9DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3d, a5);
}

uint64_t sub_236EF9DD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EF9DE8(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, uint64_t, void, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3d, a6);
}

uint64_t sub_236EF9DE8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t (*a6)(void, uint64_t, uint64_t, void, uint64_t, unint64_t)@<X7>, uint64_t *a7@<X8>)
{
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    uint64_t v8 = a6(*(void *)(result + 16), result + 32, a2 + 32, *a3, a4, a5);
    swift_bridgeObjectRelease();
    Swift::tuple_maxLevel_Int_sumOfLevels_Int result = swift_bridgeObjectRelease();
    *a7 = v8;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_236EF9E64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bvh_with_default_options_3d, a3);
}

void sub_236EF9E7C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EF9E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_236EF9EC0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bvh_with_options_3d);
}

uint64_t sub_236EF9ED8(uint64_t a1, uint64_t a2)
{
  return sub_236EF9F44(a1, a2, (void (*)(uint64_t, char *, void *))geom_bvh_tree_statistics_3d);
}

uint64_t sub_236EF9F44(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *, void *))
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v3;
  v6[0] = 0;
  a3(v4, (char *)v6 + 4, v6);
  return HIDWORD(v6[0]);
}

uint64_t sub_236EF9FAC(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_nodes_3d, (uint64_t (*)(uint64_t, void))sub_236EF59E4);
}

uint64_t sub_236EFA02C(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_bvh_get_primitive_partition_3d, (uint64_t (*)(uint64_t, void))sub_236EF53EC);
}

void *sub_236EFA0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236EFA118(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3d);
}

void *sub_236EFA118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t *))
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *v4;
  v9[0] = 0;
  uint64_t v7 = (const void *)a4(v6, a1, v9);
  return sub_236EF53EC(v7, v9[0]);
}

void *sub_236EFA194(unsigned int *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  unsigned int v2 = *a1;
  uint64_t v3 = *v1;
  v6[0] = 0;
  primitives_for_node_3d = (const void *)geom_bvh_get_primitives_for_node_3d(v3, v2, v6);
  return sub_236EF53EC(primitives_for_node_3d, v6[0]);
}

uint64_t sub_236EFA20C@<X0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, __n128 a5@<Q1>, __n128 a6@<Q3>)
{
  __n128 v7 = *a1;
  __n128 v8 = a1[2];
  double v12[2] = a2;
  _OWORD v12[3] = a3;
  a5.n128_u64[0] = a1[1].n128_u64[0];
  a6.n128_u64[0] = a1[3].n128_u64[0];
  uint64_t result = OS_geom_bvh_3d.raycast(ray:intersectFunction:)((uint64_t)sub_236EFE578, (uint64_t)v12, v7, a5, v8, a6);
  *(void *)a4 = result;
  *(_DWORD *)(a4 + 8) = v10;
  *(unsigned char *)(a4 + 12) = v11 & 1;
  return result;
}

void sub_236EFA278(uint64_t a1, void *a2, float64x2_t *a3, uint64_t a4, uint64_t a5)
{
  float64x2_t v7 = *a3;
  float64x2_t v8 = a3[1];
  void v11[2] = a4;
  v11[3] = a5;
  *(__n128 *)a1 = OS_geom_bvh_3d.closestPoint(to:closestPointFunction:)((uint64_t)sub_236EFE538, (uint64_t)v11, v7, v8);
  *(_OWORD *)(a1 + 16) = v9;
  *a2 = v10;
}

uint64_t OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFA614(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3f);
}

uint64_t OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EFA694(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3f);
}

OS_geom_triangle_mesh_bvh_3f __swiftcall OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_triangle_mesh_bvh_3f)sub_236EFA72C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3f);
}

OS_geom_triangle_mesh_bvh_3f __swiftcall OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3f options)
{
  return (OS_geom_triangle_mesh_bvh_3f)sub_236EFA7B4((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, void *))geom_create_triangle_mesh_bvh_with_options_3f);
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3f.reinit(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3f options)
{
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3f.reinit(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
}

uint64_t OS_geom_triangle_mesh_bvh_3f.raycast(ray:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, __n128 a4@<Q2>, float a5@<S3>)
{
  v12[1] = *MEMORY[0x263EF8340];
  a2.f32[2] = a3;
  a4.n128_f32[2] = a5;
  v12[0] = 0;
  int32x4_t v11 = 0uLL;
  uint64_t result = geom_triangle_mesh_bvh_raycast_3f(v5, (float *)v12 + 1, (unsigned int *)v12, &v11, a2, a4);
  if (result)
  {
    uint64_t v9 = v11.i64[1];
    uint64_t v8 = v11.i64[0];
    unint64_t v10 = HIDWORD(v12[0]) | ((unint64_t)LODWORD(v12[0]) << 32);
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = result ^ 1;
  return result;
}

void OS_geom_triangle_mesh_bvh_3f.closestPoint(to:)(uint64_t a1@<X8>, float32x4_t a2@<Q0>)
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = 0;
  float32x4_t v7 = 0uLL;
  *(double *)&long long v4 = geom_triangle_mesh_bvh_closest_point_3f(v2, (float *)v8 + 1, (unsigned int *)v8, &v7, a2);
  float32x4_t v5 = v7;
  unint64_t v6 = HIDWORD(v8[0]) | ((unint64_t)LODWORD(v8[0]) << 32);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 0;
  *(float32x4_t *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 48) = 0;
}

uint64_t sub_236EFA4B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFAAC4(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3f, a5);
}

uint64_t sub_236EFA4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EFAB44(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, void, uint64_t, void, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3f, a6);
}

uint64_t sub_236EFA4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFABDC(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3f, a3);
}

void sub_236EFA500(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

uint64_t sub_236EFA518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OS_geom_triangle_mesh_bvh_3f.raycast(ray:)((uint64_t)v4, *(float32x4_t *)a1, COERCE_FLOAT32_T(*(void *)(a1 + 8)), *(__n128 *)(a1 + 16), COERCE_FLOAT(*(void *)(a1 + 24)));
  return sub_236EFE4D4((uint64_t)v4, a2, &qword_2688DF758);
}

void sub_236EFA56C(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  v10[1] = *MEMORY[0x263EF8340];
  float32x4_t v4 = *a1;
  float32x4_t v5 = *v2;
  v10[0] = 0;
  float32x4_t v9 = 0uLL;
  *(double *)&long long v6 = geom_triangle_mesh_bvh_closest_point_3f(v5, (float *)v10 + 1, (unsigned int *)v10, &v9, v4);
  float32x4_t v7 = v9;
  unint64_t v8 = HIDWORD(v10[0]) | ((unint64_t)LODWORD(v10[0]) << 32);
  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = 0;
  *(float32x4_t *)(a2 + 32) = v7;
  *(unsigned char *)(a2 + 48) = 0;
}

uint64_t OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFA614(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3d);
}

uint64_t sub_236EFA614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a5(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_236EFA694(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3d);
}

uint64_t sub_236EFA694(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void, uint64_t, void, uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    uint64_t v6 = a6(*(void *)(result + 16), result + 32, *(void *)(a2 + 16), a2 + 32, a3, a4, a5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

OS_geom_triangle_mesh_bvh_3d __swiftcall OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_triangle_mesh_bvh_3d)sub_236EFA72C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3d);
}

uint64_t sub_236EFA72C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

OS_geom_triangle_mesh_bvh_3d __swiftcall OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3d options)
{
  return (OS_geom_triangle_mesh_bvh_3d)sub_236EFA7B4((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t, void *))geom_create_triangle_mesh_bvh_with_options_3d);
}

uint64_t sub_236EFA7B4(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void, uint64_t, unint64_t, uint64_t, void *))
{
  uint64_t v5 = a4(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v5;
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3d.reinit(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3d options)
{
}

uint64_t sub_236EFA848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t))
{
  return a4(v4, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3);
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3d.reinit(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
}

void sub_236EFA8AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(uint64_t, void, uint64_t, unint64_t, uint64_t, id))
{
  id v8 = (id)a3();
  a4(v4, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, v8);
}

uint64_t OS_geom_triangle_mesh_bvh_3d.raycast(ray:)@<X0>(uint64_t a1@<X8>, long long a2@<Q0>, __n128 a3@<Q1>, long long a4@<Q2>, long long a5@<Q3>)
{
  v18[1] = *(double *)MEMORY[0x263EF8340];
  v18[0] = 0.0;
  unsigned int v17 = 0;
  int64x2_t v15 = 0u;
  long long v16 = 0u;
  v14[0] = a2;
  v14[1] = (__int128)a3;
  void v14[2] = a4;
  v14[3] = a5;
  uint64_t result = geom_triangle_mesh_bvh_raycast_3d(v5, v14, v18, &v17, &v15, *(double *)&a2, a3);
  double v8 = 0.0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (result)
  {
    double v8 = v18[0];
    uint64_t v9 = v17;
    uint64_t v11 = v15.i64[1];
    uint64_t v10 = v15.i64[0];
    uint64_t v13 = *((void *)&v16 + 1);
    uint64_t v12 = v16;
  }
  *(double *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v13;
  *(unsigned char *)(a1 + 48) = result ^ 1;
  return result;
}

double OS_geom_triangle_mesh_bvh_3d.closestPoint(to:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  v19[1] = *(double *)MEMORY[0x263EF8340];
  v19[0] = 0.0;
  unsigned int v18 = 0;
  int64x2_t v16 = 0u;
  long long v17 = 0u;
  v15[0] = a2;
  v15[1] = a3;
  geom_triangle_mesh_bvh_closest_point_3d(v3, v15, v19, (int *)&v18, &v16, &v12);
  uint64_t v6 = v13;
  uint64_t v5 = v14;
  double result = *(double *)v12.i64;
  double v8 = v19[0];
  uint64_t v9 = v18;
  long long v10 = v17;
  int64x2_t v11 = v16;
  *(int64x2_t *)a1 = v12;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(double *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(int64x2_t *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_236EFAAAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFAAC4(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3d, a5);
}

uint64_t sub_236EFAAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void, uint64_t, void, uint64_t, uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v7 = a5(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a6 = v7;
  return result;
}

uint64_t sub_236EFAB2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_236EFAB44(a1, a2, a3, a4, a5, (uint64_t (*)(void, uint64_t, void, uint64_t, void, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3d, a6);
}

uint64_t sub_236EFAB44@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t (*a6)(void, uint64_t, void, uint64_t, void, uint64_t, unint64_t)@<X7>, uint64_t *a7@<X8>)
{
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    uint64_t v8 = a6(*(void *)(result + 16), result + 32, *(void *)(a2 + 16), a2 + 32, *a3, a4, a5);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a7 = v8;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_236EFABC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFABDC(a1, a2, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3d, a3);
}

uint64_t sub_236EFABDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_236EFAC4C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EFAC64(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(void, uint64_t, unint64_t, uint64_t, void)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v6 = (void *)*a3;
  uint64_t v7 = a4(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, *a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a5 = v7;
}

uint64_t sub_236EFACE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q1>, __n128 a4@<Q3>)
{
  a3.n128_u64[0] = *(void *)(a1 + 16);
  a4.n128_u64[0] = *(void *)(a1 + 48);
  OS_geom_triangle_mesh_bvh_3d.raycast(ray:)((uint64_t)v6, *(_OWORD *)a1, a3, *(_OWORD *)(a1 + 32), *(_OWORD *)&a4);
  return sub_236EFE4D4((uint64_t)v6, a2, &qword_2688DF750);
}

double sub_236EFAD40@<D0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  v21[1] = *(double *)MEMORY[0x263EF8340];
  long long v4 = *a1;
  long long v5 = a1[1];
  uint64_t v6 = *v2;
  v21[0] = 0.0;
  unsigned int v20 = 0;
  int64x2_t v18 = 0u;
  long long v19 = 0u;
  v17[0] = v4;
  v17[1] = v5;
  geom_triangle_mesh_bvh_closest_point_3d(v6, v17, v21, (int *)&v20, &v18, &v14);
  uint64_t v8 = v15;
  uint64_t v7 = v16;
  double result = *(double *)v14.i64;
  double v10 = v21[0];
  uint64_t v11 = v20;
  long long v12 = v19;
  int64x2_t v13 = v18;
  *(int64x2_t *)a2 = v14;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = v10;
  *(void *)(a2 + 40) = v11;
  *(int64x2_t *)(a2 + 48) = v13;
  *(_OWORD *)(a2 + 64) = v12;
  *(unsigned char *)(a2 + 80) = 0;
  return result;
}

uint64_t OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2f);
}

OS_geom_bezier_curve_bvh_2f __swiftcall OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  return (OS_geom_bezier_curve_bvh_2f)sub_236EFB0B8((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, geom_create_bezier_curve_bvh_with_default_options_2f);
}

OS_geom_bezier_curve_bvh_2f __swiftcall OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2f options)
{
  return (OS_geom_bezier_curve_bvh_2f)sub_236EFB12C((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bezier_curve_bvh_with_options_2f);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2f.reinit(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2f options)
{
  geom_recreate_bezier_curve_bvh_with_options_2f(v3, *((void *)accumulatedPointCount._rawValue + 2), (uint64_t)accumulatedPointCount._rawValue + 32, (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2f.reinit(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
}

double OS_geom_bezier_curve_bvh_2f.closestPoint(to:)(float32x2_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v4 = 0;
  double v3 = 0.0;
  return geom_bezier_curve_bvh_closest_point_2f(v1, (float *)&v4, (unsigned int *)&v3 + 1, &v3, a1);
}

uint64_t sub_236EFAF08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2f, a5);
}

uint64_t sub_236EFAF20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bezier_curve_bvh_with_default_options_2f, a3);
}

void sub_236EFAF38(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EFAF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_236EFAF7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bezier_curve_bvh_with_options_2f);
}

void sub_236EFAF94(float32x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  v10[1] = *MEMORY[0x263EF8340];
  float32x2_t v4 = *a1;
  uint64_t v5 = *v2;
  v10[0] = 0;
  int v9 = 0;
  double v6 = geom_bezier_curve_bvh_closest_point_2f(v5, (float *)v10 + 1, (unsigned int *)v10, (double *)&v9, v4);
  int v7 = v9;
  unint64_t v8 = HIDWORD(v10[0]) | ((unint64_t)LODWORD(v10[0]) << 32);
  *(double *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(_DWORD *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 20) = 0;
}

uint64_t OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_236EFB03C(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2d);
}

uint64_t sub_236EFB03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a5(*(void *)(a1 + 16), a1 + 32, a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

OS_geom_bezier_curve_bvh_2d __swiftcall OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  return (OS_geom_bezier_curve_bvh_2d)sub_236EFB0B8((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, geom_create_bezier_curve_bvh_with_default_options_2d);
}

uint64_t sub_236EFB0B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

OS_geom_bezier_curve_bvh_2d __swiftcall OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2d options)
{
  return (OS_geom_bezier_curve_bvh_2d)sub_236EFB12C((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, uint64_t, void *))geom_create_bezier_curve_bvh_with_options_2d);
}

uint64_t sub_236EFB12C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void, uint64_t, uint64_t, void *))
{
  uint64_t v5 = a4(*(void *)(a1 + 16), a1 + 32, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v5;
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2d.reinit(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2d options)
{
  geom_recreate_bezier_curve_bvh_with_options_2d(v3, *((void *)accumulatedPointCount._rawValue + 2), (uint64_t)accumulatedPointCount._rawValue + 32, (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2d.reinit(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
}

void sub_236EFB1DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(uint64_t, void, uint64_t, uint64_t, id))
{
  id v8 = (id)a3();
  a4(v4, *(void *)(a1 + 16), a1 + 32, a2 + 32, v8);
}

void OS_geom_bezier_curve_bvh_2d.closestPoint(to:)(uint64_t a1@<X8>, float64x2_t a2@<Q0>)
{
  v10[1] = *(double *)MEMORY[0x263EF8340];
  v10[0] = 0.0;
  unsigned int v9 = 0;
  double v8 = 0.0;
  geom_bezier_curve_bvh_closest_point_2d(v2, v10, &v9, &v8, a2);
  double v4 = v10[0];
  uint64_t v5 = v9;
  double v6 = v8;
  *(_OWORD *)a1 = v7;
  *(double *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(double *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t sub_236EFB2E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_236EFB2F8(a1, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2d, a5);
}

uint64_t sub_236EFB2F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v7 = a5(*(void *)(a1 + 16), a1 + 32, a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a6 = v7;
  return result;
}

uint64_t sub_236EFB35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFB374(a1, a2, geom_create_bezier_curve_bvh_with_default_options_2d, a3);
}

uint64_t sub_236EFB374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a3(*(void *)(a1 + 16), a1 + 32, a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_236EFB3D0(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_236EFB3E8(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(void, uint64_t, uint64_t, void)@<X5>, uint64_t *a5@<X8>)
{
  double v6 = (void *)*a3;
  uint64_t v7 = a4(*(void *)(a1 + 16), a1 + 32, a2 + 32, *a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a5 = v7;
}

void sub_236EFB458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_236EFB484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(uint64_t, void, uint64_t, uint64_t, id))
{
  uint64_t v10 = *v6;
  id v11 = (id)a5();
  a6(v10, *(void *)(a1 + 16), a1 + 32, a2 + 32, v11);
}

uint64_t sub_236EFB4FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_236EFB514(a1, a2, a3, a4, a5, geom_recreate_bezier_curve_bvh_with_options_2d);
}

uint64_t sub_236EFB514(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, void, uint64_t, uint64_t, void))
{
  return a6(*v6, *(void *)(a1 + 16), a1 + 32, a2 + 32, *a3);
}

void sub_236EFB538(float64x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  v12[1] = *(double *)MEMORY[0x263EF8340];
  float64x2_t v4 = *a1;
  uint64_t v5 = *v2;
  v12[0] = 0.0;
  unsigned int v11 = 0;
  double v10 = 0.0;
  geom_bezier_curve_bvh_closest_point_2d(v5, v12, &v11, &v10, v4);
  double v6 = v12[0];
  uint64_t v7 = v11;
  double v8 = v10;
  *(_OWORD *)a2 = v9;
  *(double *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 40) = 0;
}

uint64_t sub_236EFB5CC()
{
  return geom_kd_tree_create_opt_get_should_copy_input_data_2f(*v0);
}

uint64_t sub_236EFB5E8(char a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2f(*v1, a1 & 1);
}

uint64_t (*sub_236EFB5F8(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_2f(v3);
  return sub_236EFB644;
}

uint64_t sub_236EFB644(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EFB654()
{
  return geom_kd_tree_create_opt_get_build_strategy_2f(*v0);
}

uint64_t sub_236EFB65C(int a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2f(*v1, a1);
}

uint64_t (*sub_236EFB668(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_2f(v3);
  return sub_236EFB6B4;
}

uint64_t sub_236EFB6B4(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2f(*(void *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_236EFB6C4()
{
  return geom_kd_tree_create_opt_get_should_copy_input_data_3f(*v0);
}

uint64_t sub_236EFB6E0(char a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3f(*v1, a1 & 1);
}

uint64_t (*sub_236EFB6F0(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_3f(v3);
  return sub_236EFB73C;
}

uint64_t sub_236EFB73C(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3f(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EFB74C()
{
  return geom_kd_tree_create_opt_get_build_strategy_3f(*v0);
}

uint64_t sub_236EFB754(int a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3f(*v1, a1);
}

uint64_t (*sub_236EFB760(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_3f(v3);
  return sub_236EFB7AC;
}

uint64_t sub_236EFB7AC(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3f(*(void *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_236EFB7BC()
{
  return geom_kd_tree_create_opt_get_should_copy_input_data_2d(*v0);
}

uint64_t sub_236EFB7D8(char a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2d(*v1, a1 & 1);
}

uint64_t (*sub_236EFB7E8(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_2d(v3);
  return sub_236EFB834;
}

uint64_t sub_236EFB834(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EFB844()
{
  return geom_kd_tree_create_opt_get_build_strategy_2d(*v0);
}

uint64_t sub_236EFB84C(int a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2d(*v1, a1);
}

uint64_t (*sub_236EFB858(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_2d(v3);
  return sub_236EFB8A4;
}

uint64_t sub_236EFB8A4(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2d(*(void *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_236EFB8B4()
{
  return geom_kd_tree_create_opt_get_should_copy_input_data_3d(*v0);
}

uint64_t sub_236EFB8D0(char a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3d(*v1, a1 & 1);
}

uint64_t (*sub_236EFB8E0(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_3d(v3);
  return sub_236EFB92C;
}

uint64_t sub_236EFB92C(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3d(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_236EFB93C()
{
  return geom_kd_tree_create_opt_get_build_strategy_3d(*v0);
}

uint64_t sub_236EFB944(int a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3d(*v1, a1);
}

uint64_t (*sub_236EFB950(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_3d(v3);
  return sub_236EFB99C;
}

uint64_t sub_236EFB99C(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3d(*(void *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t static KDTree.rootNode.getter()
{
  return 1;
}

uint64_t static KDTree.leftChild(ofNode:)(int a1)
{
  return (2 * a1);
}

uint64_t static KDTree.rightChild(ofNode:)(int a1)
{
  return (2 * a1) | 1u;
}

uint64_t KDTree.value(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 136))(a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 104))(a1, a2, a3);
  swift_getAssociatedTypeWitness();
  sub_236F12A70();
  return swift_unknownObjectRelease();
}

uint64_t OS_geom_kd_tree_2f.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_236EFC24C(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_2f);
}

OS_geom_kd_tree_2f __swiftcall OS_geom_kd_tree_2f.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_2f)sub_236EFC2AC((uint64_t)points._rawValue, geom_create_kd_tree_with_default_options_2f);
}

OS_geom_kd_tree_2f __swiftcall OS_geom_kd_tree_2f.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2f options)
{
  return (OS_geom_kd_tree_2f)sub_236EFC308((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, void *))geom_create_kd_tree_with_options_2f);
}

Swift::Void __swiftcall OS_geom_kd_tree_2f.reinit(points:)(Swift::OpaquePointer points)
{
}

Swift::Void __swiftcall OS_geom_kd_tree_2f.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2f options)
{
  geom_recreate_kd_tree_with_options_2f(v2, *((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_2f.points.getter()
{
  return sub_236EFC48C(geom_kd_tree_points_2f, (uint64_t (*)(uint64_t, void))sub_236EF5490);
}

uint64_t sub_236EFBBBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFC530(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_2f, a3);
}

uint64_t sub_236EFBBD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236EFC598(a1, geom_create_kd_tree_with_default_options_2f, a2);
}

void sub_236EFBBEC(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
}

void sub_236EFBC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_236EFBC30(uint64_t a1, uint64_t *a2)
{
  return geom_recreate_kd_tree_with_options_2f(*v2, *(void *)(a1 + 16), a1 + 32, *a2);
}

BOOL sub_236EFBC48(unsigned int a1)
{
  return geom_kd_tree_is_node_valid_2f(*v1, a1);
}

uint64_t sub_236EFBC68(unsigned int a1)
{
  return geom_kd_tree_get_node_value_index_2f(*v1, a1);
}

uint64_t sub_236EFBC74(unsigned int a1)
{
  return geom_kd_tree_get_node_split_axis_2f(*v1, a1);
}

uint64_t sub_236EFBC94(float32x2_t *a1)
{
  return geom_kd_tree_find_closest_2f(*v1, *a1);
}

uint64_t sub_236EFBCA0(float32x2_t *a1, float *a2, uint64_t a3)
{
  return geom_kd_tree_find_within_radius_2f(*v3, a3, *a1, *a2);
}

uint64_t sub_236EFBCB4(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_kd_tree_points_2f, (uint64_t (*)(uint64_t, void))sub_236EF5490);
}

uint64_t OS_geom_kd_tree_3f.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_236EFC24C(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_3f);
}

OS_geom_kd_tree_3f __swiftcall OS_geom_kd_tree_3f.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_3f)sub_236EFC2AC((uint64_t)points._rawValue, geom_create_kd_tree_with_default_options_3f);
}

OS_geom_kd_tree_3f __swiftcall OS_geom_kd_tree_3f.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3f options)
{
  return (OS_geom_kd_tree_3f)sub_236EFC308((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, void *))geom_create_kd_tree_with_options_3f);
}

Swift::Void __swiftcall OS_geom_kd_tree_3f.reinit(points:)(Swift::OpaquePointer points)
{
}

Swift::Void __swiftcall OS_geom_kd_tree_3f.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3f options)
{
  geom_recreate_kd_tree_with_options_3f(v2, *((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_3f.points.getter()
{
  return sub_236EFC48C(geom_kd_tree_points_3f, (uint64_t (*)(uint64_t, void))sub_236EF533C);
}

uint64_t sub_236EFBE3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFC530(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_3f, a3);
}

uint64_t sub_236EFBE54@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236EFC598(a1, geom_create_kd_tree_with_default_options_3f, a2);
}

void sub_236EFBE6C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
}

void sub_236EFBE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_236EFBEB0(uint64_t a1, uint64_t *a2)
{
  return geom_recreate_kd_tree_with_options_3f(*v2, *(void *)(a1 + 16), a1 + 32, *a2);
}

BOOL sub_236EFBEC8(unsigned int a1)
{
  return geom_kd_tree_is_node_valid_3f(*v1, a1);
}

uint64_t sub_236EFBEE8(unsigned int a1)
{
  return geom_kd_tree_get_node_value_index_3f(*v1, a1);
}

uint64_t sub_236EFBEF4(unsigned int a1)
{
  return geom_kd_tree_get_node_split_axis_3f(*v1, a1);
}

uint64_t sub_236EFBF14(float32x4_t *a1)
{
  return geom_kd_tree_find_closest_3f(*v1, *a1);
}

uint64_t sub_236EFBF20(float32x4_t *a1, float *a2, uint64_t a3)
{
  return geom_kd_tree_find_within_radius_3f(*v3, a3, *a1, *a2);
}

uint64_t sub_236EFBF34(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_kd_tree_points_3f, (uint64_t (*)(uint64_t, void))sub_236EF533C);
}

uint64_t OS_geom_kd_tree_2d.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_236EFC24C(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_2d);
}

OS_geom_kd_tree_2d __swiftcall OS_geom_kd_tree_2d.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_2d)sub_236EFC2AC((uint64_t)points._rawValue, geom_create_kd_tree_with_default_options_2d);
}

OS_geom_kd_tree_2d __swiftcall OS_geom_kd_tree_2d.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2d options)
{
  return (OS_geom_kd_tree_2d)sub_236EFC308((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, void *))geom_create_kd_tree_with_options_2d);
}

Swift::Void __swiftcall OS_geom_kd_tree_2d.reinit(points:)(Swift::OpaquePointer points)
{
}

Swift::Void __swiftcall OS_geom_kd_tree_2d.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2d options)
{
  geom_recreate_kd_tree_with_options_2d(v2, *((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_2d.points.getter()
{
  return sub_236EFC48C(geom_kd_tree_points_2d, (uint64_t (*)(uint64_t, void))sub_236EF5A9C);
}

uint64_t sub_236EFC0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFC530(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_2d, a3);
}

uint64_t sub_236EFC0D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236EFC598(a1, geom_create_kd_tree_with_default_options_2d, a2);
}

void sub_236EFC0EC(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
}

void sub_236EFC104(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_236EFC130(uint64_t a1, uint64_t *a2)
{
  return geom_recreate_kd_tree_with_options_2d(*v2, *(void *)(a1 + 16), a1 + 32, *a2);
}

BOOL sub_236EFC148(unsigned int a1)
{
  return geom_kd_tree_is_node_valid_2d(*v1, a1);
}

uint64_t sub_236EFC168(unsigned int a1)
{
  return geom_kd_tree_get_node_value_index_2d(*v1, a1);
}

uint64_t sub_236EFC174(unsigned int a1)
{
  return geom_kd_tree_get_node_split_axis_2d(*v1, a1);
}

uint64_t sub_236EFC194(float64x2_t *a1)
{
  return geom_kd_tree_find_closest_2d(*v1, *a1);
}

uint64_t sub_236EFC1A0(float64x2_t *a1, double *a2, uint64_t a3)
{
  return geom_kd_tree_find_within_radius_2d(*v3, a3, *a1, *a2);
}

uint64_t sub_236EFC1B4(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_kd_tree_points_2d, (uint64_t (*)(uint64_t, void))sub_236EF5A9C);
}

uint64_t OS_geom_kd_tree_3d.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_236EFC24C(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_3d);
}

uint64_t sub_236EFC24C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, a2);
  swift_bridgeObjectRelease();
  return v3;
}

OS_geom_kd_tree_3d __swiftcall OS_geom_kd_tree_3d.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_3d)sub_236EFC2AC((uint64_t)points._rawValue, geom_create_kd_tree_with_default_options_3d);
}

uint64_t sub_236EFC2AC(uint64_t a1, uint64_t (*a2)(void, uint64_t))
{
  uint64_t v2 = a2(*(void *)(a1 + 16), a1 + 32);
  swift_bridgeObjectRelease();
  return v2;
}

OS_geom_kd_tree_3d __swiftcall OS_geom_kd_tree_3d.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3d options)
{
  return (OS_geom_kd_tree_3d)sub_236EFC308((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(void, uint64_t, void *))geom_create_kd_tree_with_options_3d);
}

uint64_t sub_236EFC308(uint64_t a1, void *a2, uint64_t (*a3)(void, uint64_t, void *))
{
  uint64_t v4 = a3(*(void *)(a1 + 16), a1 + 32, a2);
  swift_bridgeObjectRelease();

  return v4;
}

Swift::Void __swiftcall OS_geom_kd_tree_3d.reinit(points:)(Swift::OpaquePointer points)
{
}

void sub_236EFC38C(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t, void, uint64_t, id))
{
  id v6 = (id)a2();
  a3(v3, *(void *)(a1 + 16), a1 + 32, v6);
}

Swift::Void __swiftcall OS_geom_kd_tree_3d.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3d options)
{
  geom_recreate_kd_tree_with_options_3d(v2, *((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_3d.points.getter()
{
  return sub_236EFC48C(geom_kd_tree_points_3d, (uint64_t (*)(uint64_t, void))sub_236EF5348);
}

uint64_t sub_236EFC48C(uint64_t (*a1)(uint64_t, void *), uint64_t (*a2)(uint64_t, void))
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  uint64_t v4 = a1(v2, v6);
  return a2(v4, v6[0]);
}

uint64_t sub_236EFC518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236EFC530(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))geom_create_kd_tree_3d, a3);
}

uint64_t sub_236EFC530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void, uint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a3(*(void *)(a1 + 16), a1 + 32, a2);
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

uint64_t sub_236EFC580@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236EFC598(a1, geom_create_kd_tree_with_default_options_3d, a2);
}

uint64_t sub_236EFC598@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = a2(*(void *)(a1 + 16), a1 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

void sub_236EFC5E4(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
}

void sub_236EFC5FC(uint64_t a1@<X0>, void *a2@<X1>, uint64_t (*a3)(void, uint64_t, void)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5 = (void *)*a2;
  uint64_t v6 = a3(*(void *)(a1 + 16), a1 + 32, *a2);
  swift_bridgeObjectRelease();

  *a4 = v6;
}

void sub_236EFC654(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_236EFC680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(uint64_t, void, uint64_t, id))
{
  uint64_t v8 = *v5;
  id v9 = (id)a4();
  a5(v8, *(void *)(a1 + 16), a1 + 32, v9);
}

uint64_t sub_236EFC6F0(uint64_t a1, uint64_t *a2)
{
  return geom_recreate_kd_tree_with_options_3d(*v2, *(void *)(a1 + 16), a1 + 32, *a2);
}

BOOL sub_236EFC708(unsigned int a1)
{
  return geom_kd_tree_is_node_valid_3d(*v1, a1);
}

uint64_t sub_236EFC728(unsigned int a1)
{
  return geom_kd_tree_get_node_value_index_3d(*v1, a1);
}

uint64_t sub_236EFC734(unsigned int a1)
{
  return geom_kd_tree_get_node_split_axis_3d(*v1, a1);
}

uint64_t sub_236EFC754(float64x2_t *a1)
{
  float64x2_t v2 = *a1;
  float64x2_t v3 = a1[1];
  uint64_t v4 = *v1;
  v6[0] = v2;
  v6[1] = v3;
  return geom_kd_tree_find_closest_3d(v4, v6);
}

uint64_t sub_236EFC784(float64x2_t *a1, double *a2, uint64_t a3)
{
  float64x2_t v4 = *a1;
  float64x2_t v5 = a1[1];
  double v6 = *a2;
  uint64_t v7 = *v3;
  v9[0] = v4;
  v9[1] = v5;
  return geom_kd_tree_find_within_radius_3d(v7, v9, a3, v6);
}

uint64_t sub_236EFC7B8(uint64_t a1, uint64_t a2)
{
  return sub_236EFC838(a1, a2, geom_kd_tree_points_3d, (uint64_t (*)(uint64_t, void))sub_236EF5348);
}

uint64_t sub_236EFC838(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void *), uint64_t (*a4)(uint64_t, void))
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *v4;
  v9[0] = 0;
  uint64_t v7 = a3(v6, v9);
  return a4(v7, v9[0]);
}

uint64_t sub_236EFC8C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236EFC8D0@<X0>(unsigned int *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, double, double))(v3 + 16))(*a1, *a2, a2[1]);
  *(_DWORD *)a3 = result;
  *(unsigned char *)(a3 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_236EFC910()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236EFC920(unsigned int *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = (*(double (**)(void, double))(v3 + 16))(*a1, *a2);
}

uint64_t sub_236EFC958()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236EFC968@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, __n128, float, __n128, float))(v3 + 16))(*a1, *a2, COERCE_FLOAT(a2->n128_u64[1]), a2[1], COERCE_FLOAT(a2[1].n128_u64[1]));
  *(_DWORD *)a3 = result;
  *(unsigned char *)(a3 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_236EFC9B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236EFC9C0(unsigned int *a1@<X0>, __n128 *a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = (*(double (**)(void, __n128))(v3 + 16))(*a1, *a2);
  *a3 = v5;
}

uint64_t sub_236EFC9F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236EFCA08@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, __n128, __n128))(v3 + 16))(*a1, *a2, a2[1]);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v6 & 1;
  return result;
}

uint64_t sub_236EFCA48()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236EFCA58(unsigned int *a1@<X0>, __n128 *a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = (*(double (**)(void, __n128))(v3 + 16))(*a1, *a2);
  *a3 = v5;
}

uint64_t sub_236EFCA90()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236EFCAA0@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, __n128, double, __n128, double))(v3 + 16))(*a1, *a2, a2[1].n128_f64[0], a2[2], a2[3].n128_f64[0]);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v6 & 1;
  return result;
}

uint64_t sub_236EFCAEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236EFCAFC(unsigned int *a1@<X0>, __n128 *a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = (*(double (**)(void, __n128, __n128))(v3 + 16))(*a1, *a2, a2[1]);
  *a3 = v5;
  a3[1] = v6;
}

uint64_t sub_236EFCB34()
{
  return sub_236EFCBC4(&qword_2688DF5F0, type metadata accessor for BBox2f);
}

uint64_t sub_236EFCB7C()
{
  return sub_236EFCBC4(&qword_2688DF5F8, type metadata accessor for BBox3f);
}

uint64_t sub_236EFCBC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236EFCC0C()
{
  return sub_236EFCBC4(&qword_2688DF600, type metadata accessor for BBox2d);
}

uint64_t sub_236EFCC54()
{
  return sub_236EFCBC4(&qword_2688DF608, type metadata accessor for BBox3d);
}

_UNKNOWN **sub_236EFCC9C()
{
  return &protocol witness table for OS_geom_bvh_create_opt_2f;
}

uint64_t sub_236EFCCA8()
{
  return sub_236EFCBC4(&qword_2688DF610, _s3__C4NodeVMa_2);
}

uint64_t sub_236EFCCF0()
{
  return sub_236EFCBC4(&qword_2688DF618, type metadata accessor for Ray2f);
}

_UNKNOWN **sub_236EFCD38()
{
  return &protocol witness table for OS_geom_bvh_create_opt_3f;
}

uint64_t sub_236EFCD44()
{
  return sub_236EFCBC4(&qword_2688DF620, _s3__C4NodeVMa_1);
}

uint64_t sub_236EFCD8C()
{
  return sub_236EFCBC4(&qword_2688DF628, type metadata accessor for Ray3f);
}

_UNKNOWN **sub_236EFCDD4()
{
  return &protocol witness table for OS_geom_bvh_create_opt_2d;
}

uint64_t sub_236EFCDE0()
{
  return sub_236EFCBC4(&qword_2688DF630, _s3__C4NodeVMa_0);
}

uint64_t sub_236EFCE28()
{
  return sub_236EFCBC4(&qword_2688DF638, type metadata accessor for Ray2d);
}

_UNKNOWN **sub_236EFCE70()
{
  return &protocol witness table for OS_geom_bvh_create_opt_3d;
}

uint64_t sub_236EFCE7C()
{
  return sub_236EFCBC4(&qword_2688DF640, type metadata accessor for Node);
}

uint64_t sub_236EFCEC4()
{
  return sub_236EFCBC4(&qword_2688DF648, type metadata accessor for Ray3d);
}

uint64_t sub_236EFCF0C(uint64_t a1)
{
  uint64_t result = sub_236EFCF60(&qword_2688DF650, &qword_2688DF658);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFCF60(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_236EFD0A0(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236EFCFA4(uint64_t a1)
{
  uint64_t result = sub_236EFCF60(&qword_2688DF660, &qword_2688DF668);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFCFF8(uint64_t a1)
{
  uint64_t result = sub_236EFCF60(&qword_2688DF670, &qword_2688DF678);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFD04C(uint64_t a1)
{
  uint64_t result = sub_236EFCF60(&qword_2688DF680, &qword_2688DF688);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFD0A0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_UNKNOWN **sub_236EFD0DC()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_2f;
}

uint64_t sub_236EFD0E8()
{
  return sub_236EFD1FC(&qword_2688DF690, &qword_2688DF698);
}

_UNKNOWN **sub_236EFD124()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_3f;
}

uint64_t sub_236EFD130()
{
  return sub_236EFD1FC(&qword_2688DF6A0, &qword_2688DF6A8);
}

_UNKNOWN **sub_236EFD16C()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_2d;
}

uint64_t sub_236EFD178()
{
  return sub_236EFD1FC(&qword_2688DF6B0, &qword_2688DF6B8);
}

_UNKNOWN **sub_236EFD1B4()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_3d;
}

uint64_t sub_236EFD1C0()
{
  return sub_236EFD1FC(&qword_2688DF6C0, qword_2688DF6C8);
}

uint64_t sub_236EFD1FC(unint64_t *a1, uint64_t *a2)
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

void *sub_236EFD240@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((void *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_2f.buildStrategy.getter, a1);
}

uint64_t sub_236EFD258(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF785C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

void *sub_236EFD298@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((void *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_3f.buildStrategy.getter, a1);
}

void *keypath_getTm_0@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1(&v6);
  int v4 = v7;
  char v5 = v8;
  *(void *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 12) = v5;
  return result;
}

uint64_t sub_236EFD300(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF785C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

void *sub_236EFD340@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((void *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_2d.buildStrategy.getter, a1);
}

uint64_t sub_236EFD358(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF785C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

void *sub_236EFD398@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((void *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_3d.buildStrategy.getter, a1);
}

uint64_t sub_236EFD3B0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236EF785C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, void))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t dispatch thunk of BVH2Node.index.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BVH2Node.left.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BVH2Node.right.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BVH2Node.start.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BVH2Node.range.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BVH2Node.bounds.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BVH3Node.index.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BVH3Node.left.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BVH3Node.right.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BVH3Node.start.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BVH3Node.range.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BVH3Node.bounds.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_236EFD4E0()
{
  v2[4] = MEMORY[0x263F8CF68] + 64;
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_236EFD594(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  if (((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL) {
    unint64_t v7 = ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  else {
    unint64_t v7 = 4;
  }
  int v8 = *(_DWORD *)(v5 + 80);
  uint64_t v9 = v8 & 0xFC | 3;
  int v10 = v8 & 0x100000;
  if (v9 > 7 || v10 != 0 || (v7 | 1) > 0x18)
  {
    uint64_t v13 = *a2;
    *int v4 = *a2;
    int v4 = (uint64_t *)(v13 + ((v9 + 16) & ~v9));
    swift_retain();
  }
  else
  {
    unsigned int v14 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v14 >= 2) {
      unsigned int v14 = *(_DWORD *)a2 + 2;
    }
    if (v14 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
      *(_DWORD *)(((unint64_t)v4 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) = *(_DWORD *)(((unint64_t)a2 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      *((unsigned char *)v4 + v7) = 1;
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *((unsigned char *)a1 + v7) = 0;
    }
  }
  return v4;
}

_DWORD *sub_236EFD6D8(_DWORD *result, uint64_t a2)
{
  unint64_t v2 = 4;
  if (((*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4 > 4) {
    unint64_t v2 = ((*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  unsigned int v3 = *((unsigned __int8 *)result + v2);
  uint64_t v4 = v2 & 0xFFFFFFFC;
  if (v3 >= 2 && v4 != 0) {
    unsigned int v3 = *result + 2;
  }
  if (v3 == 1) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

_DWORD *sub_236EFD770(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  unsigned int v3 = a2;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL) {
    unint64_t v6 = ((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  else {
    unint64_t v6 = 4;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFFC) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    (*(void (**)(_DWORD *, _DWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
    uint64_t v9 = (_DWORD *)(((unint64_t)a1 + v5 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    unsigned int v3 = (_DWORD *)(((unint64_t)v3 + v5 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    uint64_t v9 = a1;
  }
  *uint64_t v9 = *v3;
  *((unsigned char *)a1 + v6) = v10;
  return a1;
}

_DWORD *sub_236EFD870(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v4 = a2;
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    if (((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL) {
      unint64_t v8 = ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
    }
    else {
      unint64_t v8 = 4;
    }
    unsigned int v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFFC) != 0) {
      unsigned int v9 = *a1 + 2;
    }
    if (v9 == 1) {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v11 = *((unsigned __int8 *)v4 + v8);
    if ((v8 & 0xFFFFFFFC) != 0 && v11 >= 2) {
      unsigned int v11 = *v4 + 2;
    }
    if (v11 == 1)
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, v4, v5);
      uint64_t v13 = (_DWORD *)(((unint64_t)a1 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      uint64_t v4 = (_DWORD *)(((unint64_t)v4 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
      uint64_t v13 = a1;
    }
    *uint64_t v13 = *v4;
    *((unsigned char *)a1 + v8) = v14;
  }
  return a1;
}

_DWORD *sub_236EFD9C8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  unsigned int v3 = a2;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL) {
    unint64_t v6 = ((v5 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  else {
    unint64_t v6 = 4;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFFC) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    (*(void (**)(_DWORD *, _DWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1, a2);
    unsigned int v9 = (_DWORD *)(((unint64_t)a1 + v5 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    unsigned int v3 = (_DWORD *)(((unint64_t)v3 + v5 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    unsigned int v9 = a1;
  }
  *unsigned int v9 = *v3;
  *((unsigned char *)a1 + v6) = v10;
  return a1;
}

_DWORD *sub_236EFDAC8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v4 = a2;
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    if (((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL) {
      unint64_t v8 = ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
    }
    else {
      unint64_t v8 = 4;
    }
    unsigned int v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFFC) != 0) {
      unsigned int v9 = *a1 + 2;
    }
    if (v9 == 1) {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v11 = *((unsigned __int8 *)v4 + v8);
    if ((v8 & 0xFFFFFFFC) != 0 && v11 >= 2) {
      unsigned int v11 = *v4 + 2;
    }
    if (v11 == 1)
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, v4, v5);
      uint64_t v13 = (_DWORD *)(((unint64_t)a1 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      uint64_t v4 = (_DWORD *)(((unint64_t)v4 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
      uint64_t v13 = a1;
    }
    *uint64_t v13 = *v4;
    *((unsigned char *)a1 + v8) = v14;
  }
  return a1;
}

uint64_t sub_236EFDC20(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  unint64_t v4 = ((*(void *)(v3 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v4 == 4 || ((*(void *)(v3 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL) {
    unint64_t v4 = 4;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_20;
  }
  uint64_t v5 = v4 | 1;
  char v6 = 8 * (v4 | 1);
  if ((v4 | 1) <= 3)
  {
    unsigned int v7 = (a2 + ~(-1 << v6) - 254) >> v6;
    if (v7 > 0xFFFE)
    {
      int v8 = *(_DWORD *)&a1[v5];
      if (!v8) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (v7 > 0xFE)
    {
      int v8 = *(unsigned __int16 *)&a1[v5];
      if (!*(_WORD *)&a1[v5]) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (!v7) {
      goto LABEL_20;
    }
  }
  int v8 = a1[v5];
  if (!a1[v5])
  {
LABEL_20:
    unsigned int v12 = a1[v4];
    if (v12 >= 2) {
      return (v12 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
LABEL_13:
  int v10 = (v8 - 1) << v6;
  if (v5 >= 4) {
    int v10 = 0;
  }
  if (v5 == 1) {
    int v11 = *a1;
  }
  else {
    int v11 = *(_DWORD *)a1;
  }
  return (v11 | v10) + 255;
}

void sub_236EFDD04(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8);
  unint64_t v6 = ((*(void *)(v5 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v6 == 4 || ((*(void *)(v5 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL) {
    unint64_t v6 = 4;
  }
  size_t v7 = v6 | 1;
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v7 <= 3)
  {
    unsigned int v11 = (a3 + ~(-1 << (8 * v7)) - 254) >> (8 * v7);
    if (v11 > 0xFFFE)
    {
      int v8 = 4;
    }
    else if (v11 >= 0xFF)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 != 0;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 <= 0xFE)
  {
    switch(v8)
    {
      case 1:
        a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      case 2:
        *(_WORD *)&a1[v7] = 0;
        goto LABEL_23;
      case 3:
        goto LABEL_31;
      case 4:
        *(_DWORD *)&a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      default:
LABEL_23:
        if (a2) {
LABEL_24:
        }
          a1[v6] = -(char)a2;
        break;
    }
    return;
  }
  unsigned int v9 = a2 - 255;
  if (v7 < 4)
  {
    int v10 = (v9 >> (8 * v7)) + 1;
    v9 &= ~(-1 << (8 * v7));
    bzero(a1, v7);
    if (v7 == 1)
    {
      *a1 = v9;
      goto LABEL_20;
    }
  }
  else
  {
    bzero(a1, v6 | 1);
    int v10 = 1;
  }
  *(_DWORD *)a1 = v9;
LABEL_20:
  switch(v8)
  {
    case 1:
      a1[v7] = v10;
      break;
    case 2:
      *(_WORD *)&a1[v7] = v10;
      break;
    case 3:
LABEL_31:
      __break(1u);
      JUMPOUT(0x236EFDEB8);
    case 4:
      *(_DWORD *)&a1[v7] = v10;
      break;
    default:
      return;
  }
}

uint64_t sub_236EFDEE0(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  unint64_t v3 = 4;
  if (((*(void *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0
    && ((*(void *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
  {
    unint64_t v3 = ((*(void *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  uint64_t v4 = *((unsigned __int8 *)a1 + v3);
  uint64_t v5 = v3 & 0xFFFFFFFC;
  if (v4 >= 2 && v5 != 0) {
    return (*a1 + 2);
  }
  return v4;
}

void sub_236EFDF34(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  size_t v5 = ((*(void *)(v4 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v5 == 4 || ((*(void *)(v4 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL) {
    size_t v5 = 4;
  }
  if (a2 > 1)
  {
    if (v5) {
      char v6 = 2;
    }
    else {
      char v6 = a2;
    }
    if (v5) {
      unsigned int v7 = a2 - 2;
    }
    else {
      unsigned int v7 = 0;
    }
    a1[v5] = v6;
    bzero(a1, v5);
    *(_DWORD *)a1 = v7;
  }
  else
  {
    a1[v5] = a2;
  }
}

uint64_t type metadata accessor for BVHBuildStrategy()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 96))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of BVH2.reinit(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of BVH2.reinit(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of BVH2.statistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of BVH2.nodes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of BVH2.primitivePartition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of BVH2.primitives(forNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of BVH2.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 176))();
}

uint64_t dispatch thunk of BVH2.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 184))();
}

uint64_t dispatch thunk of BVH3.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of BVH3.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 96))();
}

uint64_t dispatch thunk of BVH3.init(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of BVH3.init(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of BVH3.reinit(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of BVH3.reinit(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of BVH3.statistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of BVH3.nodes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of BVH3.primitivePartition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of BVH3.primitives(forNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of BVH3.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 176))();
}

uint64_t dispatch thunk of BVH3.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 184))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.raycast(ray:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of BezierCurveBVH2.reinit(accumulatedPointCount:points:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of BezierCurveBVH2.reinit(accumulatedPointCount:points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of BezierCurveBVH2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of KDTree.init(points:strategy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of KDTree.init(points:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of KDTree.init(points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of KDTree.reinit(points:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of KDTree.reinit(points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of KDTree.isNodeValid(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of KDTree.valueIndex(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of KDTree.splitAxis(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of KDTree.findClosest(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of KDTree.findWithinRadius(query:radius:pointIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of KDTree.points.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_236EFE4D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_236EFE538(uint64_t a1, __n128 a2, __n128 a3)
{
  void (*v4)(long long *__return_ptr, uint64_t, _OWORD *);
  long long v6;
  _OWORD v7[2];

  uint64_t v4 = *(void (**)(long long *__return_ptr, uint64_t, _OWORD *))(v3 + 16);
  v7[0] = a2;
  v7[1] = a3;
  v4(&v6, a1, v7);
  return *(double *)&v6;
}

uint64_t sub_236EFE578(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v8;
  _OWORD v9[4];

  char v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v5 + 16);
  v9[0] = a2;
  v9[1] = a3;
  void v9[2] = a4;
  v9[3] = a5;
  v6(&v8, a1, v9);
  return v8;
}

double sub_236EFE5C0(uint64_t a1, __n128 a2)
{
  void (*v3)(long long *__return_ptr, uint64_t, __n128 *);
  long long v5;
  __n128 v6;

  uint64_t v3 = *(void (**)(long long *__return_ptr, uint64_t, __n128 *))(v2 + 16);
  char v6 = a2;
  v3(&v5, a1, &v6);
  return *(double *)&v5;
}

uint64_t sub_236EFE600(uint64_t a1, __n128 a2, __n128 a3)
{
  void (*v4)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v6;
  _OWORD v7[2];

  uint64_t v4 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v3 + 16);
  v7[0] = a2;
  v7[1] = a3;
  v4(&v6, a1, v7);
  return v6;
}

unint64_t sub_236EFE644(uint64_t a1, __n128 a2, float a3, __n128 a4, float a5)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v8;
  _OWORD v9[2];

  char v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v5 + 16);
  a2.n128_f32[2] = a3;
  a4.n128_f32[2] = a5;
  v9[0] = a2;
  v9[1] = a4;
  v6(&v8, a1, v9);
  return v8 | ((unint64_t)BYTE4(v8) << 32);
}

double sub_236EFE69C(uint64_t a1, double a2)
{
  void (*v3)(double *__return_ptr, uint64_t, double *);
  double v5;
  double v6;

  uint64_t v3 = *(void (**)(double *__return_ptr, uint64_t, double *))(v2 + 16);
  char v6 = a2;
  v3(&v5, a1, &v6);
  return v5;
}

unint64_t sub_236EFE6DC(uint64_t a1, double a2, double a3)
{
  void (*v4)(uint64_t *__return_ptr, uint64_t, void *);
  uint64_t v6;
  void v7[2];

  uint64_t v4 = *(void (**)(uint64_t *__return_ptr, uint64_t, void *))(v3 + 16);
  *(double *)unsigned int v7 = a2;
  *(double *)&v7[1] = a3;
  v4(&v6, a1, v7);
  return v6 | ((unint64_t)BYTE4(v6) << 32);
}

OS_geom_arap_deformer_3f __swiftcall OS_geom_arap_deformer_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_arap_deformer_3f)sub_236EFE794((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_arap_deformer_create_3f);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3f.addConstraints(vertexPositions:vertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer vertexIndices)
{
  geom_arap_deformer_add_constraints_3f(v2, *((void *)vertexPositions._rawValue + 2), (long long *)vertexPositions._rawValue + 2, (_DWORD *)vertexIndices._rawValue + 8);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3f.addStaticConstraints(vertexIndices:)(Swift::OpaquePointer vertexIndices)
{
  geom_arap_deformer_add_static_constraints_3f(v1, *((void *)vertexIndices._rawValue + 2), (_DWORD *)vertexIndices._rawValue + 8);
}

OS_geom_arap_deformer_3d __swiftcall OS_geom_arap_deformer_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_arap_deformer_3d)sub_236EFE794((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void, uint64_t, unint64_t, uint64_t))geom_arap_deformer_create_3d);
}

uint64_t sub_236EFE794(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

Swift::Void __swiftcall OS_geom_arap_deformer_3d.addConstraints(vertexPositions:vertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer vertexIndices)
{
  geom_arap_deformer_add_constraints_3d(v2, *((void *)vertexPositions._rawValue + 2), (long long *)vertexPositions._rawValue + 2, (_DWORD *)vertexIndices._rawValue + 8);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3d.addStaticConstraints(vertexIndices:)(Swift::OpaquePointer vertexIndices)
{
  geom_arap_deformer_add_static_constraints_3d(v1, *((void *)vertexIndices._rawValue + 2), (_DWORD *)vertexIndices._rawValue + 8);
}

uint64_t static DopAxes3.axisCount.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 32))();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_236F12AB0();
  uint64_t v2 = sub_236F12A60();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t (*sub_236EFE904())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*sub_236EFE924())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*sub_236EFE944())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236EFE964(uint64_t a1)
{
  uint64_t result = sub_236EFEF70(&qword_2688DF760, type metadata accessor for BBox3f);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFE9BC(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo12geom_bbox_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t (*sub_236EFE9D4())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236EFE9F4(uint64_t a1)
{
  uint64_t result = sub_236EFEF70(&qword_2688DF768, type metadata accessor for BBox3d);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_236EFEA4C(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo12geom_bbox_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEA64(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo12geom_dop8_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEA7C(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo12geom_dop8_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEA94(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop12_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEAAC(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop12_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEAC4(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop14_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEADC(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop14_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEAF4(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop18_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEB0C(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop18_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEB24(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop20_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEB3C(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop20_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEB54(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop26_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_236EFEB6C(uint64_t a1, uint64_t a2)
{
  return sub_236EFEB84(a1, a2, (void (*)(void))_sSo13geom_dop26_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_236EFEB84(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  swift_unknownObjectRelease();
  uint64_t result = (v6 >> 1) - v4;
  if (__OFSUB__(v6 >> 1, v4)) {
    __break(1u);
  }
  return result;
}

double sub_236EFEBC4@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

double sub_236EFEBD0(double *a1)
{
  double result = *a1;
  *uint64_t v1 = *(void *)a1;
  return result;
}

double sub_236EFEBDC@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double sub_236EFEBE8(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

double sub_236EFEBF4@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 16);
  *a1 = result;
  return result;
}

double sub_236EFEC00(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 16) = *a1;
  return result;
}

double sub_236EFEC0C@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 24);
  *a1 = result;
  return result;
}

double sub_236EFEC18(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 24) = *a1;
  return result;
}

uint64_t (*sub_236EFEC24())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_236EFEC44@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  return result;
}

__n128 sub_236EFEC50(__n128 *a1)
{
  __n128 result = *a1;
  *uint64_t v1 = *a1;
  return result;
}

__n128 sub_236EFEC5C@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

__n128 sub_236EFEC68(__n128 *a1)
{
  __n128 result = *a1;
  v1[1] = *a1;
  return result;
}

__n128 sub_236EFEC74@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[2];
  *a1 = result;
  return result;
}

__n128 sub_236EFEC80(__n128 *a1)
{
  __n128 result = *a1;
  v1[2] = *a1;
  return result;
}

__n128 sub_236EFEC8C@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[3];
  *a1 = result;
  return result;
}

__n128 sub_236EFEC98(__n128 *a1)
{
  __n128 result = *a1;
  v1[3] = *a1;
  return result;
}

uint64_t (*sub_236EFECA4())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_236EFECC4@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[4];
  *a1 = result;
  return result;
}

__n128 sub_236EFECD0(__n128 *a1)
{
  __n128 result = *a1;
  v1[4] = *a1;
  return result;
}

uint64_t (*sub_236EFECDC())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_236EFECFC@<Q0>(_OWORD *a1@<X8>)
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

__n128 sub_236EFED08(uint64_t a1)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *uint64_t v1 = *(_OWORD *)a1;
  v1[1] = v3;
  return result;
}

__n128 sub_236EFED14(uint64_t a1)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 48) = v3;
  return result;
}

__n128 sub_236EFED20@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_236EFED2C(uint64_t a1)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 80) = v3;
  return result;
}

__n128 sub_236EFED38@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 128);
  long long v3 = *(_OWORD *)(v1 + 144);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_236EFED44(uint64_t a1)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 128) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 144) = v3;
  return result;
}

uint64_t (*sub_236EFED50())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

void sub_236EFED70(__n128 *a1@<X0>, float *a2@<X8>)
{
}

void sub_236EFED88(_OWORD *a1@<X0>, double *a2@<X8>)
{
}

uint64_t sub_236EFEDA0()
{
  return sub_236EFEF70(&qword_2688DF770, type metadata accessor for LineSegment2f);
}

uint64_t sub_236EFEDE8()
{
  return sub_236EFEF70(&qword_2688DF618, type metadata accessor for Ray2f);
}

uint64_t sub_236EFEE30@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EFEE60(a1, (uint64_t (*)(double, double))geom_line_from_line_segment_2f, a2);
}

uint64_t sub_236EFEE48@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EFEE60(a1, (uint64_t (*)(double, double))geom_line_from_ray_2f, a2);
}

uint64_t sub_236EFEE60@<X0>(double *a1@<X0>, uint64_t (*a2)(double, double)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1]);
  *(void *)a3 = result;
  *(_DWORD *)(a3 + 8) = v5;
  return result;
}

float sub_236EFEE94@<S0>(float *a1@<X8>)
{
  float result = *(float *)(v1 + 8);
  *a1 = result;
  return result;
}

float sub_236EFEEA0(float *a1)
{
  float result = *a1;
  *(float *)(v1 + 8) = *a1;
  return result;
}

void sub_236EFEEAC(float32x2_t *a1@<X0>, float *a2@<X8>)
{
  *a2 = geom_signed_distance_point_to_line_2f(*(void *)v2, *(_DWORD *)(v2 + 8), *a1);
}

uint64_t sub_236EFEEE0()
{
  return sub_236EFEF70(&qword_2688DF778, type metadata accessor for LineSegment2d);
}

uint64_t sub_236EFEF28()
{
  return sub_236EFEF70(&qword_2688DF638, type metadata accessor for Ray2d);
}

uint64_t sub_236EFEF70(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_236EFEFB8@<D0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EFEFE8(a1, (void (*)(long long *__return_ptr, __n128, __n128))geom_line_from_line_segment_2d, a2);
}

double sub_236EFEFD0@<D0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236EFEFE8(a1, (void (*)(long long *__return_ptr, __n128, __n128))geom_line_from_ray_2d, a2);
}

double sub_236EFEFE8@<D0>(__n128 *a1@<X0>, void (*a2)(long long *__return_ptr, __n128, __n128)@<X3>, uint64_t a3@<X8>)
{
  a2(&v6, *a1, a1[1]);
  double result = *(double *)&v6;
  uint64_t v5 = v7;
  *(_OWORD *)a3 = v6;
  *(void *)(a3 + 16) = v5;
  return result;
}

void sub_236EFF030(float64x2_t *a1@<X0>, float64_t *a2@<X8>)
{
  float64x2_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + 16);
  float64x2_t v5 = *(float64x2_t *)v2;
  uint64_t v6 = v4;
  *a2 = geom_signed_distance_point_to_line_2d(&v5, v3);
}

void sub_236EFF078(float32x4_t *a1@<X0>, _DWORD *a2@<X8>)
{
  double v4 = geom_signed_distance_point_to_plane_point_normal_3f(*a1, *v2, v2[1]);
  *a2 = LODWORD(v4);
}

void sub_236EFF0A8(float64x2_t *a1@<X0>, float64_t *a2@<X8>)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = *v2;
  float64x2_t v5 = v2[1];
  float64x2_t v6 = v2[2];
  float64x2_t v7 = v2[3];
  v9[0] = *a1;
  v9[1] = v3;
  v8[0] = v4;
  v8[1] = v5;
  void v8[2] = v6;
  v8[3] = v7;
  *a2 = geom_signed_distance_point_to_plane_point_normal_3d(v9, v8);
}

double sub_236EFF0F8@<D0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, __n128 *a3@<X8>)
{
  geom_plane_from_point_and_normal_3f(&v6, *a1, *a2);
  double result = v6.n128_f64[0];
  unsigned __int32 v5 = v7;
  *a3 = v6;
  a3[1].n128_u32[0] = v5;
  return result;
}

float sub_236EFF140@<S0>(float *a1@<X8>)
{
  float result = *(float *)(v1 + 16);
  *a1 = result;
  return result;
}

float sub_236EFF14C(float *a1)
{
  float result = *a1;
  *(float *)(v1 + 16) = *a1;
  return result;
}

void sub_236EFF158(__n128 *a1@<X0>, float *a2@<X8>)
{
}

void sub_236EFF170(__n128 *a1@<X0>, float (*a2)(long long *, __n128)@<X3>, float *a3@<X8>)
{
  __n128 v4 = *a1;
  int v5 = *((_DWORD *)v3 + 4);
  long long v6 = *v3;
  int v7 = v5;
  *a3 = a2(&v6, v4);
}

double sub_236EFF1BC@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  float64x2_t v4 = a1[1];
  float64x2_t v5 = *a2;
  float64x2_t v6 = a2[1];
  v13[0] = *a1;
  v13[1] = v4;
  v12[0] = v5;
  v12[1] = v6;
  geom_plane_from_point_and_normal_3d(v13, v12, (uint64_t)v10);
  double result = *(double *)v10;
  long long v8 = v10[1];
  uint64_t v9 = v11;
  *(_OWORD *)a3 = v10[0];
  *(_OWORD *)(a3 + 16) = v8;
  *(void *)(a3 + 32) = v9;
  return result;
}

double sub_236EFF214@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 32);
  *a1 = result;
  return result;
}

double sub_236EFF220(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 32) = *a1;
  return result;
}

void sub_236EFF22C(_OWORD *a1@<X0>, double *a2@<X8>)
{
}

void sub_236EFF244(_OWORD *a1@<X0>, double (*a2)(_OWORD *, _OWORD *)@<X3>, double *a3@<X8>)
{
  long long v4 = a1[1];
  long long v5 = *v3;
  long long v6 = v3[1];
  uint64_t v7 = *((void *)v3 + 4);
  v10[0] = *a1;
  v10[1] = v4;
  v8[0] = v5;
  v8[1] = v6;
  uint64_t v9 = v7;
  *a3 = a2(v10, v8);
}

uint64_t dispatch thunk of BBox2.min.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BBox2.min.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BBox2.min.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of BBox2.max.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BBox2.max.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of BBox2.max.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of static DopAxes3.axisCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static DopAxes3.axisDirections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BBox3.min.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BBox3.min.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of BBox3.min.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BBox3.max.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BBox3.max.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of BBox3.max.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of OrientedBBox2.center.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of OrientedBBox2.center.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of OrientedBBox2.center.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of OrientedBBox2.x.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of OrientedBBox2.x.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of OrientedBBox2.x.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of OrientedBBox2.y.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of OrientedBBox2.y.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of OrientedBBox2.y.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of OrientedBBox3.center.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of OrientedBBox3.center.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of OrientedBBox3.center.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of OrientedBBox3.x.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of OrientedBBox3.x.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of OrientedBBox3.x.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of OrientedBBox3.y.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of OrientedBBox3.y.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of OrientedBBox3.y.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of OrientedBBox3.halfExtents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of OrientedBBox3.halfExtents.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of OrientedBBox3.halfExtents.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of Sphere3.center.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Sphere3.center.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of Sphere3.center.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Sphere3.radius.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Sphere3.radius.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of Sphere3.radius.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Sphere3.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 72))();
}

uint64_t dispatch thunk of Sphere3.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of Triangle3.p0.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Triangle3.p0.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of Triangle3.p0.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Triangle3.p1.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Triangle3.p1.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of Triangle3.p1.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Triangle3.p2.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of Triangle3.p2.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of Triangle3.p2.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of Triangle3.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of LineSegment2.p0.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of LineSegment2.p0.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of LineSegment2.p0.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of LineSegment2.p1.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of LineSegment2.p1.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of LineSegment2.p1.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of LineSegment3.p0.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of LineSegment3.p0.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of LineSegment3.p0.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of LineSegment3.p1.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of LineSegment3.p1.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of LineSegment3.p1.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Line2.init(colinearWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Line2.normal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of Line2.normal.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of Line2.normal.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of Line2.signedOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of Line2.signedOffset.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of Line2.signedOffset.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of Line2.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of PlanePointNormal3.point.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PlanePointNormal3.point.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PlanePointNormal3.point.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PlanePointNormal3.normal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PlanePointNormal3.normal.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of PlanePointNormal3.normal.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PlanePointNormal3.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of Plane3.init(point:normal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of Plane3.normal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Plane3.normal.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Plane3.normal.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Plane3.signedOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Plane3.signedOffset.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Plane3.signedOffset.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of Plane3.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of Ray2.origin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Ray2.origin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of Ray2.origin.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Ray2.direction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Ray2.direction.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of Ray2.direction.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Ray3.origin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Ray3.origin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of Ray3.origin.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Ray3.direction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Ray3.direction.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of Ray3.direction.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(powerBasis:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(interpolatePoints:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(elevateFrom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(useDerivativesOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of QuadraticBezier2.powerBasis.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 120))();
}

uint64_t dispatch thunk of QuadraticBezier2.subdivided(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of QuadraticBezier2.findRoots(withXValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of QuadraticBezier2.findRoots(withYValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of QuadraticBezier2.findMonotonicIntervals()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of QuadraticBezier2.extract(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 160))();
}

uint64_t dispatch thunk of QuadraticBezier2.demoteToLinear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of QuadraticBezier2.position(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of QuadraticBezier2.tangent(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of QuadraticBezier2.normal(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of QuadraticBezier2.derivative(withOrder:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 200))();
}

uint64_t dispatch thunk of QuadraticBezier2.curvature(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of QuadraticBezier2.arcLength(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 216))();
}

uint64_t dispatch thunk of QuadraticBezier2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 224))();
}

uint64_t dispatch thunk of QuadraticBezier2.tightBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of QuadraticBezier2.orientedBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of QuadraticBezier2.orientedBBoxMatrix()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of CubicBezier2.init(elevateFrom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of CubicBezier2.init(powerBasis:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 120))();
}

uint64_t dispatch thunk of CubicBezier2.init(interpolatePoints:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 128))();
}

uint64_t dispatch thunk of CubicBezier2.init(interpolatePoints:derivatives:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 136))();
}

uint64_t dispatch thunk of CubicBezier2.extract(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of CubicBezier2.demoteToLinear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of CubicBezier2.demoteToQuadratic()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of CubicBezier2.position(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of CubicBezier2.tangent(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of CubicBezier2.normal(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of CubicBezier2.derivative(withOrder:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 192))();
}

uint64_t dispatch thunk of CubicBezier2.curvature(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of CubicBezier2.arcLength(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 208))();
}

uint64_t dispatch thunk of CubicBezier2.fitWithQuadraticBeziers(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t dispatch thunk of CubicBezier2.subdivided(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 224))();
}

uint64_t dispatch thunk of CubicBezier2.powerBasis.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 232))();
}

uint64_t dispatch thunk of CubicBezier2.findRoots(withXValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of CubicBezier2.findRoots(withYValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of CubicBezier2.findMonotonicIntervals()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of CubicBezier2.findCharacteristicPoints()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 264))();
}

uint64_t dispatch thunk of CubicBezier2.fitWithQuadraticBezierPair(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 272))();
}

uint64_t dispatch thunk of CubicBezier2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 280))();
}

uint64_t dispatch thunk of CubicBezier2.approximateClosestPoint(to:withSampleCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 288))();
}

uint64_t dispatch thunk of CubicBezier2.tightBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 296))();
}

uint64_t dispatch thunk of CubicBezier2.orientedBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of CubicBezier2.orientedBBoxMatrix()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 312))();
}

float64_t geom_signed_distance_point_to_plane_3d(float64x2_t *a1, float64x2_t *a2)
{
  return a2[2].f64[0] + vmulq_f64(a1[1], a2[1]).f64[0] + vaddvq_f64(vmulq_f64(*a1, *a2));
}

float64_t geom_plane_from_point_and_normal_3d@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  float64x2_t v4 = *a1;
  float64x2_t v3 = a1[1];
  float64x2_t v5 = *a2;
  float64x2_t v6 = a2[1];
  *(void *)(a3 + 40) = 0;
  *(float64x2_t *)a3 = v5;
  *(float64x2_t *)(a3 + 16) = v6;
  float64_t result = vmulq_f64(v6, vnegq_f64(v3)).f64[0] + vaddvq_f64(vmulq_f64(v5, vnegq_f64(v4)));
  *(float64_t *)(a3 + 32) = result;
  return result;
}

float geom_signed_distance_point_to_plane_3f(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(*a1, a2);
  return a1[1].f32[0]
       + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0];
}

double geom_plane_from_point_and_normal_3f@<D0>(__n128 *a1@<X8>, float32x4_t a2@<Q0>, float32x4_t a3@<Q1>)
{
  a1[1].n128_u64[0] = 0;
  a1[1].n128_u64[1] = 0;
  float32x4_t v3 = vmulq_f32(a3, vnegq_f32(a2));
  *a1 = (__n128)a3;
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  a1[1].n128_u32[0] = LODWORD(result);
  return result;
}

float64_t geom_signed_distance_point_to_plane_point_normal_3d(float64x2_t *a1, float64x2_t *a2)
{
  return vmulq_f64(vsubq_f64(a1[1], a2[1]), a2[3]).f64[0] + vaddvq_f64(vmulq_f64(vsubq_f64(*a1, *a2), a2[2]));
}

double geom_signed_distance_point_to_plane_point_normal_3f(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t v3 = vmulq_f32(a3, vsubq_f32(a1, a2));
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  return result;
}

float64_t geom_signed_distance_point_to_line_2d(float64x2_t *a1, float64x2_t a2)
{
  return a1[1].f64[0] + vaddvq_f64(vmulq_f64(*a1, a2));
}

double geom_line_from_ray_2d@<D0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>)
{
  *(double *)a4.i64 = -*(double *)&a3.i64[1];
  float64x2_t v4 = (float64x2_t)vzip1q_s64(a4, a3);
  float64x2_t v5 = vmulq_n_f64(v4, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v4, v4))));
  *(void *)(a1 + 24) = 0;
  *(float64x2_t *)a1 = v5;
  double result = -vaddvq_f64(vmulq_f64(a2, v5));
  *(double *)(a1 + 16) = result;
  return result;
}

double geom_line_from_line_segment_2d@<D0>(uint64_t a1@<X8>, int8x16_t a2@<Q0>, int8x16_t a3@<Q1>)
{
  float64x2_t v3 = vsubq_f64((float64x2_t)vextq_s8(a2, a3, 8uLL), (float64x2_t)vextq_s8(a3, a2, 8uLL));
  float64x2_t v4 = vmulq_n_f64(v3, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v3, v3))));
  *(void *)(a1 + 24) = 0;
  *(float64x2_t *)a1 = v4;
  double result = -vaddvq_f64(vmulq_f64((float64x2_t)a2, v4));
  *(double *)(a1 + 16) = result;
  return result;
}

float geom_signed_distance_point_to_line_2f(uint64_t a1, int a2, float32x2_t a3)
{
  return vaddv_f32(vmul_f32((float32x2_t)a1, a3)) + *(float *)&a2;
}

uint64_t geom_line_from_ray_2f(double a1, int32x2_t a2, double a3)
{
  *(float *)&a3 = -*(float *)&a2.i32[1];
  float32x2_t v3 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a3, a2);
  float32x2_t v4 = vmul_f32(v3, v3);
  v4.i32[0] = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  return (uint64_t)vmul_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
}

uint64_t geom_line_from_line_segment_2f(int8x8_t a1, int8x8_t a2)
{
  float32x2_t v2 = vsub_f32((float32x2_t)vext_s8(a1, a2, 4uLL), (float32x2_t)vext_s8(a2, a1, 4uLL));
  float32x2_t v3 = vmul_f32(v2, v2);
  v3.i32[0] = vadd_f32(v3, (float32x2_t)vdup_lane_s32((int32x2_t)v3, 1)).u32[0];
  float32x2_t v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
  float32x2_t v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
  return (uint64_t)vmul_n_f32(v2, vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).f32[0]);
}

double geom_signed_distance_point_to_sphere_3d(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(*a1, *a2);
  float64x2_t v3 = vsubq_f64(a1[1], a2[1]);
  return sqrt(vmulq_f64(v3, v3).f64[0] + vaddvq_f64(vmulq_f64(v2, v2))) - a2[2].f64[0];
}

float geom_signed_distance_point_to_sphere_3f(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a2, *a1);
  float32x4_t v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0])- a1[1].f32[0];
}

uint64_t sub_236F00150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(v4);
  if (a1 < 0 || result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = a4(v4);
  if (a3 < 0 || result < a3) {
    goto LABEL_17;
  }
  uint64_t v10 = a3 - a1;
  if (a2 >= 1)
  {
    if (v10 < 0 || v10 >= a2) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v10 <= 0 && v10 > a2) {
    return 0;
  }
LABEL_12:
  BOOL v12 = __OFADD__(a1, a2);
  uint64_t v11 = a1 + a2;
  if (v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = a4(v4);
  if ((v11 & 0x8000000000000000) == 0 && result >= v11) {
    return v11;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_236F0022C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  long long v8 = (void *)*v3;
  uint64_t result = geom_collection_size_f(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F002D0;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F002D0(id **a1, char a2)
{
}

uint64_t sub_236F002E8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  long long v8 = (void *)*v3;
  uint64_t result = geom_collection_size_d(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F0038C;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F0038C(id **a1, char a2)
{
}

void sub_236F003A4(id **a1, char a2, void (*a3)(id, id, id, id, id, id))
{
  uint64_t v4 = *a1;
  id v5 = **a1;
  id v6 = (*a1)[1];
  id v7 = (*a1)[4];
  id v8 = (*a1)[5];
  id v9 = (*a1)[2];
  id v10 = (*a1)[3];
  if (a2)
  {
    id v11 = v9;
    a3(v8, v10, v7, v5, v6, v11);
  }
  else
  {
    a3((*a1)[5], v10, v7, v5, v6, v9);
  }

  free(v4);
}

uint64_t sub_236F00458(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_u16(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F004FC;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F004FC(id **a1, char a2)
{
}

uint64_t sub_236F00514(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_u(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F005B8;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F005B8(id **a1, char a2)
{
}

void sub_236F005F8(id **a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(id, id, id, id, id, id, uint64_t, uint64_t))
{
  id v8 = *a1;
  id v9 = **a1;
  id v10 = (*a1)[1];
  id v11 = (*a1)[4];
  id v12 = (*a1)[5];
  id v13 = (*a1)[2];
  id v14 = (*a1)[3];
  if (a2)
  {
    id v15 = v13;
    a5(v12, v14, v11, v9, v10, v15, a3, a4);
  }
  else
  {
    a5((*a1)[5], v14, v11, v9, v10, v13, a3, a4);
  }

  free(v8);
}

uint64_t sub_236F006CC(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_i(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00770;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00770(id **a1, char a2)
{
}

uint64_t sub_236F007B0(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_i8(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00854;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00854(id **a1, char a2)
{
}

uint64_t sub_236F0086C(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_2f(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00910;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00910(id **a1, char a2)
{
}

uint64_t sub_236F00928(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_3f(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F009CC;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F009CC(id **a1, char a2)
{
}

uint64_t sub_236F00A0C(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_4f(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00AB0;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00AB0(id **a1, char a2)
{
}

uint64_t sub_236F00AF0(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_2d(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00B94;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00B94(id **a1, char a2)
{
}

uint64_t sub_236F00BAC(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_3d(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00C50;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00C50(id **a1, char a2)
{
}

uint64_t sub_236F00C90(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  id v8 = (void *)*v3;
  uint64_t result = geom_collection_size_4d(*v3);
  if (result < 0)
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
  if (result >= a3)
  {
    *id v7 = a2;
    v7[1] = a3;
    void v7[2] = v8;
    id v10 = v8;
    return (uint64_t)sub_236F00D34;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_236F00D34(id **a1, char a2)
{
}

void *sub_236F00D7C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AC5C(a1, a2, a3, geom_collection_size_i, geom_collection_data_i);
}

void *sub_236F00DA8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AC5C(a1, a2, a3, geom_collection_size_u, geom_collection_data_u);
}

void *sub_236F00DDC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AEC8(a1, a2, a3, geom_collection_size_3d, geom_collection_data_3d);
}

void *sub_236F00E08(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AFB4(a1, a2, a3, geom_collection_size_3f, geom_collection_data_3f);
}

void *sub_236F00E34(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AEC8(a1, a2, a3, geom_collection_size_4d, geom_collection_data_4d);
}

void *sub_236F00E60(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AFB4(a1, a2, a3, geom_collection_size_4f, geom_collection_data_4f);
}

uint64_t GeometryCollection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v6 + *(void *)(v8 + 72) * a1;
  return v9(a4, v10, AssociatedTypeWitness);
}

uint64_t GeometryCollection.startIndex.getter()
{
  return 0;
}

uint64_t GeometryCollection.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9E0A0](a1, *(void *)(*(void *)(a2 + 8) + 8));
}

uint64_t sub_236F00F74(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *(uint64_t *)((char *)a3 + a4 - 16);
  uint64_t v7 = *(uint64_t *)((char *)a3 + a4 - 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness, v9);
  id v11 = (char *)&v15 - v10;
  uint64_t v12 = *a3;
  (*(void (**)(char *, uint64_t))(v13 + 16))((char *)&v15 - v10, a1);
  return GeometryCollection.subscript.setter((uint64_t)v11, v12, v6, v7);
}

uint64_t GeometryCollection.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  uint64_t v10 = AssociatedTypeWitness;
  uint64_t v11 = v6 + *(void *)(v8 + 72) * a2;
  return v9(v11, a1, v10);
}

uint64_t (*sub_236F01148(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * a2);
  return sub_236F011A4;
}

uint64_t sub_236F011A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = *((_DWORD *)a1 + 4);
  uint64_t result = geom_collection_data_f(*(void *)a1[1]);
  *(_DWORD *)(result + 4 * v1) = v2;
  return result;
}

uint64_t (*sub_236F011DC(void *a1, uint64_t a2))(uint64_t *a1)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(geom_collection_data_d(*v2) + 8 * a2);
  return sub_236F01238;
}

uint64_t sub_236F01238(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = *a1;
  uint64_t result = geom_collection_data_d(*(void *)a1[2]);
  *(void *)(result + 8 * v1) = v2;
  return result;
}

uint64_t (*sub_236F01270(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(geom_collection_data_u16(*v2) + 2 * a2);
  return sub_236F012CC;
}

uint64_t sub_236F012CC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  __int16 v2 = *((_WORD *)a1 + 8);
  uint64_t result = geom_collection_data_u16(*(void *)a1[1]);
  *(_WORD *)(result + 2 * v1) = v2;
  return result;
}

uint64_t (*sub_236F012FC(uint64_t a1, uint64_t a2))(uint64_t *a1, uint64_t a2)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_u(*v2) + 4 * a2);
  return sub_236F01358;
}

uint64_t sub_236F01358(uint64_t *a1, uint64_t a2)
{
  return sub_236F013E4(a1, a2, geom_collection_data_u);
}

uint64_t (*sub_236F01370(uint64_t a1, uint64_t a2))(uint64_t *a1, uint64_t a2)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_i(*v2) + 4 * a2);
  return sub_236F013CC;
}

uint64_t sub_236F013CC(uint64_t *a1, uint64_t a2)
{
  return sub_236F013E4(a1, a2, geom_collection_data_i);
}

uint64_t sub_236F013E4(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = *a1;
  int v4 = *((_DWORD *)a1 + 4);
  uint64_t result = a3(*(void *)a1[1]);
  *(_DWORD *)(result + 4 * v3) = v4;
  return result;
}

uint64_t (*sub_236F01418(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(geom_collection_data_i8(*v2) + a2);
  return sub_236F01474;
}

uint64_t sub_236F01474(uint64_t *a1)
{
  uint64_t v1 = *a1;
  char v2 = *((unsigned char *)a1 + 16);
  uint64_t result = geom_collection_data_i8(*(void *)a1[1]);
  *(unsigned char *)(result + v1) = v2;
  return result;
}

uint64_t (*sub_236F014A4(void *a1, uint64_t a2))(uint64_t *a1)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(void *)(geom_collection_data_2f(*v2) + 8 * a2);
  return sub_236F01500;
}

uint64_t sub_236F01500(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = *a1;
  uint64_t result = geom_collection_data_2f(*(void *)a1[2]);
  *(void *)(result + 8 * v1) = v2;
  return result;
}

void (*sub_236F01538(void *a1, uint64_t a2))(long long **a1, uint64_t a2)
{
  id v5 = malloc(0x20uLL);
  *a1 = v5;
  uint64_t v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)id v5 = *(_OWORD *)(geom_collection_data_3f(*v2) + 16 * a2);
  return sub_236F015A4;
}

void sub_236F015A4(long long **a1, uint64_t a2)
{
}

void (*sub_236F015BC(void *a1, uint64_t a2))(long long **a1, uint64_t a2)
{
  id v5 = malloc(0x20uLL);
  *a1 = v5;
  uint64_t v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)id v5 = *(_OWORD *)(geom_collection_data_4f(*v2) + 16 * a2);
  return sub_236F01628;
}

void sub_236F01628(long long **a1, uint64_t a2)
{
}

void sub_236F01640(long long **a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *((void *)*a1 + 2);
  long long v5 = **a1;
  *(_OWORD *)(a3(**((void **)*a1 + 3)) + 16 * v4) = v5;
  free(v3);
}

void (*sub_236F0169C(void *a1, uint64_t a2))(long long **a1)
{
  long long v5 = malloc(0x20uLL);
  *a1 = v5;
  uint64_t v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)long long v5 = *(_OWORD *)(geom_collection_data_2d(*v2) + 16 * a2);
  return sub_236F01708;
}

void sub_236F01708(long long **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *((void *)*a1 + 2);
  long long v3 = **a1;
  *(_OWORD *)(geom_collection_data_2d(**((void **)*a1 + 3)) + 16 * v2) = v3;
  free(v1);
}

void (*sub_236F01760(void *a1, uint64_t a2))(long long **a1, uint64_t a2)
{
  long long v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  uint64_t v6 = (_OWORD *)(geom_collection_data_3d(*v2) + 32 * a2);
  long long v7 = v6[1];
  *(_OWORD *)long long v5 = *v6;
  *((_OWORD *)v5 + 1) = v7;
  return sub_236F017D0;
}

void sub_236F017D0(long long **a1, uint64_t a2)
{
}

void (*sub_236F017E8(void *a1, uint64_t a2))(long long **a1, uint64_t a2)
{
  long long v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  uint64_t v6 = (_OWORD *)(geom_collection_data_4d(*v2) + 32 * a2);
  long long v7 = v6[1];
  *(_OWORD *)long long v5 = *v6;
  *((_OWORD *)v5 + 1) = v7;
  return sub_236F01858;
}

void sub_236F01858(long long **a1, uint64_t a2)
{
}

void sub_236F01870(long long **a1, uint64_t a2, uint64_t (*a3)(void))
{
  long long v3 = *a1;
  uint64_t v4 = *((void *)*a1 + 4);
  long long v6 = (*a1)[1];
  long long v7 = **a1;
  long long v5 = (_OWORD *)(a3(**((void **)*a1 + 5)) + 32 * v4);
  *long long v5 = v7;
  v5[1] = v6;
  free(v3);
}

void (*GeometryCollection.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  float64x2_t v9[2] = a4;
  v9[3] = v4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  void v9[4] = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  float32x4_t v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  GeometryCollection.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_236F019EC;
}

void sub_236F019EC(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  long long v3 = (void *)(*a1)[6];
  uint64_t v4 = (void *)(*a1)[7];
  if (a2)
  {
    uint64_t v5 = v2[4];
    uint64_t v6 = v2[5];
    uint64_t v7 = v2[2];
    uint64_t v9 = *v2;
    uint64_t v8 = v2[1];
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    GeometryCollection.subscript.setter((uint64_t)v3, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    GeometryCollection.subscript.setter((*a1)[7], *v2, v2[1], v2[2]);
  }
  free(v4);
  free(v3);
  free(v2);
}

Swift::Int __swiftcall GeometryCollection.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

void *sub_236F01AD4@<X0>(void *a1@<X8>)
{
  Swift::Int result = geom_create_collection_f();
  *a1 = result;
  return result;
}

uint64_t sub_236F01AFC()
{
  return geom_collection_data_f(*v0);
}

float sub_236F01B04@<S0>(uint64_t a1@<X0>, float *a2@<X8>)
{
  float result = *(float *)(geom_collection_data_f(*v2) + 4 * a1);
  *a2 = result;
  return result;
}

void sub_236F01B40(unint64_t a1)
{
  geom_collection_resize_f(*v1, a1);
}

void (*sub_236F01B4C(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_f(v3);
  return sub_236F01B98;
}

void sub_236F01B98(uint64_t a1)
{
}

uint64_t sub_236F01BA4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF780, &qword_2688DF788);
  uint64_t result = sub_236EFCF60(&qword_2688DF790, &qword_2688DF788);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F01C34()
{
  return sub_236EFCF60(&qword_2688DF798, &qword_2688DF788);
}

unint64_t sub_236F01C7C()
{
  unint64_t result = qword_2688DF7A0;
  if (!qword_2688DF7A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF7A8);
    sub_236EFCF60(&qword_2688DF790, &qword_2688DF788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF7A0);
  }
  return result;
}

void *sub_236F01D1C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_f, a3);
}

uint64_t sub_236F01D34@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_f, a4);
}

uint64_t sub_236F01D4C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_f);
}

uint64_t sub_236F01D64()
{
  return sub_236EFCF60(&qword_2688DF7B0, &qword_2688DF788);
}

unint64_t sub_236F01DAC()
{
  unint64_t result = qword_2688DF7B8;
  if (!qword_2688DF7B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF7A8);
    sub_236EFCF60(&qword_2688DF780, &qword_2688DF788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF7B8);
  }
  return result;
}

uint64_t sub_236F01E4C(int *a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_f(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_236F01E84(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01148((uint64_t)v4, *a2);
  return sub_236EE9F48;
}

void sub_236F01EE4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F01EFC(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F0022C(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F01F5C@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F09DE0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t *sub_236F01F88(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (*result != *a2)
  {
    uint64_t v5 = *v2;
    int v6 = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * v3);
    uint64_t v7 = 4 * v4;
    int v8 = *(_DWORD *)(geom_collection_data_f(v5) + v7);
    *(_DWORD *)(geom_collection_data_f(v5) + 4 * v3) = v8;
    uint64_t result = (uint64_t *)geom_collection_data_f(v5);
    *(_DWORD *)((char *)result + v7) = v6;
  }
  return result;
}

uint64_t sub_236F02000()
{
  return sub_236F12930();
}

uint64_t sub_236F0207C()
{
  return sub_236F12920();
}

unint64_t sub_236F020FC()
{
  unint64_t result = qword_2688DF7C0;
  if (!qword_2688DF7C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF7A8);
    sub_236EFCF60(&qword_2688DF798, &qword_2688DF788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF7C0);
  }
  return result;
}

void *sub_236F0219C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_f, a2);
}

uint64_t *sub_236F021B4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_f);
}

uint64_t sub_236F021CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t a5@<X8>)
{
  uint64_t result = sub_236F00150(*a1, a2, *a3, a4);
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = v7 & 1;
  return result;
}

uint64_t sub_236F0220C()
{
  return sub_236EFCF60(&qword_2688DF7C8, &qword_2688DF788);
}

uint64_t sub_236F02250()
{
  return sub_236EFD1FC(&qword_2688DF7D0, &qword_2688DF7A8);
}

uint64_t sub_236F0228C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F022B8(_DWORD *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F02310@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_f, a2);
}

uint64_t sub_236F02328@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_f, a1);
}

uint64_t sub_236F02340()
{
  return geom_collection_size_f(*v0);
}

uint64_t sub_236F02354()
{
  return sub_236EFD1FC(&qword_2688DF7D8, &qword_2688DF7E0);
}

uint64_t sub_236F02390(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F023E4()
{
  BOOL v1 = *v0;
  sub_236EF4C4C(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F02418(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AB98(a1, a2, a3);
}

uint64_t sub_236F0243C()
{
  return sub_236F12970();
}

void *sub_236F024B8@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_d();
  *a1 = result;
  return result;
}

uint64_t sub_236F024E0()
{
  return geom_collection_data_d(*v0);
}

double sub_236F024E8@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(geom_collection_data_d(*v2) + 8 * a1);
  *a2 = result;
  return result;
}

void sub_236F02524(unint64_t a1)
{
  geom_collection_resize_d(*v1, a1);
}

void (*sub_236F02530(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_d(v3);
  return sub_236F0257C;
}

void sub_236F0257C(uint64_t a1)
{
}

uint64_t sub_236F02588(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF7E8, &qword_2688DF7F0);
  uint64_t result = sub_236EFCF60(&qword_2688DF7F8, &qword_2688DF7F0);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F02618()
{
  return sub_236EFCF60(&qword_2688DF800, &qword_2688DF7F0);
}

unint64_t sub_236F02660()
{
  unint64_t result = qword_2688DF808;
  if (!qword_2688DF808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF810);
    sub_236EFCF60(&qword_2688DF7F8, &qword_2688DF7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF808);
  }
  return result;
}

void *sub_236F02700@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_d, a3);
}

uint64_t sub_236F02718@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_d, a4);
}

uint64_t sub_236F02730(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_d);
}

uint64_t sub_236F02748()
{
  return sub_236EFCF60(&qword_2688DF818, &qword_2688DF7F0);
}

unint64_t sub_236F02790()
{
  unint64_t result = qword_2688DF820;
  if (!qword_2688DF820)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF810);
    sub_236EFCF60(&qword_2688DF7E8, &qword_2688DF7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF820);
  }
  return result;
}

uint64_t sub_236F02830(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_d(*v2);
  *(void *)(result + 8 * v4) = v3;
  return result;
}

uint64_t (*sub_236F02868(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F011DC(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F028C8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_236F028E0(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void, void, void, void))
{
  id v6 = (id)a1[2];
  a5(v5, *a2, a2[1], *a1, a1[1]);
}

uint64_t (*sub_236F02934(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F002E8(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F02994@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F09F38(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t *sub_236F029C0(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (*result != *a2)
  {
    uint64_t v5 = *v2;
    uint64_t v6 = *(void *)(geom_collection_data_d(*v2) + 8 * v3);
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)(geom_collection_data_d(v5) + v7 * 8);
    *(void *)(geom_collection_data_d(v5) + 8 * v3) = v8;
    uint64_t result = (uint64_t *)geom_collection_data_d(v5);
    result[v7] = v6;
  }
  return result;
}

uint64_t sub_236F02A38()
{
  return sub_236F12930();
}

uint64_t sub_236F02AB4()
{
  return sub_236F12920();
}

unint64_t sub_236F02B34()
{
  unint64_t result = qword_2688DF828;
  if (!qword_2688DF828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF810);
    sub_236EFCF60(&qword_2688DF800, &qword_2688DF7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF828);
  }
  return result;
}

void *sub_236F02BD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_d, a2);
}

uint64_t *sub_236F02BEC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_d);
}

uint64_t sub_236F02C04()
{
  return sub_236EFCF60(&qword_2688DF830, &qword_2688DF7F0);
}

uint64_t sub_236F02C48()
{
  return sub_236EFD1FC(&qword_2688DF838, &qword_2688DF810);
}

uint64_t sub_236F02C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_d(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F02CB0(void *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(void *)(geom_collection_data_d(*v2) + 8 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F02D08@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_d, a2);
}

uint64_t sub_236F02D20@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_d, a1);
}

uint64_t sub_236F02D38()
{
  return geom_collection_size_d(*v0);
}

void *sub_236F02D40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_236F02D58(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

uint64_t sub_236F02D70()
{
  return sub_236EFD1FC(&qword_2688DF840, &qword_2688DF848);
}

void sub_236F02DAC(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_236F02DB8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F02E0C()
{
  BOOL v1 = *v0;
  sub_236EF4C18(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F02E40(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AAD4(a1, a2, a3);
}

uint64_t sub_236F02E64()
{
  return sub_236F12970();
}

void *sub_236F02EE0@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_u16();
  *a1 = result;
  return result;
}

uint64_t sub_236F02F08()
{
  return geom_collection_data_u16(*v0);
}

uint64_t sub_236F02F10@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t result = geom_collection_data_u16(*v2);
  *a2 = *(_WORD *)(result + 2 * a1);
  return result;
}

void sub_236F02F4C(unint64_t a1)
{
  geom_collection_resize_u16(*v1, a1);
}

void (*sub_236F02F58(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_u16(v3);
  return sub_236F02FA4;
}

void sub_236F02FA4(uint64_t a1)
{
}

uint64_t sub_236F02FB0(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF850, &qword_2688DF858);
  uint64_t result = sub_236EFCF60(&qword_2688DF860, &qword_2688DF858);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F03040()
{
  return sub_236EFCF60(&qword_2688DF868, &qword_2688DF858);
}

unint64_t sub_236F03088()
{
  unint64_t result = qword_2688DF870;
  if (!qword_2688DF870)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF878);
    sub_236EFCF60(&qword_2688DF860, &qword_2688DF858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF870);
  }
  return result;
}

void *sub_236F03128@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_u16, a3);
}

uint64_t sub_236F03140@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_u16, a4);
}

uint64_t sub_236F03158(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_u16);
}

uint64_t sub_236F03170()
{
  return sub_236EFCF60(&qword_2688DF880, &qword_2688DF858);
}

unint64_t sub_236F031B8()
{
  unint64_t result = qword_2688DF888;
  if (!qword_2688DF888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF878);
    sub_236EFCF60(&qword_2688DF850, &qword_2688DF858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF888);
  }
  return result;
}

uint64_t sub_236F03258(__int16 *a1, uint64_t *a2)
{
  __int16 v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_u16(*v2);
  *(_WORD *)(result + 2 * v4) = v3;
  return result;
}

uint64_t (*sub_236F03290(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01270((uint64_t)v4, *a2);
  return sub_236EE9F48;
}

void sub_236F032F0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F03308(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00458(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F03368@<X0>(uint64_t (*a1)(__int16 *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F0A090(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t *sub_236F03394(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (*result != *a2)
  {
    uint64_t v5 = *v2;
    uint64_t v6 = geom_collection_data_u16(*v2);
    uint64_t v7 = 2 * v3;
    __int16 v8 = *(_WORD *)(v6 + 2 * v3);
    uint64_t v9 = 2 * v4;
    __int16 v10 = *(_WORD *)(geom_collection_data_u16(v5) + v9);
    *(_WORD *)(geom_collection_data_u16(v5) + v7) = v10;
    uint64_t result = (uint64_t *)geom_collection_data_u16(v5);
    *(_WORD *)((char *)result + v9) = v8;
  }
  return result;
}

uint64_t sub_236F0340C()
{
  return sub_236F12930();
}

uint64_t sub_236F03488()
{
  return sub_236F12920();
}

unint64_t sub_236F03508()
{
  unint64_t result = qword_2688DF890;
  if (!qword_2688DF890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF878);
    sub_236EFCF60(&qword_2688DF868, &qword_2688DF858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF890);
  }
  return result;
}

void *sub_236F035A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_u16, a2);
}

uint64_t *sub_236F035C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_u16);
}

uint64_t sub_236F035D8()
{
  return sub_236EFCF60(&qword_2688DF898, &qword_2688DF858);
}

uint64_t sub_236F0361C()
{
  return sub_236EFD1FC(&qword_2688DF8A0, &qword_2688DF878);
}

uint64_t sub_236F03658@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_u16(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F03684(_WORD *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(_WORD *)(geom_collection_data_u16(*v2) + 2 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F036DC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_u16, a2);
}

uint64_t sub_236F036F4@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_u16, a1);
}

uint64_t sub_236F0370C()
{
  return geom_collection_size_u16(*v0);
}

uint64_t sub_236F03714()
{
  return sub_236EFD1FC(&qword_2688DF8A8, &qword_2688DF8B0);
}

uint64_t sub_236F03750(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F037A4()
{
  BOOL v1 = *v0;
  sub_236EF5270(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F037D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0B158(a1, a2, a3);
}

uint64_t sub_236F037FC()
{
  return sub_236F12970();
}

void *sub_236F03878@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_u();
  *a1 = result;
  return result;
}

uint64_t sub_236F038A0()
{
  return geom_collection_data_u(*v0);
}

uint64_t sub_236F038A8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = geom_collection_data_u(*v2);
  *a2 = *(_DWORD *)(result + 4 * a1);
  return result;
}

void sub_236F038E4(std::vector<int>::size_type a1)
{
  geom_collection_resize_u(*v1, a1);
}

void (*sub_236F038F0(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_u(v3);
  return sub_236F0393C;
}

void sub_236F0393C(uint64_t a1)
{
}

uint64_t sub_236F03948(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF8B8, &qword_2688DF8C0);
  uint64_t result = sub_236EFCF60(&qword_2688DF8C8, &qword_2688DF8C0);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F039D8()
{
  return sub_236EFCF60(&qword_2688DF8D0, &qword_2688DF8C0);
}

unint64_t sub_236F03A20()
{
  unint64_t result = qword_2688DF8D8;
  if (!qword_2688DF8D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF8E0);
    sub_236EFCF60(&qword_2688DF8C8, &qword_2688DF8C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF8D8);
  }
  return result;
}

void *sub_236F03AC0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_u, a3);
}

uint64_t sub_236F03AD8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_u, a4);
}

uint64_t sub_236F03AF0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_u);
}

uint64_t sub_236F03B08()
{
  return sub_236EFCF60(&qword_2688DF8E8, &qword_2688DF8C0);
}

unint64_t sub_236F03B50()
{
  unint64_t result = qword_2688DF8F0;
  if (!qword_2688DF8F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF8E0);
    sub_236EFCF60(&qword_2688DF8B8, &qword_2688DF8C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF8F0);
  }
  return result;
}

uint64_t sub_236F03BF0(int *a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_u(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_236F03C28(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F012FC((uint64_t)v4, *a2);
  return sub_236EE9F48;
}

void sub_236F03C88(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_236F03CC8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, void, void, void, void))
{
  id v8 = (id)a1[2];
  a7(v7, *a2, a2[1], *a1, a1[1]);
}

uint64_t (*sub_236F03D24(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00514(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F03D84@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A1E8(a1, a2, geom_collection_size_u, geom_collection_data_u);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *sub_236F03DD8(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F047A0(a1, a2, a3, a4, geom_collection_data_u);
}

uint64_t sub_236F03DF0()
{
  return sub_236F12930();
}

uint64_t sub_236F03E6C()
{
  return sub_236F12920();
}

unint64_t sub_236F03EEC()
{
  unint64_t result = qword_2688DF8F8;
  if (!qword_2688DF8F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF8E0);
    sub_236EFCF60(&qword_2688DF8D0, &qword_2688DF8C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF8F8);
  }
  return result;
}

void *sub_236F03F8C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_u, a2);
}

uint64_t *sub_236F03FA4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_u);
}

uint64_t sub_236F03FBC()
{
  return sub_236EFCF60(&qword_2688DF900, &qword_2688DF8C0);
}

uint64_t sub_236F04000()
{
  return sub_236EFD1FC(&qword_2688DF908, &qword_2688DF8E0);
}

uint64_t sub_236F0403C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_u(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F04068(_DWORD *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_u(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F040C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_u, a2);
}

uint64_t sub_236F040D8@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_u, a1);
}

uint64_t sub_236F040F0()
{
  return geom_collection_size_u(*v0);
}

uint64_t sub_236F040F8()
{
  return sub_236EFD1FC(&qword_2688DF910, &qword_2688DF918);
}

uint64_t sub_236F04134(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F04188()
{
  BOOL v1 = *v0;
  sub_236EF4CB4(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F041BC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AC5C(a1, a2, a3, geom_collection_size_u, geom_collection_data_u);
}

uint64_t sub_236F04208()
{
  return sub_236F12970();
}

void *sub_236F04284@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_i();
  *a1 = result;
  return result;
}

uint64_t sub_236F042AC()
{
  return geom_collection_data_i(*v0);
}

uint64_t sub_236F042B4@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = geom_collection_data_i(*v2);
  *a2 = *(_DWORD *)(result + 4 * a1);
  return result;
}

void sub_236F042F0(std::vector<int>::size_type a1)
{
  geom_collection_resize_i(*v1, a1);
}

void (*sub_236F042FC(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_i(v3);
  return sub_236F04348;
}

void sub_236F04348(uint64_t a1)
{
}

uint64_t sub_236F04354(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF920, &qword_2688DF928);
  uint64_t result = sub_236EFCF60(&qword_2688DF930, &qword_2688DF928);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F043E4()
{
  return sub_236EFCF60(&qword_2688DF938, &qword_2688DF928);
}

unint64_t sub_236F0442C()
{
  unint64_t result = qword_2688DF940;
  if (!qword_2688DF940)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF948);
    sub_236EFCF60(&qword_2688DF930, &qword_2688DF928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF940);
  }
  return result;
}

void *sub_236F044CC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_i, a3);
}

uint64_t sub_236F044E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_i, a4);
}

uint64_t sub_236F044FC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_i);
}

uint64_t sub_236F04514()
{
  return sub_236EFCF60(&qword_2688DF950, &qword_2688DF928);
}

unint64_t sub_236F0455C()
{
  unint64_t result = qword_2688DF958;
  if (!qword_2688DF958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF948);
    sub_236EFCF60(&qword_2688DF920, &qword_2688DF928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF958);
  }
  return result;
}

uint64_t sub_236F045FC(int *a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_i(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_236F04634(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01370((uint64_t)v4, *a2);
  return sub_236EE9F48;
}

void sub_236F04694(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F046D4(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F006CC(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F04734@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A1E8(a1, a2, geom_collection_size_i, geom_collection_data_i);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *sub_236F04788(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F047A0(a1, a2, a3, a4, geom_collection_data_i);
}

void *sub_236F047A0(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  if (*result != *a2)
  {
    uint64_t v8 = *v5;
    uint64_t v9 = 4 * *result;
    int v10 = *(_DWORD *)(a5(v8) + v9);
    uint64_t v11 = 4 * v6;
    int v12 = *(_DWORD *)(a5(v8) + v11);
    *(_DWORD *)(a5(v8) + v9) = v12;
    uint64_t result = (void *)a5(v8);
    *(_DWORD *)((char *)result + v11) = v10;
  }
  return result;
}

uint64_t sub_236F0482C()
{
  return sub_236F12930();
}

uint64_t sub_236F048A8()
{
  return sub_236F12920();
}

unint64_t sub_236F04928()
{
  unint64_t result = qword_2688DF960;
  if (!qword_2688DF960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF948);
    sub_236EFCF60(&qword_2688DF938, &qword_2688DF928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF960);
  }
  return result;
}

void *sub_236F049C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_i, a2);
}

uint64_t *sub_236F049E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_i);
}

uint64_t sub_236F049F8()
{
  return sub_236EFCF60(&qword_2688DF968, &qword_2688DF928);
}

uint64_t sub_236F04A3C()
{
  return sub_236EFD1FC(&qword_2688DF970, &qword_2688DF948);
}

uint64_t sub_236F04A78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_i(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F04AA4(_DWORD *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_i(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F04AFC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_i, a2);
}

uint64_t sub_236F04B14@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_i, a1);
}

uint64_t sub_236F04B2C()
{
  return geom_collection_size_i(*v0);
}

uint64_t sub_236F04B34()
{
  return sub_236EFD1FC(&qword_2688DF978, &qword_2688DF980);
}

uint64_t sub_236F04B70(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F04BC4()
{
  BOOL v1 = *v0;
  sub_236EF4C80(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F04BF8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AC5C(a1, a2, a3, geom_collection_size_i, geom_collection_data_i);
}

uint64_t sub_236F04C44()
{
  return sub_236F12970();
}

void *sub_236F04CC0@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_i8();
  *a1 = result;
  return result;
}

uint64_t sub_236F04CE8()
{
  return geom_collection_data_i8(*v0);
}

uint64_t sub_236F04CF0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = geom_collection_data_i8(*v2);
  *a2 = *(unsigned char *)(result + a1);
  return result;
}

void sub_236F04D2C(unint64_t a1)
{
  geom_collection_resize_i8(*v1, a1);
}

void (*sub_236F04D38(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_i8(v3);
  return sub_236F04D84;
}

void sub_236F04D84(uint64_t a1)
{
}

uint64_t sub_236F04D90(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF988, &qword_2688DF990);
  uint64_t result = sub_236EFCF60(&qword_2688DF998, &qword_2688DF990);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F04E20()
{
  return sub_236EFCF60(&qword_2688DF9A0, &qword_2688DF990);
}

unint64_t sub_236F04E68()
{
  unint64_t result = qword_2688DF9A8;
  if (!qword_2688DF9A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF9B0);
    sub_236EFCF60(&qword_2688DF998, &qword_2688DF990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF9A8);
  }
  return result;
}

void *sub_236F04F08@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_i8, a3);
}

uint64_t sub_236F04F20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_i8, a4);
}

uint64_t sub_236F04F38(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_i8);
}

uint64_t sub_236F04F50()
{
  return sub_236EFCF60(&qword_2688DF9B8, &qword_2688DF990);
}

unint64_t sub_236F04F98()
{
  unint64_t result = qword_2688DF9C0;
  if (!qword_2688DF9C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF9B0);
    sub_236EFCF60(&qword_2688DF988, &qword_2688DF990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF9C0);
  }
  return result;
}

uint64_t sub_236F05038(char *a1, uint64_t *a2)
{
  char v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_i8(*v2);
  *(unsigned char *)(result + v4) = v3;
  return result;
}

uint64_t (*sub_236F05070(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01418((uint64_t)v4, *a2);
  return sub_236EE9F48;
}

void sub_236F050D0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F050E8(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F007B0(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F05148@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F0A380(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void *sub_236F05174(void *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (*result != *a2)
  {
    uint64_t v5 = *v2;
    char v6 = *(unsigned char *)(geom_collection_data_i8(*v2) + v3);
    char v7 = *(unsigned char *)(geom_collection_data_i8(v5) + v4);
    *(unsigned char *)(geom_collection_data_i8(v5) + v3) = v7;
    uint64_t result = (void *)geom_collection_data_i8(v5);
    *((unsigned char *)result + v4) = v6;
  }
  return result;
}

uint64_t sub_236F051E4()
{
  return sub_236F12930();
}

uint64_t sub_236F05260()
{
  return sub_236F12920();
}

unint64_t sub_236F052E0()
{
  unint64_t result = qword_2688DF9C8;
  if (!qword_2688DF9C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DF9B0);
    sub_236EFCF60(&qword_2688DF9A0, &qword_2688DF990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DF9C8);
  }
  return result;
}

void *sub_236F05380@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_i8, a2);
}

uint64_t *sub_236F05398(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_i8);
}

uint64_t sub_236F053B0()
{
  return sub_236EFCF60(&qword_2688DF9D0, &qword_2688DF990);
}

uint64_t sub_236F053F4()
{
  return sub_236EFD1FC(&qword_2688DF9D8, &qword_2688DF9B0);
}

uint64_t sub_236F05430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_i8(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F0545C(unsigned char *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(unsigned char *)(geom_collection_data_i8(*v2) + v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F054B4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_i8, a2);
}

uint64_t sub_236F054CC@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_i8, a1);
}

uint64_t sub_236F054E4()
{
  return geom_collection_size_i8(*v0);
}

uint64_t sub_236F054EC()
{
  return sub_236EFD1FC(&qword_2688DF9E0, &qword_2688DF9E8);
}

uint64_t sub_236F05528(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F0557C()
{
  BOOL v1 = *v0;
  sub_236EF51B0(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F055B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0B098(a1, a2, a3);
}

uint64_t sub_236F055D4()
{
  return sub_236F12970();
}

void *sub_236F05650@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_2f();
  *a1 = result;
  return result;
}

uint64_t sub_236F05678()
{
  return geom_collection_data_2f(*v0);
}

double sub_236F05680@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(geom_collection_data_2f(*v2) + 8 * a1);
  *a2 = result;
  return result;
}

void sub_236F056BC(unint64_t a1)
{
  geom_collection_resize_2f(*v1, a1);
}

void (*sub_236F056C8(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_2f(v3);
  return sub_236F05714;
}

void sub_236F05714(uint64_t a1)
{
}

uint64_t sub_236F05720(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DF9F0, &qword_2688DF9F8);
  uint64_t result = sub_236EFCF60(&qword_2688DFA00, &qword_2688DF9F8);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F057B0()
{
  return sub_236EFCF60(&qword_2688DFA08, &qword_2688DF9F8);
}

unint64_t sub_236F057F8()
{
  unint64_t result = qword_2688DFA10;
  if (!qword_2688DFA10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA18);
    sub_236EFCF60(&qword_2688DFA00, &qword_2688DF9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA10);
  }
  return result;
}

void *sub_236F05898@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_2f, a3);
}

uint64_t sub_236F058B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_2f, a4);
}

uint64_t sub_236F058C8(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_2f);
}

uint64_t sub_236F058E0()
{
  return sub_236EFCF60(&qword_2688DFA20, &qword_2688DF9F8);
}

unint64_t sub_236F05928()
{
  unint64_t result = qword_2688DFA28;
  if (!qword_2688DFA28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA18);
    sub_236EFCF60(&qword_2688DF9F0, &qword_2688DF9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA28);
  }
  return result;
}

uint64_t sub_236F059C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = geom_collection_data_2f(*v2);
  *(void *)(result + 8 * v4) = v3;
  return result;
}

uint64_t (*sub_236F05A00(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F014A4(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F05A60(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F05A78(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F0086C(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F05AD8@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F0A4C8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t *sub_236F05B04(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v4 = *a2;
  if (*result != *a2)
  {
    uint64_t v5 = *v2;
    uint64_t v6 = *(void *)(geom_collection_data_2f(*v2) + 8 * v3);
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)(geom_collection_data_2f(v5) + v7 * 8);
    *(void *)(geom_collection_data_2f(v5) + 8 * v3) = v8;
    uint64_t result = (uint64_t *)geom_collection_data_2f(v5);
    result[v7] = v6;
  }
  return result;
}

uint64_t sub_236F05B7C()
{
  return sub_236F12930();
}

uint64_t sub_236F05BF8()
{
  return sub_236F12920();
}

unint64_t sub_236F05C78()
{
  unint64_t result = qword_2688DFA30;
  if (!qword_2688DFA30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA18);
    sub_236EFCF60(&qword_2688DFA08, &qword_2688DF9F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA30);
  }
  return result;
}

void *sub_236F05D18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_2f, a2);
}

uint64_t *sub_236F05D30(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_2f);
}

uint64_t sub_236F05D48()
{
  return sub_236EFCF60(&qword_2688DFA38, &qword_2688DF9F8);
}

uint64_t sub_236F05D8C()
{
  return sub_236EFD1FC(&qword_2688DFA40, &qword_2688DFA18);
}

uint64_t sub_236F05DC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_2f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F05DF4(void *a1, uint64_t *a2))(void)
{
  uint64_t v3 = *a2;
  *a1 = *(void *)(geom_collection_data_2f(*v2) + 8 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_236F05E4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_2f, a2);
}

uint64_t sub_236F05E64@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_2f, a1);
}

uint64_t sub_236F05E7C()
{
  return geom_collection_size_2f(*v0);
}

uint64_t sub_236F05E84()
{
  return sub_236EFD1FC(&qword_2688DFA48, &qword_2688DFA50);
}

uint64_t sub_236F05EC0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F05F14()
{
  BOOL v1 = *v0;
  sub_236EF4E00(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F05F48(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AE04(a1, a2, a3);
}

uint64_t sub_236F05F6C()
{
  return sub_236F12970();
}

void *sub_236F05FE8@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_3f();
  *a1 = result;
  return result;
}

uint64_t sub_236F06010()
{
  return geom_collection_data_3f(*v0);
}

__n128 sub_236F06018@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *(__n128 *)(geom_collection_data_3f(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_236F06054(unint64_t a1)
{
  geom_collection_resize_3f(*v1, a1);
}

void (*sub_236F06060(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_3f(v3);
  return sub_236F060AC;
}

void sub_236F060AC(uint64_t a1)
{
}

uint64_t sub_236F060B8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DFA58, &qword_2688DFA60);
  uint64_t result = sub_236EFCF60(&qword_2688DFA68, &qword_2688DFA60);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F06148()
{
  return sub_236EFCF60(&qword_2688DFA70, &qword_2688DFA60);
}

unint64_t sub_236F06190()
{
  unint64_t result = qword_2688DFA78;
  if (!qword_2688DFA78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA80);
    sub_236EFCF60(&qword_2688DFA68, &qword_2688DFA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA78);
  }
  return result;
}

void *sub_236F06230@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_3f, a3);
}

uint64_t sub_236F06248@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_3f, a4);
}

uint64_t sub_236F06260(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_3f);
}

uint64_t sub_236F06278()
{
  return sub_236EFCF60(&qword_2688DFA88, &qword_2688DFA60);
}

unint64_t sub_236F062C0()
{
  unint64_t result = qword_2688DFA90;
  if (!qword_2688DFA90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA80);
    sub_236EFCF60(&qword_2688DFA58, &qword_2688DFA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA90);
  }
  return result;
}

__n128 sub_236F06360(__n128 *a1, uint64_t *a2)
{
  __n128 v6 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = geom_collection_data_3f(*v2);
  __n128 result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_236F063A0(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01538(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F06400(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F06440(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00928(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F064A0@<X0>(uint64_t (*a1)(long long *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A620(a1, a2, geom_collection_size_3f, geom_collection_data_3f);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

double sub_236F064F4(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&double result = sub_236F06ED8(a1, a2, a3, a4, geom_collection_data_3f).n128_u64[0];
  return result;
}

uint64_t sub_236F0650C()
{
  return sub_236F12930();
}

uint64_t sub_236F06588()
{
  return sub_236F12920();
}

unint64_t sub_236F06608()
{
  unint64_t result = qword_2688DFA98;
  if (!qword_2688DFA98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFA80);
    sub_236EFCF60(&qword_2688DFA70, &qword_2688DFA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFA98);
  }
  return result;
}

void *sub_236F066A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_3f, a2);
}

uint64_t *sub_236F066C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_3f);
}

uint64_t sub_236F066D8()
{
  return sub_236EFCF60(&qword_2688DFAA0, &qword_2688DFA60);
}

uint64_t sub_236F0671C()
{
  return sub_236EFD1FC(&qword_2688DFAA8, &qword_2688DFA80);
}

uint64_t sub_236F06758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_3f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F06784(void *a1, uint64_t *a2))()
{
  uint64_t v5 = malloc(0x10uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  *uint64_t v5 = *(_OWORD *)(geom_collection_data_3f(*v2) + 16 * v6);
  return sub_236F0B228;
}

uint64_t sub_236F067F0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_3f, a2);
}

uint64_t sub_236F06808@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_3f, a1);
}

uint64_t sub_236F06820()
{
  return geom_collection_size_3f(*v0);
}

uint64_t sub_236F06828()
{
  return sub_236EFD1FC(&qword_2688DFAB0, &qword_2688DFAB8);
}

uint64_t sub_236F06864(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F068B8()
{
  BOOL v1 = *v0;
  sub_236EF4F4C(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F068EC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AFB4(a1, a2, a3, geom_collection_size_3f, geom_collection_data_3f);
}

uint64_t sub_236F06938()
{
  return sub_236F12970();
}

void *sub_236F069B4@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_4f();
  *a1 = result;
  return result;
}

uint64_t sub_236F069DC()
{
  return geom_collection_data_4f(*v0);
}

__n128 sub_236F069E4@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *(__n128 *)(geom_collection_data_4f(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_236F06A20(unint64_t a1)
{
  geom_collection_resize_4f(*v1, a1);
}

void (*sub_236F06A2C(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_4f(v3);
  return sub_236F06A78;
}

void sub_236F06A78(uint64_t a1)
{
}

uint64_t sub_236F06A84(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DFAC0, &qword_2688DFAC8);
  uint64_t result = sub_236EFCF60(&qword_2688DFAD0, &qword_2688DFAC8);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F06B14()
{
  return sub_236EFCF60(&qword_2688DFAD8, &qword_2688DFAC8);
}

unint64_t sub_236F06B5C()
{
  unint64_t result = qword_2688DFAE0;
  if (!qword_2688DFAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFAE8);
    sub_236EFCF60(&qword_2688DFAD0, &qword_2688DFAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFAE0);
  }
  return result;
}

void *sub_236F06BFC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_4f, a3);
}

uint64_t sub_236F06C14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_4f, a4);
}

uint64_t sub_236F06C2C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_4f);
}

uint64_t sub_236F06C44()
{
  return sub_236EFCF60(&qword_2688DFAF0, &qword_2688DFAC8);
}

unint64_t sub_236F06C8C()
{
  unint64_t result = qword_2688DFAF8;
  if (!qword_2688DFAF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFAE8);
    sub_236EFCF60(&qword_2688DFAC0, &qword_2688DFAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFAF8);
  }
  return result;
}

__n128 sub_236F06D2C(__n128 *a1, uint64_t *a2)
{
  __n128 v6 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = geom_collection_data_4f(*v2);
  __n128 result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_236F06D6C(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F015BC(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F06DCC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F06E0C(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00A0C(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F06E6C@<X0>(uint64_t (*a1)(long long *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A620(a1, a2, geom_collection_size_4f, geom_collection_data_4f);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

double sub_236F06EC0(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&double result = sub_236F06ED8(a1, a2, a3, a4, geom_collection_data_4f).n128_u64[0];
  return result;
}

__n128 sub_236F06ED8(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  if (*a1 != *a2)
  {
    uint64_t v8 = *v5;
    uint64_t v9 = 16 * *a1;
    __n128 v14 = *(__n128 *)(a5(v8) + v9);
    uint64_t v10 = 16 * v6;
    long long v13 = *(_OWORD *)(a5(v8) + v10);
    *(_OWORD *)(a5(v8) + v9) = v13;
    uint64_t v11 = a5(v8);
    __n128 result = v14;
    *(__n128 *)(v11 + v10) = v14;
  }
  return result;
}

uint64_t sub_236F06F74()
{
  return sub_236F12930();
}

uint64_t sub_236F06FF0()
{
  return sub_236F12920();
}

unint64_t sub_236F07070()
{
  unint64_t result = qword_2688DFB00;
  if (!qword_2688DFB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFAE8);
    sub_236EFCF60(&qword_2688DFAD8, &qword_2688DFAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFB00);
  }
  return result;
}

void *sub_236F07110@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_4f, a2);
}

uint64_t *sub_236F07128(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_4f);
}

uint64_t sub_236F07140()
{
  return sub_236EFCF60(&qword_2688DFB08, &qword_2688DFAC8);
}

uint64_t sub_236F07184()
{
  return sub_236EFD1FC(&qword_2688DFB10, &qword_2688DFAE8);
}

uint64_t sub_236F071C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_4f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F071EC(void *a1, uint64_t *a2))()
{
  uint64_t v5 = malloc(0x10uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  *uint64_t v5 = *(_OWORD *)(geom_collection_data_4f(*v2) + 16 * v6);
  return sub_236F0B228;
}

uint64_t sub_236F07258@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_4f, a2);
}

uint64_t sub_236F07270@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_4f, a1);
}

uint64_t sub_236F07288()
{
  return geom_collection_size_4f(*v0);
}

uint64_t sub_236F07290()
{
  return sub_236EFD1FC(&qword_2688DFB18, &qword_2688DFB20);
}

uint64_t sub_236F072CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F07320()
{
  BOOL v1 = *v0;
  sub_236EF5098(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F07354(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AFB4(a1, a2, a3, geom_collection_size_4f, geom_collection_data_4f);
}

uint64_t sub_236F073A0()
{
  return sub_236F12970();
}

void *sub_236F0741C@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_2d();
  *a1 = result;
  return result;
}

uint64_t sub_236F07444()
{
  return geom_collection_data_2d(*v0);
}

__n128 sub_236F0744C@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *(__n128 *)(geom_collection_data_2d(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_236F07488(unint64_t a1)
{
  geom_collection_resize_2d(*v1, a1);
}

void (*sub_236F07494(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_2d(v3);
  return sub_236F074E0;
}

void sub_236F074E0(uint64_t a1)
{
}

uint64_t sub_236F074EC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DFB28, &qword_2688DFB30);
  uint64_t result = sub_236EFCF60(&qword_2688DFB38, &qword_2688DFB30);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F0757C()
{
  return sub_236EFCF60(&qword_2688DFB40, &qword_2688DFB30);
}

unint64_t sub_236F075C4()
{
  unint64_t result = qword_2688DFB48;
  if (!qword_2688DFB48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFB50);
    sub_236EFCF60(&qword_2688DFB38, &qword_2688DFB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFB48);
  }
  return result;
}

void *sub_236F07664@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_2d, a3);
}

uint64_t sub_236F0767C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_2d, a4);
}

uint64_t sub_236F07694(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_2d);
}

uint64_t sub_236F076AC()
{
  return sub_236EFCF60(&qword_2688DFB58, &qword_2688DFB30);
}

unint64_t sub_236F076F4()
{
  unint64_t result = qword_2688DFB60;
  if (!qword_2688DFB60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFB50);
    sub_236EFCF60(&qword_2688DFB28, &qword_2688DFB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFB60);
  }
  return result;
}

__n128 sub_236F07794(__n128 *a1, uint64_t *a2)
{
  __n128 v6 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = geom_collection_data_2d(*v2);
  __n128 result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_236F077D4(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F0169C(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F07834(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F0784C(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00AF0(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F078AC@<X0>(uint64_t (*a1)(long long *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_236F0A7B8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

__n128 sub_236F078D8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  if (*a1 != *a2)
  {
    uint64_t v5 = *v2;
    __n128 v10 = *(__n128 *)(geom_collection_data_2d(*v2) + 16 * v3);
    uint64_t v6 = 16 * v4;
    long long v9 = *(_OWORD *)(geom_collection_data_2d(v5) + v6);
    *(_OWORD *)(geom_collection_data_2d(v5) + 16 * v3) = v9;
    uint64_t v7 = geom_collection_data_2d(v5);
    __n128 result = v10;
    *(__n128 *)(v7 + v6) = v10;
  }
  return result;
}

uint64_t sub_236F07960()
{
  return sub_236F12930();
}

uint64_t sub_236F079DC()
{
  return sub_236F12920();
}

unint64_t sub_236F07A5C()
{
  unint64_t result = qword_2688DFB68;
  if (!qword_2688DFB68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFB50);
    sub_236EFCF60(&qword_2688DFB40, &qword_2688DFB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFB68);
  }
  return result;
}

void *sub_236F07AFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_2d, a2);
}

uint64_t *sub_236F07B14(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_2d);
}

uint64_t sub_236F07B2C()
{
  return sub_236EFCF60(&qword_2688DFB70, &qword_2688DFB30);
}

uint64_t sub_236F07B70()
{
  return sub_236EFD1FC(&qword_2688DFB78, &qword_2688DFB50);
}

uint64_t sub_236F07BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_2d(*v1);
  *a1 = result;
  return result;
}

void (*sub_236F07BD8(void *a1, uint64_t *a2))(void **a1)
{
  uint64_t v5 = malloc(0x10uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  *uint64_t v5 = *(_OWORD *)(geom_collection_data_2d(*v2) + 16 * v6);
  return sub_236F07C44;
}

void sub_236F07C44(void **a1)
{
}

uint64_t sub_236F07C4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_2d, a2);
}

uint64_t sub_236F07C64@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_2d, a1);
}

uint64_t sub_236F07C7C()
{
  return geom_collection_size_2d(*v0);
}

uint64_t sub_236F07C84()
{
  return sub_236EFD1FC(&qword_2688DFB80, &qword_2688DFB88);
}

uint64_t sub_236F07CC0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F07D14()
{
  BOOL v1 = *v0;
  sub_236EF4DCC(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t *sub_236F07D48(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AD40(a1, a2, a3);
}

uint64_t sub_236F07D6C()
{
  return sub_236F12970();
}

void *sub_236F07DE8@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_3d();
  *a1 = result;
  return result;
}

uint64_t sub_236F07E10()
{
  return geom_collection_data_3d(*v0);
}

__n128 sub_236F07E18@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = geom_collection_data_3d(*v2) + 32 * a1;
  __n128 result = *(__n128 *)v4;
  long long v6 = *(_OWORD *)(v4 + 16);
  *a2 = *(_OWORD *)v4;
  a2[1] = v6;
  return result;
}

void sub_236F07E58(unint64_t a1)
{
  geom_collection_resize_3d(*v1, a1);
}

void (*sub_236F07E64(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_3d(v3);
  return sub_236F07EB0;
}

void sub_236F07EB0(uint64_t a1)
{
}

uint64_t sub_236F07EBC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DFB90, &qword_2688DFB98);
  uint64_t result = sub_236EFCF60(&qword_2688DFBA0, &qword_2688DFB98);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F07F4C()
{
  return sub_236EFCF60(&qword_2688DFBA8, &qword_2688DFB98);
}

unint64_t sub_236F07F94()
{
  unint64_t result = qword_2688DFBB0;
  if (!qword_2688DFBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFBB8);
    sub_236EFCF60(&qword_2688DFBA0, &qword_2688DFB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFBB0);
  }
  return result;
}

void *sub_236F08034@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_3d, a3);
}

uint64_t sub_236F0804C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_3d, a4);
}

uint64_t sub_236F08064(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_3d);
}

uint64_t sub_236F0807C()
{
  return sub_236EFCF60(&qword_2688DFBC0, &qword_2688DFB98);
}

unint64_t sub_236F080C4()
{
  unint64_t result = qword_2688DFBC8;
  if (!qword_2688DFBC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFBB8);
    sub_236EFCF60(&qword_2688DFB90, &qword_2688DFB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFBC8);
  }
  return result;
}

__n128 sub_236F08164(__n128 *a1, uint64_t *a2)
{
  __n128 v6 = a1[1];
  __n128 v7 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (__n128 *)(geom_collection_data_3d(*v2) + 32 * v3);
  __n128 result = v7;
  *uint64_t v4 = v7;
  v4[1] = v6;
  return result;
}

uint64_t (*sub_236F081B0(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F01760(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F08210(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F08250(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00BAC(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F082B0@<X0>(uint64_t (*a1)(long long *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A918(a1, a2, geom_collection_size_3d, geom_collection_data_3d);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

double sub_236F08304(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&double result = sub_236F08CFC(a1, a2, a3, a4, geom_collection_data_3d).n128_u64[0];
  return result;
}

uint64_t sub_236F0831C()
{
  return sub_236F12930();
}

uint64_t sub_236F08398()
{
  return sub_236F12920();
}

unint64_t sub_236F08418()
{
  unint64_t result = qword_2688DFBD0;
  if (!qword_2688DFBD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFBB8);
    sub_236EFCF60(&qword_2688DFBA8, &qword_2688DFB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFBD0);
  }
  return result;
}

void *sub_236F084B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_3d, a2);
}

uint64_t *sub_236F084D0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_3d);
}

uint64_t sub_236F084E8()
{
  return sub_236EFCF60(&qword_2688DFBD8, &qword_2688DFB98);
}

uint64_t sub_236F0852C()
{
  return sub_236EFD1FC(&qword_2688DFBE0, &qword_2688DFBB8);
}

uint64_t sub_236F08568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_3d(*v1);
  *a1 = result;
  return result;
}

void (*sub_236F08594(void *a1, uint64_t *a2))(void **a1)
{
  uint64_t v5 = malloc(0x20uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  __n128 v7 = (_OWORD *)(geom_collection_data_3d(*v2) + 32 * v6);
  long long v8 = v7[1];
  *uint64_t v5 = *v7;
  v5[1] = v8;
  return sub_236F07C44;
}

uint64_t sub_236F08604@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_3d, a2);
}

uint64_t sub_236F0861C@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_3d, a1);
}

uint64_t sub_236F08634()
{
  return geom_collection_size_3d(*v0);
}

uint64_t sub_236F0863C()
{
  return sub_236EFD1FC(&qword_2688DFBE8, &qword_2688DFBF0);
}

uint64_t sub_236F08678(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F086CC()
{
  BOOL v1 = *v0;
  sub_236EF4F18(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F08700(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AEC8(a1, a2, a3, geom_collection_size_3d, geom_collection_data_3d);
}

uint64_t sub_236F0874C()
{
  return sub_236F12970();
}

void *sub_236F087C8@<X0>(void *a1@<X8>)
{
  uint64_t result = geom_create_collection_4d();
  *a1 = result;
  return result;
}

uint64_t sub_236F087F0()
{
  return geom_collection_data_4d(*v0);
}

__n128 sub_236F087F8@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = geom_collection_data_4d(*v2) + 32 * a1;
  __n128 result = *(__n128 *)v4;
  long long v6 = *(_OWORD *)(v4 + 16);
  *a2 = *(_OWORD *)v4;
  a2[1] = v6;
  return result;
}

void sub_236F08838(unint64_t a1)
{
  geom_collection_resize_4d(*v1, a1);
}

void (*sub_236F08844(uint64_t *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_4d(v3);
  return sub_236F08890;
}

void sub_236F08890(uint64_t a1)
{
}

uint64_t sub_236F0889C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_236EFCF60(&qword_2688DFBF8, &qword_2688DFC00);
  uint64_t result = sub_236EFCF60(&qword_2688DFC08, &qword_2688DFC00);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236F0892C()
{
  return sub_236EFCF60(&qword_2688DFC10, &qword_2688DFC00);
}

unint64_t sub_236F08974()
{
  unint64_t result = qword_2688DFC18;
  if (!qword_2688DFC18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFC20);
    sub_236EFCF60(&qword_2688DFC08, &qword_2688DFC00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFC18);
  }
  return result;
}

void *sub_236F08A14@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_236F0923C(a1, a2, geom_collection_size_4d, a3);
}

uint64_t sub_236F08A2C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_236F021CC(a1, a2, a3, geom_collection_size_4d, a4);
}

uint64_t sub_236F08A44(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F09294(a1, a2, a3, a4, geom_collection_size_4d);
}

uint64_t sub_236F08A5C()
{
  return sub_236EFCF60(&qword_2688DFC28, &qword_2688DFC00);
}

unint64_t sub_236F08AA4()
{
  unint64_t result = qword_2688DFC30;
  if (!qword_2688DFC30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFC20);
    sub_236EFCF60(&qword_2688DFBF8, &qword_2688DFC00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFC30);
  }
  return result;
}

__n128 sub_236F08B44(__n128 *a1, uint64_t *a2)
{
  __n128 v6 = a1[1];
  __n128 v7 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (__n128 *)(geom_collection_data_4d(*v2) + 32 * v3);
  __n128 result = v7;
  *uint64_t v4 = v7;
  v4[1] = v6;
  return result;
}

uint64_t (*sub_236F08B90(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F017E8(v4, *a2);
  return sub_236EE9F48;
}

void sub_236F08BF0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t (*sub_236F08C30(void *a1, uint64_t *a2))()
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_236F00C90(v4, *a2, a2[1]);
  return sub_236EE9F48;
}

uint64_t sub_236F08C90@<X0>(uint64_t (*a1)(long long *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_236F0A918(a1, a2, geom_collection_size_4d, geom_collection_data_4d);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

double sub_236F08CE4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&double result = sub_236F08CFC(a1, a2, a3, a4, geom_collection_data_4d).n128_u64[0];
  return result;
}

__n128 sub_236F08CFC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  if (*a1 != *a2)
  {
    uint64_t v9 = *v5;
    uint64_t v10 = a5(v9);
    uint64_t v11 = 32 * v6;
    __n128 v19 = *(__n128 *)(v10 + v11 + 16);
    __n128 v20 = *(__n128 *)(v10 + v11);
    uint64_t v12 = a5(v9);
    uint64_t v13 = 32 * v7;
    long long v17 = *(_OWORD *)(v12 + v13 + 16);
    long long v18 = *(_OWORD *)(v12 + v13);
    __n128 v14 = (_OWORD *)(a5(v9) + v11);
    *__n128 v14 = v18;
    v14[1] = v17;
    uint64_t v15 = (__n128 *)(a5(v9) + v13);
    __n128 result = v20;
    *uint64_t v15 = v20;
    v15[1] = v19;
  }
  return result;
}

uint64_t sub_236F08DB8()
{
  return sub_236F12930();
}

uint64_t sub_236F08E34()
{
  return sub_236F12920();
}

unint64_t sub_236F08EB4()
{
  unint64_t result = qword_2688DFC38;
  if (!qword_2688DFC38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688DFC20);
    sub_236EFCF60(&qword_2688DFC10, &qword_2688DFC00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688DFC38);
  }
  return result;
}

void *sub_236F08F54@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_236F08F6C(a1, geom_collection_size_4d, a2);
}

void *sub_236F08F6C@<X0>(void *result@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t result = (void *)a2(*v3);
    if ((v5 & 0x8000000000000000) == 0 && v5 < (uint64_t)result)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F08FC4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F08FDC(a1, a2, a3, geom_collection_size_4d);
}

uint64_t *sub_236F08FDC(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = result;
    unint64_t result = (uint64_t *)a4(*v4);
    if ((v5 & 0x8000000000000000) == 0 && v5 < (uint64_t)result)
    {
      *uint64_t v6 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_236F09034()
{
  return sub_236EFCF60(&qword_2688DFC40, &qword_2688DFC00);
}

uint64_t sub_236F09078()
{
  return sub_236EFD1FC(&qword_2688DFC48, &qword_2688DFC20);
}

uint64_t sub_236F090B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = geom_collection_size_4d(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_236F090E0(void *a1, uint64_t *a2))()
{
  uint64_t v5 = malloc(0x20uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  uint64_t v7 = (_OWORD *)(geom_collection_data_4d(*v2) + 32 * v6);
  long long v8 = v7[1];
  *uint64_t v5 = *v7;
  v5[1] = v8;
  return sub_236F0B228;
}

uint64_t sub_236F09150@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F09168(a1, (uint64_t (*)(void))geom_collection_size_4d, a2);
}

uint64_t sub_236F09168@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X3>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  id v8 = *v3;
  uint64_t result = a2();
  if (result < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v6 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result < v5)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *a3 = v6;
  a3[1] = v5;
  a3[2] = v8;
  return (uint64_t)v8;
}

uint64_t sub_236F091E4@<X0>(void *a1@<X8>)
{
  return sub_236F091FC(geom_collection_size_4d, a1);
}

uint64_t sub_236F091FC@<X0>(uint64_t (*a1)(void)@<X2>, void *a2@<X8>)
{
  uint64_t result = a1(*v2);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *a2 = 0;
    a2[1] = result;
  }
  return result;
}

uint64_t sub_236F09234()
{
  return geom_collection_size_4d(*v0);
}

void *sub_236F0923C@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v6 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (void *)a3(*v4);
    if ((v6 & 0x8000000000000000) == 0 && (uint64_t)result >= v6)
    {
      *a4 = v6;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_236F09294(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v8 = *a2;
  uint64_t v9 = *v5;
  uint64_t result = a5(v9);
  if (v7 < 0 || result < v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = a5(v9);
    if ((v8 & 0x8000000000000000) == 0 && result >= v8) {
      return v8 - v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F09304(uint64_t *result, uint64_t *a2)
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

void *sub_236F09320(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_236F0933C(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

uint64_t sub_236F09358()
{
  return sub_236EFD1FC(&qword_2688DFC50, &qword_2688DFC58);
}

uint64_t sub_236F09394(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_236F093E8()
{
  BOOL v1 = *v0;
  sub_236EF4F80(*v0);
  uint64_t v3 = v2;

  return v3;
}

void *sub_236F0941C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F0AEC8(a1, a2, a3, geom_collection_size_4d, geom_collection_data_4d);
}

uint64_t sub_236F09468()
{
  return sub_236F12970();
}

uint64_t sub_236F094E4@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return GeometryCollection.subscript.getter(*a1, *(uint64_t *)((char *)a1 + a2 - 16), *(uint64_t *)((char *)a1 + a2 - 8), a3);
}

uint64_t sub_236F0951C()
{
  return 16;
}

__n128 sub_236F09528(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of GeometryCollection.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GeometryCollection.dataPointer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of GeometryCollection.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of GeometryCollection.count.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of GeometryCollection.count.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_236F09598(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_f(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      int v14 = *(_DWORD *)(geom_collection_data_f(a6) + 4 * a4);
      uint64_t result = geom_collection_data_f(v11);
      *(_DWORD *)(result + 4 * a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09678(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_d(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      uint64_t v14 = *(void *)(geom_collection_data_d(a6) + 8 * a4);
      uint64_t result = geom_collection_data_d(v11);
      *(void *)(result + 8 * a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09758(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_u16(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      __int16 v14 = *(_WORD *)(geom_collection_data_u16(a6) + 2 * a4);
      uint64_t result = geom_collection_data_u16(v11);
      *(_WORD *)(result + 2 * a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09838(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void), uint64_t (*a8)(uint64_t))
{
  uint64_t v14 = *a1;
  uint64_t result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v16 = a3 - 1;
    while (a4 < a5)
    {
      int v17 = *(_DWORD *)(a8(a6) + 4 * a4);
      uint64_t result = a8(v14);
      *(_DWORD *)(result + 4 * a2) = v17;
      ++a4;
      if (v16 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09928(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_i8(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      char v14 = *(unsigned char *)(geom_collection_data_i8(a6) + a4);
      uint64_t result = geom_collection_data_i8(v11);
      *(unsigned char *)(result + a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09A08(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_2f(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      uint64_t v14 = *(void *)(geom_collection_data_2f(a6) + 8 * a4);
      uint64_t result = geom_collection_data_2f(v11);
      *(void *)(result + 8 * a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09AE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void), uint64_t (*a8)(uint64_t))
{
  uint64_t v14 = *a1;
  uint64_t result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v16 = a3 - 1;
    while (a4 < a5)
    {
      long long v17 = *(_OWORD *)(a8(a6) + 16 * a4);
      uint64_t result = a8(v14);
      *(_OWORD *)(result + 16 * a2) = v17;
      ++a4;
      if (v16 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09BE8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t result = geom_collection_size_2d(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = a3 - 1;
    while (a4 < a5)
    {
      long long v14 = *(_OWORD *)(geom_collection_data_2d(a6) + 16 * a4);
      uint64_t result = geom_collection_data_2d(v11);
      *(_OWORD *)(result + 16 * a2) = v14;
      ++a4;
      if (v13 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09CD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void), uint64_t (*a8)(uint64_t))
{
  uint64_t v14 = *a1;
  uint64_t result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v16 = a3 - 1;
    while (a4 < a5)
    {
      long long v17 = (long long *)(a8(a6) + 32 * a4);
      long long v19 = v17[1];
      long long v20 = *v17;
      uint64_t result = a8(v14);
      long long v18 = (_OWORD *)(result + 32 * a2);
      *long long v18 = v20;
      v18[1] = v19;
      ++a4;
      if (v16 == a2) {
        goto LABEL_5;
      }
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_236F09DE0(uint64_t (*a1)(int *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_f(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    int v15 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * i);
    char v8 = a1(&v15);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_f(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        int v14 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * v6 - 4);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          int v12 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * i);
          int v13 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * v9);
          *(_DWORD *)(geom_collection_data_f(v4) + 4 * i) = v13;
          *(_DWORD *)(geom_collection_data_f(v4) + 4 * v9) = v12;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F09F38(uint64_t (*a1)(uint64_t *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_d(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    uint64_t v14 = *(void *)(geom_collection_data_d(v4) + 8 * i);
    char v8 = a1(&v14);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_d(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        uint64_t v14 = *(void *)(geom_collection_data_d(v4) + 8 * v6 - 8);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          uint64_t v12 = *(void *)(geom_collection_data_d(v4) + 8 * i);
          uint64_t v13 = *(void *)(geom_collection_data_d(v4) + 8 * v9);
          *(void *)(geom_collection_data_d(v4) + 8 * i) = v13;
          *(void *)(geom_collection_data_d(v4) + 8 * v9) = v12;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A090(uint64_t (*a1)(__int16 *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_u16(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    __int16 v15 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * i);
    char v8 = a1(&v15);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_u16(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        __int16 v14 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * v6 - 2);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          __int16 v13 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * i);
          __int16 v12 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * v9);
          *(_WORD *)(geom_collection_data_u16(v4) + 2 * i) = v12;
          *(_WORD *)(geom_collection_data_u16(v4) + 2 * v9) = v13;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A1E8(uint64_t (*a1)(int *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v9 = *v4;
  uint64_t v10 = a3(*v4);
  if (v10 < 1) {
    return 0;
  }
  uint64_t v11 = v10;
  for (uint64_t i = 0; i < v14; ++i)
  {
    int v20 = *(_DWORD *)(a4(v9) + 4 * i);
    char v13 = a1(&v20);
    if (v5) {
      break;
    }
    if (v13)
    {
      while (1)
      {
        uint64_t v14 = v11 - 1;
        uint64_t result = a3(v9);
        if (v11 - 1 < 0 || v14 >= result) {
          break;
        }
        if (i >= v14) {
          return i;
        }
        int v19 = *(_DWORD *)(a4(v9) + 4 * v11 - 4);
        char v16 = a1(&v19);
        --v11;
        if ((v16 & 1) == 0)
        {
          int v18 = *(_DWORD *)(a4(v9) + 4 * i);
          int v17 = *(_DWORD *)(a4(v9) + 4 * v14);
          *(_DWORD *)(a4(v9) + 4 * i) = v17;
          *(_DWORD *)(a4(v9) + 4 * v14) = v18;
          uint64_t v11 = v14;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v14 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A380(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_i8(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    char v15 = *(unsigned char *)(geom_collection_data_i8(v4) + i);
    char v8 = a1(&v15);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_i8(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        char v14 = *(unsigned char *)(geom_collection_data_i8(v4) + v6 - 1);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          char v12 = *(unsigned char *)(geom_collection_data_i8(v4) + i);
          char v13 = *(unsigned char *)(geom_collection_data_i8(v4) + v9);
          *(unsigned char *)(geom_collection_data_i8(v4) + i) = v13;
          *(unsigned char *)(geom_collection_data_i8(v4) + v9) = v12;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A4C8(uint64_t (*a1)(uint64_t *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_2f(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    uint64_t v14 = *(void *)(geom_collection_data_2f(v4) + 8 * i);
    char v8 = a1(&v14);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_2f(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        uint64_t v14 = *(void *)(geom_collection_data_2f(v4) + 8 * v6 - 8);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          uint64_t v12 = *(void *)(geom_collection_data_2f(v4) + 8 * i);
          uint64_t v13 = *(void *)(geom_collection_data_2f(v4) + 8 * v9);
          *(void *)(geom_collection_data_2f(v4) + 8 * i) = v13;
          *(void *)(geom_collection_data_2f(v4) + 8 * v9) = v12;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A620(uint64_t (*a1)(long long *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v9 = *v4;
  uint64_t v10 = a3(*v4);
  if (v10 < 1) {
    return 0;
  }
  uint64_t v11 = v10;
  for (uint64_t i = 0; i < v14; ++i)
  {
    long long v21 = *(_OWORD *)(a4(v9) + 16 * i);
    char v13 = a1(&v21);
    if (v5) {
      break;
    }
    if (v13)
    {
      while (1)
      {
        uint64_t v14 = v11 - 1;
        uint64_t result = a3(v9);
        if (v11 - 1 < 0 || v14 >= result) {
          break;
        }
        if (i >= v14) {
          return i;
        }
        long long v21 = *(_OWORD *)(a4(v9) + 16 * v11 - 16);
        char v16 = a1(&v21);
        --v11;
        if ((v16 & 1) == 0)
        {
          uint64_t v17 = a4(v9);
          uint64_t v22 = 16 * i;
          long long v20 = *(_OWORD *)(v17 + 16 * i);
          long long v19 = *(_OWORD *)(a4(v9) + 16 * v14);
          uint64_t v18 = a4(v9);
          *(_OWORD *)(v18 + v22) = v19;
          *(_OWORD *)(a4(v9) + 16 * v14) = v20;
          uint64_t v11 = v14;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v14 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A7B8(uint64_t (*a1)(long long *))
{
  uint64_t v4 = *v1;
  uint64_t v5 = geom_collection_size_2d(*v1);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = v5;
  for (uint64_t i = 0; i < v9; ++i)
  {
    long long v14 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i);
    char v8 = a1(&v14);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = v6 - 1;
        uint64_t result = geom_collection_size_2d(v4);
        if (v6 - 1 < 0 || v9 >= result) {
          break;
        }
        if (i >= v9) {
          return i;
        }
        long long v14 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v6 - 16);
        char v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          long long v13 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i);
          long long v12 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v9);
          *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i) = v12;
          *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v9) = v13;
          uint64_t v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_236F0A918(uint64_t (*a1)(long long *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v9 = *v4;
  uint64_t v10 = a3(*v4);
  if (v10 < 1) {
    return 0;
  }
  uint64_t v11 = v10;
  for (uint64_t i = 0; i < v16; ++i)
  {
    long long v13 = (long long *)(a4(v9) + 32 * i);
    long long v14 = v13[1];
    long long v31 = *v13;
    long long v32 = v14;
    char v15 = a1(&v31);
    if (v5) {
      break;
    }
    if (v15)
    {
      while (1)
      {
        uint64_t v16 = v11 - 1;
        uint64_t result = a3(v9);
        if (v11 - 1 < 0 || v16 >= result) {
          break;
        }
        if (i >= v16) {
          return i;
        }
        uint64_t v18 = a4(v9) + 32 * v11;
        long long v19 = *(_OWORD *)(v18 - 16);
        long long v31 = *(_OWORD *)(v18 - 32);
        long long v32 = v19;
        char v20 = a1(&v31);
        --v11;
        if ((v20 & 1) == 0)
        {
          uint64_t v21 = a4(v9);
          uint64_t v33 = 32 * i;
          uint64_t v22 = (long long *)(v21 + 32 * i);
          long long v29 = v22[1];
          long long v30 = *v22;
          uint64_t v23 = (long long *)(a4(v9) + 32 * v16);
          long long v27 = v23[1];
          long long v28 = *v23;
          uint64_t v24 = a4(v9);
          uint64_t v25 = (_OWORD *)(v24 + v33);
          *uint64_t v25 = v28;
          v25[1] = v27;
          uint64_t v26 = (_OWORD *)(a4(v9) + 32 * v16);
          *uint64_t v26 = v30;
          v26[1] = v29;
          uint64_t v11 = v16;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    uint64_t v16 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t *sub_236F0AAD4(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_d(v3))
    {
      uint64_t v7 = geom_collection_data_d(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(void *)(a2 + 8 * v8) = *(void *)(v7 + 8 * v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_d(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_d(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F0AB98(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_f(v3))
    {
      uint64_t v7 = geom_collection_data_f(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v8) = *(_DWORD *)(v7 + 4 * v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_f(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_f(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void *sub_236F0AC5C(void *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v6 = v5;
    v6[1] = v7;
    return (void *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      uint64_t v11 = a5(v5);
      uint64_t v12 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v12) = *(_DWORD *)(v11 + 4 * v12);
        if (v7 - 1 == v12) {
          goto LABEL_11;
        }
        if (v12 + 1 == a4(v5))
        {
          uint64_t v7 = v12 + 1;
          goto LABEL_11;
        }
        uint64_t v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F0AD40(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_2d(v3))
    {
      uint64_t v7 = geom_collection_data_2d(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(_OWORD *)(a2 + 16 * v8) = *(_OWORD *)(v7 + 16 * v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_2d(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_2d(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F0AE04(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_2f(v3))
    {
      uint64_t v7 = geom_collection_data_2f(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(void *)(a2 + 8 * v8) = *(void *)(v7 + 8 * v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_2f(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_2f(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void *sub_236F0AEC8(void *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v6 = v5;
    v6[1] = v7;
    return (void *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      uint64_t v11 = a5(v5);
      uint64_t v12 = 0;
      while (1)
      {
        long long v13 = (_OWORD *)(a2 + 32 * v12);
        long long v14 = (_OWORD *)(v11 + 32 * v12);
        long long v15 = v14[1];
        *long long v13 = *v14;
        v13[1] = v15;
        if (v7 - 1 == v12) {
          goto LABEL_11;
        }
        if (v12 + 1 == a4(v5))
        {
          uint64_t v7 = v12 + 1;
          goto LABEL_11;
        }
        uint64_t v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void *sub_236F0AFB4(void *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v6 = v5;
    v6[1] = v7;
    return (void *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      uint64_t v11 = a5(v5);
      uint64_t v12 = 0;
      while (1)
      {
        *(_OWORD *)(a2 + 16 * v12) = *(_OWORD *)(v11 + 16 * v12);
        if (v7 - 1 == v12) {
          goto LABEL_11;
        }
        if (v12 + 1 == a4(v5))
        {
          uint64_t v7 = v12 + 1;
          goto LABEL_11;
        }
        uint64_t v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F0B098(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_i8(v3))
    {
      uint64_t v7 = geom_collection_data_i8(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(unsigned char *)(a2 + v8) = *(unsigned char *)(v7 + v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_i8(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_i8(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_236F0B158(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  if (!a3)
  {
LABEL_11:
    *uint64_t v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_u16(v3))
    {
      uint64_t v7 = geom_collection_data_u16(v3);
      uint64_t v8 = 0;
      while (1)
      {
        *(_WORD *)(a2 + 2 * v8) = *(_WORD *)(v7 + 2 * v8);
        if (v5 - 1 == v8) {
          goto LABEL_11;
        }
        if (v8 + 1 == geom_collection_size_u16(v3))
        {
          uint64_t v5 = v8 + 1;
          goto LABEL_11;
        }
        uint64_t v7 = geom_collection_data_u16(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t geom_quadratic_bezier_2f.init(powerBasis:)(double a1, double a2, double a3)
{
  return sub_236F0B304((uint64_t (*)(void *))geom_power_basis_convert_to_quadratic_bezier_2f, a1, a2, a3);
}

uint64_t geom_quadratic_bezier_2f.init(interpolatePoints:)(double a1, double a2, double a3)
{
  return sub_236F0B304((uint64_t (*)(void *))geom_quadratic_bezier_interpolate_points_2f, a1, a2, a3);
}

uint64_t sub_236F0B304(uint64_t (*a1)(void *), double a2, double a3, double a4)
{
  v5[3] = *MEMORY[0x263EF8340];
  *(double *)uint64_t v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&uint64_t v5[2] = a4;
  return a1(v5);
}

double geom_quadratic_bezier_2f.subdivided(at:)@<D0>(uint64_t a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  geom_quadratic_bezier_subdivide_2f((uint64_t)&v12, (uint64_t)&v10, a3, a4, a5, a2);
  double result = *(double *)&v12;
  uint64_t v7 = v13;
  long long v8 = v10;
  uint64_t v9 = v11;
  *(_OWORD *)a1 = v12;
  *(void *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v8;
  *(void *)(a1 + 40) = v9;
  return result;
}

double geom_quadratic_bezier_2f.powerBasis.getter(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 0, 24);
  geom_quadratic_bezier_convert_to_power_basis_2f((uint64_t)v4, a1, a2, a3);
  return *(double *)v4;
}

double geom_quadratic_bezier_2f.findRoots(withXValue:)@<D0>(void *a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  return sub_236F0B540((uint64_t (*)(void *, double, double, double, float))geom_quadratic_bezier_find_roots_at_x_2f, a1, a2, a3, a4, a5);
}

double geom_quadratic_bezier_2f.findRoots(withYValue:)@<D0>(void *a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  return sub_236F0B540((uint64_t (*)(void *, double, double, double, float))geom_quadratic_bezier_find_roots_at_y_2f, a1, a2, a3, a4, a5);
}

double sub_236F0B540@<D0>(uint64_t (*a1)(void *, double, double, double, float)@<X0>, void *a2@<X8>, float a3@<S0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unsigned int v7 = a1(v9, a4, a5, a6, a3);
  double result = *(double *)v9;
  *a2 = v9[0];
  a2[1] = v7;
  return result;
}

double geom_quadratic_bezier_2f.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(_OWORD *)unsigned int v7 = 0uLL;
  unsigned int monotonic_intervals_2f = geom_quadratic_bezier_find_monotonic_intervals_2f(v7, a2, a3, a4);
  double result = v7[0];
  *(_OWORD *)a1 = *(_OWORD *)v7;
  *(void *)(a1 + 16) = monotonic_intervals_2f;
  return result;
}

void __swiftcall geom_quadratic_bezier_2f.orientedBBoxMatrix()(simd_float3x3 *__return_ptr retstr)
{
  *(double *)v5.i64 = geom_oriented_bounding_box_matrix_of_quadratic_bezier_2f(v1, v2, v3);
  retstr->columns[0] = v5;
  retstr->columns[1] = v6;
  retstr->columns[2] = v7;
}

void sub_236F0B670(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  sub_236F0B748(a1, a2, a3, (double (*)(void *))geom_power_basis_convert_to_quadratic_bezier_2f, a4);
}

void sub_236F0B6DC(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  sub_236F0B748(a1, a2, a3, (double (*)(void *))geom_quadratic_bezier_interpolate_points_2f, a4);
}

void sub_236F0B748(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, double (*a4)(void *)@<X5>, uint64_t a5@<X8>)
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  v10[0] = *a1;
  v10[1] = v6;
  _OWORD v10[2] = v7;
  *(double *)a5 = a4(v10);
  *(void *)(a5 + 8) = v8;
  *(void *)(a5 + 16) = v9;
}

void sub_236F0B7C4(void *a1@<X8>)
{
  geom_quadratic_bezier_elevate_from_linear_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
}

void sub_236F0B7F4(float32x2_t *a1@<X0>, float32x2_t *a2@<X8>)
{
  *a2 = geom_quadratic_bezier_from_derivative_of_cubic_bezier_2f(*a1, a1[1]);
  a2[1] = v3;
  a2[2] = v4;
}

double sub_236F0B828(double *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  float32x2_t v7 = *v3;
  float32x2_t v8 = v3[1];
  float32x2_t v9 = v3[2];
  double v13 = 0.0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  geom_quadratic_bezier_convert_to_power_basis_2f((uint64_t)&v13, v7, v8, v9);
  double result = v13;
  uint64_t v11 = v14;
  uint64_t v12 = v15;
  *a1 = v13;
  *a2 = v11;
  *a3 = v12;
  return result;
}

double sub_236F0B8B8(uint64_t a1, uint64_t a2, float *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  float v6 = *a3;
  float32x2_t v7 = *v3;
  float32x2_t v8 = v3[1];
  float32x2_t v9 = v3[2];
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  geom_quadratic_bezier_subdivide_2f((uint64_t)&v16, (uint64_t)&v14, v7, v8, v9, v6);
  double result = *(double *)&v16;
  uint64_t v11 = v17;
  long long v12 = v14;
  uint64_t v13 = v15;
  *(_OWORD *)a1 = v16;
  *(void *)(a1 + 16) = v11;
  *(_OWORD *)a2 = v12;
  *(void *)(a2 + 16) = v13;
  return result;
}

double sub_236F0B960@<D0>(float *a1@<X0>, void *a2@<X8>)
{
  return sub_236F0BA38(a1, (uint64_t (*)(void *, double, double, double, float))geom_quadratic_bezier_find_roots_at_x_2f, a2);
}

double sub_236F0B9CC@<D0>(float *a1@<X0>, void *a2@<X8>)
{
  return sub_236F0BA38(a1, (uint64_t (*)(void *, double, double, double, float))geom_quadratic_bezier_find_roots_at_y_2f, a2);
}

double sub_236F0BA38@<D0>(float *a1@<X0>, uint64_t (*a2)(void *, double, double, double, float)@<X3>, void *a3@<X8>)
{
  v11[1] = *MEMORY[0x263EF8340];
  float v5 = *a1;
  double v6 = *v3;
  double v7 = v3[1];
  double v8 = v3[2];
  v11[0] = 0;
  unsigned int v9 = a2(v11, v6, v7, v8, v5);
  double result = *(double *)v11;
  *a3 = v11[0];
  a3[1] = v9;
  return result;
}

double sub_236F0BAB8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  float32x2_t v3 = *v1;
  float32x2_t v4 = v1[1];
  float32x2_t v5 = v1[2];
  *(_OWORD *)double v8 = 0uLL;
  unsigned int monotonic_intervals_2f = geom_quadratic_bezier_find_monotonic_intervals_2f(v8, v3, v4, v5);
  double result = v8[0];
  *(_OWORD *)a1 = *(_OWORD *)v8;
  *(void *)(a1 + 16) = monotonic_intervals_2f;
  return result;
}

void sub_236F0BB30(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  *a2 = geom_quadratic_bezier_extract_2f(*v2, v2[1], v2[2], *a1);
  a2[1] = v4;
  a2[2] = v5;
}

void sub_236F0BB6C(float32x2_t *a1@<X8>)
{
  *a1 = geom_quadratic_bezier_demote_to_linear_2f(*v1, v1[1], v1[2]);
  a1[1] = v3;
}

void sub_236F0BB9C(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  *a2 = geom_quadratic_bezier_point_at_2f(*v2, v2[1], v2[2], *a1);
}

void sub_236F0BBD0(float *a1@<X0>, double *a2@<X8>)
{
}

void sub_236F0BBE8(float *a1@<X0>, double *a2@<X8>)
{
}

void sub_236F0BC00(float *a1@<X0>, double (*a2)(double, double, double, float)@<X3>, double *a3@<X8>)
{
  *a3 = a2(*v3, v3[1], v3[2], *a1);
}

void sub_236F0BC38(unsigned __int8 a1@<W0>, float *a2@<X1>, float32x2_t *a3@<X8>)
{
  *a3 = geom_quadratic_bezier_derivative_at_2f(a1, *v3, v3[1], v3[2], *a2);
}

void sub_236F0BC70(float *a1@<X0>, float *a2@<X8>)
{
  *a2 = geom_quadratic_bezier_curvature_at_2f(*v2, v2[1], v2[2], *a1);
}

void sub_236F0BCA4(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  *a3 = geom_quadratic_bezier_arc_length_in_range_2f(*v3, v3[1], v3[2], *a1, *a2);
}

void sub_236F0BCDC(uint64_t a1@<X8>)
{
  *(double *)a1 = geom_tight_bbox_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *(void *)(a1 + 8) = v3;
}

void sub_236F0BD0C(uint64_t a1@<X8>)
{
  *(double *)a1 = geom_oriented_bounding_box_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
}

void sub_236F0BD40(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_oriented_bounding_box_matrix_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

uint64_t geom_quadratic_bezier_2d.init(powerBasis:)(__n128 a1, __n128 a2, __n128 a3)
{
  return sub_236F0BE4C((uint64_t (*)(_OWORD *))geom_power_basis_convert_to_quadratic_bezier_2d, a1, a2, a3);
}

uint64_t geom_quadratic_bezier_2d.init(interpolatePoints:)(__n128 a1, __n128 a2, __n128 a3)
{
  return sub_236F0BE4C((uint64_t (*)(_OWORD *))geom_quadratic_bezier_interpolate_points_2d, a1, a2, a3);
}

uint64_t sub_236F0BE4C(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = a2;
  v5[1] = a3;
  uint64_t v5[2] = a4;
  return a1(v5);
}

float64_t geom_quadratic_bezier_2d.subdivided(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  float64x2_t v15 = 0u;
  float64x2_t v12 = 0u;
  long long v13 = 0u;
  geom_quadratic_bezier_subdivide_2d(&v15, &v12, a3, a4, a5, a2);
  float64_t result = v15.f64[0];
  long long v7 = v16;
  long long v8 = v17;
  float64x2_t v9 = v12;
  long long v10 = v13;
  long long v11 = v14;
  *(float64x2_t *)a1 = v15;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = v8;
  *(float64x2_t *)(a1 + 48) = v9;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v11;
  return result;
}

float64_t geom_quadratic_bezier_2d.powerBasis.getter(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  geom_quadratic_bezier_convert_to_power_basis_2d(v4, a1, a2, a3);
  return v4[0].f64[0];
}

double geom_quadratic_bezier_2d.findRoots(withXValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  return sub_236F0C088((uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_x_2d, a1, a2, a3, a4, a5);
}

double geom_quadratic_bezier_2d.findRoots(withYValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  return sub_236F0C088((uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_y_2d, a1, a2, a3, a4, a5);
}

double sub_236F0C088@<D0>(uint64_t (*a1)(double *, __n128, __n128, __n128, double)@<X0>, uint64_t a2@<X8>, double a3@<D0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(_OWORD *)float64x2_t v9 = 0uLL;
  unsigned int v7 = a1(v9, a4, a5, a6, a3);
  double result = v9[0];
  *(_OWORD *)a2 = *(_OWORD *)v9;
  *(void *)(a2 + 16) = v7;
  return result;
}

__n128 geom_quadratic_bezier_2d.findMonotonicIntervals()@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  __n128 v8 = 0u;
  unsigned int monotonic_intervals_2d = geom_quadratic_bezier_find_monotonic_intervals_2d(&v7, a2, a3, a4);
  __n128 result = v8;
  *(_OWORD *)a1 = v7;
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = monotonic_intervals_2d;
  return result;
}

void __swiftcall geom_quadratic_bezier_2d.orientedBBoxMatrix()(simd_double3x3 *__return_ptr retstr)
{
  geom_oriented_bounding_box_matrix_of_quadratic_bezier_2d((uint64_t)v10, v1, v2, v3);
  long long v5 = v10[1];
  long long v6 = v10[2];
  long long v7 = v10[3];
  long long v8 = v10[4];
  long long v9 = v10[5];
  *(_OWORD *)retstr->columns[0].f64 = v10[0];
  *(_OWORD *)&retstr->columns[0].f64[2] = v5;
  *(_OWORD *)retstr->columns[1].f64 = v6;
  *(_OWORD *)&retstr->columns[1].f64[2] = v7;
  *(_OWORD *)retstr->columns[2].f64 = v8;
  *(_OWORD *)&retstr->columns[2].f64[2] = v9;
}

void sub_236F0C1D8(_OWORD *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, _OWORD *a4@<X8>)
{
  sub_236F0C2B0(a1, a2, a3, (double (*)(_OWORD *))geom_power_basis_convert_to_quadratic_bezier_2d, a4);
}

void sub_236F0C244(_OWORD *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, _OWORD *a4@<X8>)
{
  sub_236F0C2B0(a1, a2, a3, (double (*)(_OWORD *))geom_quadratic_bezier_interpolate_points_2d, a4);
}

void sub_236F0C2B0(_OWORD *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, double (*a4)(_OWORD *)@<X5>, _OWORD *a5@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v6 = *a2;
  long long v7 = *a3;
  v11[0] = *a1;
  v11[1] = v6;
  void v11[2] = v7;
  *(double *)&long long v8 = a4(v11);
  *a5 = v8;
  a5[1] = v9;
  a5[2] = v10;
}

void sub_236F0C32C(_OWORD *a1@<X8>)
{
  geom_quadratic_bezier_elevate_from_linear_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
}

void sub_236F0C35C(float64x2_t *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v3 = geom_quadratic_bezier_from_derivative_of_cubic_bezier_2d(*a1, a1[1]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
}

float64_t sub_236F0C390(float64x2_t *a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  float64x2_t v7 = *v3;
  float64x2_t v8 = v3[1];
  float64x2_t v9 = v3[2];
  long long v14 = 0u;
  long long v15 = 0u;
  float64x2_t v13 = 0u;
  geom_quadratic_bezier_convert_to_power_basis_2d(&v13, v7, v8, v9);
  float64_t result = v13.f64[0];
  long long v11 = v14;
  long long v12 = v15;
  *a1 = v13;
  *a2 = v11;
  *a3 = v12;
  return result;
}

float64_t sub_236F0C424(uint64_t a1, float64x2_t *a2, double *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v6 = *a3;
  float64x2_t v7 = *v3;
  float64x2_t v8 = v3[1];
  float64x2_t v9 = v3[2];
  long long v20 = 0u;
  long long v21 = 0u;
  float64x2_t v18 = 0u;
  float64x2_t v19 = 0u;
  float64x2_t v16 = 0u;
  float64x2_t v17 = 0u;
  geom_quadratic_bezier_subdivide_2d(&v19, &v16, v7, v8, v9, v6);
  float64_t result = v19.f64[0];
  long long v11 = v20;
  long long v12 = v21;
  float64x2_t v13 = v16;
  float64x2_t v14 = v17;
  float64x2_t v15 = v18;
  *(float64x2_t *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v12;
  *a2 = v13;
  a2[1] = v14;
  a2[2] = v15;
  return result;
}

double sub_236F0C4CC@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0C5A4(a1, (uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_x_2d, a2);
}

double sub_236F0C538@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0C5A4(a1, (uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_y_2d, a2);
}

double sub_236F0C5A4@<D0>(double *a1@<X0>, uint64_t (*a2)(double *, __n128, __n128, __n128, double)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v5 = *a1;
  __n128 v6 = *v3;
  __n128 v7 = v3[1];
  __n128 v8 = v3[2];
  *(_OWORD *)long long v11 = 0uLL;
  unsigned int v9 = a2(v11, v6, v7, v8, v5);
  double result = v11[0];
  *(_OWORD *)a3 = *(_OWORD *)v11;
  *(void *)(a3 + 16) = v9;
  return result;
}

__n128 sub_236F0C624@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  float64x2_t v3 = *v1;
  float64x2_t v4 = v1[1];
  float64x2_t v5 = v1[2];
  long long v8 = 0u;
  __n128 v9 = 0u;
  unsigned int monotonic_intervals_2d = geom_quadratic_bezier_find_monotonic_intervals_2d(&v8, v3, v4, v5);
  __n128 result = v9;
  *(_OWORD *)a1 = v8;
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = monotonic_intervals_2d;
  return result;
}

void sub_236F0C6A0(double *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_quadratic_bezier_extract_2d(*v2, v2[1], v2[2], *a1);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
}

void sub_236F0C6DC(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_quadratic_bezier_demote_to_linear_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_236F0C70C(double *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_quadratic_bezier_point_at_2d(*v2, v2[1], v2[2], *a1);
  *a2 = v4;
}

void sub_236F0C740(double *a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_236F0C758(double *a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_236F0C770(double *a1@<X0>, double (*a2)(__n128, __n128, __n128, double)@<X3>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = a2(*v3, v3[1], v3[2], *a1);
  *a3 = v5;
}

void sub_236F0C7A8(unsigned __int8 a1@<W0>, double *a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = geom_quadratic_bezier_derivative_at_2d(a1, *v3, v3[1], v3[2], *a2);
  *a3 = v5;
}

void sub_236F0C7E0(double *a1@<X0>, long double *a2@<X8>)
{
  *a2 = geom_quadratic_bezier_curvature_at_2d(*v2, v2[1], v2[2], *a1);
}

void sub_236F0C814(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = geom_quadratic_bezier_arc_length_in_range_2d(*v3, v3[1], v3[2], *a1, *a2);
}

void sub_236F0C84C(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_tight_bbox_of_quadratic_bezier_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_236F0C87C(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_oriented_bounding_box_of_quadratic_bezier_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
}

double sub_236F0C8B0@<D0>(_OWORD *a1@<X8>)
{
  geom_oriented_bounding_box_matrix_of_quadratic_bezier_2d((uint64_t)v9, *v1, v1[1], v1[2]);
  double result = *(double *)v9;
  long long v4 = v9[1];
  long long v5 = v9[2];
  long long v6 = v9[3];
  long long v7 = v9[4];
  long long v8 = v9[5];
  *a1 = v9[0];
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

float32x2_t geom_cubic_bezier_2f.init(interpolatePoints:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  void v5[4] = *(float32x2_t *)MEMORY[0x263EF8340];
  v5[0] = a1;
  v5[1] = a2;
  uint64_t v5[2] = a3;
  _OWORD v5[3] = a4;
  return geom_cubic_bezier_interpolate_points_2f(v5);
}

double geom_cubic_bezier_2f.init(interpolatePoints:derivatives:)(double a1, double a2)
{
  void v3[2] = *(double *)MEMORY[0x263EF8340];
  v3[0] = a1;
  v3[1] = a2;
  return geom_cubic_bezier_interpolate_points_and_derivatives_2f(v3);
}

double geom_cubic_bezier_2f.init(powerBasis:)(double a1, double a2, double a3, double a4)
{
  void v5[4] = *(double *)MEMORY[0x263EF8340];
  v5[0] = a1;
  v5[1] = a2;
  uint64_t v5[2] = a3;
  _OWORD v5[3] = a4;
  return geom_power_basis_convert_to_cubic_bezier_2f(v5);
}

double geom_cubic_bezier_2f.powerBasis.getter(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  geom_cubic_bezier_convert_to_power_basis_2f((uint64_t)v5, a1, a2, a3, a4);
  return *(double *)v5;
}

double geom_cubic_bezier_2f.subdivided(at:)@<D0>(_OWORD *a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>, float32x2_t a6@<D4>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  geom_cubic_bezier_subdivide_2f((uint64_t)&v13, (uint64_t)&v11, a3, a4, a5, a6, a2);
  double result = *(double *)&v13;
  long long v8 = v14;
  long long v9 = v11;
  long long v10 = v12;
  *a1 = v13;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  return result;
}

float geom_cubic_bezier_2f.findRoots(withXValue:)@<S0>(uint64_t a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  return sub_236F0CBE8((uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_x_2f, a1, a2, a3, a4, a5, a6);
}

float geom_cubic_bezier_2f.findRoots(withYValue:)@<S0>(uint64_t a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  return sub_236F0CBE8((uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_y_2f, a1, a2, a3, a4, a5, a6);
}

float sub_236F0CBE8@<S0>(uint64_t (*a1)(uint64_t *, double, double, double, double, float)@<X0>, uint64_t a2@<X8>, float a3@<S0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  *(void *)long long v11 = 0;
  unsigned int v8 = a1(&v10, a4, a5, a6, a7, a3);
  float result = v11[0];
  *(void *)a2 = v10;
  *(float *)(a2 + 8) = result;
  *(void *)(a2 + 16) = v8;
  return result;
}

double geom_cubic_bezier_2f.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  *(_OWORD *)long long v9 = 0u;
  unsigned int monotonic_intervals_2f = geom_cubic_bezier_find_monotonic_intervals_2f(&v8, a2, a3, a4, a5);
  *(_OWORD *)a1 = v8;
  double result = v9[0];
  *(double *)(a1 + 16) = v9[0];
  *(void *)(a1 + 24) = monotonic_intervals_2f;
  return result;
}

double geom_cubic_bezier_2f.findCharacteristicPoints()(double *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v5 = 0;
  double v4 = 0.0;
  uint64_t characteristic_points_2f = geom_cubic_bezier_find_characteristic_points_2f(&v5, &v4);
  double result = v4;
  *a1 = v4;
  *((void *)a1 + 1) = characteristic_points_2f;
  return result;
}

double geom_cubic_bezier_2f.fitWithQuadraticBezierPair(at:)@<D0>(uint64_t a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>, float32x2_t a6@<D4>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2f((uint64_t)&v13, (uint64_t)&v11, a3, a4, a5, a6, a2);
  double result = *(double *)&v13;
  uint64_t v8 = v14;
  long long v9 = v11;
  uint64_t v10 = v12;
  *(_OWORD *)a1 = v13;
  *(void *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 24) = v9;
  *(void *)(a1 + 40) = v10;
  return result;
}

void __swiftcall geom_cubic_bezier_2f.orientedBBoxMatrix()(simd_float3x3 *__return_ptr retstr)
{
  *(double *)v6.i64 = geom_oriented_bounding_box_matrix_of_cubic_bezier_2f(v1, v2, v3, v4);
  retstr->columns[0] = v6;
  retstr->columns[1] = v7;
  retstr->columns[2] = v8;
}

void sub_236F0CE54(void *a1@<X8>)
{
  geom_cubic_bezier_elevate_from_linear_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_236F0CE84(void *a1@<X8>)
{
  geom_cubic_bezier_elevate_from_quadratic_bezier_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_236F0CEB8(double *a1@<X0>, double *a2@<X1>, double *a3@<X2>, double *a4@<X3>, uint64_t a5@<X8>)
{
  void v12[4] = *(double *)MEMORY[0x263EF8340];
  double v6 = *a2;
  double v7 = *a3;
  double v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  float64x2_t v12[2] = v7;
  _OWORD v12[3] = v8;
  *(double *)a5 = geom_power_basis_convert_to_cubic_bezier_2f(v12);
  *(void *)(a5 + 8) = v9;
  *(void *)(a5 + 16) = v10;
  *(void *)(a5 + 24) = v11;
}

void sub_236F0CF34(float32x2_t *a1@<X0>, float32x2_t *a2@<X1>, float32x2_t *a3@<X2>, float32x2_t *a4@<X3>, float32x2_t *a5@<X8>)
{
  void v12[4] = *(float32x2_t *)MEMORY[0x263EF8340];
  float32x2_t v6 = *a2;
  float32x2_t v7 = *a3;
  float32x2_t v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  float64x2_t v12[2] = v7;
  _OWORD v12[3] = v8;
  *a5 = geom_cubic_bezier_interpolate_points_2f(v12);
  a5[1] = v9;
  a5[2] = v10;
  a5[3] = v11;
}

void sub_236F0CFB0(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  _OWORD v8[2] = *(double *)MEMORY[0x263EF8340];
  double v4 = *a2;
  v8[0] = *a1;
  v8[1] = v4;
  *(double *)a3 = geom_cubic_bezier_interpolate_points_and_derivatives_2f(v8);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v6;
  *(void *)(a3 + 24) = v7;
}

void sub_236F0D028(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  *a2 = geom_cubic_bezier_extract_2f(*v2, v2[1], v2[2], v2[3], *a1);
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
}

void sub_236F0D064(float32x2_t *a1@<X8>)
{
  *a1 = geom_cubic_bezier_demote_to_linear_2f(*v1, v1[1], v1[2], v1[3]);
  a1[1] = v3;
}

void sub_236F0D094(uint64_t a1@<X8>)
{
  *(double *)a1 = geom_cubic_bezier_demote_to_quadratic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
}

void sub_236F0D0C8(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  *a2 = geom_cubic_bezier_point_at_2f(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_236F0D0FC(float *a1@<X0>, double *a2@<X8>)
{
}

void sub_236F0D114(float *a1@<X0>, double *a2@<X8>)
{
}

void sub_236F0D12C(float *a1@<X0>, double (*a2)(double, double, double, double, float)@<X3>, double *a3@<X8>)
{
  *a3 = a2(*v3, v3[1], v3[2], v3[3], *a1);
}

void sub_236F0D164(unsigned __int8 a1@<W0>, float *a2@<X1>, float32x2_t *a3@<X8>)
{
  *a3 = geom_cubic_bezier_derivative_at_2f(a1, *v3, v3[1], v3[2], v3[3], *a2);
}

void sub_236F0D19C(float *a1@<X0>, float *a2@<X8>)
{
  *a2 = geom_cubic_bezier_curvature_at_2f(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_236F0D1D0(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  *a3 = geom_cubic_bezier_arc_length_in_range_2f(*v3, v3[1], v3[2], v3[3], *a1, *a2);
}

unint64_t sub_236F0D208(uint64_t *a1)
{
  return geom_cubic_bezier_fit_with_quadratic_beziers_2f(*a1, *(double *)v1, *(float32x2_t *)(v1 + 8), *(float32x2_t *)(v1 + 16), *(float32x2_t *)(v1 + 24));
}

double sub_236F0D218(_OWORD *a1, _OWORD *a2, float *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v6 = *a3;
  float32x2_t v7 = *v3;
  float32x2_t v8 = v3[1];
  float32x2_t v9 = v3[2];
  float32x2_t v10 = v3[3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  geom_cubic_bezier_subdivide_2f((uint64_t)&v17, (uint64_t)&v15, v7, v8, v9, v10, v6);
  double result = *(double *)&v17;
  long long v12 = v18;
  long long v13 = v15;
  long long v14 = v16;
  *a1 = v17;
  a1[1] = v12;
  *a2 = v13;
  a2[1] = v14;
  return result;
}

double sub_236F0D2BC(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  float32x2_t v9 = *v4;
  float32x2_t v10 = v4[1];
  float32x2_t v11 = v4[2];
  float32x2_t v12 = v4[3];
  long long v16 = 0u;
  long long v17 = 0u;
  geom_cubic_bezier_convert_to_power_basis_2f((uint64_t)&v16, v9, v10, v11, v12);
  uint64_t v14 = *((void *)&v16 + 1);
  double result = *(double *)&v16;
  long long v15 = v17;
  *a1 = v16;
  *a2 = v14;
  *a3 = v15;
  *a4 = *((void *)&v15 + 1);
  return result;
}

float sub_236F0D35C@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0D434(a1, (uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_x_2f, a2);
}

float sub_236F0D3C8@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0D434(a1, (uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_y_2f, a2);
}

float sub_236F0D434@<S0>(float *a1@<X0>, uint64_t (*a2)(uint64_t *, double, double, double, double, float)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  float v5 = *a1;
  double v6 = *v3;
  double v7 = v3[1];
  double v8 = v3[2];
  double v9 = v3[3];
  uint64_t v12 = 0;
  *(void *)long long v13 = 0;
  unsigned int v10 = a2(&v12, v6, v7, v8, v9, v5);
  float result = v13[0];
  *(void *)a3 = v12;
  *(float *)(a3 + 8) = result;
  *(void *)(a3 + 16) = v10;
  return result;
}

double sub_236F0D4BC@<D0>(uint64_t a1@<X8>)
{
  return geom_cubic_bezier_2f.findMonotonicIntervals()(a1, *v1, v1[1], v1[2], v1[3]);
}

double sub_236F0D4C8(double *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v5 = 0;
  double v4 = 0.0;
  uint64_t characteristic_points_2f = geom_cubic_bezier_find_characteristic_points_2f(&v5, &v4);
  double result = v4;
  *a1 = v4;
  *((void *)a1 + 1) = characteristic_points_2f;
  return result;
}

double sub_236F0D54C(uint64_t a1, uint64_t a2, float *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v6 = *a3;
  float32x2_t v7 = *v3;
  float32x2_t v8 = v3[1];
  float32x2_t v9 = v3[2];
  float32x2_t v10 = v3[3];
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2f((uint64_t)&v17, (uint64_t)&v15, v7, v8, v9, v10, v6);
  double result = *(double *)&v17;
  uint64_t v12 = v18;
  long long v13 = v15;
  uint64_t v14 = v16;
  *(_OWORD *)a1 = v17;
  *(void *)(a1 + 16) = v12;
  *(_OWORD *)a2 = v13;
  *(void *)(a2 + 16) = v14;
  return result;
}

void sub_236F0D5F4(uint64_t a1@<X8>)
{
  *(double *)a1 = geom_tight_bbox_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(void *)(a1 + 8) = v3;
}

void sub_236F0D624(uint64_t a1@<X8>)
{
  *(double *)a1 = geom_oriented_bounding_box_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
}

void sub_236F0D658(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_oriented_bounding_box_matrix_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

float64_t geom_cubic_bezier_2d.init(interpolatePoints:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = a1;
  v5[1] = a2;
  _OWORD v5[2] = a3;
  _OWORD v5[3] = a4;
  return geom_cubic_bezier_interpolate_points_2d(v5);
}

double geom_cubic_bezier_2d.init(interpolatePoints:derivatives:)(__n128 a1, __n128 a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = a1;
  v3[1] = a2;
  *(void *)&double result = geom_cubic_bezier_interpolate_points_and_derivatives_2d(v3).n128_u64[0];
  return result;
}

double geom_cubic_bezier_2d.init(powerBasis:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = a1;
  v5[1] = a2;
  _OWORD v5[2] = a3;
  _OWORD v5[3] = a4;
  *(void *)&double result = geom_power_basis_convert_to_cubic_bezier_2d(v5).n128_u64[0];
  return result;
}

float64_t geom_cubic_bezier_2d.powerBasis.getter(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  geom_cubic_bezier_convert_to_power_basis_2d(v5, a1, a2, a3, a4);
  return v5[0].f64[0];
}

float64_t geom_cubic_bezier_2d.subdivided(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  float64x2_t v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float64x2_t v15 = 0u;
  long long v16 = 0u;
  geom_cubic_bezier_subdivide_2d(&v19, &v15, a3, a4, a5, a6, a2);
  float64_t result = v19.f64[0];
  long long v8 = v20;
  long long v9 = v21;
  long long v10 = v22;
  float64x2_t v11 = v15;
  long long v12 = v16;
  long long v13 = v17;
  long long v14 = v18;
  *(float64x2_t *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v10;
  *(float64x2_t *)(a1 + 64) = v11;
  *(_OWORD *)(a1 + 80) = v12;
  *(_OWORD *)(a1 + 96) = v13;
  *(_OWORD *)(a1 + 112) = v14;
  return result;
}

double geom_cubic_bezier_2d.findRoots(withXValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>)
{
  return sub_236F0D980((uint64_t (*)(long long *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_x_2d, a1, a2, a3, a4, a5, a6);
}

double geom_cubic_bezier_2d.findRoots(withYValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>)
{
  return sub_236F0D980((uint64_t (*)(long long *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_y_2d, a1, a2, a3, a4, a5, a6);
}

double sub_236F0D980@<D0>(uint64_t (*a1)(long long *, __n128, __n128, __n128, __n128, double)@<X0>, uint64_t a2@<X8>, double a3@<D0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>, __n128 a7@<Q4>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v8 = a1(&v11, a4, a5, a6, a7, a3);
  double result = *(double *)&v11;
  uint64_t v10 = v12;
  *(_OWORD *)a2 = v11;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v8;
  return result;
}

double geom_cubic_bezier_2d.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int monotonic_intervals_2d = geom_cubic_bezier_find_monotonic_intervals_2d(&v9, a2, a3, a4, a5);
  long long v7 = v10;
  *(_OWORD *)a1 = v9;
  *(_OWORD *)(a1 + 16) = v7;
  double result = *(double *)&v11;
  *(_OWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = monotonic_intervals_2d;
  return result;
}

double geom_cubic_bezier_2d.findCharacteristicPoints()(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v5 = 0;
  *(_OWORD *)uint64_t v4 = 0uLL;
  uint64_t characteristic_points_2d = geom_cubic_bezier_find_characteristic_points_2d(&v5, v4);
  double result = v4[0];
  *(_OWORD *)a1 = *(_OWORD *)v4;
  *(void *)(a1 + 16) = characteristic_points_2d;
  return result;
}

float64_t geom_cubic_bezier_2d.fitWithQuadraticBezierPair(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  float64x2_t v16 = 0u;
  float64x2_t v13 = 0u;
  long long v14 = 0u;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2d(&v16, &v13, a3, a4, a5, a6, a2);
  float64_t result = v16.f64[0];
  long long v8 = v17;
  long long v9 = v18;
  float64x2_t v10 = v13;
  long long v11 = v14;
  long long v12 = v15;
  *(float64x2_t *)a1 = v16;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
  *(float64x2_t *)(a1 + 48) = v10;
  *(_OWORD *)(a1 + 64) = v11;
  *(_OWORD *)(a1 + 80) = v12;
  return result;
}

void __swiftcall geom_cubic_bezier_2d.orientedBBoxMatrix()(simd_double3x3 *__return_ptr retstr)
{
  geom_oriented_bounding_box_matrix_of_cubic_bezier_2d((uint64_t)v11, v1, v2, v3, v4);
  long long v6 = v11[1];
  long long v7 = v11[2];
  long long v8 = v11[3];
  long long v9 = v11[4];
  long long v10 = v11[5];
  *(_OWORD *)retstr->columns[0].f64 = v11[0];
  *(_OWORD *)&retstr->columns[0].f64[2] = v6;
  *(_OWORD *)retstr->columns[1].f64 = v7;
  *(_OWORD *)&retstr->columns[1].f64[2] = v8;
  *(_OWORD *)retstr->columns[2].f64 = v9;
  *(_OWORD *)&retstr->columns[2].f64[2] = v10;
}

uint64_t sub_236F0DC0C()
{
  return sub_236F0DC9C(&qword_2688DF5F0, type metadata accessor for BBox2f);
}

uint64_t sub_236F0DC54()
{
  return sub_236F0DC9C(&qword_2688DFC60, type metadata accessor for CubicBezier2f);
}

uint64_t sub_236F0DC9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236F0DCE4()
{
  return sub_236F0DC9C(&qword_2688DF770, type metadata accessor for LineSegment2f);
}

uint64_t sub_236F0DD2C()
{
  return sub_236F0DC9C(&qword_2688DFC68, type metadata accessor for OrientedBBox2f);
}

uint64_t sub_236F0DD74()
{
  return sub_236F0DC9C(&qword_2688DF600, type metadata accessor for BBox2d);
}

uint64_t sub_236F0DDBC()
{
  return sub_236F0DC9C(&qword_2688DFC70, type metadata accessor for CubicBezier2d);
}

uint64_t sub_236F0DE04()
{
  return sub_236F0DC9C(&qword_2688DF778, type metadata accessor for LineSegment2d);
}

uint64_t sub_236F0DE4C()
{
  return sub_236F0DC9C(&qword_2688DFC78, type metadata accessor for OrientedBBox2d);
}

uint64_t sub_236F0DE94()
{
  return sub_236EFCF60(&qword_2688DFC80, &qword_2688DF9F8);
}

uint64_t sub_236F0DED8()
{
  return sub_236F0DC9C(&qword_2688DFC88, type metadata accessor for QuadraticBezier2f);
}

uint64_t sub_236F0DF20()
{
  return sub_236EFCF60(&qword_2688DFC90, &qword_2688DFB30);
}

uint64_t sub_236F0DF64()
{
  return sub_236F0DC9C(&qword_2688DFC98, type metadata accessor for QuadraticBezier2d);
}

void sub_236F0DFAC(_OWORD *a1@<X8>)
{
  geom_cubic_bezier_elevate_from_linear_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_236F0DFDC(_OWORD *a1@<X8>)
{
  geom_cubic_bezier_elevate_from_quadratic_bezier_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_236F0E010(__n128 *a1@<X0>, __n128 *a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __n128 v6 = *a2;
  __n128 v7 = *a3;
  __n128 v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  float64x2_t v12[2] = v7;
  _OWORD v12[3] = v8;
  *(__n128 *)a5 = geom_power_basis_convert_to_cubic_bezier_2d(v12);
  *(_OWORD *)(a5 + 16) = v9;
  *(_OWORD *)(a5 + 32) = v10;
  *(_OWORD *)(a5 + 48) = v11;
}

void sub_236F0E08C(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X2>, float64x2_t *a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  float64x2_t v6 = *a2;
  float64x2_t v7 = *a3;
  float64x2_t v8 = *a4;
  v13[0] = *a1;
  v13[1] = v6;
  float64x2_t v13[2] = v7;
  v13[3] = v8;
  *(double *)&long long v9 = geom_cubic_bezier_interpolate_points_2d(v13);
  *a5 = v9;
  a5[1] = v10;
  a5[2] = v11;
  a5[3] = v12;
}

void sub_236F0E108(__n128 *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __n128 v4 = *a2;
  v8[0] = *a1;
  v8[1] = v4;
  *(__n128 *)a3 = geom_cubic_bezier_interpolate_points_and_derivatives_2d(v8);
  *(_OWORD *)(a3 + 16) = v5;
  *(_OWORD *)(a3 + 32) = v6;
  *(_OWORD *)(a3 + 48) = v7;
}

void sub_236F0E180(double *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_cubic_bezier_extract_2d(*v2, v2[1], v2[2], v2[3], *a1);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
}

void sub_236F0E1BC(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_cubic_bezier_demote_to_linear_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_236F0E1EC(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_cubic_bezier_demote_to_quadratic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

void sub_236F0E220(double *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v4 = geom_cubic_bezier_point_at_2d(*v2, v2[1], v2[2], v2[3], *a1);
  *a2 = v4;
}

void sub_236F0E254(double *a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_236F0E26C(double *a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_236F0E284(double *a1@<X0>, double (*a2)(__n128, __n128, __n128, __n128, double)@<X3>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = a2(*v3, v3[1], v3[2], v3[3], *a1);
  *a3 = v5;
}

void sub_236F0E2BC(unsigned __int8 a1@<W0>, double *a2@<X1>, _OWORD *a3@<X8>)
{
  *(double *)&long long v5 = geom_cubic_bezier_derivative_at_2d(a1, *v3, v3[1], v3[2], v3[3], *a2);
  *a3 = v5;
}

void sub_236F0E2F4(double *a1@<X0>, long double *a2@<X8>)
{
  *a2 = geom_cubic_bezier_curvature_at_2d(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_236F0E328(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = geom_cubic_bezier_arc_length_in_range_2d(*v3, v3[1], v3[2], v3[3], *a1, *a2);
}

unint64_t sub_236F0E360(uint64_t *a1)
{
  return geom_cubic_bezier_fit_with_quadratic_beziers_2d(*a1, *v1, v1[1], v1[2], v1[3]);
}

float64_t sub_236F0E370(uint64_t a1, float64x2_t *a2, double *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v6 = *a3;
  float64x2_t v7 = *v3;
  float64x2_t v8 = v3[1];
  float64x2_t v9 = v3[2];
  float64x2_t v10 = v3[3];
  long long v25 = 0u;
  long long v26 = 0u;
  float64x2_t v23 = 0u;
  long long v24 = 0u;
  float64x2_t v21 = 0u;
  float64x2_t v22 = 0u;
  float64x2_t v19 = 0u;
  float64x2_t v20 = 0u;
  geom_cubic_bezier_subdivide_2d(&v23, &v19, v7, v8, v9, v10, v6);
  float64_t result = v23.f64[0];
  long long v12 = v24;
  long long v13 = v25;
  long long v14 = v26;
  float64x2_t v15 = v19;
  float64x2_t v16 = v20;
  float64x2_t v17 = v21;
  float64x2_t v18 = v22;
  *(float64x2_t *)a1 = v23;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *(_OWORD *)(a1 + 48) = v14;
  *a2 = v15;
  a2[1] = v16;
  a2[2] = v17;
  a2[3] = v18;
  return result;
}

float64_t sub_236F0E41C(float64x2_t *a1, _OWORD *a2, _OWORD *a3, _OWORD *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  float64x2_t v9 = *v4;
  float64x2_t v10 = v4[1];
  float64x2_t v11 = v4[2];
  float64x2_t v12 = v4[3];
  long long v19 = 0u;
  long long v20 = 0u;
  float64x2_t v17 = 0u;
  long long v18 = 0u;
  geom_cubic_bezier_convert_to_power_basis_2d(&v17, v9, v10, v11, v12);
  float64_t result = v17.f64[0];
  long long v14 = v18;
  long long v15 = v19;
  long long v16 = v20;
  *a1 = v17;
  *a2 = v14;
  *a3 = v15;
  *a4 = v16;
  return result;
}

double sub_236F0E4C0@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0E598(a1, (uint64_t (*)(long long *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_x_2d, a2);
}

double sub_236F0E52C@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F0E598(a1, (uint64_t (*)(long long *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_y_2d, a2);
}

double sub_236F0E598@<D0>(double *a1@<X0>, uint64_t (*a2)(long long *, __n128, __n128, __n128, __n128, double)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v5 = *a1;
  __n128 v6 = *v3;
  __n128 v7 = v3[1];
  __n128 v8 = v3[2];
  __n128 v9 = v3[3];
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v10 = a2(&v13, v6, v7, v8, v9, v5);
  double result = *(double *)&v13;
  uint64_t v12 = v14;
  *(_OWORD *)a3 = v13;
  *(void *)(a3 + 16) = v12;
  *(void *)(a3 + 24) = v10;
  return result;
}

double sub_236F0E624@<D0>(uint64_t a1@<X8>)
{
  return geom_cubic_bezier_2d.findMonotonicIntervals()(a1, *v1, v1[1], v1[2], v1[3]);
}

double sub_236F0E630(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v5 = 0;
  *(_OWORD *)long long v4 = 0uLL;
  uint64_t characteristic_points_2d = geom_cubic_bezier_find_characteristic_points_2d(&v5, v4);
  double result = v4[0];
  *(_OWORD *)a1 = *(_OWORD *)v4;
  *(void *)(a1 + 16) = characteristic_points_2d;
  return result;
}

float64_t sub_236F0E6B4(uint64_t a1, float64x2_t *a2, double *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v6 = *a3;
  float64x2_t v7 = *v3;
  float64x2_t v8 = v3[1];
  float64x2_t v9 = v3[2];
  float64x2_t v10 = v3[3];
  long long v21 = 0u;
  long long v22 = 0u;
  float64x2_t v19 = 0u;
  float64x2_t v20 = 0u;
  float64x2_t v17 = 0u;
  float64x2_t v18 = 0u;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2d(&v20, &v17, v7, v8, v9, v10, v6);
  float64_t result = v20.f64[0];
  long long v12 = v21;
  long long v13 = v22;
  float64x2_t v14 = v17;
  float64x2_t v15 = v18;
  float64x2_t v16 = v19;
  *(float64x2_t *)a1 = v20;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *a2 = v14;
  a2[1] = v15;
  a2[2] = v16;
  return result;
}

void sub_236F0E75C(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_tight_bbox_of_cubic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_236F0E78C(_OWORD *a1@<X8>)
{
  *(double *)&long long v3 = geom_oriented_bounding_box_of_cubic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
}

double sub_236F0E7C0@<D0>(_OWORD *a1@<X8>)
{
  geom_oriented_bounding_box_matrix_of_cubic_bezier_2d((uint64_t)v9, *v1, v1[1], v1[2], v1[3]);
  double result = *(double *)v9;
  long long v4 = v9[1];
  long long v5 = v9[2];
  long long v6 = v9[3];
  long long v7 = v9[4];
  long long v8 = v9[5];
  *a1 = v9[0];
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

double geom_cubic_bezier_derivative_at_2d(int a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, double a6)
{
  double v6 = 1.0 - a6;
  switch(a1)
  {
    case 0:
      *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a3, v6 * v6 * 3.0 * a6), a2, v6 * (v6 * v6)), a4, a6 * a6 * (v6 * 3.0)), a5, a6 * a6 * a6);
      break;
    case 1:
      *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vsubq_f64(a4, a3), v6 * 6.0 * a6), vsubq_f64(a3, a2), v6 * (v6 * 3.0)), vsubq_f64(a5, a4), a6 * 3.0 * a6);
      break;
    case 2:
      __asm { FMOV            V6.2D, #-2.0; jumptable 0000000236F0E840 case 2 }
      float64x2_t v13 = vmlaq_n_f64(vmulq_n_f64(vaddq_f64(a5, vmlaq_f64(a3, _Q6, a4)), a6), vaddq_f64(a4, vmlaq_f64(a2, _Q6, a3)), v6);
      __asm { FMOV            V0.2D, #6.0 }
      *(void *)&double result = *(_OWORD *)&vmulq_f64(v13, _Q0);
      break;
    case 3:
      float64x2_t v15 = vsubq_f64(a3, a4);
      __asm { FMOV            V2.2D, #3.0 }
      float64x2_t v17 = vmlaq_f64(vsubq_f64(a5, a2), _Q2, v15);
      __asm { FMOV            V1.2D, #6.0 }
      *(void *)&double result = *(_OWORD *)&vmulq_f64(v17, _Q1);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double geom_cubic_bezier_point_at_2d(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a2, (1.0 - a5) * (1.0 - a5) * 3.0 * a5), a1, (1.0 - a5) * ((1.0 - a5) * (1.0 - a5))), a3, a5 * a5 * ((1.0 - a5) * 3.0)), a4, a5 * a5 * a5);
  return result;
}

float32x2_t geom_cubic_bezier_derivative_at_2f(int a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float a6)
{
  float v6 = 1.0 - a6;
  switch(a1)
  {
    case 0:
      float32x2_t result = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a3, (float)((float)(v6 * v6) * 3.0) * a6), a2, v6 * (float)(v6 * v6)), a4, (float)(a6 * a6) * (float)(v6 * 3.0)), a5, (float)(a6 * a6) * a6);
      break;
    case 1:
      float32x2_t result = vmla_n_f32(vmla_n_f32(vmul_n_f32(vsub_f32(a4, a3), (float)(v6 * 6.0) * a6), vsub_f32(a3, a2), v6 * (float)(v6 * 3.0)), vsub_f32(a5, a4), (float)(a6 * 3.0) * a6);
      break;
    case 2:
      float32x2_t v8 = vmla_n_f32(vmul_n_f32(vadd_f32(a5, vmla_f32(a3, (float32x2_t)0xC0000000C0000000, a4)), a6), vadd_f32(a4, vmla_f32(a2, (float32x2_t)0xC0000000C0000000, a3)), v6);
      __asm { FMOV            V0.2S, #6.0 }
      float32x2_t result = vmul_f32(v8, _D0);
      break;
    case 3:
      float32x2_t v14 = vsub_f32(a3, a4);
      __asm { FMOV            V2.2S, #3.0 }
      float32x2_t v16 = vmla_f32(vsub_f32(a5, a2), _D2, v14);
      __asm { FMOV            V1.2S, #6.0 }
      float32x2_t result = vmul_f32(v16, _D1);
      break;
    default:
      float32x2_t result = 0;
      break;
  }
  return result;
}

float32x2_t geom_cubic_bezier_point_at_2f(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float a5)
{
  return vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a2, (float)((float)((float)(1.0 - a5) * (float)(1.0 - a5)) * 3.0) * a5), a1, (float)(1.0 - a5) * (float)((float)(1.0 - a5) * (float)(1.0 - a5))), a3, (float)(a5 * a5) * (float)((float)(1.0 - a5) * 3.0)), a4, (float)(a5 * a5) * a5);
}

double geom_quadratic_bezier_derivative_at_2d(int a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  double v5 = 1.0 - a5;
  if (a1)
  {
    if (a1 == 2)
    {
      float64x2_t v9 = vaddq_f64(a2, a4);
      __asm { FMOV            V2.2D, #-2.0 }
      float64x2_t v15 = vmlaq_f64(v9, _Q2, a3);
      *(void *)&double v6 = *(_OWORD *)&vaddq_f64(v15, v15);
    }
    else
    {
      double v6 = 0.0;
      if (a1 == 1)
      {
        float64x2_t v7 = vmlaq_n_f64(vmulq_n_f64(vsubq_f64(a4, a3), a5), vsubq_f64(a3, a2), v5);
        *(void *)&double v6 = *(_OWORD *)&vaddq_f64(v7, v7);
      }
    }
    return v6;
  }
  else
  {
    *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a3, (v5 + v5) * a5), a2, v5 * v5), a4, a5 * a5);
  }
  return result;
}

double geom_quadratic_bezier_point_at_2d(float64x2_t a1, float64x2_t a2, float64x2_t a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a2, (1.0 - a4 + 1.0 - a4) * a4), a1, (1.0 - a4) * (1.0 - a4)), a3, a4 * a4);
  return result;
}

float32x2_t geom_quadratic_bezier_derivative_at_2f(int a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float a5)
{
  float v5 = 1.0 - a5;
  if (a1)
  {
    if (a1 == 2)
    {
      float32x2_t v9 = vmla_f32(vadd_f32(a2, a4), (float32x2_t)0xC0000000C0000000, a3);
      return vadd_f32(v9, v9);
    }
    else
    {
      uint64_t v6 = 0;
      if (a1 == 1)
      {
        float32x2_t v7 = vmla_n_f32(vmul_n_f32(vsub_f32(a4, a3), a5), vsub_f32(a3, a2), v5);
        return vadd_f32(v7, v7);
      }
    }
    return (float32x2_t)v6;
  }
  else
  {
    return vmla_n_f32(vmla_n_f32(vmul_n_f32(a3, (float)(v5 + v5) * a5), a2, v5 * v5), a4, a5 * a5);
  }
}

float32x2_t geom_quadratic_bezier_point_at_2f(float32x2_t a1, float32x2_t a2, float32x2_t a3, float a4)
{
  return vmla_n_f32(vmla_n_f32(vmul_n_f32(a2, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a3, a4 * a4);
}

Swift::Void __swiftcall refineTriangleMesh(vertexPositions:triangleVertexIndices:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_refine_triangle_mesh_opt_3f_optional options)
{
}

Swift::Void __swiftcall refineTriangleMesh(vertexPositions:triangleVertexIndices:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_refine_triangle_mesh_opt_3d_optional options)
{
}

uint64_t sub_236F0EC40(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, void, void, uint64_t), uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, void, void))
{
  uint64_t v9 = *(void *)(a1 + 16);
  unint64_t v10 = *(void *)(a2 + 16) / 3uLL;
  if (a5) {
    return a6(v9, a1 + 32, v10, a2 + 32, *a3, *a4, a5);
  }
  else {
    return a7(v9, a1 + 32, v10, a2 + 32, *a3, *a4);
  }
}

void *OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.getter()
{
  return sub_236F0F0B8(geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_236F0F270(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

void (*OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.modify(void *a1))(uint64_t **a1, char a2)
{
  long long v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  refinement_face_subset_data_3f = (const void *)geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f(v1);
  uint64_t refinement_face_subset_count_3f = geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f(v1);
  uint64_t v6 = sub_236EF53EC(refinement_face_subset_data_3f, refinement_face_subset_count_3f);
  uint64_t v7 = (2 * v6[2]) | 1;
  *long long v3 = v6;
  v3[1] = v6 + 4;
  __n128 v3[2] = 0;
  double v3[3] = v7;
  return sub_236F0ED90;
}

void sub_236F0ED90(uint64_t **a1, char a2)
{
}

void *OS_geom_refine_triangle_mesh_opt_3f.uvValues.getter()
{
  return sub_236F0F4CC(geom_refine_triangle_mesh_opt_get_uv_value_data_3f, geom_refine_triangle_mesh_opt_get_uv_value_count_3f);
}

void *OS_geom_refine_triangle_mesh_opt_3f.trianglesWithUVs.getter()
{
  return sub_236F0F560(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3f.triangleUVIndices.getter()
{
  return sub_236F0F5F0(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3f.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3f.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
}

void *sub_236F0EE70(uint64_t a1, uint64_t a2)
{
  return sub_236F0F758(a1, a2, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f);
}

uint64_t sub_236F0EE9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236F0F7EC(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

uint64_t (*sub_236F0EEC8(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.modify(v2);
  return sub_236EE9F48;
}

void *sub_236F0EF24(uint64_t a1, uint64_t a2)
{
  return sub_236F0F8F0(a1, a2, geom_refine_triangle_mesh_opt_get_uv_value_data_3f, geom_refine_triangle_mesh_opt_get_uv_value_count_3f);
}

void *sub_236F0EF50(uint64_t a1, uint64_t a2)
{
  return sub_236F0F984(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t sub_236F0EF7C(uint64_t a1, uint64_t a2)
{
  return sub_236F0FA14(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

id sub_236F0EFA8()
{
  output_uv_value_collection_3f = (void *)geom_refine_triangle_mesh_opt_get_output_uv_value_collection_3f(*v0);
  return output_uv_value_collection_3f;
}

id sub_236F0EFD8()
{
  output_triangles_with_uvs_collection_3f = (void *)geom_refine_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3f(*v0);
  return output_triangles_with_uvs_collection_3f;
}

id sub_236F0F008()
{
  output_triangle_uv_indices_collection_3f = (void *)geom_refine_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3f(*v0);
  return output_triangle_uv_indices_collection_3f;
}

uint64_t sub_236F0F038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236F0FB34(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3f);
}

uint64_t sub_236F0F050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_236F0FBAC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

void *sub_236F0F084()
{
  return geom_refine_triangle_mesh_opt_clear_uvs_3f(*v0);
}

void *OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.getter()
{
  return sub_236F0F0B8(geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d);
}

void *sub_236F0F0B8(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  long long v4 = (const void *)a1(v2);
  uint64_t v5 = a2(v2);
  return sub_236EF53EC(v4, v5);
}

void *sub_236F0F120@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, void *a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = (const void *)a2(*a1);
  uint64_t v8 = a3(v6);
  double result = sub_236EF53EC(v7, v8);
  uint64_t v10 = (2 * result[2]) | 1;
  *a4 = result;
  a4[1] = result + 4;
  a4[2] = 0;
  a4[3] = v10;
  return result;
}

void *sub_236F0F190(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t (*a6)(uint64_t))
{
  uint64_t v6 = *a2;
  if (*result)
  {
    uint64_t v7 = result[2];
    uint64_t v8 = result[3] >> 1;
    uint64_t v9 = v8 - v7;
    if (__OFSUB__(v8, v7))
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = result[1] + 4 * v7;
      swift_unknownObjectRetain();
      a5(v6, v9, v11);
      return (void *)swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v12 = *a2;
    return (void *)a6(v12);
  }
  return result;
}

uint64_t OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_236F0F270(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t sub_236F0F270(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t, unint64_t, uint64_t), uint64_t (*a6)(uint64_t))
{
  if (result)
  {
    if (__OFSUB__(a4 >> 1, a3))
    {
      __break(1u);
    }
    else
    {
      a5(v6, (a4 >> 1) - a3, a2 + 4 * a3);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    return a6(v6);
  }
  return result;
}

void (*OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.modify(void *a1))(uint64_t **a1, char a2)
{
  long long v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  refinement_face_subset_data_3d = (const void *)geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d(v1);
  uint64_t refinement_face_subset_count_3d = geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d(v1);
  uint64_t v6 = sub_236EF53EC(refinement_face_subset_data_3d, refinement_face_subset_count_3d);
  uint64_t v7 = (2 * v6[2]) | 1;
  *long long v3 = v6;
  v3[1] = v6 + 4;
  __n128 v3[2] = 0;
  double v3[3] = v7;
  return sub_236F0F380;
}

void sub_236F0F380(uint64_t **a1, char a2)
{
}

void sub_236F0F3AC(uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t))
{
  uint64_t v5 = *a1;
  uint64_t v6 = **a1;
  if ((a2 & 1) == 0)
  {
    if (!v6)
    {
      a4(v5[4]);
      goto LABEL_10;
    }
    uint64_t v12 = v5[2];
    unint64_t v13 = (unint64_t)v5[3] >> 1;
    if (!__OFSUB__(v13, v12))
    {
      a3(v5[4], v13 - v12, v5[1] + 4 * v12);
      goto LABEL_9;
    }
LABEL_15:
    __break(1u);
    return;
  }
  if (!v6)
  {
    a4(v5[4]);
    goto LABEL_9;
  }
  uint64_t v7 = v5[2];
  unint64_t v8 = (unint64_t)v5[3] >> 1;
  uint64_t v9 = v8 - v7;
  if (__OFSUB__(v8, v7))
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v10 = v5[4];
  uint64_t v11 = v5[1] + 4 * v7;
  swift_unknownObjectRetain();
  a3(v10, v9, v11);
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
LABEL_10:
  free(v5);
}

void *OS_geom_refine_triangle_mesh_opt_3d.uvValues.getter()
{
  return sub_236F0F4CC(geom_refine_triangle_mesh_opt_get_uv_value_data_3d, geom_refine_triangle_mesh_opt_get_uv_value_count_3d);
}

void *sub_236F0F4CC(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  long long v4 = (const void *)a1(v2);
  uint64_t v5 = a2(v2);
  return sub_236EF5490(v4, v5);
}

void *OS_geom_refine_triangle_mesh_opt_3d.trianglesWithUVs.getter()
{
  return sub_236F0F560(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

void *sub_236F0F560(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a1(v2);
  uint64_t v5 = (const void *)a2(v2);
  return sub_236EF53EC(v5, v4);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3d.triangleUVIndices.getter()
{
  return sub_236F0F5F0(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_236F0F5F0(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t result = a1(v2);
  uint64_t v5 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    uint64_t v6 = (const void *)a2(v2);
    return (uint64_t)sub_236EF53EC(v6, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3d.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
}

uint64_t sub_236F0F680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  return a5(v5, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3d.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
}

uint64_t sub_236F0F6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a7(v7, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

void *sub_236F0F72C(uint64_t a1, uint64_t a2)
{
  return sub_236F0F758(a1, a2, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d);
}

void *sub_236F0F758(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = (const void *)a3(v6);
  uint64_t v8 = a4(v6);
  return sub_236EF53EC(v7, v8);
}

uint64_t sub_236F0F7C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236F0F7EC(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t sub_236F0F7EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, unint64_t, uint64_t), uint64_t (*a8)(uint64_t))
{
  uint64_t result = *v8;
  if (a1)
  {
    if (__OFSUB__(a4 >> 1, a3))
    {
      __break(1u);
    }
    else
    {
      a7(result, (a4 >> 1) - a3, a2 + 4 * a3);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    return a8(result);
  }
  return result;
}

uint64_t (*sub_236F0F868(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.modify(v2);
  return sub_236EE9F48;
}

void *sub_236F0F8C4(uint64_t a1, uint64_t a2)
{
  return sub_236F0F8F0(a1, a2, geom_refine_triangle_mesh_opt_get_uv_value_data_3d, geom_refine_triangle_mesh_opt_get_uv_value_count_3d);
}

void *sub_236F0F8F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = (const void *)a3(v6);
  uint64_t v8 = a4(v6);
  return sub_236EF5490(v7, v8);
}

void *sub_236F0F958(uint64_t a1, uint64_t a2)
{
  return sub_236F0F984(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

void *sub_236F0F984(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = a3(v6);
  uint64_t v8 = (const void *)a4(v6);
  return sub_236EF53EC(v8, v7);
}

uint64_t sub_236F0F9E8(uint64_t a1, uint64_t a2)
{
  return sub_236F0FA14(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_236F0FA14(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t result = a3(v6);
  uint64_t v8 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    uint64_t v9 = (const void *)a4(v6);
    return (uint64_t)sub_236EF53EC(v9, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_236F0FA8C()
{
  output_uv_value_collection_3d = (void *)geom_refine_triangle_mesh_opt_get_output_uv_value_collection_3d(*v0);
  return output_uv_value_collection_3d;
}

id sub_236F0FABC()
{
  output_triangles_with_uvs_collection_3d = (void *)geom_refine_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3d(*v0);
  return output_triangles_with_uvs_collection_3d;
}

id sub_236F0FAEC()
{
  output_triangle_uv_indices_collection_3d = (void *)geom_refine_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3d(*v0);
  return output_triangle_uv_indices_collection_3d;
}

uint64_t sub_236F0FB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_236F0FB34(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3d);
}

uint64_t sub_236F0FB34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  return a7(*v7, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

uint64_t sub_236F0FB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_236F0FBAC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

uint64_t sub_236F0FBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a9(*v9, *(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

void *sub_236F0FBEC()
{
  return geom_refine_triangle_mesh_opt_clear_uvs_3d(*v0);
}

void *sub_236F0FBF4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_236F0F120(a1, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f, a2);
}

void *sub_236F0FC34(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F0F190(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

void *sub_236F0FC74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_236F0F120(a1, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d, a2);
}

void *sub_236F0FCB4(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_236F0F190(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.uvValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.trianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.triangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outUVValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outTrianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outTriangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 96))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.clearUVs()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t singularValueDecomposition(of3x3Matrix:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v3 = *a1;
  long long v4 = a1[1];
  long long v5 = a1[2];
  long long v6 = a1[3];
  long long v7 = a1[4];
  long long v8 = a1[5];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v25[0] = v3;
  v25[1] = v4;
  v25[2] = v5;
  v25[3] = v6;
  v25[4] = v7;
  v25[5] = v8;
  if (geom_compute_svd_3x3_d(v25, &v18, &v10, &v12))
  {
    v24[0] = v18;
    v24[1] = v19;
    v24[2] = v20;
    v24[3] = v21;
    v24[4] = v22;
    v24[5] = v23;
    v24[6] = v12;
    v24[7] = v13;
    v24[8] = v14;
    v24[9] = v15;
    v24[10] = v16;
    v24[11] = v17;
    v24[12] = v10;
    v24[13] = v11;
    sub_236F0FF80((uint64_t)v24);
  }
  else
  {
    sub_236F0FEEC((uint64_t)v24);
  }
  sub_236F0FF18((uint64_t)v24, (uint64_t)v25);
  return sub_236F0FF18((uint64_t)v25, a2);
}

double sub_236F0FEEC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 224) = 1;
  return result;
}

uint64_t sub_236F0FF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688DFCA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F0FF80(uint64_t result)
{
  *(unsigned char *)(result + 224) = 0;
  return result;
}

void singularValueDecomposition(of3x3Matrix:)(int8x16_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, float *a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int8x16_t v7 = a1[1];
  int8x16_t v8 = a1[2];
  int8x16_t v9 = *a1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0uLL;
  geom_compute_svd_3x3_f(&v29, &v25, &v26, v9, v7, v8, a2, a3, a4, a5);
  if (v10)
  {
    uint64_t v12 = *((void *)&v29 + 1);
    uint64_t v11 = v29;
    uint64_t v14 = *((void *)&v30 + 1);
    uint64_t v13 = v30;
    uint64_t v16 = *((void *)&v31 + 1);
    uint64_t v15 = v31;
    uint64_t v18 = *((void *)&v26 + 1);
    uint64_t v17 = v26;
    uint64_t v20 = *((void *)&v27 + 1);
    uint64_t v19 = v27;
    uint64_t v22 = *((void *)&v28 + 1);
    uint64_t v21 = v28;
    uint64_t v24 = *((void *)&v25 + 1);
    uint64_t v23 = v25;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  *(void *)a6 = v11;
  *(void *)(a6 + 8) = v12;
  *(void *)(a6 + 16) = v13;
  *(void *)(a6 + 24) = v14;
  *(void *)(a6 + 32) = v15;
  *(void *)(a6 + 40) = v16;
  *(void *)(a6 + 48) = v17;
  *(void *)(a6 + 56) = v18;
  *(void *)(a6 + 64) = v19;
  *(void *)(a6 + 72) = v20;
  *(void *)(a6 + 80) = v21;
  *(void *)(a6 + 88) = v22;
  *(void *)(a6 + 96) = v23;
  *(void *)(a6 + 104) = v24;
  *(unsigned char *)(a6 + 112) = v10 ^ 1;
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_f.solve(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return sub_236F10160((uint64_t)a1._rawValue, (uint64_t *)a2, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F1037C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_f);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_f.solve(_:)(Swift::OpaquePointer *a1)
{
  return sub_236F10224((uint64_t *)a1, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F1037C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_f);
}

BOOL sub_236F100E0(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return OS_geom_sparse_linear_solver_f.solve(_:_:)(a1, a2);
}

uint64_t sub_236F10108(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F102F8(a1, a2, a3, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F1037C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_f);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_d.solve(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return sub_236F10160((uint64_t)a1._rawValue, (uint64_t *)a2, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F10478, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_d);
}

uint64_t sub_236F10160(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void, uint64_t, void, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *a2;
  uint64_t v11 = *(void *)(*a2 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = a3(0, v11, 0, v10);
  }
  *a2 = v10;
  return a4(v4, v9, a1 + 32, v11, v10 + 32);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_d.solve(_:)(Swift::OpaquePointer *a1)
{
  return sub_236F10224((uint64_t *)a1, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F10478, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_d);
}

uint64_t sub_236F10224(uint64_t *a1, uint64_t (*a2)(void, uint64_t, void, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = a2(0, v8, 0, v7);
  }
  *a1 = v7;
  return a3(v3, v8, v7 + 32);
}

BOOL sub_236F102A4(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return OS_geom_sparse_linear_solver_d.solve(_:_:)(a1, a2);
}

uint64_t sub_236F102CC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_236F102F8(a1, a2, a3, (uint64_t (*)(void, uint64_t, void, uint64_t))sub_236F10478, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_d);
}

uint64_t sub_236F102F8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, void, uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *v5;
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = a4(0, v11, 0, v10);
  }
  *a1 = v10;
  return a5(v9, v11, v10 + 32);
}

char *sub_236F1037C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_236F10478(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t dispatch thunk of SparseLinearSolver.solve(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SparseLinearSolver.solve(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t SIMD.asUnsafeScalarMutableCArray(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD v10[2] = a3;
  v10[3] = a4;
  void v10[4] = a1;
  v10[5] = a2;
  return sub_236F10610(v8, (uint64_t)sub_236F10CA4, (uint64_t)v10, a3, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], a8);
}

uint64_t sub_236F10610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t simd_float3x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(void *), double a2, double a3, double a4)
{
  _OWORD v5[3] = *MEMORY[0x263EF8340];
  *(double *)char v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&_OWORD v5[2] = a4;
  return a1(v5);
}

uint64_t simd_float3x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t simd_double3x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = a2;
  v5[1] = a3;
  _OWORD v5[2] = a4;
  return a1(v5);
}

uint64_t simd_double3x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t simd_float4x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(void *), double a2, double a3, double a4, double a5)
{
  v6[4] = *MEMORY[0x263EF8340];
  *(double *)uint64_t v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&float64x2_t v6[2] = a4;
  *(double *)&v6[3] = a5;
  return a1(v6);
}

uint64_t simd_float2x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(void *), double a2, double a3)
{
  double v4[2] = *MEMORY[0x263EF8340];
  *(double *)uint64_t v4 = a2;
  *(double *)&v4[1] = a3;
  return a1(v4);
}

uint64_t simd_float4x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t simd_double4x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = a3;
  float64x2_t v6[2] = a4;
  v6[3] = a5;
  return a1(v6);
}

uint64_t simd_double2x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4[0] = a2;
  v4[1] = a3;
  return a1(v4);
}

uint64_t simd_double4x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t SIMD.asUnsafeScalarCArray(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD v10[2] = a3;
  v10[3] = a4;
  void v10[4] = a1;
  v10[5] = a2;
  return sub_236F10AB8(v8, (uint64_t)sub_236F10CEC, (uint64_t)v10, a3, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], a8);
}

uint64_t sub_236F10AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_236F10BAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t))
{
  if (a1)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    uint64_t v13 = *(void *)(*(void *)(result - 8) + 72);
    if (v13)
    {
      uint64_t AssociatedTypeWitness = result;
      if (a2 - a1 != 0x8000000000000000 || v13 != -1)
      {
        uint64_t v15 = (a2 - a1) / v13;
        goto LABEL_7;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v15 = 0;
LABEL_7:
  uint64_t result = a8(a1, v15, AssociatedTypeWitness);
  if (result) {
    return a3();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_236F10CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236F10BAC(a1, a2, *(uint64_t (**)(void))(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 16), *(void *)(v3 + 24), a3, MEMORY[0x263F8D900]);
}

uint64_t sub_236F10CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236F10BAC(a1, a2, *(uint64_t (**)(void))(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 16), *(void *)(v3 + 24), a3, MEMORY[0x263F8D228]);
}

uint64_t simd_float2x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t marchingSquares(implicit:cellCount:bbox:points:accumulatedPolylineDegree:options:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, float32x2_t a7, float32x2_t a8)
{
  unsigned __int16 v10 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a6)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      if (!(a3 >> 16))
      {
        uint64_t v16 = *a4;
        uint64_t v17 = *a5;
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = a1;
        *(void *)(v18 + 24) = a2;
        uint64_t v20 = sub_236F10F6C;
        uint64_t v21 = v18;
        geom_marching_squares_with_default_options_2f((uint64_t)sub_236F10EF8, (uint64_t)&v20, v10, v16, v17, a7, a8);
        return swift_release();
      }
LABEL_12:
      __break(1u);
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a3 >> 16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v13 = *a4;
  uint64_t v14 = *a5;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  uint64_t v20 = sub_236F11888;
  uint64_t v21 = v15;
  geom_marching_squares_with_options_2f((uint64_t)sub_236F10EF8, (uint64_t)&v20, v10, v13, v14, a7, a8);
  return swift_release();
}

float sub_236F10EF8(void (**a1)(float *__return_ptr, double *), double a2)
{
  void (*v2)(float *__return_ptr, double *);
  float v4;
  double v5;

  if (!a1) {
    return NAN;
  }
  uint64_t v2 = *a1;
  uint64_t v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_236F10F5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236F10F6C(double *a1@<X0>, float *a2@<X8>)
{
  *a2 = (*(float (**)(double))(v2 + 16))(*a1);
}

uint64_t sub_236F10FA0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t marchingSquares(implicit:cellCount:bbox:points:accumulatedPolylineDegree:options:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, float64x2_t a7, float64x2_t a8)
{
  unsigned __int16 v8 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a6)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      if (!(a3 >> 16))
      {
        uint64_t v14 = *a4;
        uint64_t v15 = *a5;
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = a1;
        *(void *)(v16 + 24) = a2;
        uint64_t v20 = sub_236F111A0;
        uint64_t v21 = v16;
        geom_marching_squares_with_default_options_2d((uint64_t)sub_236F1112C, (uint64_t)&v20, v8, v14, v15, a7, a8);
        return swift_release();
      }
LABEL_12:
      __break(1u);
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a3 >> 16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v11 = *a4;
  uint64_t v12 = *a5;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v20 = sub_236F1188C;
  uint64_t v21 = v13;
  geom_marching_squares_with_options_2d((uint64_t)sub_236F1112C, (uint64_t)&v20, v8, v11, v12, a7, a8);
  return swift_release();
}

double sub_236F1112C(void (**a1)(double *__return_ptr, __n128 *), __n128 a2)
{
  void (*v2)(double *__return_ptr, __n128 *);
  double v4;
  __n128 v5;

  if (!a1) {
    return NAN;
  }
  uint64_t v2 = *a1;
  uint64_t v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_236F11190()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236F111A0(__n128 *a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(__n128))(v2 + 16))(*a1);
}

uint64_t sub_236F111D4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t dualContouringUniform(implicit:cellCount:bbox:points:quadVertexIndices:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, float32x4_t a6, float32_t a7, float32x4_t a8, float32_t a9)
{
  double v18[2] = *MEMORY[0x263EF8340];
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  unsigned __int16 v9 = a3;
  if (a3 >> 16) {
    goto LABEL_5;
  }
  a8.f32[2] = a9;
  a6.f32[2] = a7;
  float32x4_t v16 = a6;
  float32x4_t v17 = a8;
  uint64_t v12 = *a4;
  uint64_t v13 = *a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  v18[0] = sub_236F1134C;
  v18[1] = v14;
  geom_dual_contouring_uniform_3f((uint64_t)sub_236F112D8, (uint64_t)v18, v9, v12, v13, v16, v17);
  return swift_release();
}

float sub_236F112D8(void (**a1)(float *__return_ptr, __n128 *), __n128 a2)
{
  void (*v2)(float *__return_ptr, __n128 *);
  float v4;
  __n128 v5;

  if (!a1) {
    return NAN;
  }
  uint64_t v2 = *a1;
  uint64_t v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_236F1133C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236F1134C(__n128 *a1@<X0>, float *a2@<X8>)
{
  *a2 = (*(float (**)(__n128))(v2 + 16))(*a1);
}

uint64_t dualContouringUniform(implicit:cellCount:bbox:points:quadVertexIndices:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  double v21[2] = *MEMORY[0x263EF8340];
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  unsigned __int16 v9 = a3;
  if (a3 >> 16) {
    goto LABEL_5;
  }
  uint64_t v12 = *a4;
  uint64_t v13 = *a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  v21[0] = sub_236F11500;
  v21[1] = v14;
  v20[0] = a6;
  v20[1] = a7;
  float64x2_t v20[2] = a8;
  v20[3] = a9;
  geom_dual_contouring_uniform_3d((uint64_t)sub_236F11488, (uint64_t)v21, v9, (uint64_t)v20, v12, v13);
  return swift_release();
}

double sub_236F11488(_OWORD *a1, void (**a2)(double *__return_ptr, _OWORD *))
{
  void (*v3)(double *__return_ptr, _OWORD *);
  double v5;
  _OWORD v6[2];

  if (!a2) {
    return NAN;
  }
  long long v2 = a1[1];
  uint64_t v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  swift_retain();
  v3(&v5, v6);
  swift_release();
  return v5;
}

uint64_t sub_236F114F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t marchingCubes(implicit:method:cellCount:bbox:points:triangleVertexIndices:)(uint64_t a1, uint64_t a2, int a3, unint64_t a4, uint64_t *a5, uint64_t *a6, float32x4_t a7, float32_t a8, float32x4_t a9, float32_t a10)
{
  float64x2_t v20[2] = *MEMORY[0x263EF8340];
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  unsigned __int16 v10 = a4;
  if (a4 >> 16) {
    goto LABEL_5;
  }
  a9.f32[2] = a10;
  a7.f32[2] = a8;
  float32x4_t v18 = a7;
  float32x4_t v19 = a9;
  uint64_t v14 = *a5;
  uint64_t v15 = *a6;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  v20[0] = sub_236F11890;
  v20[1] = v16;
  geom_marching_cubes_3f((uint64_t)sub_236F112D8, a3, (uint64_t)v20, v10, v14, v15, v18, v19);
  return swift_release();
}

uint64_t sub_236F11608()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t marchingCubes(implicit:method:cellCount:bbox:points:triangleVertexIndices:)(uint64_t a1, uint64_t a2, int a3, unint64_t a4, uint64_t *a5, uint64_t *a6, float64x2_t a7, float64x2_t a8, float64x2_t a9, float64x2_t a10)
{
  float64x2_t v23[2] = *MEMORY[0x263EF8340];
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  unsigned __int16 v10 = a4;
  if (a4 >> 16) {
    goto LABEL_5;
  }
  uint64_t v14 = *a5;
  uint64_t v15 = *a6;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  v23[0] = sub_236F11500;
  v23[1] = v16;
  v22[0] = a7;
  v22[1] = a8;
  v22[2] = a9;
  v22[3] = a10;
  geom_marching_cubes_3d((uint64_t)sub_236F11488, a3, (uint64_t)v23, v10, v22, v14, v15);
  return swift_release();
}

uint64_t sub_236F11730()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_236F11740(__n128 *a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(__n128, __n128))(v2 + 16))(*a1, a1[1]);
}

Swift::Void __swiftcall triangulateByEarClipping(points:triangleVertexIndices:)(Swift::OpaquePointer points, OS_geom_collection_u *triangleVertexIndices)
{
}

{
  geom_triangulate_by_ear_clipping_2d(*((void *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)triangleVertexIndices->super.isa);
}

Swift::Void __swiftcall triangulateByEarClipping(points:accumuluatedOutlineIndexCount:triangleVertexIndices:)(Swift::OpaquePointer points, Swift::OpaquePointer accumuluatedOutlineIndexCount, OS_geom_collection_u *triangleVertexIndices)
{
}

{
  sub_236F117CC((uint64_t)points._rawValue, (uint64_t)accumuluatedOutlineIndexCount._rawValue, triangleVertexIndices, (uint64_t (*)(void, uint64_t, void, uint64_t, void))geom_triangulate_by_ear_clipping_with_holes_2d);
}

uint64_t sub_236F117CC(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void, uint64_t, void, uint64_t, void))
{
  return a4(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32, *a3);
}

OS_geom_inset_evaluator_2f __swiftcall OS_geom_inset_evaluator_2f.init(points:accumulatedOutlineIndexCount:)(Swift::OpaquePointer points, Swift::OpaquePointer accumulatedOutlineIndexCount)
{
  return (OS_geom_inset_evaluator_2f)sub_236F11828((uint64_t)points._rawValue, (uint64_t)accumulatedOutlineIndexCount._rawValue, (uint64_t (*)(void, uint64_t, void, uint64_t))geom_create_inset_evaluator_2f);
}

OS_geom_inset_evaluator_2d __swiftcall OS_geom_inset_evaluator_2d.init(points:accumulatedOutlineIndexCount:)(Swift::OpaquePointer points, Swift::OpaquePointer accumulatedOutlineIndexCount)
{
  return (OS_geom_inset_evaluator_2d)sub_236F11828((uint64_t)points._rawValue, (uint64_t)accumulatedOutlineIndexCount._rawValue, (uint64_t (*)(void, uint64_t, void, uint64_t))geom_create_inset_evaluator_2d);
}

uint64_t sub_236F11828(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, void, uint64_t))
{
  uint64_t v3 = a3(*(void *)(a1 + 16), a1 + 32, *(void *)(a2 + 16), a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

double polynomialRoots(coefficients:)@<D0>(void *a1@<X8>, unsigned int a2@<S0>, unsigned int a3@<S1>, unsigned int a4@<S2>)
{
  *(void *)&long long v5 = __PAIR64__(a3, a2);
  v9[1] = *MEMORY[0x263EF8340];
  *((void *)&v5 + 1) = a4;
  v9[0] = 0;
  long long v8 = v5;
  unsigned int v6 = geom_quadratic_roots_f((float *)&v8, (float *)v9);
  double result = *(double *)v9;
  *a1 = v9[0];
  a1[1] = v6;
  return result;
}

double polynomialRoots(coefficients:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, unint64_t a4@<D2>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  a2.n128_f64[1] = a3;
  *(_OWORD *)long long v8 = 0uLL;
  v7[0] = a2;
  v7[1] = a4;
  unsigned int v5 = geom_quadratic_roots_d((double *)v7, v8);
  double result = v8[0];
  *(_OWORD *)a1 = *(_OWORD *)v8;
  *(void *)(a1 + 16) = v5;
  return result;
}

float polynomialRoots(coefficients:)@<S0>(uint64_t a1@<X8>, __n128 a2@<Q0>, float a3@<S1>, unsigned int a4@<S2>, unsigned int a5@<S3>)
{
  a2.n128_f32[1] = a3;
  a2.n128_u64[1] = __PAIR64__(a5, a4);
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  *(void *)unsigned __int16 v10 = 0;
  __n128 v8 = a2;
  unsigned int v6 = geom_cubic_roots_f(&v8, &v9);
  float result = v10[0];
  *(void *)a1 = v9;
  *(float *)(a1 + 8) = result;
  *(void *)(a1 + 16) = v6;
  return result;
}

double polynomialRoots(coefficients:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, __n128 a4@<Q2>, double a5@<D3>)
{
  a2.n128_f64[1] = a3;
  a4.n128_f64[1] = a5;
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  v9[0] = a2;
  v9[1] = a4;
  unsigned int v6 = geom_cubic_roots_d(v9, &v10);
  double result = *(double *)&v10;
  uint64_t v8 = v11;
  *(_OWORD *)a1 = v10;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t polynomialRoots(coefficients:)(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 == 1) {
    goto LABEL_5;
  }
  if (!v2)
  {
    __break(1u);
    return result;
  }
  uint64_t v3 = sub_236F12980();
  *(void *)(v3 + 16) = v2 - 1;
  bzero((void *)(v3 + 32), 4 * v2 - 4);
  if (v2 > 0xFF)
  {
    __break(1u);
LABEL_5:
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  geom_polynomial_roots_f(v2, v1 + 32);
  uint64_t v5 = *(void *)(v3 + 16) - v4;
  return sub_236F11B5C(v5, v3);
}

{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 == 1) {
    goto LABEL_5;
  }
  if (!v2)
  {
    __break(1u);
    return result;
  }
  uint64_t v3 = sub_236F12980();
  *(void *)(v3 + 16) = v2 - 1;
  bzero((void *)(v3 + 32), 8 * v2 - 8);
  if (v2 > 0xFF)
  {
    __break(1u);
LABEL_5:
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  unsigned int v4 = *(void *)(v3 + 16) - geom_polynomial_roots_d(v2, v1 + 32, v3 + 32);
  return sub_236F11D6C(v4, v3);
}

uint64_t sub_236F11B5C(uint64_t result, uint64_t a2)
{
  if (result < 0) {
    goto LABEL_30;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if (!result) {
    return v2;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  if (!v4)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v9;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v17 = a2 + 32;
  uint64_t v7 = v4 - 1;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = MEMORY[0x263F8EE78];
  do
  {
    int v12 = *(_DWORD *)(v17 + 4 * v5);
    uint64_t v13 = *(void *)(v8 + 16);
    if (v13 < v3)
    {
      double result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        double result = (uint64_t)sub_236F12240(0, v13 + 1, 1);
      }
      unint64_t v11 = *(void *)(v8 + 16);
      unint64_t v10 = *(void *)(v8 + 24);
      if (v11 >= v10 >> 1) {
        double result = (uint64_t)sub_236F12240((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v8 + 16) = v11 + 1;
      *(_DWORD *)(v8 + 4 * v11 + 32) = v12;
LABEL_8:
      if (v7 == v5) {
        goto LABEL_25;
      }
      goto LABEL_9;
    }
    if (v6 >= v13) {
      goto LABEL_28;
    }
    int v14 = *(_DWORD *)(v8 + 4 * v6 + 32);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_236F12240(0, *(void *)(v9 + 16) + 1, 1);
    }
    unint64_t v16 = *(void *)(v9 + 16);
    unint64_t v15 = *(void *)(v9 + 24);
    if (v16 >= v15 >> 1) {
      sub_236F12240((char *)(v15 > 1), v16 + 1, 1);
    }
    *(void *)(v9 + 16) = v16 + 1;
    *(_DWORD *)(v9 + 4 * v16 + 32) = v14;
    double result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      double result = (uint64_t)sub_236F12020(v8);
      uint64_t v8 = result;
    }
    if (v6 >= *(void *)(v8 + 16)) {
      goto LABEL_29;
    }
    *(_DWORD *)(v8 + 4 * v6++ + 32) = v12;
    if ((uint64_t)v6 < v3) {
      goto LABEL_8;
    }
    if (v7 == v5) {
      goto LABEL_25;
    }
    unint64_t v6 = 0;
LABEL_9:
    ++v5;
  }
  while (v5 < *(void *)(v2 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_236F11D6C(uint64_t result, uint64_t a2)
{
  if (result < 0) {
    goto LABEL_30;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if (!result) {
    return v2;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  if (!v4)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v9;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v17 = a2 + 32;
  uint64_t v7 = v4 - 1;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v12 = *(void *)(v17 + 8 * v5);
    uint64_t v13 = *(void *)(v8 + 16);
    if (v13 < v3)
    {
      double result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        double result = (uint64_t)sub_236F12260(0, v13 + 1, 1);
      }
      unint64_t v11 = *(void *)(v8 + 16);
      unint64_t v10 = *(void *)(v8 + 24);
      if (v11 >= v10 >> 1) {
        double result = (uint64_t)sub_236F12260((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v8 + 16) = v11 + 1;
      *(void *)(v8 + 8 * v11 + 32) = v12;
LABEL_8:
      if (v7 == v5) {
        goto LABEL_25;
      }
      goto LABEL_9;
    }
    if (v6 >= v13) {
      goto LABEL_28;
    }
    uint64_t v14 = *(void *)(v8 + 8 * v6 + 32);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_236F12260(0, *(void *)(v9 + 16) + 1, 1);
    }
    unint64_t v16 = *(void *)(v9 + 16);
    unint64_t v15 = *(void *)(v9 + 24);
    if (v16 >= v15 >> 1) {
      sub_236F12260((char *)(v15 > 1), v16 + 1, 1);
    }
    *(void *)(v9 + 16) = v16 + 1;
    *(void *)(v9 + 8 * v16 + 32) = v14;
    double result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      double result = (uint64_t)sub_236F12034(v8);
      uint64_t v8 = result;
    }
    if (v6 >= *(void *)(v8 + 16)) {
      goto LABEL_29;
    }
    *(void *)(v8 + 8 * v6++ + 32) = v12;
    if ((uint64_t)v6 < v3) {
      goto LABEL_8;
    }
    if (v7 == v5) {
      goto LABEL_25;
    }
    unint64_t v6 = 0;
LABEL_9:
    ++v5;
  }
  while (v5 < *(void *)(v2 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

char *sub_236F12020(uint64_t a1)
{
  return sub_236F12048(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_236F12034(uint64_t a1)
{
  return sub_236F12144(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_236F12048(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5C8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_236F12144(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688DF5C0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_236F12240(char *a1, int64_t a2, char a3)
{
  double result = sub_236F12048(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_236F12260(char *a1, int64_t a2, char a3)
{
  double result = sub_236F12144(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

Swift::Float __swiftcall polyhedronVolume(vertexPositions:faceVertexIndices:faceAccumulatedValence:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer faceVertexIndices, Swift::OpaquePointer faceAccumulatedValence)
{
  return geom_polyhedron_volume_3f(*((void *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((void *)faceAccumulatedValence._rawValue + 2), (uint64_t)faceVertexIndices._rawValue + 32, (unsigned int *)faceAccumulatedValence._rawValue + 8);
}

Swift::Double __swiftcall polyhedronVolume(vertexPositions:faceVertexIndices:faceAccumulatedValence:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer faceVertexIndices, Swift::OpaquePointer faceAccumulatedValence)
{
  return geom_polyhedron_volume_3d(*((void *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((void *)faceAccumulatedValence._rawValue + 2), (uint64_t)faceVertexIndices._rawValue + 32, (unsigned int *)faceAccumulatedValence._rawValue + 8);
}

Swift::Float __swiftcall triangleMeshVolume(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return geom_triangle_mesh_volume_3f(*((void *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((void *)triangleVertexIndices._rawValue + 2) / 3uLL, (uint64_t)triangleVertexIndices._rawValue + 32);
}

Swift::Double __swiftcall triangleMeshVolume(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return geom_triangle_mesh_volume_3d(*((void *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((void *)triangleVertexIndices._rawValue + 2) / 3uLL, (uint64_t)triangleVertexIndices._rawValue + 32);
}

Swift::Void __swiftcall applyCatmullClarkSubdivisionStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
}

{
  sub_236F123D0(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (void *(*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, void, uint64_t))geom_apply_catmull_clark_subdivision_stencil_3d);
}

Swift::Void __swiftcall applyCatmullClarkLimitStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
}

{
  sub_236F123D0(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (void *(*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, void, uint64_t))geom_apply_catmull_clark_limit_stencil_3d);
}

Swift::Void __swiftcall applyCatmullClarkNormalStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
}

{
  sub_236F123D0(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (void *(*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, void, uint64_t))geom_apply_catmull_clark_normal_stencil_3d);
}

uint64_t sub_236F12368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void, uint64_t))
{
  return a5(a1, a2 + 32, a3 + 32, *(void *)(a4 + 16), a4 + 32);
}

void *sub_236F123D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *(*a5)(void *__return_ptr, uint64_t, uint64_t, uint64_t, void, uint64_t))
{
  return a5(v6, a1, a2 + 32, a3 + 32, *(void *)(a4 + 16), a4 + 32);
}

void SparseFactor()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_236DD6000, &_os_log_internal, v0, "%s.blockSize must be > 0, but is %d.]n", v1, v2, v3, v4, 2u);
}

{
  uint8_t v0[56];
  uint64_t v1;

  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_236DD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s.attributes.kind=SparseSymmetric, but %s.rowCount (%d) != %s.columnCount (%d).\n", v0, 0x2Cu);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_236DD6000, &_os_log_internal, v0, "%s.columnCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_236DD6000, &_os_log_internal, v0, "%s.rowCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
}

void SparseFactor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void geom::sparse_linear_solver<float>::solve(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_236DD6000, &_os_log_internal, a3, "%s does not hold a completed matrix factorization.\n", a5, a6, a7, a8, 2u);
}

void geom::sparse_linear_solver<float>::solve()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_236DD6000, &_os_log_internal, v0, "Failed to allocate workspace of size %ld for SparseSolve().\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_236DD6000, &_os_log_internal, v0, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_236DD6000, &_os_log_internal, v0, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", v1, v2, v3, v4, 2u);
}

{
  int v0[5];
  const char *v1;
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_8();
  uint64_t v1 = "Factored";
  _os_log_error_impl(&dword_236DD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n", (uint8_t *)v0, 0x1Cu);
}

uint64_t sub_236F12910()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_236F12920()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t sub_236F12930()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t sub_236F12940()
{
  return MEMORY[0x270F9D4D8]();
}

uint64_t sub_236F12950()
{
  return MEMORY[0x270F9D500]();
}

uint64_t sub_236F12960()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_236F12970()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_236F12980()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_236F12990()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_236F129F0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_236F12A00()
{
  return MEMORY[0x270F9E090]();
}

uint64_t sub_236F12A20()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_236F12A40()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_236F12A50()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_236F12A60()
{
  return MEMORY[0x270F9E6F8]();
}

uint64_t sub_236F12A70()
{
  return MEMORY[0x270F9E720]();
}

uint64_t sub_236F12A80()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_236F12A90()
{
  return MEMORY[0x270F9F4D8]();
}

uint64_t sub_236F12AA0()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_236F12AB0()
{
  return MEMORY[0x270F9FB90]();
}

uint64_t sub_236F12AC0()
{
  return MEMORY[0x270F9FBD8]();
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorQR_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x270EDE210](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorQR_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x270EDE218](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorSymmetric_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x270EDE220](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorSymmetric_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x270EDE228](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseSymbolicFactorOptions *__cdecl _SparseGetOptionsFromSymbolicFactor(SparseSymbolicFactorOptions *__return_ptr retstr, SparseOpaqueSymbolicFactorization *factor)
{
  return (SparseSymbolicFactorOptions *)MEMORY[0x270EDE240](retstr, factor);
}

void _SparseSolveOpaque_Double(const SparseOpaqueFactorization_Double *Factored, const DenseMatrix_Double *RHS, const DenseMatrix_Double *Soln, void *workspace)
{
}

void _SparseSolveOpaque_Float(const SparseOpaqueFactorization_Float *Factored, const DenseMatrix_Float *RHS, const DenseMatrix_Float *Soln, void *workspace)
{
}

void _SparseTrap(void)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x270F98BD8]();
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x270F98BE0]();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x270F98BF0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

simd_double2x2 __invert_d2(simd_double2x2 a1)
{
  MEMORY[0x270ED7DF8]((__n128)a1.columns[0], (__n128)a1.columns[1]);
  result.columns[1].f64[1] = v4;
  result.columns[1].f64[0] = v3;
  result.columns[0].f64[1] = v2;
  result.columns[0].f64[0] = v1;
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x270ED7E00]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x270ED7E08]();
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x270ED7E10]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

double _simd_orient_pd2(simd_double2 a1, simd_double2 a2, simd_double2 a3)
{
  MEMORY[0x270ED82F0]((__n128)a1, (__n128)a2, (__n128)a3);
  return result;
}

float _simd_orient_pf2(simd_float2 a1, simd_float2 a2, simd_float2 a3)
{
  MEMORY[0x270ED82F8](*(__n128 *)a1.f32, *(__n128 *)a2.f32, *(__n128 *)a3.f32);
  return result;
}

double _simd_orient_vd2(simd_double2 a1, simd_double2 a2)
{
  MEMORY[0x270ED8300]((__n128)a1, (__n128)a2);
  return result;
}

float _simd_orient_vf2(simd_float2 a1, simd_float2 a2)
{
  MEMORY[0x270ED8308](*(__n128 *)a1.f32, *(__n128 *)a2.f32);
  return result;
}

void abort(void)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  MEMORY[0x270EDE318](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_strsv(const CBLAS_ORDER __Order, const CBLAS_UPLO __Uplo, const CBLAS_TRANSPOSE __TransA, const CBLAS_DIAG __Diag, const int __N, const float *__A, const int __lda, float *__X, const int __incX)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

int dgeev_(char *__jobvl, char *__jobvr, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__wr, __CLPK_doublereal *__wi, __CLPK_doublereal *__vl, __CLPK_integer *__ldvl, __CLPK_doublereal *__vr, __CLPK_integer *__ldvr, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE518](__jobvl, __jobvr, __n, __a, __lda, __wr, __wi, __vl);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE590](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

int dsyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__w, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE690](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
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

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA380](alignment, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int sgeqrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE778](__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int sgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE7B8](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sormqr_(char *__side, char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__c__, __CLPK_integer *__ldc, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE848](__side, __trans, __m, __n, __k, __a, __lda, __tau);
}

int ssyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__w, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE8E8](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}